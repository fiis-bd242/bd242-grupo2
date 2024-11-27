-- INSERCIÓN DE DATOS DE LAS TABLAS RELACIONADAS AL EMPLEADO

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
(13,'ANFITRION'),
(14, 'JEFE ALMACEN');
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

INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-07-31', '14:07:00', '22:31:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-03-27', '07:57:00', '18:25:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-10-17', '09:13:00', '17:39:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-03-09', '15:00:00', '22:02:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-03-23', '15:08:00', '21:48:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-07-21', '14:43:00', '22:13:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-08-24', '09:41:00', '18:04:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-09-29', '15:02:00', '22:53:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-06-19', '09:13:00', '19:19:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-02-19', '08:33:00', '18:25:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-05-26', '08:40:00', '19:19:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-02-12', '15:00:00', '21:44:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-11-06', '14:23:00', '22:06:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-10-26', '08:34:00', '17:33:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-05-05', '09:25:00', '18:07:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-11-09', '15:07:00', '22:16:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-09-17', '07:55:00', '17:52:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-02-10', '14:34:00', '22:08:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-07-11', '14:26:00', '22:12:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-11-11', '14:56:00', '23:13:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-10-09', '15:13:00', '21:51:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-12-03', '14:18:00', '22:05:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-07-19', '14:12:00', '22:09:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-01-30', '07:35:00', '18:13:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-04-17', '09:41:00', '18:49:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-12-26', '14:06:00', '22:07:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-09-03', '07:18:00', '18:02:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-12-07', '14:26:00', '22:11:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-01-15', '15:24:00', '21:46:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-02-12', '09:07:00', '18:50:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-04-26', '13:32:00', '22:17:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-10-22', '14:11:00', '21:44:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-05-14', '07:02:00', '18:07:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-03-01', '14:16:00', '23:10:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-05-17', '14:42:00', '21:37:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-06-03', '14:37:00', '22:13:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-03-31', '08:01:00', '19:19:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-01-08', '14:00:00', '22:30:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-12-23', '13:44:00', '22:18:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-08-17', '09:19:00', '17:33:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-09-17', '07:41:00', '17:51:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-03-19', '08:00:00', '17:46:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-08-14', '15:23:00', '22:20:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-02-17', '13:39:00', '22:31:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-01-29', '14:07:00', '23:14:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-05-29', '07:50:00', '18:27:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-05-20', '09:58:00', '18:14:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-01-04', '13:36:00', '21:36:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-12-26', '14:22:00', '22:02:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-01-13', '09:29:00', '18:28:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-03-08', '13:46:00', '21:48:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-01-26', '08:21:00', '19:18:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-07-02', '09:10:00', '18:43:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-06-18', '08:47:00', '18:50:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-06-05', '13:50:00', '23:00:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-03-01', '14:30:00', '21:40:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-04-18', '14:25:00', '22:16:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-04-12', '14:16:00', '22:18:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-12-28', '09:49:00', '19:07:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-07-28', '07:00:00', '18:25:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-01-05', '09:45:00', '19:15:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-08-25', '14:11:00', '21:59:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-04-09', '07:17:00', '18:21:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-07-18', '07:35:00', '17:44:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-09-20', '07:52:00', '17:38:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-12-21', '08:52:00', '18:39:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-05-02', '14:53:00', '23:28:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-10-06', '07:49:00', '18:26:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-09-29', '08:41:00', '18:02:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-06-09', '09:07:00', '17:58:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-06-28', '08:18:00', '17:48:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-08-15', '07:37:00', '18:10:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-08-01', '14:06:00', '21:38:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-04-17', '08:05:00', '18:30:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-10-24', '14:03:00', '22:56:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-04-09', '07:26:00', '18:06:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-06-28', '14:52:00', '22:05:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2024-09-30', '08:44:00', '18:31:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-02-05', '14:22:00', '22:45:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-08-17', '09:46:00', '18:14:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-12-28', '09:03:00', '18:18:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-12-28', '08:52:00', '17:43:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-04-26', '07:44:00', '18:01:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-12-16', '07:33:00', '17:41:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-11-11', '15:14:00', '23:25:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-10-20', '14:24:00', '22:32:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-06-22', '08:24:00', '17:41:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-07-26', '13:41:00', '22:34:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2022-12-02', '14:13:00', '22:26:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-06-09', '08:36:00', '19:28:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2019-12-20', '07:01:00', '18:14:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-06-29', '09:42:00', '18:47:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-10-12', '09:27:00', '17:34:00', 3);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-04-16', '13:57:00', '21:34:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-06-02', '14:23:00', '21:35:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-10-09', '13:32:00', '21:54:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2023-11-09', '13:34:00', '21:39:00', 1);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2018-07-31', '07:25:00', '19:28:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2020-07-11', '14:19:00', '22:33:00', 6);
INSERT INTO asistencia (fecha, hora_ingreso, hora_salida, cod_estado) VALUES ('2021-04-29', '08:56:00', '18:42:00', 6);


insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-05-14', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-04-20', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-09-20', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-02-20', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-02-27', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-04-01', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-02-12', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-08-15', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-02-07', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-06-04', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-07-30', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-07-19', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-08-31', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-07-08', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-01-05', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-10-13', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-08-30', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-01-10', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-05-22', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-12-26', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-03-03', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-01-16', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-01-04', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-12-07', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-09-15', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-04-13', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-07-06', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-03-04', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-03-18', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-08-28', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-06-20', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-01-12', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-11-26', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-02-26', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-08-19', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-10-05', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-05-02', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-05-11', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-05-06', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-12-09', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-12-06', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-03-31', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-06-09', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-07-25', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-05-12', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-04-17', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-02-22', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-07-04', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-12-29', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-05-12', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-04-09', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-09-15', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-09-26', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-07-24', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-08-10', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-08-24', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-05-03', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-03-18', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-06-29', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-03-22', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-01-23', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-03-16', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-05-13', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-01-09', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-02-17', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-01-28', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-01-22', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-03-25', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2018-11-14', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-09-06', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-05-15', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-08-29', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-07-03', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-07-27', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-03-24', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-01-21', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-07-01', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-12-02', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-12-05', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2018-11-14', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-03-19', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-08-17', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2018-11-12', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-01-08', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-11-20', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-07-09', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-10-19', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-02-12', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-03-10', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-12-31', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-03-02', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-07-11', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-04-10', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2023-04-09', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-09-15', 5);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2019-02-05', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2020-09-22', 3);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-04-04', 2);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2021-03-13', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2024-08-01', 4);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-05-11', 1);
insert into Contrato (fecha_contratacion, cod_tipo_contrato) values ('2022-05-10', 1);


