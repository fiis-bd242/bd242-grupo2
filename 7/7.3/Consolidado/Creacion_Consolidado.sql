

DROP TABLE IF EXISTS Turno CASCADE;
CREATE TABLE Turno
(
  Cod_turno SERIAL NOT NULL,
  Nombre_turno VARCHAR(50) NOT NULL,
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  PRIMARY KEY (Cod_turno)
);

DROP TABLE IF EXISTS Habilidad CASCADE;
CREATE TABLE Habilidad
(
  Nombre_habilidad VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(300) NOT NULL,
  Cod_habilidad SERIAL NOT NULL,
  PRIMARY KEY (Cod_habilidad)
);

DROP TABLE IF EXISTS Estado_Asistencia CASCADE;
CREATE TABLE Estado_Asistencia
(
  Cod_estado SERIAL NOT NULL,
  Nombre_Estado VARCHAR(100) NOT NULL,
  Descripcion_estado varchar(300) NOT NULL,
  PRIMARY KEY (Cod_estado)
);

DROP TABLE IF EXISTS Estado_SD CASCADE;
CREATE TABLE Estado_SD
(
  Cod_estado_SD SERIAL NOT NULL,
  Nombre_estado_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_SD)
);

DROP TABLE IF EXISTS Tipo_SD CASCADE;
CREATE TABLE Tipo_SD
(
  Cod_tipo_sd SERIAL NOT NULL,
  Nombre_tipo_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_sd)
);


DROP TABLE IF EXISTS Tipo_generacion CASCADE;
CREATE TABLE Tipo_generacion
(
  Cod_tipo_generacion SERIAL NOT NULL,
  Nombre_tipo_generacion VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_generacion)
);

DROP TABLE IF EXISTS Tipo_notificacion CASCADE;
CREATE TABLE Tipo_notificacion
(
  Cod_tipo_notificacion SERIAL NOT NULL,
  Nombre_tipo_notificacion VARCHAR(100) NOT NULL,
  Cod_tipo_generacion INT NOT NULL,
  PRIMARY KEY (Cod_tipo_notificacion),
  FOREIGN KEY(Cod_tipo_generacion) REFERENCES Tipo_generacion(Cod_tipo_generacion)
);

DROP TABLE IF EXISTS Estado_usuario CASCADE;
CREATE TABLE Estado_usuario
(
  Cod_estado_usuario SERIAL NOT NULL,
  Nombre_estado_usuario VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_usuario)
);

DROP TABLE IF EXISTS Local CASCADE;
CREATE TABLE Local
(
  Cod_local SERIAL NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

DROP TABLE IF EXISTS Cargo CASCADE;
CREATE TABLE Cargo
(
  Cod_cargo SERIAL NOT NULL,
  Nombre_cargo VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_cargo)
);

DROP TABLE IF EXISTS Area CASCADE;
CREATE TABLE Area
(
  Cod_area SERIAL NOT NULL,
  Nombre_area VARCHAR(50) NOT NULL,
  Cod_cargo INT NOT NULL,
  PRIMARY KEY (Cod_area),
  FOREIGN KEY(Cod_cargo) REFERENCES Cargo(Cod_cargo)
);

DROP TABLE IF EXISTS Tipo_contrato CASCADE;
CREATE TABLE Tipo_contrato
(
  Cod_tipo_contrato SERIAL NOT NULL,
  Nombre_tipo_contrato VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_contrato)
);

DROP TABLE IF EXISTS Asistencia CASCADE;
CREATE TABLE Asistencia
(
  Cod_asistencia SERIAL NOT NULL,
  Fecha DATE NOT NULL,
  Hora_ingreso TIME NOT NULL,
  Hora_salida TIME NOT NULL,
  Cod_estado INT NOT NULL,
  PRIMARY KEY (Cod_asistencia),
  FOREIGN KEY (Cod_estado) REFERENCES Estado_Asistencia(Cod_estado)
);

DROP TABLE IF EXISTS Contrato CASCADE;
CREATE TABLE Contrato
(
  Cod_contrato SERIAL NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  Cod_tipo_contrato INT NOT NULL,
  PRIMARY KEY (Cod_contrato),
  FOREIGN KEY (Cod_tipo_contrato) REFERENCES Tipo_contrato(Cod_tipo_contrato)
);

