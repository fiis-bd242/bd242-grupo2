import React from 'react'
import Sidebar from '../Modulo4/components/Sidebar'
import Header from '../Modulo4/components/Header'
import StaffDemand from '../Modulo4/components/StaffDemand'
import AvailableStaff from '../Modulo4/components/AvailableStaff'
import AssignedShifts from '../Modulo4/components/AssignedShifts'
import ShiftManagement from './components/ShiftManagement'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
export default function App() {
  return (
    <div className="min-h-screen">
      <div className="flex">
        <main className="flex-1 p-8">
          <ShiftManagement/>
        </main>
      </div>
    </div>
  )
}
