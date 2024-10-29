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
('COC', 'Cocina'),
('VEN', 'Ventas');

INSERT INTO Cargo (Cod_cargo, Nombre_cargo)
VALUES 
('AL', 'ALMACENERO'),
('CO', 'COCINERO'),
('VE', 'VENTAS'),
('JA', 'JEFEALMACEN');

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
('CT002', '2024-01-01', 'C002'),
('CT003', '2024-10-01', 'C002'),
('CT004', '2024-11-01', 'C002');

INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Codigo_empleado, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Juan', 'Pérez', 'López', 'PL12345678', 'MAN', 'CT001','ALM', 'AL', 'AE'),
('Calle Falsa 123', '987654322', '87654321', 'María', 'González', 'Díaz', 'GD87654321', 'TAR', 'CT002', 'COC', 'CO', 'LA'),
('Calle Jirasol 152', '987452322', '87415321', 'Felipe', 'Juan', 'Quispe', 'JQ87415321', 'MAN', 'CT004', 'ALM', 'JA', 'AE'),
('Calle San Felipe 394', '952563245', '85256341', 'Luis', 'Brayan', 'Perez', 'BP87654121', 'TAR', 'CT003', 'VEN', 'VE', 'LA');

INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria)
VALUES ('CHK5147856', 'Sesame Chicken Strips', 40.00, 'Tiritas de pollo empanizadas en pan japonés, en salsa glaze fridays', 'AP');
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria)
VALUES ('BUR1254785', 'Bacon Cheeseburger', 38.00, 'Hamburguesa de 200gr, gratinada con queso Cheddar y cubierta con dos tiras de tocino','BS');

INSERT INTO Tipo_movimiento (Cod_tipomovimiento, Nombre_tipomovimiento) 
VALUES ('E', 'Entrada');

INSERT INTO Tipo_movimiento (Cod_tipomovimiento, Nombre_tipomovimiento) 
VALUES ('S', 'Salida');


INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('AB', 'Abastecim.');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('BE', 'Bebidas');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('CO', 'Comida');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('PC', 'ProcesadoC');

INSERT INTO Categoria_insumo (Cod_categoriainsumo, Nombre_categoriainsumo) 
VALUES ('PB', 'ProcesadoB');



INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U1', 'Kilogramo');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U2', 'Litro');

INSERT INTO Unidad_medidad (Cod_unidad, Nombre_unidad) 
VALUES ('U3', 'Unidad');



INSERT INTO Subcategoria (Cod_subcategoria, Nombre_subcategoria, Cod_categoria) 
VALUES ('ADC', 'Artículo de cocina', 'AB'),
       ('ADL', 'Artículo de limpieza', 'AB'),
       ('DES', 'Descartable', 'AB'),
       ('MNS', 'Menús', 'AB'),
       ('OTR', 'Otros', 'AB'),
       ('PAP', 'Papelería', 'AB'),
       ('UNI', 'Uniformes', 'AB'),
       ('VAJ', 'Vajillas', 'AB'),
       ('BAR', 'Barmix', 'BE'),
       ('CER', 'Cervezas', 'BE'),
       ('LIC', 'Licores', 'BE'),
       ('NAL', 'No alcohólicos', 'BE'),
       ('VIN', 'Vinos', 'BE'),
       ('ABA', 'Abarrotes', 'CO'),
       ('AVE', 'Aves', 'CO'),
       ('CAR', 'Carnes y embutidos', 'CO'),
       ('HAM', 'Hamburguesas', 'CO'),
       ('LAC', 'Lácteos', 'CO'),
       ('PAN', 'Pan', 'CO'),
       ('PPS', 'Papas', 'CO'),
       ('PEZ', 'Pescados', 'CO'),
       ('QUE', 'Quesos', 'CO'),
       ('VER', 'Verduras', 'CO'),
       ('ACE', 'Aceites', 'PC'),
       ('CAL', 'Calientes', 'PC'),
       ('FRI', 'Fríos', 'PC'),
       ('SEC', 'Secos', 'PC'),
       ('VEG', 'Vegetales', 'PC'),
       ('BP1', 'Barmix Preps 1', 'PB'),
       ('BP2', 'Barmix Preps 2', 'PB');


INSERT INTO Condiciones (Cod_condiciones, Nombre_condiciones) 
VALUES ('A1', 'Congelado'),
       ('A2', 'Refrigerado'),
       ('A3', 'Seco');

      
INSERT INTO Insumo (Cod_Insumo, Nombre_Insumo, Cantidad_total, umbral, Cod_unidad, Cod_condiciones, Cod_subcategoria, Cod_categoriainsumo)
VALUES 
('HB254', 'hamburguesa 200g', 230, 100, 'U3', 'A1', 'HAM', 'CO'),
('QC658', 'queso chedar', 45, 20, 'U3', 'A2', 'QUE', 'CO'),
('TL659', 'tocino loncha', 26, 20, 'U3', 'A2', 'CAR', 'CO'),
('LC154', 'lechuga', 48, 20, 'U3', 'A2', 'VER', 'CO'),
('TM265', 'tomate', 45, 20, 'U3', 'A2', 'VER', 'CO'),
('CB985', 'cebollas', 47, 20, 'U3', 'A2', 'VER', 'CO'),
('PP346', 'papas', 150, 20, 'U3', 'A3', 'PPS', 'CO'),
('TP978', 'tiras de pollo', 170, 20, 'U1', 'A1', 'AVE', 'CO'),
('SS265', 'salsa salame', 30, 20, 'U3', 'A3', 'FRI', 'PC');





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
('HP45', '2024-10-08', 'JQ87415321'),
('HP46', '2024-10-09', 'JQ87415321');


