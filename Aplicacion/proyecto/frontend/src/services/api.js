// frontend/src/services/api.js
import axios from 'axios';

const API_URL = 'http://127.0.0.1:5000/api';

// Función para agregar un nuevo insumo
export const agregarInsumo = async (insumo) => {
    try {
        const response = await axios.post(`${API_URL}/agregar_insumo`, insumo);
        return response.data;
    } catch (error) {
        throw error.response ? error.response.data : error;
    }
};