DROP TABLE IF EXISTS Empleado CASCADE;
CREATE TABLE Empleado
(
  Direccion VARCHAR(100) NOT NULL,
  Contacto CHAR(11) NOT NULL,
  DNI CHAR(8) NOT NULL,
  Primer_nombre VARCHAR(100) NOT NULL,
  Primer_apellido VARCHAR(100) NOT NULL,
  Segundo_apellido VARCHAR(100) NOT NULL,
  Codigo_empleado SERIAL NOT NULL,
  Cod_turno INT NOT NULL,
  Cod_contrato INT NOT NULL,
  Cod_cargo INT NOT NULL,
  Cod_local INT NOT NULL,
  PRIMARY KEY (Codigo_empleado),
  FOREIGN KEY (Cod_turno) REFERENCES Turno(Cod_turno),
  FOREIGN KEY (Cod_contrato) REFERENCES Contrato(Cod_contrato),
  FOREIGN KEY (Cod_cargo) REFERENCES Cargo(Cod_cargo),
  FOREIGN KEY (Cod_local) REFERENCES Local(Cod_local)
);

DROP TABLE IF EXISTS Horario_libre CASCADE;
CREATE TABLE Horario_libre
(
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  Cod_horario SERIAL NOT NULL,
  Codigo_empleado INT NOT NULL,
  PRIMARY KEY (Cod_horario),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);

DROP TABLE IF EXISTS Historial_laboral CASCADE;
CREATE TABLE Historial_laboral
(
  Cod_his_lab SERIAL NOT NULL,
  Empresa VARCHAR(100) NOT NULL,
  Cargo VARCHAR(100) NOT NULL,
  Duración FLOAT NOT NULL,
  Codigo_empleado INT NOT NULL,
  PRIMARY KEY (Cod_his_lab),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);

DROP TABLE IF EXISTS Solicitud_o_descargo CASCADE;
CREATE TABLE Solicitud_o_descargo
(
  Cod_sd SERIAL NOT NULL,
  Titulo VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(300) NOT NULL,
  Evidencia VARCHAR(100) NOT NULL,
  Respuesta VARCHAR(300) NULL,
  Codigo_empleado INT NOT NULL,
  Cod_estado_SD INT NOT NULL,
  Cod_tipo_sd INT NOT NULL,
  PRIMARY KEY (Cod_sd),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_estado_SD) REFERENCES Estado_SD(Cod_estado_SD),
  FOREIGN KEY (Cod_tipo_sd) REFERENCES Tipo_SD(Cod_tipo_sd)
);

DROP TABLE IF EXISTS Notificacion CASCADE;
CREATE TABLE Notificacion
(
  Cod_notificacion SERIAL PRIMARY KEY,
  Fecha_envio DATE NOT NULL,
  Hora_envio TIME NOT NULL,
  Mensaje TEXT NOT NULL,
  Destino INT NOT NULL,
  Codigo_empleado INT NOT NULL,
  Cod_tipo_notificacion INT NOT NULL,
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_tipo_notificacion) REFERENCES Tipo_notificacion(Cod_tipo_notificacion)
);

DROP TABLE IF EXISTS Posee CASCADE;
CREATE TABLE Posee
(
  Codigo_empleado INT NOT NULL,
  Cod_habilidad INT NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_habilidad),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_habilidad) REFERENCES Habilidad(Cod_habilidad)
);

DROP TABLE IF EXISTS Registra CASCADE;
CREATE TABLE Registra
(
  Codigo_empleado INT NOT NULL,
  Cod_asistencia INT NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_asistencia),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_asistencia) REFERENCES Asistencia(Cod_asistencia)
);

DROP TABLE IF EXISTS Horario_libre_Dias CASCADE;
CREATE TABLE Horario_libre_Dias
(
  Dias VARCHAR(20) NOT NULL,
  Cod_horario INT NOT NULL,
  PRIMARY KEY (Dias, Cod_horario),
  FOREIGN KEY (Cod_horario) REFERENCES Horario_libre(Cod_horario)
);

