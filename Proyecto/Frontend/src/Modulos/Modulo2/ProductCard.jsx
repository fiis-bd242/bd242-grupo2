import React, { useState } from 'react';
import '../../styles/ProductCard.css';

const ProductCard = ({ product, onAddToOrder }) => {
  const [quantity, setQuantity] = useState(0);

  const increment = () => setQuantity(quantity + 1);
  const decrement = () => setQuantity(Math.max(0, quantity - 1));

  return (
    <div className="product-card">
      <h3>{product.nombre_producto}</h3>
      <div className="quantity-controls">
        <button onClick={increment} className="add-button">AÑADIR</button>
        <button onClick={decrement} className="remove-button">QUITAR</button>
        <span className="quantity-display">{quantity}</span>
      </div>
    </div>
  );
};

export default ProductCard;
