-- Ingreso de MNuevo Producto


SELECT ci.cod_categoriainsumo FROM categoria_insumo ci WHERE ci.nombre_categoriainsumo = '';
SELECT s.cod_subcategoria FROM subcategoria s WHERE s.nombre_subcategoria = '';
SELECT c.cod_condiciones FROM condiciones c WHERE c.nombre_condiciones = '';
select um.cod_unidad FROM unidad_medidad um WHERE um.nombre_unidad = 'Unidad';

insert into insumo (cod_categoriainsumo , cod_subcategoria, nombre_insumo, cod_unidad, cod_condiciones) values ('', '', 'Salsa de tomate', '', '')


select * from insumo i 

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
 

CREATE OR REPLACE FUNCTION generar_codigo_empleado() 
RETURNS TRIGGER AS $$
BEGIN
  NEW.Codigo_empleado := SUBSTRING(NEW.Primer_nombre FROM 1 FOR 1) || 
                         SUBSTRING(NEW.Primer_apellido FROM 1 FOR 1) || 
                         NEW.DNI;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
EXECUTE FUNCTION generar_codigo_empleado();


INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Mario', 'Lopez', 'Sanches', 'MAN', 'CT001','ALM', 'AL', 'AE');


select * from empleado e 

select * from insumo i 

SELECT * FROM insumo i WHERE i.nombre_insumo LIKE '%tomate%';

select * from insumo i where i.cod_categoriainsumo = 'C3'

select * from insumo i where i.cod_subcategoria = 'S23'


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

INSERT INTO Movimiento (Cod_Movimiento, Cantidad_movimiento, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento, FechaHora_inicio, FechaHora_fin) VALUES
('MV456', 50, 'JQ87415321', 'ST145', 'HB254', 'RR123', 'S',
  TIMESTAMP '2024-10-09 06:35:12',  -- Combinando fecha y hora de inicio
  TIMESTAMP '2024-10-09 07:01:00'), -- Combinando fecha y hora de fin
('MV457', 70, 'JQ87415321', 'ST568', 'LC154', 'RR123', 'E',
  TIMESTAMP '2024-10-09 05:43:45',  -- Combinando fecha y hora de inicio
  TIMESTAMP '2024-10-09 06:02:48'); -- Combinando fecha y hora de fin



select * from movimiento m 
-- INGRESO DE INSUMOS
  INSERT INTO Movimiento (Cod_Movimiento, Cantidad_movimiento, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento, FechaHora_inicio, FechaHora_fin) VALUES
('MV458', 50, 'JQ87415321', 'ST145', 'HB254', 'RR123', 'S',
  NOW(),                               -- Timestamp actual para FechaHora_inicio
  NOW() + INTERVAL '30 minutes'),      -- Timestamp actual más 30 minutos para FechaHora_fin
('MV459', 70, 'JQ87415321', 'ST568', 'LC154', 'RR123', 'E',
  NOW(),                               -- Timestamp actual para FechaHora_inicio
  NOW() + INTERVAL '1 hour');          -- Timestamp actual más 1 hora para FechaHora_fin

  