DROP TABLE IF EXISTS Usuario CASCADE;
CREATE TABLE Usuario
(
  Cod_usuario SERIAL NOT NULL,
  Username VARCHAR(50) NOT NULL,
  Contraseña VARCHAR(100) NOT NULL,
  Gmail VARCHAR(50) NOT NULL,
  Fecha_creacion DATE NOT NULL,
  Rol VARCHAR(50) NOT NULL,
  Codigo_empleado INT NOT NULL,
  Cod_estado_usuario INT NOT NULL,
  PRIMARY KEY (Cod_usuario),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_estado_usuario) REFERENCES Estado_usuario(Cod_estado_usuario)
);


-- modulo  2

DROP TABLE IF EXISTS CATEGORIA CASCADE;
CREATE TABLE CATEGORIA (
  cod_categoria CHAR (5) NOT NULL,
  nombre_categoria VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_categoria)
);



DROP TABLE IF EXISTS Producto_Friday CASCADE;
CREATE TABLE Producto_Friday (
  Cod_prodFriday CHAR (10) NOT NULL,
  Nombre_producto VARCHAR(50) NOT NULL,
  Precio_producto NUMERIC(10,2) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  cod_categoria CHAR (5) NOT NULL,
  cod_area_ec CHAR (2) NOT NULL,
  PRIMARY KEY (Cod_prodFriday)
);


DROP TABLE IF EXISTS TAMANO CASCADE;
CREATE TABLE TAMANO (
  cod_tamano CHAR (2) NOT NULL,
  descripcion_tamano VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_tamano)
);

DROP TABLE IF EXISTS TIPO_DE_MESA CASCADE;
CREATE TABLE TIPO_DE_MESA (
  cod_tipo_de_mesa VARCHAR(3) NOT NULL,
  descripcion_tipo_mesa VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_tipo_de_mesa)
);



DROP TABLE IF EXISTS ESTADO_DP CASCADE;
CREATE TABLE ESTADO_DP (
  cod_estado_dp CHAR (2) NOT NULL, -- TEMPRANO -- MODERADO -- TARDANZA -- TERMINADO
  descripcion_estado_dp VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_dp)
);

DROP TABLE IF EXISTS AREA_EC CASCADE;
CREATE TABLE AREA_EC (
  cod_area_ec CHAR (2) NOT NULL,
  descripcion_ec VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_area_ec)
);

DROP TABLE IF EXISTS ESTADO_ITEM_DP CASCADE;
CREATE TABLE ESTADO_ITEM_DP (
  cod_estado_item_dp CHAR (2) NOT NULL,
  descripcion_estado_item_dp VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_item_dp)
);

DROP TABLE IF EXISTS IDENTIFICACION_MESERO CASCADE;
CREATE TABLE IDENTIFICACION_MESERO (
  cod_im SERIAL,
  fecha DATE NOT NULL DEFAULT CURRENT_DATE,
  hora TIME NOT NULL DEFAULT CURRENT_TIME,
  Codigo_empleado INTEGER NOT NULL,
  PRIMARY KEY (cod_im)
);

DROP TABLE IF EXISTS MESA CASCADE;
CREATE TABLE MESA (
  cod_mesa VARCHAR (3) NOT NULL,
  cod_tipo_de_mesa CHAR(2) NOT NULL,
  cod_tamano CHAR (2) NOT NULL,
  PRIMARY KEY (cod_mesa)
);

DROP TABLE IF EXISTS DETALLE_PEDIDO CASCADE;
CREATE TABLE DETALLE_PEDIDO (
  cod_dp VARCHAR(20) NOT NULL,
  fecha_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cod_estado_dp CHAR (2) NOT NULL,
  cod_im INTEGER NOT NULL,
  cod_mesa VARCHAR (3) NOT NULL,
  PRIMARY KEY (cod_dp)
);

DROP TABLE IF EXISTS ITEM_DETALLE_PEDIDO CASCADE;
CREATE TABLE ITEM_DETALLE_PEDIDO (
  cod_item_dp VARCHAR(20) NOT NULL,
  Cod_prodFriday CHAR (10) NOT NULL,
  cantidad NUMERIC(10,2) NOT NULL,
  precio NUMERIC(10,2) NOT NULL,
  cod_estado_item_dp CHAR (2) NOT NULL, -- FINALIZADO o EN ESPERA
  cod_dp VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_item_dp)
);

