import axios from "../../api";

export const fetchProductsByCategory = async (cod_categoria) => {
  try {
    const response = await axios.get(`/modulo2/registrando_pedido/categorias/${cod_categoria}/`);
    return response.data;
  } catch (error) {
    console.error('Error fetching products:', error);
    throw error;
  }
};
