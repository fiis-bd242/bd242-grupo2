// Service_summary.js
const API_URL = import.meta.env.VITE_APP_API_URL;

export const obtenerSummary = async (codDp) => {
  try {
    const response = await fetch(`${API_URL}/modulo2/registrando_pedido/summary?cod_dp=${codDp}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      }
    });
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error en obtenerSummary:', error);
    throw error;
  }
};