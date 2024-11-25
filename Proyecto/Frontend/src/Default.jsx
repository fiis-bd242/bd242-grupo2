import React from 'react';
import { useNavigate } from "react-router-dom";
import { ShoppingCart, Book, DollarSign, Users, ClipboardCheck } from 'lucide-react'; // Reemplazamos Clock por Users
import './styles/Default.css';

function Default() {
  const navigate = useNavigate();

  const handleNavigation = (ruta) => {
    navigate(ruta);
  };

  // Cambié Clock por Users, que está disponible
  const modules = [
    { icon: <ShoppingCart className="icon pink" />, route: "/" },
    { icon: <Book className="icon orange" />, route: "/autenticacion" },
    { icon: <DollarSign className="icon black" />, route: "/" },
    { icon: <Users className="icon blue" />, route: "/" }, // Cambié Clock por Users
    { icon: <ClipboardCheck className="icon black" />, route: "/modulo5" }
  ];

  return (
    <div className="container">
      <h1>Por favor, seleccione un módulo</h1>
      <div className="module-grid">
        {modules.map((module, index) => (
          <div key={index} className="module-item">
            <div className="icon-container">
              {module.icon}
            </div>
            <button 
              className="module-button"
              onClick={() => handleNavigation(module.route)}
            >
              Módulo {index + 1}
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Default;
