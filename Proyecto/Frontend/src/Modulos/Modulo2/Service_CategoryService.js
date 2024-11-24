import axios from "../../api";

export const fetchCategories = async () => {
  try {
    const response = await axios.get('/modulo2/registrando_pedido/categorias');
    return response.data;
  } catch (error) {
    console.error('Error fetching categories:', error);
    throw error;
  }
};
