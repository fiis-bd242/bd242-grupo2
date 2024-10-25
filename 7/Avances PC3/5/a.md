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
 

## Cambios a tabla MOVIMIENTO
DROP TABLE IF EXISTS Movimiento CASCADE;
CREATE TABLE Movimiento (
  Cantidad_movimiento NUMERIC(10,2) NOT NULL,
  Cod_Movimiento CHAR(5) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_Stock VARCHAR(5) NOT NULL,
  Cod_Insumo CHAR(5) NOT NULL,
  Cod_Almacen VARCHAR(5) NOT NULL,
  Cod_tipomovimiento CHAR(1) NOT NULL,
  FechaHora_inicio TIMESTAMP NOT NULL,
  FechaHora_fin TIMESTAMP NOT NULL,
  PRIMARY KEY (Cod_Movimiento)
);


 
