import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom'; // Importamos el hook useLocation
import { useNavigate } from "react-router-dom";
import { fetchProductsByCategory } from './Service_ProductService';
import ProductCard from './ProductCard';
import '../../styles/Products.css';

const Products = ({ onAddToOrder, onBack }) => {
  const [products, setProducts] = useState([]);
  const location = useLocation(); // Usamos el hook useLocation para obtener el estado
  const codCategoria = location.state?.cod_categoria; // Accedemos 
  const navigate = useNavigate(); // Hook para redirigir

  useEffect(() => {
    const loadProducts = async () => {
      try {
        const data = await fetchProductsByCategory(codCategoria);
        setProducts(data);
      } catch (error) {
        console.error('Error loading products', error);
      }
    };
    loadProducts();
  }, [codCategoria]);

  const handleAdd = () => {
    /*
    CODIGO PARA CONECTAR CON EL BACKEND DE INSERTAR ITEM PEDIDO
    */
    setTimeout(() => {
      navigate("/categorias");
    }, 350);
  };

  const handleReady = () => {
    console.log("BOTÓN LISTO");
  };

  return (
    <div className="products-container">
      <div className="product-list">
        {products.map((product) => (
          <ProductCard
            key={product.cod_prodfriday}
            product={product}
            onAddToOrder={onAddToOrder}
          />
        ))}
      </div>
      <div className="action-buttons">
        <button className="add-all-button" onClick={handleAdd}>AGREGAR</button>
        <button className="ready-button" onClick={handleReady}>LISTO</button>
      </div>
    </div>
  );
};

export default Products;
