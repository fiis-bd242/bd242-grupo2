INSERT INTO Turno (Cod_turno, Nombre_turno, Hora_inicio, Hora_fin)
VALUES 
('MAN', 'Mañana', '08:00:00', '18:00:00'),
('TAR', 'Tarde', '14:00:00', '22:00:00');

INSERT INTO Habilidad (Nombre_habilidad, Descripcion, Cod_habilidad)
VALUES 
('Atención al cliente', 'Habilidad para interactuar y resolver dudas de clientes', 'H001'),
('Cocina rápida', 'Capacidad de preparar alimentos en poco tiempo', 'H002');

INSERT INTO Estado_Asistencia (Cod_estado, Nombre_Estado)
VALUES 
('OK', 'Asistencia correcta'),
('AI', 'Ausencia injustificada');

INSERT INTO Estado_SD (Cod_estado_SD, Nombre_estado_sd)
VALUES 
('PEN', 'Pendiente'),
('RES', 'Resuelto');

INSERT INTO Tipo_SD (Cod_tipo_sd, Nombre_tipo_sd)
VALUES 
('TSD01', 'Solicitud de Vacaciones'),
('TSD02', 'Descargo por Falla');

INSERT INTO Tipo_notificacion (Cod_tipo_notificacion, Nombre_tipo_notificacion)
VALUES 
('TN01', 'Recordatorio de Turno'),
('TN02', 'Cambio de Turno');

INSERT INTO Tipo_generación (Cod_tipo_generacion, Nombre_tipo_generacion)
VALUES 
('TG01', 'Automático'),
('TG02', 'Manual');

INSERT INTO Estado_usuario (Cod_estado_usuario, Nombre_estado_usuario)
VALUES 
('ACT', 'Activo'),
('INA', 'Inactivo');

INSERT INTO Local (Cod_local, Ubicacion_local, Nombre_local)
VALUES 
('AE', 'Av. Central 123', 'AEROPUERTO'),
('LA', 'Av. Norte 456', 'LARCOMAR');

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


INSERT INTO Asistencia (Cod_asistencia, Fecha, Hora_ingreso, Hora_salida, Cod_estado)
VALUES 
('A001', '2024-10-01', '08:00:00', '14:00:00', 'OK'),
('A002', '2024-10-01', '14:00:00', '20:00:00', 'AI');

INSERT INTO Contrato (Cod_contrato, Fecha_contratacion, Cod_tipo_contrato)
VALUES 
('CT001', '2023-09-01', 'C001'),
('CT002', '2024-01-01', 'C002');

INSERT INTO Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Codigo_empleado, Cod_turno, Cod_contrato, Cod_area, Cod_cargo, Cod_local)
VALUES 
('Av. Siempreviva 742', '987654321', '12345678', 'Juan', 'Pérez', 'López', 'PL12345678', 'MAN', 'CT001','ALM', 'AL', 'AE'),
('Calle Falsa 123', '987654322', '87654321', 'María', 'González', 'Díaz', 'GD87654321', 'TAR', 'CT002', 'COC', 'CO', 'LA');

INSERT INTO Horario_libre (Hora_inicio, Hora_fin, Cod_horario, Codigo)
VALUES 
('14:00:00', '18:00:00', 'H001', 'PL12345678'),
('10:00:00', '14:00:00', 'H002', 'GD87654321');

INSERT INTO Historial_laboral (Cod_his_lab, Empresa, Cargo, Duración, Codigo_empleado)
VALUES 
('HL001', 'KFC', 'Almacenero', 2.5, 'PL12345678'),
('HL002', 'KFC', 'Cocinero', 1.2, 'GD87654321');

INSERT INTO Solicitud_o_descargo (Cod_sd, Titulo, Descripcion, Evidencia, Respuesta, Codigo_empleado, Cod_estado_SD, Cod_tipo_sd)
VALUES 
('SD001', 'Solicitud de Vacaciones', 'Solicito 10 días de vacaciones', 'Vacaciones.pdf', '', 'PL12345678', 'PEN', 'TSD01'),
('SD002', 'Descargo por Falla', 'Hubo un problema con el pedido', 'Falla_pedido.pdf', 'No procede', 'GD87654321', 'RES', 'TSD02');

INSERT INTO Notificacion (Cod_notificacion,Fecha_envio, Hora_envio, Mensaje, Origen, Destino, Codigo_empleado, Cod_tipo_notificacion, Cod_tipo_generacion)
VALUES 
('N001','2024-09-30', '08:00:00', 'Recordatorio de turno mañana', 'Sistema', 'Juan Pérez', 'PL12345678', 'TN01', 'TG01'),
('N002','2024-09-30', '14:00:00', 'Cambio de turno tarde', 'Administrador', 'María González', 'GD87654321', 'TN02', 'TG02');

INSERT INTO Posee (Codigo_empleado, cod_habilidad)
VALUES 
('PL12345678', 'H001'),
('GD87654321', 'H002');

INSERT INTO Registra (Codigo_empleado, Cod_asistencia)
VALUES 
('PL12345678', 'A001'),
('GD87654321', 'A002');

INSERT INTO Horario_libre_Dias (Dias, Cod_horario)
VALUES 
('Lunes', 'H001'),
('Viernes', 'H002');

INSERT INTO Usuario (Username, Contraseña, Gmail, Fecha_creacion, Rol, Codigo_empleado, Cod_estado_usuario)
VALUES 
('jperez', 'abc123', 'juanperez@fridays.com', '2023-01-01', 'NAD', 'PL12345678', 'ACT'),
('mgonzalez', 'xyz789', 'mariagonzalez@fridays.com', '2023-05-01', 'NAD', 'GD87654321', 'ACT');