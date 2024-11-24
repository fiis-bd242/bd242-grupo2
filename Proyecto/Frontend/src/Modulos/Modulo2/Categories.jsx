import React, { useEffect, useState } from 'react';
import { fetchCategories } from './Service_CategoryService';
import CategoryCard from './CategoryCard';
import '../../styles/Categories.css';

const Categories = ({ onCategoryClick }) => {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    const loadCategories = async () => {
      try {
        const data = await fetchCategories();
        setCategories(data);
      } catch (error) {
        console.error('Error loading categories', error);
      }
    };
    loadCategories();
  }, []);

  return (
    <div className="categories-container">
      {categories.map((category) => (
        <CategoryCard
          key={category.cod_categoria.trim()}
          category={category}
          onClick={onCategoryClick}
        />
      ))}
    </div>
  );
};

export default Categories;
