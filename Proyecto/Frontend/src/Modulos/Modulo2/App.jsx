import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import Keypad from "./Keypad";
import { autenticarMesero } from "./Service";
import "../../styles/autenticacion.css";

const AuthenticationForm = () => {
  const [codigo, setCodigo] = useState("");
  const [mensaje, setMensaje] = useState(null);
  const navigate = useNavigate(); // Hook para redirigir

  const handleKeyPress = (value) => {
    if (value === "clear") {
      setCodigo("");
    } else if (value === "submit") {
      autenticar();
    } else {
      setCodigo((prev) => (prev.length < 8 ? prev + value : prev));
    }
  };

  const autenticar = async () => {
    try {
      setMensaje(null);
      const response = await autenticarMesero(codigo);
      setMensaje({ type: "success", text: response.message });

      // Redirigir a la pantalla de Asignación de Mesa
      setTimeout(() => {
        navigate("/asignacion-mesa"); // Ruta que apunta a AsignacionMesa
      }, 1000);
    } catch (error) {
      setMensaje({ type: "error", text: error.message });
    }
  };

  return (
    <div className="auth-form">
      <input
        type="text"
        value={codigo}
        readOnly
        placeholder="Ingrese su código"
      />
      <Keypad onKeyPress={handleKeyPress} />
      {mensaje && <div className={mensaje.type}>{mensaje.text}</div>}
    </div>
  );
};

export default AuthenticationForm;

