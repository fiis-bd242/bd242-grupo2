// frontend/src/components/InsumoForm.js
import React, { useState } from 'react';
import { agregarInsumo } from '../services/api';

const InsumoForm = () => {
    const [insumo, setInsumo] = useState({
        nombre_insumo: '',
        nombre_unidad: '',
        nombre_condiciones: '',
        nombre_subcategoria: ''
    });

    const handleChange = (e) => {
        setInsumo({ ...insumo, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await agregarInsumo(insumo);
            alert(response.message);
            setInsumo({
                nombre_insumo: '',
                nombre_unidad: '',
                nombre_condiciones: '',
                nombre_subcategoria: ''
            });
        } catch (error) {
            alert(error.error || "Error al agregar insumo");
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <input type="text" name="nombre_insumo" placeholder="Nombre del insumo" value={insumo.nombre_insumo} onChange={handleChange} required />
            <input type="text" name="nombre_unidad" placeholder="Unidad" value={insumo.nombre_unidad} onChange={handleChange} required />
            <input type="text" name="nombre_condiciones" placeholder="Condiciones" value={insumo.nombre_condiciones} onChange={handleChange} required />
            <input type="text" name="nombre_subcategoria" placeholder="Subcategoría" value={insumo.nombre_subcategoria} onChange={handleChange} required />
            <button type="submit">Agregar Insumo</button>
        </form>
    );
};

export default InsumoForm;