DROP TABLE IF EXISTS KDS CASCADE;
CREATE TABLE KDS (
  cod_kds_item SERIAL not null,
  cod_kds CHAR (8) NOT NULL,
  cod_area_ec CHAR (2) NOT NULL,
  cod_item_dp VARCHAR(20) NULL,
  PRIMARY KEY (cod_kds_item)
);

DROP TABLE IF EXISTS EVENTO_ACTUALIZA CASCADE;
CREATE TABLE EVENTO_ACTUALIZA (
  cod_evento_actualiza SERIAL,
  fecha_finalizado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cod_item_dp VARCHAR(20) NOT NULL,
  cod_estado_item_dp CHAR (2) NOT NULL, -- FINALIZADO o EN ESPERA
  PRIMARY KEY (cod_evento_actualiza)
);


ALTER TABLE Producto_Friday ADD FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA (cod_categoria);

ALTER TABLE IDENTIFICACION_MESERO ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);
ALTER TABLE MESA ADD FOREIGN KEY (cod_tipo_de_mesa) REFERENCES TIPO_DE_MESA (cod_tipo_de_mesa);

ALTER TABLE MESA ADD FOREIGN KEY (cod_tamano) REFERENCES TAMANO (cod_tamano);

ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_im) REFERENCES IDENTIFICACION_MESERO (cod_im);

ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_mesa) REFERENCES MESA (cod_mesa);



ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_dp) REFERENCES ESTADO_DP (cod_estado_dp);


ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (Cod_prodFriday) REFERENCES Producto_Friday (Cod_prodFriday);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_dp) REFERENCES DETALLE_PEDIDO (cod_dp);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);

ALTER TABLE KDS ADD FOREIGN KEY (cod_area_ec) REFERENCES AREA_EC (cod_area_ec);

ALTER TABLE KDS ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE Producto_Friday ADD FOREIGN key (cod_area_ec) REFERENCES AREA_EC (cod_area_ec);

ALTER TABLE EVENTO_ACTUALIZA ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE EVENTO_ACTUALIZA ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);


-- modulo 5

drop table if exists Unidad_medidad cascade;
CREATE TABLE Unidad_medidad (
  Cod_unidad SERIAL,
  Nombre_unidad VARCHAR(15) NOT NULL,
  PRIMARY KEY (Cod_unidad)
);

drop table if exists Condiciones cascade;
CREATE TABLE Condiciones (
  Cod_condiciones SERIAL,
  Nombre_condiciones VARCHAR(20) NOT NULL,
  PRIMARY KEY (Cod_condiciones)
);

drop table if exists Categoria_insumo cascade;
CREATE TABLE Categoria_insumo (
  Cod_categoriainsumo SERIAL,
  Nombre_categoriainsumo VARCHAR(15) NOT NULL,
  PRIMARY KEY (Cod_categoriainsumo)
);

drop table if exists Subcategoria cascade;
CREATE TABLE Subcategoria (
  Cod_subcategoria SERIAL,
  Nombre_subcategoria VARCHAR(25) NOT NULL,
  Cod_categoria INT,
  PRIMARY KEY (Cod_subcategoria),
  FOREIGN KEY (Cod_categoria) REFERENCES Categoria_insumo(Cod_categoriainsumo)
);



drop table if exists Insumo cascade;
CREATE TABLE Insumo (
  Cod_Insumo SERIAL,
  Nombre_Insumo VARCHAR(100) NOT NULL,
  Cod_unidad INT NOT NULL,
  Cod_condiciones INT NOT NULL,
  Cod_subcategoria INT NOT NULL,
  PRIMARY KEY (Cod_Insumo)
);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_unidad) REFERENCES Unidad_medidad (Cod_unidad);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_condiciones) REFERENCES Condiciones (Cod_condiciones);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_subcategoria) REFERENCES Subcategoria (Cod_subcategoria);


drop table if exists Tipo_Almacen cascade;
create table Tipo_Almacen(
	Cod_tipo_almacen SERIAL,
	Nombre_tipo_almacen VARCHAR(50) not null,
	primary key (Cod_tipo_almacen)
);

drop table if exists Almacen cascade;
CREATE TABLE Almacen (
  Cod_Almacen SERIAL NOT NULL,
  Cod_tipo_almacen INT NOT NULL,
  Cod_local INT NOT NULL,
  PRIMARY KEY (Cod_Almacen),
  FOREIGN KEY (Cod_local) REFERENCES Local(Cod_local)
);

