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
  FechaHora_fin TIMESTAMP,
  PRIMARY KEY (Cod_Movimiento)
);

INSERT INTO Movimiento (Cod_Movimiento, Cantidad_movimiento, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento, FechaHora_inicio, FechaHora_fin) VALUES
('MV456', 50, 'JQ87415321', 'ST145', 'HB254', 'RR123', 'S',
  TIMESTAMP '2024-10-09 06:35:12',  -- Combinando fecha y hora de inicio
  TIMESTAMP '2024-10-09 07:01:00'), -- Combinando fecha y hora de fin
('MV457', 70, 'JQ87415321', 'ST568', 'LC154', 'RR123', 'E',
  TIMESTAMP '2024-10-09 05:43:45',  -- Combinando fecha y hora de inicio
  TIMESTAMP '2024-10-09 06:02:48'); -- Combinando fecha y hora de fin



select * from movimiento m 
-- INGRESO DE INSUMOS, resigtrar hora inicio
  INSERT INTO Movimiento (Cod_Movimiento, Cantidad_movimiento, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento, FechaHora_inicio, FechaHora_fin) VALUES
('MV458', 50, 'JQ87415321', 'ST145', 'HB254', 'RR123', 'S',
  NOW(),                               -- Timestamp actual para FechaHora_inicio
  NOW() + INTERVAL '30 minutes'),      -- Timestamp actual más 30 minutos para FechaHora_fin
('MV459', 70, 'JQ87415321', 'ST568', 'LC154', 'RR123', 'E',
  NOW(),                               -- Timestamp actual para FechaHora_inicio
  NOW() + INTERVAL '1 hour');          -- Timestamp actual más 1 hora para FechaHora_fin



-- Buscar productos
SELECT ci.nombre_categoriainsumo , s.nombre_subcategoria , i.cod_insumo , i.Nombre_Insumo, um.nombre_unidad, i.cantidad_total, a.nombre_almacen, s2.fecha_vencimiento, p.nombre_empresa , s2.cod_stock 
FROM Insumo i
left JOIN subcategoria s ON i.Cod_subcategoria = s.Cod_subcategoria
left JOIN categoria_insumo ci ON s.cod_categoria = ci.cod_categoriainsumo
left join unidad_medidad um on i.cod_unidad = um.cod_unidad
left join stock s2 on i.cod_insumo = s2.cod_insumo 
left join almacen a on s2.cod_almacen = a.cod_almacen 
left join proveedor p on s2.cod_proveedor = p.cod_proveedor 
WHERE (ci.cod_categoriainsumo = COALESCE(NULL, ci.cod_categoriainsumo))
	AND (s.Cod_subcategoria = COALESCE(NULL, s.Cod_subcategoria))
	AND (i.Nombre_Insumo ILIKE COALESCE('%' || 'tomate' || '%', '%'));