INSERT INTO Incluye (Cod_Hoja, Cod_prodFriday, Cantidad) VALUES
('HP45', 'CHK5147856', 15),
('HP45', 'BUR1254785', 80),
('HP46', 'CHK5147856', 25),
('HP46', 'BUR1254785', 65);


INSERT INTO Movimiento (Cod_Movimiento, Fecha_Movimiento, Hora_inicio, Cantidad_movimiento, Hora_fin, Codigo_empleado, Cod_Stock, Cod_Insumo, Cod_Almacen, Cod_tipomovimiento) VALUES
('MV456', '2024-10-09', '06:35:12', 50, '07:01:00', 'JQ87415321', 'ST145', 'HB254', 'RR123', 'S'),
('MV457', '2024-10-09', '05:43:45', 70, '06:02:48', 'JQ87415321', 'ST568', 'LC154', 'RR123', 'E');


INSERT INTO Reporte_disponibilidad (Cod_reporte_disponibilidad, Fecha_reporte, Hora_reporte, Cod_Insumo, Emisor, Receptor)
VALUES
('RD25478569', '2024-10-09', '07:15:02', 'HB254', 'JQ87415321', 'BP87654121'),
('RD25478570', '2024-10-09', '07:18:23', 'LC154', 'JQ87415321', 'BP87654121');





INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Codigo_empleado, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Mario', 'Lopez', 'Sanches', 'LS12345678', 'MAN', 'CT001','ALM', 'AL', 'AE');
INSERT INTO Gasto (Cod_Gasto,Area_Gasto,Monto_Gasto,Local_gasto,Fecha_gasto,codigo_empleado)
VALUES ('000000001C','Administracion','2134','Fridays Mall Plaza Comas','01-2-2021','LS12345678'),
('000000002C','Almacen','2134','Fridays Plaza San Miguel','01-2-2021','LS12345678'),
('000000003C','Administracion','2134','Fridays Open Plaza','01-2-2021','LS12345678'),
('000000004C','Producion','2134','Fridays Óvalo Monitor','01-2-2021','LS12345678'),
('000000005C','Almacen','2134','Fridays Plaza San Miguel','01-2-2021','LS12345678'),
('000000006C','Producion','2134','Fridays Óvalo Gutiérrez','01-2-2021','LS12345678');
INSERT INTO Solicitud_ReporteCostos (Cod_Solicitud, Correo_Solicitante,Fecha_Solicitud,Estado_Solicitud,Descripcion_Solicitud,Fecha_Entrega,Codigo_empleado, SolicitaCodigo_empleado)
VALUES ('000000002B','gachule@DICS.com','15-02-2021','En proseso','reporte de costos insumos','01-04-2021','LS12345678','LS12345678'),
('000000003B','nsnkaksm@DICS.com','13-01-2022','En proseso','reporte de costos insumos','01-04-2022','LS12345678','LS12345678'),
('000000004B','nsiemdmm@DICS.com','14-05-2023','En proseso','reporte de costos administrativos','01-04-2023','LS12345678','LS12345678'),
('000000005B','msndoss@DICS.com','15-09-2024','En proseso','reporte de costos Operativos ','01-04-2024','LS12345678','LS12345678'),
('000000009B','nsnsmkj@DICS.com','15-02-2024','En proseso','reporte de costos insumos','01-04-2024','LS12345678','LS12345678');
INSERT INTO Informe_RC ( Cod_RC, Fecha, Descripcion, Fecha_InicioRC, Fecha_FinRC, Local_RC, Codigo_empleado)
VALUES ('000000023C','24-5-2024','reporte de costos insumos','01-04-2023','30-7-2023','Fridays Plaza Norte','LS12345678'),
('100000023C','01-05-2022','reporte de costos Administrativo','01-04-2021','30-7-2021','Fridays Salaverry','LS12345678'),
('200000025C','12-06-2020','reporte de costos insumos','01-04-2019','30-7-2019','Fridays Plaza San Miguel','LS12345678'),
('300000026C','24-03-2021','reporte de costos operativo','01-04-2020','30-7-2020','Fridays Plaza Norte','LS12345678'),
('400000027C','24-5-2023','reporte de costos administrativo','01-04-2022','30-7-2022','Fridays Plaza San Miguel','LS12345678'),
('500000028C','24-5-2024','reporte de costos insumos','01-04-2023','30-7-2023','Fridays Plaza Norte','LS12345678');







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



















