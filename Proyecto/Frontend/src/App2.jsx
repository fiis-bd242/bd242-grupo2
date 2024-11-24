import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import AuthenticationForm from "./Modulos/Modulo2/App";
import AsignacionMesa from "./Modulos/Modulo2/AsignacionMesa";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<AuthenticationForm />} />
        <Route path="/asignacion-mesa" element={<AsignacionMesa />} />
      </Routes>
    </Router>
  );
};

export default App;