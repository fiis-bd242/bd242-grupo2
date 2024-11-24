import axios from "../../api";

export const saveOrderItems = async (cod_categoria, products) => {
  try {
    const response = await axios.post(
      `/modulo2/registrando_pedido/categorias/${cod_categoria}/items_pedido`,
      { productos: products }
    );
    return response.data;
  } catch (error) {
    console.error('Error saving order items:', error);
    throw error;
  }
};
