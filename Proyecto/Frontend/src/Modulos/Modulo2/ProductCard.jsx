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
        <button onClick={decrement}>-</button>
        <span>{quantity}</span>
        <button onClick={increment}>+</button>
      </div>
      <button onClick={() => onAddToOrder(product.cod_prodfriday, quantity)}>
        Add to Order
      </button>
    </div>
  );
};

export default ProductCard;
