import React, { useState } from "react";
import { crearPedido } from "./Service"; // Cambia la ruta según tu estructura de proyecto.

const CrearPedido = () => {
  const [nombreInsumo, setNombreInsumo] = useState("");
  const [datos, setDatos] = useState([]);
  const [error, setError] = useState("");

  const handleCrearPedido = async () => {
    try {
      setError("");
      const resultado = await crearPedido(nombreInsumo); // Llama a la función fetch
      setDatos(resultado); // Asigna los datos recibidos a la tabla
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Crear Pedido</h1>

      {/* Formulario para ingresar el nombre del insumo */}
      <div style={{ marginBottom: "20px" }}>
        <label htmlFor="nombreInsumo">Nombre del Insumo:</label>
        <input
          type="text"
          id="nombreInsumo"
          value={nombreInsumo}
          onChange={(e) => setNombreInsumo(e.target.value)}
          placeholder="Ingrese el nombre del insumo"
          style={{ margin: "0 10px", padding: "5px" }}
        />
        <button onClick={handleCrearPedido} style={{ padding: "5px 10px" }}>
          Buscar
        </button>
      </div>

      {/* Mostrar errores */}
      {error && <p style={{ color: "red" }}>{error}</p>}

      {/* Tabla de resultados */}
      {datos.length > 0 && (
        <table
          style={{
            width: "100%",
            borderCollapse: "collapse",
            marginTop: "20px",
          }}
          border="1"
        >
          <thead>
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Categoría</th>
              <th>Subcategoría</th>
              <th>Unidad de Medida</th>
              <th>Cantidad</th>
              <th>Seleccionar</th>
            </tr>
          </thead>
          <tbody>
            {datos.map((insumo, index) => (
              <tr key={index}>
                <td>{insumo.codigo}</td>
                <td>{insumo.nombre}</td>
                <td>{insumo.categoria}</td>
                <td>{insumo.subcategoria}</td>
                <td>{insumo.unidad_medida}</td>
                <td>
                  <input
                    type="number"
                    min="1"
                    placeholder="Cantidad"
                    style={{ width: "100%" }}
                  />
                </td>
                <td>
                  <input type="radio" name="seleccion" value={insumo.codigo} />
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default CrearPedido;
