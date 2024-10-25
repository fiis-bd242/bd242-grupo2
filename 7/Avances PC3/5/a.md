# Avance ingreso nuevo producto


Query:

INSERT INTO insumo (cod_insumo , cod_categoriainsumo, cod_subcategoria, nombre_insumo, cod_unidad, cod_condiciones, cantidad_total, umbral) 
VALUES (
	'SERIA',
    (SELECT ci.cod_categoriainsumo FROM categoria_insumo ci WHERE ci.nombre_categoriainsumo = 'Comida'),
    (SELECT s.cod_subcategoria FROM subcategoria s WHERE s.nombre_subcategoria = 'Abarrotes'),
    'Salsa de tomate',
    (SELECT um.cod_unidad FROM unidad_medidad um WHERE um.nombre_unidad = 'Unidad'),
    (SELECT c.cod_condiciones FROM condiciones c WHERE c.nombre_condiciones = 'Refrigerado'),
    '0',
    20
);
 

 