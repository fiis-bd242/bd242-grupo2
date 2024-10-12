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

INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria)
VALUES ('CHK5147856', 'Sesame Chicken Strips', 40.00, 'Tiritas de pollo empanizadas en pan japonés, en salsa glaze fridays', 'AP');
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria)
VALUES ('BUR1254785', 'Bacon Cheeseburger', 38.00, 'Hamburguesa de 200gr, gratinada con queso Cheddar y cubierta con dos tiras de tocino','BS');


INSERT INTO TAMANO (cod_tamano, descripcion_tamano) VALUES 
('PE', 'Pequeño'),
('ME', 'Mediano');
INSERT INTO TIPO_DE_MESA (cod_tipo_de_mesa, descripcion_tipo_mesa) VALUES 
('BA', 'Bar'),
('NR', 'No bar');

INSERT INTO ESTADO_DP (cod_estado_dp, descripcion_estado_dp) VALUES 
('LI', 'Listo'),
('NL', 'No Listo');

INSERT INTO AREA_EC (cod_area_ec, descripcion_ec) VALUES 
('ES', 'Estación Sartén'),
('EA', 'Estación Parrilla');

INSERT INTO ESTADO_KDS (cod_estado_kds, descripcion_kds) VALUES 
('AC', 'Activo'),
('NT', 'No activo');

INSERT INTO ESTADO_ITEM_DP (cod_estado_item_dp, descripcion_estado_item_dp) VALUES 
('LI', 'Listo'),
('NL', 'No Listo');

INSERT INTO ESTADO_IM (cod_estado_im, descripcion_estado_im) VALUES 
('SI', 'Autenticado'),
('NO', 'No autenticado');

INSERT INTO IDENTIFICACION_MESERO (cod_im, fecha, hora, Codigo_empleado, cod_estado_im) VALUES 
('IM00000001', '2024-10-01', '12:00:00', 'GD87654321', 'SI'),
('IM00000002', '2024-10-01', '12:30:00', 'GD87654321', 'SI');

INSERT INTO MESA (cod_mesa, num_sillas, cod_tipo_de_mesa, cod_tamano) VALUES 
('M0000001', 2, 'NR', 'PE'),
('M0000002', 4, 'NR', 'ME');

INSERT INTO DETALLE_PEDIDO (cod_dp, precio_total, cantidad_total, Fecha, Hora, cod_estado_dp,
									cod_im, cod_mesa) VALUES 
('DP000001', 40.00, 1, '2024-10-01', '12:01:45', 'NL', 'IM00000001', 'M0000001'),
('DP000002', 76.00, 2, '2024-10-01', '12:32:01', 'NL', 'IM00000002', 'M0000002');

INSERT INTO ITEM_DETALLE_PEDIDO (cod_item_dp, Cod_prodFriday, cantidad, precio, cod_estado_item_dp, cod_dp) VALUES 
('IDP00001', 'CHK5147856', 1, 40.00, 'NL', 'DP000001'),
('IDP00002', 'BUR1254785', 2, 76.00, 'NL', 'DP000002');

INSERT INTO KDS (cod_kds, cod_area_ec, cod_estado_kds, cod_item_dp) VALUES 
('KDS000ES', 'ES', 'AC', 'IDP00001'),
('KDS000EA', 'EA', 'AC', 'IDP00002');


INSERT INTO EVENTO_ACTUALIZA (fecha, hora, cod_item_dp, cod_estado_item_dp) VALUES 
('2024-10-01', '12:07:00', 'IDP00001', 'LI'),
('2024-10-01', '12:37:00', 'IDP00002', 'LI');
