import axios from 'axios';

const API_URL = 'http://localhost:5173/api'; 

export const SolicitudesService = {
  // Proveedores
  getProveedores: () => axios.get(`${API_URL}/proveedores`),
  createProveedor: (proveedor) => axios.post(`${API_URL}/proveedores`, proveedor),

  // Solicitudes
  getSolicitudes: () => axios.get(`${API_URL}/solicitudes`),
  createSolicitud: (solicitud) => axios.post(`${API_URL}/solicitudes`, solicitud),
  deleteSolicitud: (id) => axios.delete(`${API_URL}/solicitudes/${id}`),
  enviarCorreoSolicitud: (id) => axios.post(`${API_URL}/solicitudes/${id}/enviar-correo`),

  // Detalles de solicitud
  getDetalleSolicitud: (id) => axios.get(`${API_URL}/solicitudes/${id}`),
};

export default SolicitudesService;

