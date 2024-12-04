import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CrearSolicitud = () => {
  const [proveedor, setProveedor] = useState('');
  const [fecha, setFecha] = useState('');
  const [estado, setEstado] = useState('');
  const [productos, setProductos] = useState([]);
  const [proveedores, setProveedores] = useState([]);

  useEffect(() => {
    axios.get('/api/proveedores').then(response => {
      setProveedores(response.data);
    });
  }, []);

  const agregarProducto = () => {
    setProductos([...productos, { codigo: '', nombre: '', unidades: '' }]);
  };

  const eliminarProducto = (index) => {
    const nuevosProductos = productos.filter((_, i) => i !== index);
    setProductos(nuevosProductos);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    axios.post('/api/solicitudes', {
      proveedor_id: proveedor,
      fecha,
      estado,
      detalles: productos
    }).then(response => {
      alert('Solicitud guardada correctamente');
      setProveedor('');
      setFecha('');
      setEstado('');
      setProductos([]);
    });
  };

  return (
    <div className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 className="text-2xl font-bold mb-4">FORMULARIO SOLICITUDES PROVEEDORES</h2>
      <form onSubmit={handleSubmit}>
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="proveedor">
            Proveedor
          </label>
          <select
            id="proveedor"
            value={proveedor}
            onChange={(e) => setProveedor(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Seleccione un proveedor</option>
            {proveedores.map(p => (
              <option key={p.id} value={p.id}>{p.nombre}</option>
            ))}
          </select>
        </div>
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="fecha">
            Fecha
          </label>
          <input
            type="date"
            id="fecha"
            value={fecha}
            onChange={(e) => setFecha(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="estado">
            Estado
          </label>
          <select
            id="estado"
            value={estado}
            onChange={(e) => setEstado(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Seleccione un estado</option>
            <option value="aprobado">Aprobado</option>
            <option value="pendiente">Pendiente</option>
            <option value="rechazado">Rechazado</option>
          </select>
        </div>
        <h3 className="text-xl font-bold mb-2">Añadir productos</h3>
        <table className="w-full mb-4">
          <thead>
            <tr>
              <th className="px-4 py-2">+/-</th>
              <th className="px-4 py-2">Código</th>
              <th className="px-4 py-2">Nombre de insumo</th>
              <th className="px-4 py-2">Unidades requeridas</th>
            </tr>
          </thead>
          <tbody>
            {productos.map((producto, index) => (
              <tr key={index}>
                <td className="border px-4 py-2">
                  <button
                    type="button"
                    onClick={() => eliminarProducto(index)}
                    className="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded"
                  >
                    -
                  </button>
                </td>
                <td className="border px-4 py-2">
                  <input
                    type="text"
                    value={producto.codigo}
                    onChange={(e) => {
                      const nuevosProductos = [...productos];
                      nuevosProductos[index].codigo = e.target.value;
                      setProductos(nuevosProductos);
                    }}
                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  />
                </td>
                <td className="border px-4 py-2">
                  <input
                    type="text"
                    value={producto.nombre}
                    onChange={(e) => {
                      const nuevosProductos = [...productos];
                      nuevosProductos[index].nombre = e.target.value;
                      setProductos(nuevosProductos);
                    }}
                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  />
                </td>
                <td className="border px-4 py-2">
                  <input
                    type="number"
                    value={producto.unidades}
                    onChange={(e) => {
                      const nuevosProductos = [...productos];
                      nuevosProductos[index].unidades = e.target.value;
                      setProductos(nuevosProductos);
                    }}
                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  />
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <button
          type="button"
          onClick={agregarProducto}
          className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded mr-2"
        >
          +
        </button>
        <button
          type="submit"
          className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        >
          GUARDAR SOLICITUD 💾
        </button>
      </form>
    </div>
  );
};

export default CrearSolicitud;

