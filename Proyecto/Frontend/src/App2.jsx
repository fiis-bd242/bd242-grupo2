import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import AuthenticationForm from "./Modulos/Modulo2/App";
import AsignacionMesa from "./Modulos/Modulo2/AsignacionMesa";
import Categories from "./Modulos/Modulo2/Categories";
import Products from "./Modulos/Modulo2/Products";
import Summary from "./Modulos/Modulo2/Summary";

/*
import Categories from "./Modulos/Modulo2/Categories";
<Route path="/categorias" element={<Categories />} />
*/
const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<AuthenticationForm />} />
        <Route path="/asignacion-mesa" element={<AsignacionMesa />} />
        <Route path="/categorias" element={<Categories />} />
        <Route path="/items-pedido" element={<Products />} />
        <Route path="/summary" element={<Summary />} />
      </Routes>
    </Router>
  );
};

export default App;