import { Button } from "@/components/ui/button"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { postToAPI } from "../utils/api"

export default function AvailableStaff({ selectedDay, selectedShift, selectedPosition, availableStaff }) {
  const handleAssign = async (dni) => {
    try {
      await postToAPI('/asignar-turno', {
        dni,
        turno: selectedShift
      });
      console.log(`Turno asignado a empleado con DNI: ${dni}`);
      // Aquí deberías actualizar el estado global o volver a cargar los datos
    } catch (error) {
      console.error('Error al asignar turno:', error);
      // Mostrar algún mensaje de error al usuario
    }
  };

  console.log("Datos recibidos en AvailableStaff:", availableStaff);

  return (
    <div className="space-y-4">
      <h2 className="text-xl font-semibold">Personal disponible</h2>
      <div className="bg-white border border-gray-200 rounded-lg shadow">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-[100px]">DNI</TableHead>
              <TableHead>Apellido</TableHead>
              <TableHead className="text-right">Acción</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {availableStaff.length === 0 ? (
              <TableRow>
                <TableCell colSpan={3} className="text-center">No hay personal disponible para los criterios seleccionados.</TableCell>
              </TableRow>
            ) : (
              availableStaff.map((staff) => (
                <TableRow key={staff.dni}>
                  <TableCell className="font-medium">{staff.dni}</TableCell>
                  <TableCell>{staff.primer_apellido}</TableCell>
                  <TableCell className="text-right">
                    <Button 
                      onClick={() => handleAssign(staff.dni)}
                      className="bg-blue-500 hover:bg-blue-600 text-white"
                    >
                      Asignar
                    </Button>
                  </TableCell>
                </TableRow>
              ))
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  )
}

