import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import AuthenticationForm from "./Modulos/Modulo2/App";
import AsignacionMesa from "./Modulos/Modulo2/AsignacionMesa";
import Categories from "./Modulos/Modulo2/Categories";
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
      </Routes>
    </Router>
  );
};

export default App;