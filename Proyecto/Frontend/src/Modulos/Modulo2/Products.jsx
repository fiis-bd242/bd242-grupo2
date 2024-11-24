import React, { useEffect, useState } from 'react';
import { fetchProductsByCategory } from '../../services/ProductService';
import ProductCard from './ProductCard';
import '../../styles/Products.css';

const Products = ({ codCategoria, onAddToOrder, onBack }) => {
  const [products, setProducts] = useState([]);

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
      <button className="back-button" onClick={onBack}>Back to Categories</button>
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
