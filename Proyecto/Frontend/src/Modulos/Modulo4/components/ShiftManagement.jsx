import React, { useState } from 'react'
import Sidebar from '../components/Sidebar'
import Header from '../components/Header'
import StaffDemand from '../components/StaffDemand'
import AvailableStaff from '../components/AvailableStaff'
import AssignedShifts from '../components/AssignedShifts'

export default function ShiftManagement() {
  const [selectedDay, setSelectedDay] = useState('')
  const [selectedShift, setSelectedShift] = useState('')
  const [selectedPosition, setSelectedPosition] = useState('')
  const [availableStaff, setAvailableStaff] = useState([])

  const handleStaffDemandSearch = (staffData) => {
    console.log("Datos recibidos en ShiftManagement:", staffData);
    setAvailableStaff(staffData)
  }

  return (
    <div className="min-h-screen">
      <Header />
      <div className="flex">
        <Sidebar />
        <main className="flex-1 p-8">
          <h1 className="text-3xl font-bold mb-8">Programación de Turnos</h1>
          
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
            <StaffDemand 
              setSelectedDay={setSelectedDay}
              setSelectedShift={setSelectedShift}
              setSelectedPosition={setSelectedPosition}
              onSearch={handleStaffDemandSearch}
            />
            <AvailableStaff 
              selectedDay={selectedDay}
              selectedShift={selectedShift}
              selectedPosition={selectedPosition}
              availableStaff={availableStaff}
            />
          </div>
          
          <AssignedShifts />
        </main>
      </div>
    </div>
  )
}

