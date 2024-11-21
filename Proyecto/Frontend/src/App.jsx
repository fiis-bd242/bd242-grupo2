import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Modulo4 from "./Modulos/Modulo4/App";
const App = () => {
  return (
    <Router>
      <div>
        <h1>Mi Aplicación Modular</h1>
        <Routes>
          {/* Definir rutas para cada módulo */}
          <Route path="/empleados" element={<Modulo4 />} />
          {/* Ruta por defecto */}
          <Route path="/" element={<Modulo4 />} />
        </Routes>
      </div>
    </Router>
  );
}
export default App;