insert into Empleado (Direccion, Contacto, DNI, Primer_nombre, Primer_apellido, Segundo_apellido, Cod_turno, Cod_contrato, Cod_cargo, cod_local) values ('8', '944194531', '14156500', 'Elliot', 'Gillatt', 'Blunsen', 2, 41, 11, 11);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('04', '990063300', '45237848', 'Jodee', 'Naish', 'Blaxlande', 2, 72, 4, 15);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('555', '953003239', '90887376', 'Robbyn', 'Folomkin', 'Seale', 1, 71, 11, 17);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('46', '945090144', '47379285', 'Dominica', 'Joselson', 'Vurley', 2, 72, 5, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('7', '932413101', '25917418', 'Joeann', 'Chesson', 'Fordyce', 1, 9, 13, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('51724', '906786421', '91327168', 'Meggi', 'Cronchey', 'Seczyk', 2, 45, 4, 9);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('76321', '901303447', '80741968', 'Gabbie', 'Coneley', 'Bimson', 1, 22, 8, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('543', '929081673', '36229552', 'Oates', 'Cain', 'Witcher', 1, 87, 3, 10);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('49', '905108771', '89088030', 'Drucy', 'Killik', 'Kingswoode', 1, 17, 13, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('88005', '956239354', '30033385', 'Doralin', 'Shivell', 'Smallthwaite', 1, 46, 6, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('8', '945818248', '21915624', 'Giacobo', 'Gerling', 'Attersoll', 1, 78, 8, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('08', '986997445', '19715138', 'Rose', 'Pallister', 'Klimek', 1, 85, 13, 17);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('816', '964886394', '38826162', 'Jamaal', 'Pearle', 'Chesswas', 2, 51, 10, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('36', '916304780', '31964112', 'Charisse', 'Currey', 'Edeson', 2, 97, 12, 11);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('2', '918892652', '86981639', 'Karylin', 'Mance', 'Dafter', 1, 45, 12, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('1', '907756182', '65093064', 'Antoinette', 'Kembrey', 'Boxhall', 2, 94, 5, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('0862', '905101049', '47716796', 'Averell', 'Hathaway', 'Thoumasson', 2, 27, 13, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('734', '937191862', '58426677', 'Maryellen', 'Lynock', 'Whal', 1, 7, 8, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('45959', '941001163', '81163257', 'Isa', 'Zollner', 'Cundy', 1, 39, 3, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('34984', '904197964', '50120619', 'Maximilian', 'Yurmanovev', 'Crose', 1, 3, 8, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('82804', '935704887', '80538729', 'Nickey', 'Merrell', 'Siberry', 2, 87, 1, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('0232', '910838560', '88450755', 'Amanda', 'Butterwick', 'Harral', 2, 93, 10, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('134', '980473368', '72968015', 'Nadean', 'Avramovich', 'Adrain', 2, 21, 13, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('73', '909426798', '93674950', 'Bobby', 'Derham', 'Lambillion', 1, 57, 9, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('351', '974225431', '24096423', 'Rivkah', 'Tuppeny', 'Pounsett', 1, 99, 6, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('897', '931635290', '52247242', 'Demetra', 'Amy', 'Boother', 1, 32, 12, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('56', '970232349', '66794451', 'Anatola', 'McCaughey', 'Steels', 2, 3, 6, 17);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('403', '903453982', '80469623', 'Nari', 'Height', 'Eles', 1, 26, 11, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('18', '948045780', '24470187', 'Lida', 'O''Murtagh', 'Stut', 2, 97, 2, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('1', '914199989', '65754284', 'Fulvia', 'Rogez', 'Elies', 1, 68, 8, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('118', '924430722', '23065654', 'Cass', 'Doram', 'Sabbins', 2, 67, 9, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('8', '927652855', '72719282', 'Tally', 'Dupre', 'Oxlee', 2, 51, 5, 1);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('67', '983869136', '56233798', 'Nertie', 'Jewis', 'Pettegre', 1, 42, 9, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('63859', '940366851', '46866473', 'Rowan', 'Howcroft', 'Tincombe', 2, 49, 11, 10);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('247', '985350307', '97440434', 'Adelice', 'Kingscott', 'Nunson', 2, 10, 5, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('6222', '933667291', '64650397', 'Jill', 'Huson', 'Guerin', 2, 9, 11, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('6891', '980748296', '19029746', 'Harper', 'Raynham', 'Wimpenny', 1, 17, 5, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('42', '938023973', '39405334', 'Amanda', 'Noe', 'MacKartan', 2, 88, 11, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('7075', '933042775', '47590629', 'Jackelyn', 'Pilling', 'Hedin', 2, 99, 5, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('64', '942697044', '72882676', 'Conrad', 'Yanyshev', 'Dorre', 2, 3, 2, 15);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('46963', '955340061', '67590608', 'Dorolisa', 'Osmar', 'Rolston', 1, 100, 5, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('33', '902038460', '27143301', 'Margarita', 'Coulthart', 'Matyushenko', 1, 46, 9, 9);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('6', '993956572', '39299477', 'Marilee', 'Hrus', 'Balchen', 1, 13, 2, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('73', '934130957', '53784809', 'Lura', 'Benedicte', 'Berka', 2, 9, 6, 1);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('34001', '953055492', '33552553', 'Inez', 'Sandy', 'Collinette', 1, 91, 12, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('349', '977147129', '86664253', 'Nobie', 'Murcott', 'Sydney', 2, 77, 12, 1);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('7624', '905849032', '83724493', 'Fairfax', 'Tomankowski', 'Denecamp', 2, 9, 9, 12);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('2', '926360677', '13449388', 'Anna-diana', 'Caen', 'Boylin', 1, 32, 9, 1);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('92', '900584628', '92869969', 'Kahlil', 'Imlaw', 'Lingfoot', 2, 80, 2, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('12508', '980497905', '31233343', 'Corie', 'Boothebie', 'Cosley', 2, 60, 4, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('2877', '947589487', '77865478', 'Orland', 'Ilyushkin', 'Heijnen', 1, 95, 3, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('8', '944655483', '65956779', 'Arleyne', 'Newing', 'Mulqueeny', 2, 45, 10, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('5', '980054781', '46202128', 'Lissy', 'Caw', 'Burnhill', 2, 64, 7, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('159', '966665914', '74086955', 'Dav', 'Hulkes', 'Kettleson', 2, 32, 7, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('79', '966206005', '70580573', 'Matti', 'Hands', 'Fairebrother', 1, 86, 12, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('64', '993845429', '62579712', 'Florry', 'Eskrigg', 'Ramiro', 1, 65, 2, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('9611', '969890580', '43089322', 'Eva', 'Bulstrode', 'Marson', 2, 75, 1, 12);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('01', '978921073', '20483615', 'Conroy', 'Fetherstone', 'Cordingley', 2, 56, 10, 11);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('226', '932229555', '20027825', 'Son', 'Otto', 'Wroth', 2, 37, 6, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('631', '973547029', '40791154', 'Elise', 'Laible', 'Dorin', 2, 93, 10, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('20', '904573954', '76247578', 'Seana', 'Mohring', 'Seyler', 2, 86, 7, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('455', '943726465', '18602215', 'Saundra', 'Allenby', 'Lendrem', 2, 3, 12, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('2553', '916209976', '24214174', 'Trenna', 'Rennix', 'Whitfeld', 2, 59, 13, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('922', '904831522', '27690472', 'Lewiss', 'Mattersey', 'Levick', 1, 82, 9, 14);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('4643', '916748913', '50850450', 'Joceline', 'Warland', 'Annandale', 2, 55, 8, 15);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('70', '948703399', '99367574', 'Arv', 'Pentland', 'Skitt', 2, 77, 7, 17);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('54196', '943533547', '15852054', 'Danie', 'Sinyard', 'Melville', 1, 80, 13, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('95297', '909598026', '23010089', 'Tades', 'Scardifeild', 'Freak', 2, 41, 9, 9);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('61', '919663084', '76688037', 'Nadya', 'Jobb', 'Vanichkin', 1, 91, 2, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('51', '996445801', '47218108', 'Harlin', 'Boken', 'Fearenside', 1, 78, 5, 11);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('259', '942738239', '65876797', 'Lise', 'Idell', 'Hasty', 2, 28, 7, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('752', '925710172', '19420185', 'Franny', 'Toxell', 'Solly', 2, 63, 6, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('4', '902407698', '66886872', 'Siobhan', 'Guise', 'Doerffer', 1, 28, 11, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('7', '914900642', '14649116', 'Nevsa', 'Reisk', 'Gimbrett', 2, 83, 11, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('369', '906665509', '19941225', 'Alec', 'York', 'Pettingill', 1, 18, 1, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('247', '982913383', '85632038', 'Sancho', 'Yekel', 'Jonin', 1, 50, 1, 15);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('61159', '902990989', '27185242', 'Kellie', 'Rassmann', 'Crumpton', 2, 14, 5, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('480', '931827512', '19881127', 'Bondie', 'Button', 'Foot', 2, 26, 12, 12);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('3', '908360947', '17333754', 'Rossie', 'Hovington', 'Ellwell', 1, 65, 7, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('835', '977050620', '75434859', 'Merilee', 'Murford', 'Bewlie', 2, 36, 9, 4);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('85908', '964204359', '52108407', 'Agata', 'Weld', 'Edmans', 2, 2, 6, 11);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('1009', '905613170', '77067124', 'Merle', 'Rowbottam', 'Foffano', 2, 25, 2, 5);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('7', '938949675', '85375973', 'Wendy', 'Larmouth', 'Giannassi', 2, 25, 1, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('09', '903057049', '63400983', 'Ailey', 'Gettings', 'Grishin', 2, 8, 6, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('8', '927175323', '99389257', 'Olivia', 'Brice', 'Cartmel', 1, 51, 13, 8);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('9502', '992553053', '24845201', 'Allie', 'Brennans', 'Silburn', 2, 7, 5, 6);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('3', '996853959', '54246884', 'Tobye', 'Lindgren', 'Boys', 1, 97, 5, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('544', '919118862', '23068920', 'Ronda', 'Galvan', 'Potapczuk', 2, 20, 9, 7);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('6', '952569822', '33075576', 'Diahann', 'Bessant', 'Kobpal', 1, 53, 6, 18);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('40', '939715850', '80691066', 'Charil', 'Sandercroft', 'Tallis', 2, 31, 7, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('10475', '998054026', '87812387', 'Edee', 'Pimlock', 'Hamblyn', 2, 51, 3, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('15924', '991735891', '45732923', 'Bryna', 'Latey', 'Steadman', 1, 53, 9, 17);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('45505', '997611153', '27473541', 'Mariska', 'Feldberg', 'McLucas', 2, 92, 2, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('93', '956119562', '79621279', 'Madelin', 'Deverill', 'Chevin', 2, 11, 5, 15);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('8', '949041750', '68453193', 'Aldis', 'Ladyman', 'Spinetti', 1, 98, 8, 2);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('19', '987235837', '37525656', 'Kevin', 'Whybray', 'Ogers', 1, 2, 6, 3);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('37483', '970857823', '91431766', 'Marketa', 'Pennacci', 'Bainbrigge', 2, 43, 12, 12);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('5122', '939118373', '37169237', 'Chiarra', 'Point', 'Lilian', 1, 6, 7, 13);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('94590', '939430728', '16823351', 'Rudd', 'Aneley', 'Greim', 2, 52, 11, 16);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('40', '990813928', '32206385', 'Jori', 'Dows', 'Thurley', 1, 23, 10, 12);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('82804', '935704882', '80538722', 'Nick', 'Merrell', 'Siberry', 1, 101, 1, 1);
insert into Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local) values ('82804', '935704881', '80538721', 'Nick', 'Smith', 'Siberry', 1, 102, 14, 1);


insert into Registra (codigo_empleado, cod_asistencia) values (1, 1);
insert into Registra (codigo_empleado, cod_asistencia) values (2, 2);
insert into Registra (codigo_empleado, cod_asistencia) values (3, 3);
insert into Registra (codigo_empleado, cod_asistencia) values (4, 4);
insert into Registra (codigo_empleado, cod_asistencia) values (5, 5);
insert into Registra (codigo_empleado, cod_asistencia) values (6, 6);
insert into Registra (codigo_empleado, cod_asistencia) values (7, 7);
insert into Registra (codigo_empleado, cod_asistencia) values (8, 8);
insert into Registra (codigo_empleado, cod_asistencia) values (9, 9);
insert into Registra (codigo_empleado, cod_asistencia) values (10, 10);
insert into Registra (codigo_empleado, cod_asistencia) values (11, 11);
insert into Registra (codigo_empleado, cod_asistencia) values (12, 12);
insert into Registra (codigo_empleado, cod_asistencia) values (13, 13);
insert into Registra (codigo_empleado, cod_asistencia) values (14, 14);
insert into Registra (codigo_empleado, cod_asistencia) values (15, 15);
insert into Registra (codigo_empleado, cod_asistencia) values (16, 16);
insert into Registra (codigo_empleado, cod_asistencia) values (17, 17);
insert into Registra (codigo_empleado, cod_asistencia) values (18, 18);
insert into Registra (codigo_empleado, cod_asistencia) values (19, 19);
insert into Registra (codigo_empleado, cod_asistencia) values (20, 20);
insert into Registra (codigo_empleado, cod_asistencia) values (21, 21);
insert into Registra (codigo_empleado, cod_asistencia) values (22, 22);
insert into Registra (codigo_empleado, cod_asistencia) values (23, 23);
insert into Registra (codigo_empleado, cod_asistencia) values (24, 24);
insert into Registra (codigo_empleado, cod_asistencia) values (25, 25);
insert into Registra (codigo_empleado, cod_asistencia) values (26, 26);
insert into Registra (codigo_empleado, cod_asistencia) values (27, 27);
insert into Registra (codigo_empleado, cod_asistencia) values (28, 28);
insert into Registra (codigo_empleado, cod_asistencia) values (29, 29);
insert into Registra (codigo_empleado, cod_asistencia) values (30, 30);
insert into Registra (codigo_empleado, cod_asistencia) values (31, 31);
insert into Registra (codigo_empleado, cod_asistencia) values (32, 32);
insert into Registra (codigo_empleado, cod_asistencia) values (33, 33);
insert into Registra (codigo_empleado, cod_asistencia) values (34, 34);
insert into Registra (codigo_empleado, cod_asistencia) values (35, 35);
insert into Registra (codigo_empleado, cod_asistencia) values (36, 36);
insert into Registra (codigo_empleado, cod_asistencia) values (37, 37);
insert into Registra (codigo_empleado, cod_asistencia) values (38, 38);
insert into Registra (codigo_empleado, cod_asistencia) values (39, 39);
insert into Registra (codigo_empleado, cod_asistencia) values (40, 40);
insert into Registra (codigo_empleado, cod_asistencia) values (41, 41);
insert into Registra (codigo_empleado, cod_asistencia) values (42, 42);
insert into Registra (codigo_empleado, cod_asistencia) values (43, 43);
insert into Registra (codigo_empleado, cod_asistencia) values (44, 44);
insert into Registra (codigo_empleado, cod_asistencia) values (45, 45);
insert into Registra (codigo_empleado, cod_asistencia) values (46, 46);
insert into Registra (codigo_empleado, cod_asistencia) values (47, 47);
insert into Registra (codigo_empleado, cod_asistencia) values (48, 48);
insert into Registra (codigo_empleado, cod_asistencia) values (49, 49);
insert into Registra (codigo_empleado, cod_asistencia) values (50, 50);
insert into Registra (codigo_empleado, cod_asistencia) values (51, 51);
insert into Registra (codigo_empleado, cod_asistencia) values (52, 52);
insert into Registra (codigo_empleado, cod_asistencia) values (53, 53);
insert into Registra (codigo_empleado, cod_asistencia) values (54, 54);
insert into Registra (codigo_empleado, cod_asistencia) values (55, 55);
insert into Registra (codigo_empleado, cod_asistencia) values (56, 56);
insert into Registra (codigo_empleado, cod_asistencia) values (57, 57);
insert into Registra (codigo_empleado, cod_asistencia) values (58, 58);
insert into Registra (codigo_empleado, cod_asistencia) values (59, 59);
insert into Registra (codigo_empleado, cod_asistencia) values (60, 60);
insert into Registra (codigo_empleado, cod_asistencia) values (61, 61);
insert into Registra (codigo_empleado, cod_asistencia) values (62, 62);
insert into Registra (codigo_empleado, cod_asistencia) values (63, 63);
insert into Registra (codigo_empleado, cod_asistencia) values (64, 64);
insert into Registra (codigo_empleado, cod_asistencia) values (65, 65);
insert into Registra (codigo_empleado, cod_asistencia) values (66, 66);
insert into Registra (codigo_empleado, cod_asistencia) values (67, 67);
insert into Registra (codigo_empleado, cod_asistencia) values (68, 68);
insert into Registra (codigo_empleado, cod_asistencia) values (69, 69);
insert into Registra (codigo_empleado, cod_asistencia) values (70, 70);
insert into Registra (codigo_empleado, cod_asistencia) values (71, 71);
insert into Registra (codigo_empleado, cod_asistencia) values (72, 72);
insert into Registra (codigo_empleado, cod_asistencia) values (73, 73);
insert into Registra (codigo_empleado, cod_asistencia) values (74, 74);
insert into Registra (codigo_empleado, cod_asistencia) values (75, 75);
insert into Registra (codigo_empleado, cod_asistencia) values (76, 76);
insert into Registra (codigo_empleado, cod_asistencia) values (77, 77);
insert into Registra (codigo_empleado, cod_asistencia) values (78, 78);
insert into Registra (codigo_empleado, cod_asistencia) values (79, 79);
insert into Registra (codigo_empleado, cod_asistencia) values (80, 80);
insert into Registra (codigo_empleado, cod_asistencia) values (81, 81);
insert into Registra (codigo_empleado, cod_asistencia) values (82, 82);
insert into Registra (codigo_empleado, cod_asistencia) values (83, 83);
insert into Registra (codigo_empleado, cod_asistencia) values (84, 84);
insert into Registra (codigo_empleado, cod_asistencia) values (85, 85);
insert into Registra (codigo_empleado, cod_asistencia) values (86, 86);
insert into Registra (codigo_empleado, cod_asistencia) values (87, 87);
insert into Registra (codigo_empleado, cod_asistencia) values (88, 88);
insert into Registra (codigo_empleado, cod_asistencia) values (89, 89);
insert into Registra (codigo_empleado, cod_asistencia) values (90, 90);
insert into Registra (codigo_empleado, cod_asistencia) values (91, 91);
insert into Registra (codigo_empleado, cod_asistencia) values (92, 92);
insert into Registra (codigo_empleado, cod_asistencia) values (93, 93);
insert into Registra (codigo_empleado, cod_asistencia) values (94, 94);
insert into Registra (codigo_empleado, cod_asistencia) values (95, 95);
insert into Registra (codigo_empleado, cod_asistencia) values (96, 96);
insert into Registra (codigo_empleado, cod_asistencia) values (97, 97);
insert into Registra (codigo_empleado, cod_asistencia) values (98, 98);
insert into Registra (codigo_empleado, cod_asistencia) values (99, 99);
insert into Registra (codigo_empleado, cod_asistencia) values (100, 100);