-- Insertar datos en la tabla Habilidad
INSERT INTO Habilidad (Nombre_habilidad, Descripcion, Cod_habilidad)
VALUES 
('Atención al cliente', 'Habilidad para interactuar y resolver dudas de clientes', 'H001'),
('Cocina rápida', 'Capacidad de preparar alimentos en poco tiempo', 'H002');



-- Insertar datos en la tabla Estado_Asistencia
INSERT INTO Estado_Asistencia (Cod_estado, Nombre_Estado)
VALUES 
('OK', 'Asistencia correcta'),
('AI', 'Ausencia injustificada');

-- Insertar datos en la tabla Estado_SD
INSERT INTO Estado_SD (Cod_estado_SD, Nombre_estado_sd)
VALUES 
('PEN', 'Pendiente'),
('RES', 'Resuelto');

-- Insertar datos en la tabla Tipo_SD
INSERT INTO Tipo_SD (Cod_tipo_sd, Nombre_tipo_sd)
VALUES 
('TSD01', 'Solicitud de Vacaciones'),
('TSD02', 'Descargo por Falla');

-- Insertar datos en la tabla Tipo_notificacion
INSERT INTO Tipo_notificacion (Cod_tipo_notificacion, Nombre_tipo_notificacion)
VALUES 
('TN01', 'Recordatorio de Turno'),
('TN02', 'Cambio de Turno');

-- Insertar datos en la tabla Tipo_generación
INSERT INTO Tipo_generacion (Cod_tipo_generacion, Nombre_tipo_generacion)
VALUES 
('TG01', 'Automático'),
('TG02', 'Manual');

-- Insertar datos en la tabla Estado_usuario
INSERT INTO Estado_usuario (Cod_estado_usuario, Nombre_estado_usuario)
VALUES 
('ACT', 'Activo'),
('INA', 'Inactivo');



-- Insertar datos en la tabla Asistencia
INSERT INTO Asistencia (Cod_asistencia, Fecha, Hora_ingreso, Hora_salida, Cod_estado)
VALUES 
('A001', '2024-10-01', '08:00:00', '14:00:00', 'OK'),
('A002', '2024-10-01', '14:00:00', '20:00:00', 'AI');



-- Insertar datos en la tabla Horario_libre
INSERT INTO Horario_libre (Hora_inicio, Hora_fin, Cod_horario, Codigo)
VALUES 
('14:00:00', '18:00:00', 'H001', 'PL12345678'),
('10:00:00', '14:00:00', 'H002', 'GD87654321');

-- Insertar datos en la tabla Historial_laboral
INSERT INTO Historial_laboral (Cod_his_lab, Empresa, Cargo, Duración, Codigo_empleado)
VALUES 
('HL001', 'KFC', 'Almacenero', 2.5, 'PL12345678'),
('HL002', 'KFC', 'Cocinero', 1.2, 'GD87654321');

-- Insertar datos en la tabla Solicitud_o_descargo
INSERT INTO Solicitud_o_descargo (Cod_sd, Titulo, Descripcion, Evidencia, Respuesta, Codigo_empleado, Cod_estado_SD, Cod_tipo_sd)
VALUES 
('SD001', 'Solicitud de Vacaciones', 'Solicito 10 días de vacaciones', 'Vacaciones.pdf', '', 'PL12345678', 'PEN', 'TSD01'),
('SD002', 'Descargo por Falla', 'Hubo un problema con el pedido', 'Falla_pedido.pdf', 'No procede', 'GD87654321', 'RES', 'TSD02');

-- Insertar datos en la tabla Notificacion
INSERT INTO Notificacion (Cod_notificacion,Fecha_envio, Hora_envio, Mensaje, Origen, Destino, Codigo_empleado, Cod_tipo_notificacion, Cod_tipo_generacion)
VALUES 
('N001','2024-09-30', '08:00:00', 'Recordatorio de turno mañana', 'Sistema', 'Juan Pérez', 'PL12345678', 'TN01', 'TG01'),
('N002','2024-09-30', '14:00:00', 'Cambio de turno tarde', 'Administrador', 'María González', 'GD87654321', 'TN02', 'TG02');

-- Insertar datos en la tabla Posee
INSERT INTO Posee (Codigo_empleado, cod_habilidad)
VALUES 
('PL12345678', 'H001'),
('GD87654321', 'H002');

-- Insertar datos en la tabla Registra
INSERT INTO Registra (Codigo_empleado, Cod_asistencia)
VALUES 
('PL12345678', 'A001'),
('GD87654321', 'A002');

-- Insertar datos en la tabla Horario_libre_Dias
INSERT INTO Horario_libre_Dias (Dias, Cod_horario)
VALUES 
('Lunes', 'H001'),
('Viernes', 'H002');

-- Insertar datos en la tabla Usuario
INSERT INTO Usuario (Username, Contraseña, Gmail, Fecha_creacion, Rol, Codigo_empleado, Cod_estado_usuario)
VALUES 
('jperez', 'abc123', 'juanperez@fridays.com', '2023-01-01', 'NAD', 'PL12345678', 'ACT'),
('mgonzalez', 'xyz789', 'mariagonzalez@fridays.com', '2023-05-01', 'NAD', 'GD87654321', 'ACT');
