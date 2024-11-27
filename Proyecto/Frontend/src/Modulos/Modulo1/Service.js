const API_URL = import.meta.env.VITE_APP_API_URL;


async function crearPedido(nombreInsumo) {
    try {
      // Verificamos si el nombre del insumo está vacío
      if (!nombreInsumo) {
        throw new Error("El nombre del insumo es obligatorio");
      }
  
      // Realizamos la solicitud POST a la API
      const response = await fetch(`${API_URL}/crearpedido`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          nombre_insumo: nombreInsumo,
        }),
      });
  
      // Verificamos si la respuesta es exitosa
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Error al crear el pedido');
      }
  
      // Si la respuesta es exitosa, retornamos los insumos encontrados
      const data = await response.json();
      return data;
  
    } catch (error) {
      // Capturamos y mostramos cualquier error
      console.error("Error en la creación del pedido:", error.message);
      throw error;
    }
  }
  
  export { crearPedido };