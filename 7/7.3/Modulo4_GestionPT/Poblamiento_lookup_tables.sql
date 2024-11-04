INSERT INTO Turno (Cod_turno, Nombre_turno, Hora_inicio, Hora_fin)
VALUES 
(1, 'Mañana', '08:00:00', '18:00:00'),
(2, 'Tarde', '14:00:00', '22:00:00');

INSERT INTO Estado_Asistencia (Cod_estado, Nombre_Estado,Descripcion_estado)
VALUES 
(1, 'Ok','La asistencia está correctamente'),
(2, 'Falta marcar','El empleado no ha marcado su asistencias'),
(3,'Tardanza','El empleado ha registrado fuera del horario de ingreso'),
(4,'Falta injustificado','El empleado no ha justificado su falta'),
(5,'Ausencia injustificada','El empleado ha registrado su asistencia, pero no se encuentra en su labor designado'),
(6,'Sobretiempo injustificado','El empleado ha marcado su salida fuera de lo previsto, generando sobretiempo');
INSERT INTO Tipo_generacion (Cod_tipo_generacion, Nombre_tipo_generacion)
VALUES 
(1, 'Automático'),
(2, 'Manual');
INSERT INTO Estado_SD (Cod_estado_SD, Nombre_estado_sd)
VALUES 
(1, 'Pendiente'),
(2, 'Resuelto');

INSERT INTO Tipo_SD (Cod_tipo_sd, Nombre_tipo_sd)
VALUES 
(1, 'Solicitud de Vacaciones'),
(2, 'Solicitude de cambio de turno'),
(3,'Solicitud de permiso'),
(4,'Solicitud de licencia'),
(5,'Solicitud de horas extra'),
(6,'Solicitud de cambio de área'),
(7,'Solicitud de cambio de cargo'),
(8,'Descargo por ausencia'),
(9,'Descargo por tardanza'),
(10,'Descargo por incidente operacional'),
(11,'Otro específico');

INSERT INTO Tipo_notificacion (Cod_tipo_notificacion, Nombre_tipo_notificacion,Cod_tipo_generacion)
VALUES 
(1,'Asignacion de turno',1),
(2,'Cambio de turno',1),
(3,'Aprobación de solicitud',1),
(4,'Rechazo de solicitud',1),
(5,'Recordatorio de turno',1),
(6,'Ausencia detectada',1),
(7,'Tardanza detectada',1),
(8,'Solicitud',1),
(9,'Descargo',1),
(10,'Aprobacion de descargo',1),
(11,'Rechazo de descargo',1),
(12,'Vencimiento de contrato',1),
(13,'Otro específico',2);
INSERT INTO Estado_usuario (Cod_estado_usuario, Nombre_estado_usuario)
VALUES 
(1, 'Activo'),
(2, 'Inactivo'),
(3,'Suspendido');
INSERT INTO Local (Cod_local, Ubicacion_local, Nombre_local)
VALUES 
(1,'Av. Los Angeles 602, Comas', 'FRIDAYS MALL PLAZA COMAS'),
(2,'Av. Alfredo Mendiola. Nro. 1400 INT. R109 Cenntro Comercial Plaza Norte', 'FRIDAYS PLAZA NORTE'),
(3,'Av. Santa Cruz 824, Miraflores','FRIDAYS ÓVALO GUTIÉRREZ'),
(4,'Av. Malecón de la Reserva 610-C.C. Larco Mar-Mirafloes','FRIDAYS LARCOMAR'),
(5,'Av. La Marina 2355-C.C. La Marina Open Plaza-San Miguel','FRIDAYS OPEN PLAZA'),
(6,'Av. General Felipe Salaverry 2370-CC.Real Plaza-Jesús María','FRIDAYS SALAVERRY'),
(7,'Av. Primavera 737-San Borja','FRIDAYS PRIMAVERA'),
(8,'Jr. Carpaccio Nro.230-Edificio Torre del Arte-SanBorja','FRIDAYS LA RAMBLA, SAN BORJA'),
(9,'Av. La Marina 2000, C.C Plaza San Miguel-San Miguel','FRIDAYS SAN MIGUEL'),
(10,'Av. La Molina 3555 tienda 5-Urb. El Sol de la Molina','DK LA MOLINA'),
(11,'Av. Las Palmeras Mza. B1 Lote 14. Urb. Camacho, la Molina','FRIDAYS ÓVALO MONITOR'),
(12,'Av. Nicolas de Ayllón 4770-C.C.Real Plaza Puruchuco-Ate.Lima','FRIDAYS PURUCHUCO'),
(13,'Av. Nicolás Ayllón 111-C.C. Mall Aventura Santa Anita-Santa Anita','FRIDAYS SANTA ANITA'),
(14,'Av. Los Lirios 310, 4° Piso-C.C. Mall del Sur, San Juan de Miraflores','FRIDAYS MALL DEL SUR'),
(15,'Av. Faucett s/n-Callao-Espigón Internacional del Aeropuerto Internacional Jorge Chávez','FRIDAYS AEROPUERTO'),
(16,'Av. Ejercito 1009 Cayma-C.C. Real Plaza Arequipa','FRIDAYS AREQUIPA'),
(17,'Av. Cesar Vallejo 1345-C.C. Real Plaza Trujillo','FRIDAYS TRUJILLO'),
(18,'Urb. Zarate Industrial Av. Lurigancho Int RE100-RE200','FRIDAYS SAN JUAN DE LURIGANCHO');
INSERT INTO Cargo (Cod_cargo, Nombre_cargo)
VALUES 
(1, 'ALMACENERO'),
(2, 'COCINERO'),
(3,'GERENTE GENERAL'),
(4,'GERENTE DE COCINA'),
(5,'GERENTE DE COMPRAS'),
(6,'GERENTE DE ALMACEN'),
(7,'MESERO'),
(8,'GERENTE DE PISO'),
(9,'SEGURIDAD'),
(10,'LAVAPLATOS'),
(11,'LIMPIEZA'),
(12,'BARTENDER'),
(13,'ANFITRION');
INSERT INTO Area (Cod_area, Nombre_area,cod_cargo)
VALUES 
(1, 'Almacén y compras',1),
(2, 'Almacén y compras',5),
(3, 'Almacén y compras',6),
(4, 'Cocina',2),
(5, 'Cocina',10),
(6, 'Cocina',4),
(7,'Servicio cliente',7),
(8,'Servicio cliente',12),
(9,'Servicio cliente',13),
(10,'Gerencia y administració',3),
(11,'Gerencia y administració',8),
(12,'Seguridad y limpieza',9),
(13,'Seguridad y limpieza',11);

INSERT INTO Tipo_contrato (Cod_tipo_contrato, Nombre_tipo_contrato)
VALUES 
(1, 'Indefinido'),
(2, 'Temporal'),
(3,'Medio Tiempo'),
(4,'Prácticas'),
(5,'Por obra o servicio');
