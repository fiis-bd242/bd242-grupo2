import React, { useState, useEffect } from 'react';
import axios from 'axios';

const HistorialSolicitudes = () => {
  const [solicitudes, setSolicitudes] = useState([]);

  useEffect(() => {
    axios.get('/api/solicitudes').then(response => {
      setSolicitudes(response.data);
    });
  }, []);

  const enviarCorreo = (solicitudId) => {
    axios.post(`/api/solicitudes/${solicitudId}/enviar-correo`).then(response => {
      alert('Correo enviado correctamente');
    });
  };

  const eliminarSolicitud = (solicitudId) => {
    axios.delete(`/api/solicitudes/${solicitudId}`).then(response => {
      setSolicitudes(solicitudes.filter(s => s.id !== solicitudId));
      alert('Solicitud eliminada correctamente');
    });
  };

  return (
    <div className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 className="text-2xl font-bold mb-4">Historial de Solicitudes</h2>
      <table className="w-full">
        <thead>
          <tr>
            <th className="px-4 py-2">Fecha de la solicitud</th>
            <th className="px-4 py-2">Proveedor</th>
            <th className="px-4 py-2">Estado</th>
            <th className="px-4 py-2">Acciones</th>
          </tr>
        </thead>
        <tbody>
          {solicitudes.map(solicitud => (
            <tr key={solicitud.id}>
              <td className="border px-4 py-2">{solicitud.fecha}</td>
              <td className="border px-4 py-2">{solicitud.proveedor_nombre}</td>
              <td className="border px-4 py-2">{solicitud.estado}</td>
              <td className="border px-4 py-2">
                <button
                  onClick={() => enviarCorreo(solicitud.id)}
                  className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 rounded mr-2"
                >
                  Enviar por correo
                </button>
                <button
                  onClick={() => eliminarSolicitud(solicitud.id)}
                  className="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded"
                >
                  Eliminar
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default HistorialSolicitudes;

