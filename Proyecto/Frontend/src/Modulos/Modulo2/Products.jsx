import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom'; // Importamos el hook useLocation
import { fetchProductsByCategory } from './Service_ProductService';
import ProductCard from './ProductCard';
import '../../styles/Products.css';

const Products = ({ onAddToOrder, onBack }) => {
  const [products, setProducts] = useState([]);
  // Pasando cod_categoria mediante la URL
  const location = useLocation(); // Usamos el hook useLocation para obtener el estado
  const codCategoria = location.state?.cod_categoria; // Accedemos 
  console.log(codCategoria)

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

  return (
    <div className="products-container">
      <button className="back-button" onClick={onBack}>ATRAS</button>
      {products.map((product) => (
        <ProductCard
          key={product.cod_prodfriday}
          product={product}
          onAddToOrder={onAddToOrder}
        />
      ))}
    </div>
  );
};

export default Products;