ALTER TABLE Almacen ADD FOREIGN KEY (Cod_tipo_almacen) REFERENCES Tipo_Almacen(Cod_tipo_almacen);


drop table if exists HojaProduccion cascade;
CREATE TABLE HojaProduccion (
  Cod_Hoja SERIAL,
  Fecha_elaboracion DATE NOT NULL,
  Codigo_empleado INT NOT NULL,
  PRIMARY KEY (Cod_Hoja)
);
ALTER TABLE HojaProduccion ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);


drop table if exists Proveedor cascade;
CREATE TABLE Proveedor (
  Cod_Proveedor SERIAL,
  Nombre_Empresa VARCHAR(50) NOT NULL,
  RUC CHAR (11) NOT NULL,
  Direccion_Proveedor VARCHAR(100) NOT NULL,
  Correo_Proveedor VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Proveedor)
);


drop table if exists proceso_ingreso cascade;
create table proceso_ingreso
(
	cod_proceso SERIAL,
	nombre_proceso VARCHAR(20),
	primary key (cod_proceso)
);

drop table if exists Orden_compra cascade;
CREATE TABLE Orden_compra
(
  Cod_ordencompra SERIAL,
  fecha_ordencompra DATE NOT NULL,
  Codigo_empleado INT not null,
  fecha_requeridaentrega DATE NOT NULL,
  Cod_Proveedor INT not null,
  cod_proceso INT not null,
  foreign key (cod_proceso) references proceso_ingreso(cod_proceso),
  foreign key (Cod_Proveedor) references Proveedor(Cod_Proveedor),
  PRIMARY KEY (Cod_ordencompra)
);


drop table if exists Orden_comprainsumo cascade;
CREATE TABLE Orden_comprainsumo
(
  cantidad_compra NUMERIC NOT NULL,
  cod_ordencompra INT NOT NULL,
  Cod_Insumo INT,
  PRIMARY KEY (cod_ordencompra, Cod_Insumo),
  FOREIGN KEY (cod_ordencompra) REFERENCES Orden_compra(cod_ordencompra),
  FOREIGN KEY (Cod_Insumo) REFERENCES Insumo(Cod_Insumo)
);






DROP TABLE IF EXISTS Calidad CASCADE;
CREATE TABLE Calidad (
    Cod_calidad SERIAL,
    Estado VARCHAR(15) not null,
    primary key(Cod_calidad)
);


drop table if exists Revision cascade;
create table Revision (
	cod_revision serial primary key,
	cod_ordencompra int not null,
	cod_insumo int not null,
	cod_supcantidad int not null,
	cod_supcalidad int not null,
	cantidad_recibida numeric (7, 2),
	fechahora_cantidad timestamp,
	Cod_Calidad int,
	fechahora_calidad timestamp,
	descripcion varchar (200),
	foreign key (cod_supcantidad) references Empleado(codigo_empleado),
	foreign key (cod_supcalidad) references Empleado(codigo_empleado),
	FOREIGN KEY (cod_ordencompra) REFERENCES Orden_compra(cod_ordencompra),
	FOREIGN KEY (cod_insumo) REFERENCES Insumo(cod_insumo),
	FOREIGN KEY (Cod_calidad) REFERENCES Calidad(cod_calidad)
);



drop table if exists Stock cascade;
CREATE TABLE Stock (
  Fecha_Vencimiento DATE NOT NULL,
  Cantidad NUMERIC(10,2) NOT NULL,
  Cod_Stock SERIAL,
  Cod_Insumo INT NOT NULL,
  Cod_Proveedor INT NOT NULL,
  Cod_Almacen INT NOT NULL,
  PRIMARY KEY (Cod_Stock)
);
ALTER TABLE Stock ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);
ALTER TABLE Stock ADD FOREIGN KEY (Cod_Proveedor) REFERENCES Proveedor (Cod_Proveedor);
ALTER TABLE Stock ADD FOREIGN KEY (Cod_Almacen) REFERENCES Almacen (Cod_Almacen);

