INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Codigo_empleado, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Juan', 'Pérez', 'López', 'PL12345678', 'MAN', 'CT001','ALM', 'AL', 'AE'),
('Calle Falsa 123', '987654322', '87654321', 'María', 'González', 'Díaz', 'GD87654321', 'TAR', 'CT002', 'COC', 'CO', 'LA');
('Calle San Felipe 394', '952563245', '85256341', 'Luis', 'Brayan', 'Perez', 'BP87654121', 'TAR', 'CT003', 'VEN', 'CO', 'LA')

INSERT INTO Solicitud_compra (cod_solicitudcompra, fecha_creacion, Estado_solicicompra, Codigo_empleado)
VALUES 
('SC23658941', '2024-10-01', 'Pendiente', 'GD87654321'),
('SC54789632', '2024-09-30', 'Enviado', 'PL12345678');

INSERT INTO Orden_compra (cod_ordencompra, fecha_ordencompra, fecha_requeridaentrega, Codigo_empleado)
VALUES 
('OC41258963', '2024-10-02', '2024-10-10', 'GD87654321'),
('OC74523002', '2024-10-05', '2024-10-15', 'PL12345678');

INSERT INTO Proveedor (Cod_Proveedor, Nombre_Empresa, RUC, Direccion_Proveedor, Correo_Proveedor)
VALUES 
('PR01523685', 'Insumos Perú', '20123456789', 'Av. Industrial 100', 'contacto@insumosperu.com'),
('PR02458963', 'Suministros Globales', '20123456790', 'Calle Comercio 200', 'ventas@suministrosglobales.com');

INSERT INTO Cotizacion (Cod_cotizacion, Fecha_vencimiento, Fecha_creacion, Monto, Estado_cotizacion, Fecha_entregaestimada, cod_solicitudcompra, Cod_Proveedor, Codigo_empleado)
VALUES 
('CO63148596', '2024-10-15', '2024-10-01', 1500.00, 'Pendiente', '2024-10-10', 'SC23658941', 'PR01523685', 'GD87654321'),
('CO00111512', '2024-10-20', '2024-10-05', 2500.00, 'Finalizado', '2024-10-15', 'SC54789632', 'PR02458963', 'PL12345678');

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

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U1', 'Kilogramo');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U2', 'Litro');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U3', 'Unidad');

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

INSERT INTO Condiciones (Cod_condiciones, Nombre_condiciones) 
VALUES ('A1', 'Congelado'),
       ('A2', 'Refrigerado'),
       ('A3', 'Seco');

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

INSERT INTO Orden_comprainsumo (cantidad_compra, cod_ordencompra, Cod_Insumo)
VALUES 
(9, 'OC41258963', 'HB254'),
(5, 'OC74523002', 'QC658');


INSERT INTO Solicitud_comprainsumo (cantidad_solicitud, cod_solicitudcompra, Cod_Insumo)
VALUES 
(9, 'SC23658941', 'HB254'),
(5, 'SC54789632', 'QC658');