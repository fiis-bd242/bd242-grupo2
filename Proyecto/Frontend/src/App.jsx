import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Modulo4 from "./Modulos/Modulo4/App";


import AuthenticationForm from "./Modulos/Modulo2/App";
import AsignacionMesa from "./Modulos/Modulo2/AsignacionMesa";
import Categories from "./Modulos/Modulo2/Categories";
import Products from "./Modulos/Modulo2/Products";
import Summary from "./Modulos/Modulo2/Summary";


const App = () => {
  return (
    <Router>
      <div>
        
        <Routes>
          {/* Definir rutas para cada módulo */}
          <Route path="/empleados" element={<Modulo4 />} />
          {/* Ruta por defecto */}
          <Route path="/" element={<Modulo4 />} />


          {/* MODULO 2 */}
          <Route path="/autenticacion" element={<AuthenticationForm />} />
          <Route path="/asignacion-mesa" element={<AsignacionMesa />} />
          <Route path="/categorias" element={<Categories />} />
          <Route path="/items-pedido" element={<Products />} />
          <Route path="/summary" element={<Summary />} />
      

        </Routes>
      </div>
    </Router>
  );
}
export default App;