drop table if exists Tipo_movimiento cascade;
CREATE TABLE Tipo_movimiento(
  Cod_tipomovimiento SERIAL,
  Nombre_tipomovimiento VARCHAR(10) NOT NULL,
  PRIMARY KEY (Cod_tipomovimiento)
);

drop table if exists Movimiento cascade;
CREATE TABLE Movimiento (
  Fecha_Movimiento TIMESTAMP not null,
  Cantidad_movimiento NUMERIC(10,2) NOT NULL,
  Fecha_fin TIMESTAMP,
  Cod_Movimiento SERIAL,
  Codigo_empleado INT NOT NULL,
  Cod_Stock INT NOT NULL,
  Cod_tipomovimiento INT NOT NULL,
  PRIMARY KEY (Cod_Movimiento)
);
ALTER TABLE Movimiento ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);
ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_Stock) REFERENCES Stock (Cod_Stock);
ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_tipomovimiento) REFERENCES Tipo_movimiento (Cod_tipomovimiento);

drop table if exists Incluye cascade;
CREATE TABLE Incluye (
  Cantidad INT NOT NULL,
  Cod_Hoja INT NOT NULL,
  Cod_prodFriday CHAR (10) NOT NULL,
  PRIMARY KEY (Cod_Hoja, Cod_prodFriday)
);
ALTER TABLE Incluye ADD FOREIGN KEY (Cod_Hoja) REFERENCES HojaProduccion (Cod_Hoja);
ALTER TABLE Incluye ADD FOREIGN KEY (Cod_prodFriday) REFERENCES Producto_Friday (Cod_prodFriday);


drop table if exists SeConviertenEn cascade;
CREATE TABLE SeConviertenEn (
  Cantidad_Receta INT NOT NULL,
  Cod_Insumo INT NOT NULL,
  Cod_Producto CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_Insumo, Cod_Producto)
);
ALTER TABLE SeConviertenEn ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);
ALTER TABLE SeConviertenEn ADD FOREIGN KEY (Cod_Producto) REFERENCES Producto_Friday (Cod_prodFriday);


DROP TABLE IF EXISTS Compatibilidad CASCADE;
CREATE TABLE Compatibilidad (
    Cod_tipo_almacen INT NOT NULL,
    Cod_condiciones INT NOT NULL,
    PRIMARY KEY (Cod_tipo_almacen, Cod_condiciones),
    FOREIGN KEY (Cod_tipo_almacen) REFERENCES Tipo_Almacen(Cod_tipo_almacen),
    FOREIGN KEY (Cod_condiciones) REFERENCES Condiciones(Cod_condiciones)
);


drop table if exists Solicitud_compra cascade;
CREATE TABLE Solicitud_compra
(
  Cod_solicitudcompra SERIAL,
  fecha_creacion DATE NOT NULL,
  Estado_solicicompra CHAR(20) NOT NULL,
  Codigo_empleado INT,
  PRIMARY KEY (cod_solicitudcompra),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);


drop table if exists Cotizacion cascade;
CREATE TABLE Cotizacion
(
  Cod_cotizacion SERIAL,
  Fecha_vencimiento DATE NOT NULL,
  Fecha_creacion DATE NOT NULL,
  Monto NUMERIC NOT NULL,
  Estado_cotizacion CHAR(20) NOT NULL,
  Fecha_entregaestimada DATE NOT NULL,
  cod_solicitudcompra INT,
  Cod_Proveedor INT,
  Codigo_empleado INT,
  PRIMARY KEY (Cod_cotizacion),
  FOREIGN KEY (cod_solicitudcompra) REFERENCES Solicitud_compra(cod_solicitudcompra),
  FOREIGN KEY (Cod_Proveedor) REFERENCES Proveedor(Cod_Proveedor),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);



drop table if exists Solicitud_comprainsumo cascade;
CREATE TABLE Solicitud_comprainsumo
(
  cantidad_solicitud NUMERIC NOT NULL,
  cod_solicitudcompra INT NOT NULL,
  Cod_Insumo INT,
  PRIMARY KEY (cod_solicitudcompra, Cod_Insumo),
  FOREIGN KEY (cod_solicitudcompra) REFERENCES Solicitud_compra(cod_solicitudcompra),
  FOREIGN KEY (Cod_Insumo) REFERENCES Insumo(Cod_Insumo)
);


