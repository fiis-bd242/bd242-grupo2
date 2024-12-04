import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AnadirProveedores = () => {
  const [proveedores, setProveedores] = useState([]);
  const [nuevoProveedor, setNuevoProveedor] = useState({
    nombre: '',
    ruc: '',
    direccion: '',
    correo: ''
  });
  const [mostrarFormulario, setMostrarFormulario] = useState(false);

  useEffect(() => {
    cargarProveedores();
  }, []);

  const cargarProveedores = () => {
    axios.get('/api/proveedores').then(response => {
      setProveedores(response.data);
    });
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNuevoProveedor({ ...nuevoProveedor, [name]: value });
  };

  const guardarProveedor = (e) => {
    e.preventDefault();
    axios.post('/api/proveedores', nuevoProveedor).then(response => {
      alert('Proveedor guardado correctamente');
      setNuevoProveedor({ nombre: '', ruc: '', direccion: '', correo: '' });
      setMostrarFormulario(false);
      cargarProveedores();
    });
  };

  return (
    <div className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 className="text-2xl font-bold mb-4">Proveedores</h2>
      <button
        onClick={() => setMostrarFormulario(true)}
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mb-4"
      >
        Añadir nuevo proveedor
      </button>
      {mostrarFormulario && (
        <form onSubmit={guardarProveedor} className="mb-4">
          <h3 className="text-xl font-bold mb-2">Formulario para añadir Proveedor</h3>
          <div className="mb-4">
            <input
              type="text"
              name="nombre"
              value={nuevoProveedor.nombre}
              onChange={handleInputChange}
              placeholder="Nombre del Proveedor"
              required
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
          <div className="mb-4">
            <input
              type="text"
              name="ruc"
              value={nuevoProveedor.ruc}
              onChange={handleInputChange}
              placeholder="RUC"
              required
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
          <div className="mb-4">
            <input
              type="text"
              name="direccion"
              value={nuevoProveedor.direccion}
              onChange={handleInputChange}
              placeholder="Dirección"
              required
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
          <div className="mb-4">
            <input
              type="email"
              name="correo"
              value={nuevoProveedor.correo}
              onChange={handleInputChange}
              placeholder="Correo"
              required
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
          <button
            type="submit"
            className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
          >
            GUARDAR PROVEEDOR
          </button>
        </form>
      )}
      <table className="w-full">
        <thead>
          <tr>
            <th className="px-4 py-2">Código</th>
            <th className="px-4 py-2">Nombre de la empresa</th>
            <th className="px-4 py-2">RUC</th>
            <th className="px-4 py-2">Dirección</th>
            <th className="px-4 py-2">Correo</th>
          </tr>
        </thead>
        <tbody>
          {proveedores.map(proveedor => (
            <tr key={proveedor.id}>
              <td className="border px-4 py-2">{proveedor.id}</td>
              <td className="border px-4 py-2">{proveedor.nombre}</td>
              <td className="border px-4 py-2">{proveedor.ruc}</td>
              <td className="border px-4 py-2">{proveedor.direccion}</td>
              <td className="border px-4 py-2">{proveedor.correo}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AnadirProveedores;

