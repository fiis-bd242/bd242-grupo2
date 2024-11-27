import { useEffect, useState } from 'react'
import { Button } from "@/components/ui/button"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import { fetchFromAPI, postToAPI } from "../utils/api"

export default function StaffDemand({ setSelectedDay, setSelectedShift, setSelectedPosition, onSearch }) {
  const [days, setDays] = useState([])
  const [shifts, setShifts] = useState([])
  const [positions, setPositions] = useState([])
  const [selectedDayLocal, setSelectedDayLocal] = useState('')
  const [selectedShiftLocal, setSelectedShiftLocal] = useState('')
  const [selectedPositionLocal, setSelectedPositionLocal] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState(null)

  useEffect(() => {
    const fetchOptions = async () => {
      try {
        const [daysData, shiftsData, positionsData] = await Promise.all([
          fetchFromAPI('/dias'),
          fetchFromAPI('/turno'),
          fetchFromAPI('/cargos')
        ]);

        setDays(daysData);
        setShifts(shiftsData);
        setPositions(positionsData);

        console.log('Opciones cargadas:', { days: daysData, shifts: shiftsData, positions: positionsData });
      } catch (error) {
        console.error('Error al cargar las opciones:', error);
        setError('Error al cargar las opciones. Por favor, intente de nuevo.');
      }
    };

    fetchOptions();
  }, []);

  const handleSearch = async () => {
    if (!selectedDayLocal || !selectedShiftLocal || !selectedPositionLocal) {
      setError('Por favor, seleccione todos los campos antes de buscar.');
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const requestData = {
        dia: selectedDayLocal,
        turno: selectedShiftLocal,
        cargo: selectedPositionLocal
      };
      console.log('Sending request with data:', requestData);
      const result = await postToAPI('/personal-libre', requestData);
      console.log('Resultado de la búsqueda en StaffDemand:', result);
      onSearch(result);
      
      setSelectedDay(selectedDayLocal);
      setSelectedShift(selectedShiftLocal);
      setSelectedPosition(selectedPositionLocal);
    } catch (error) {
      console.error('Error al buscar:', error);
      setError(`Error al realizar la búsqueda: ${error.message}`);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-4 p-4 bg-white rounded-lg shadow">
      <h2 className="text-xl font-semibold text-gray-800">Demanda de personal</h2>
      <div className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Días</label>
          <Select onValueChange={(value) => setSelectedDayLocal(value)}>
            <SelectTrigger className="w-full bg-white border border-gray-300 text-gray-900">
              <SelectValue placeholder="Seleccione día" />
            </SelectTrigger>
            <SelectContent className="bg-white border border-gray-300">
              {days.map((day,index) => (
                <SelectItem 
                  key={index} 
                  value={day.nombre} 
                  className="text-gray-900 hover:bg-gray-100"
                >
                  {day.nombre}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Turno</label>
          <Select onValueChange={(value) => setSelectedShiftLocal(value)}>
            <SelectTrigger className="w-full bg-white border border-gray-300 text-gray-900">
              <SelectValue placeholder="Seleccione turno" />
            </SelectTrigger>
            <SelectContent className="bg-white border border-gray-300">
              {shifts.map((shift,index) => (
                <SelectItem 
                  key={index} 
                  value={shift.nombre_turno} 
                  className="text-gray-900 hover:bg-gray-100"
                >
                  {shift.nombre_turno}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Cargo</label>
          <Select onValueChange={(value) => setSelectedPositionLocal(value)}>
            <SelectTrigger className="w-full bg-white border border-gray-300 text-gray-900">
              <SelectValue placeholder="Seleccione cargo" />
            </SelectTrigger>
            <SelectContent className="bg-white border border-gray-300">
              {positions.map((position,index) => (
                <SelectItem 
                  key={index} 
                  value={position.nombre_cargo} 
                  className="text-gray-900 hover:bg-gray-100"
                >
                  {position.nombre_cargo}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </div>
      <Button 
        className="w-full bg-blue-500 hover:bg-blue-600 text-white"
        onClick={handleSearch}
        disabled={loading}
      >
        {loading ? 'Buscando...' : 'Buscar'}
      </Button>
      {error && <p className="text-red-500 mt-2">{error}</p>}
    </div>
  )
}

