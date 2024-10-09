-- Poblamiento de datos

INSERT INTO CATEGORIA (cod_categoria, nombre_categoria) VALUES 
('AP', 'Appetizers'),
('BS', 'Burgers & Sandwiches');

INSERT INTO Turno (Cod_turno, Nombre_turno, Hora_inicio, Hora_fin)
VALUES 
('TAR', 'Tarde', '14:00:00', '22:00:00'),
('MAN', 'Mañana', '08:00:00', '18:00:00');
INSERT INTO Area (Cod_area, Nombre_area)
VALUES 
('ALM', 'Almacén'),
('COC', 'Cocina');
INSERT INTO Cargo (Cod_cargo, Nombre_cargo)
VALUES 
('AL', 'ALMACENERO'),
('CO', 'COCINERO');
INSERT INTO Tipo_contrato (Cod_tipo_contrato, Nombre_tipo_contrato)
VALUES 
('C001', 'Indefinido'),
('C002', 'Temporal');
INSERT INTO Local (Cod_local, Ubicacion_local, Nombre_local)
VALUES 
('AE', 'Av. Central 123', 'AEROPUERTO'),
('LA', 'Av. Norte 456', 'LARCOMAR');
INSERT INTO Contrato (Cod_contrato, Fecha_contratacion, Cod_tipo_contrato)
VALUES 
('CT001', '2023-09-01', 'C001'),
('CT002', '2024-01-01', 'C002');
INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Codigo_empleado, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Juan', 'Pérez', 'López', 'PL12345678', 'MAN', 'CT001','ALM', 'AL', 'AE'),
('Calle Falsa 123', '987654322', '87654321', 'María', 'González', 'Díaz', 'GD87654321', 'TAR', 'CT002', 'COC', 'CO', 'LA');

INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, Valoracion, cod_categoria)
VALUES ('CHK5147856', 'Sesame Chicken Strips', 40.00, 'Tiritas de pollo empanizadas en pan japonés, en salsa glaze fridays', 3.20, 'AP');
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, Valoracion, cod_categoria)
VALUES ('BUR1254785', 'Bacon Cheeseburger', 38.00, 'Hamburguesa de 200gr, gratinada con queso Cheddar y cubierta con dos tiras de tocino',4.00,'BS');

INSERT INTO Tipo_movimiento (Cod_tipomovimiento, Nombre_tipomovimiento) 
VALUES ('E', 'Entrada');

INSERT INTO Tipo_movimiento (Cod_tipomovimiento, Nombre_tipomovimiento) 
VALUES ('S', 'Salida');


INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('C1', 'Abastecim.');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('C2', 'Bebidas');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('C3', 'Comida');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('C4', 'ProcesadoC');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('C5', 'ProcesadoB');



INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U1', 'Kilogramo');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U2', 'Litro');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U3', 'Unidad');



INSERT INTO Subcategoria (Cod_subcategoria, Nombre_subcategoria, Cod_categoria) 
VALUES ('S01', 'Artículo de cocina', 'C1'),
       ('S02', 'Artículo de limpieza', 'C1'),
       ('S03', 'Descartable', 'C1'),
       ('S04', 'Menús', 'C1'),
       ('S05', 'Otros', 'C1'),
       ('S06', 'Papelería', 'C1'),
       ('S07', 'Uniformes', 'C1'),
       ('S08', 'Vajillas', 'C1'),
       ('S09', 'Barmix', 'C2'),
       ('S10', 'Cervezas', 'C2'),
       ('S11', 'Licores', 'C2'),
       ('S12', 'No alcohólicos', 'C2'),
       ('S13', 'Vinos', 'C2'),
       ('S14', 'Abarrotes', 'C3'),
       ('S15', 'Aves', 'C3'),
       ('S16', 'Carnes y embutidos', 'C3'),
       ('S17', 'Hamburguesas', 'C3'),
       ('S18', 'Lácteos', 'C3'),
       ('S19', 'Pan', 'C3'),
       ('S20', 'Papas', 'C3'),
       ('S21', 'Pescados', 'C3'),
       ('S22', 'Quesos', 'C3'),
       ('S23', 'Verduras', 'C3'),
       ('S24', 'Aceites', 'C4'),
       ('S25', 'Calientes', 'C4'),
       ('S26', 'Fríos', 'C4'),
       ('S27', 'Secos', 'C4'),
       ('S28', 'Vegetales', 'C4'),
       ('S29', 'Barmix Preps 1', 'C5'),
       ('S30', 'Barmix Preps 2', 'C5');


INSERT INTO Condiciones (Cod_condiciones, Nombre_condiciones) 
VALUES ('A1', 'Congelado'),
       ('A2', 'Refrigerado'),
       ('A3', 'Seco');

      
