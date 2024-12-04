import React, { useState } from 'react';
import CrearSolicitud from './CrearSolicitud';
import HistorialSolicitudes from './HistorialSolicitudes';
import AnadirProveedores from './AnadirProveedores';

const SolicitudesCompra = () => {
  const [opcionSeleccionada, setOpcionSeleccionada] = useState(null);

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-3xl font-bold mb-6">Módulo de Solicitudes de Compra</h1>
      {!opcionSeleccionada && (
        <div className="flex space-x-4 mb-6">
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            onClick={() => setOpcionSeleccionada('crear')}
          >
            Crear solicitud
          </button>
          <button
            className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
            onClick={() => setOpcionSeleccionada('historial')}
          >
            Ver historial de solicitudes
          </button>
          <button
            className="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded"
            onClick={() => setOpcionSeleccionada('proveedores')}
          >
            Añadir proveedores
          </button>
        </div>
      )}
      {opcionSeleccionada === 'crear' && <CrearSolicitud />}
      {opcionSeleccionada === 'historial' && <HistorialSolicitudes />}
      {opcionSeleccionada === 'proveedores' && <AnadirProveedores />}
    </div>
  );
};

export default SolicitudesCompra;