INSERT INTO Insumo (Cod_Insumo, Nombre_Insumo, Cantidad_total, Cod_unidad, Cod_condiciones, Cod_subcategoria, Cod_categoriainsumo)
VALUES 
('HB254', 'hamburguesa 200g', 230, 'U3', 'A1', 'S17', 'C3'),
('QC658', 'queso chedar', 45, 'U3', 'A2', 'S18', 'C3'),
('TL659', 'tocino loncha', 26, 'U3', 'A2', 'S16', 'C3'),
('LC154', 'lechuga', 48, 'U3', 'A2', 'S23', 'C3'),
('TM265', 'tomate', 45, 'U3', 'A2', 'S23', 'C3'),
('CB985', 'cebollas', 47, 'U3', 'A2', 'S23', 'C3'),
('PP346', 'papas', 150, 'U3', 'A3', 'S20', 'C3'),
('TP978', 'tiras de pollo', 170, 'U1', 'A1', 'S15', 'C3'),
('SS265', 'salsa salame', 30, 'U3', 'A3', 'S25', 'C4');





INSERT INTO Proveedor (Cod_Proveedor, Nombre_Empresa, RUC, Direccion_Proveedor, Correo_Proveedor) VALUES
('PLL1547852', 'PolloRico', '15478569587', 'Av. CalleNoReal 189', 'pollorico@pollo.com'),
('LCH2586475', 'LechugaFresca', '2145896574', 'Av. GaChuLe568', 'gachule@lechuga.com');


INSERT INTO Tipo_Almacen (Cod_tipo_almacen, Nombre_tipo_almacen) VALUES
('B1', 'Congelador'),
('B2', 'Refrigerador'),
('B3', 'Estante');






INSERT INTO SeConviertenEn (Cantidad_Receta, Cod_Insumo, Cod_Producto) VALUES
(0.2, 'TP978', 'CHK5147856'),
(30, 'PP346', 'CHK5147856'),
(1, 'SS265', 'CHK5147856'),
(1, 'HB254', 'BUR1254785'),
(1, 'QC658', 'BUR1254785'),
(2, 'TL659', 'BUR1254785'),
(2, 'LC154', 'BUR1254785'),
(2, 'TM265', 'BUR1254785'),
(1, 'CB985', 'BUR1254785'),
(8, 'PP346', 'BUR1254785');


INSERT INTO Almacen (Cod_Almacen, Nombre_Almacen, Cod_tipo_almacen) VALUES
('RR123', 'Congelador1', 'B1'),
('RR124', 'Congelador2', 'B1');



INSERT INTO Tiene (Cod_Proveedor, Cod_Insumo) VALUES
('PLL1547852', 'HB254'),
('PLL1547852', 'TP978'),
('LCH2586475', 'LC154');




INSERT INTO Almacenado (Cod_Insumo, Cod_Almacen) VALUES
('HB254', 'RR123'),
('TP978', 'RR123');



INSERT INTO Stock (Cod_Stock, Fecha_Vencimiento, Cantidad, Cod_Insumo, Cod_Proveedor, Cod_Almacen) VALUES
('ST145', '2025-01-01', 45, 'HB254', 'PLL1547852', 'RR123'),
('ST568', '2005-04-03', 25, 'LC154', 'LCH2586475', 'RR123');

INSERT INTO HojaProduccion (Cod_Hoja, Fecha_elaboracion, Codigo_empleado) VALUES
('HP45', '2024-10-08', 'PL12345678'),
('HP46', '2024-10-09', 'PL12345678');


INSERT INTO Incluye (Cod_Hoja, Cod_prodFriday, Cantidad) VALUES
('HP45', 'CHK5147856', 15),
('HP45', 'BUR1254785', 80),
('HP46', 'CHK5147856', 25),
('HP46', 'BUR1254785', 65);


INSERT INTO Movimiento (Cod_Movimiento, Fecha_Movimiento, Hora_inicio, Cantidad_movimiento, Hora_fin, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento) VALUES
('MV456', '2024-10-09', '06:35:12', 50, '07:01:00', 'PL12345678', 'ST145', 'HB254', 'RR123', 'S'),
('MV457', '2024-10-09', '05:43:45', 70, '06:02:48', 'PL12345678', 'ST568', 'LC154', 'RR123', 'E');


INSERT INTO Reporte_disponibilidad (Cod_reporte_disponibilidad, Fecha_reporte, Hora_reporte, Cod_Insumo, Emisor, Receptor)
VALUES
('RD25478569', '2024-10-09', '07:15:02', 'HB254', 'PL12345678', 'GD87654321'),
('RD25478570', '2024-10-09', '07:18:23', 'LC154', 'PL12345678', 'GD87654321');

