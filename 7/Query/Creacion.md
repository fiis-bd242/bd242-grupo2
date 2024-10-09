
-- Creacion de tablas
DROP TABLE IF EXISTS CATEGORIA CASCADE;
CREATE TABLE CATEGORIA (
  cod_categoria CHAR (5) NOT NULL,
  nombre_categoria VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_categoria)
);

DROP TABLE IF EXISTS Area CASCADE;
CREATE TABLE Area (
  Cod_area CHAR (10) NOT NULL,
  nombre_area VARCHAR(100) NOT NULL,
  PRIMARY KEY (cod_area)
);

DROP TABLE IF EXISTS Cargo CASCADE;
CREATE TABLE Cargo (
  Cod_cargo CHAR (10) NOT NULL,
  Nombre_cargo VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_cargo)
);

DROP TABLE IF EXISTS Tipo_Contrato CASCADE;
CREATE TABLE Tipo_Contrato (
  Cod_tipo_contrato CHAR (10) NOT NULL,
  Nombre_tipo_contrato VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_contrato)
);

DROP TABLE IF EXISTS Local CASCADE;
CREATE TABLE Local (
  Cod_local CHAR (10) NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

DROP TABLE IF EXISTS Turno CASCADE;
CREATE TABLE Turno (
  Cod_turno CHAR (10) NOT NULL,
  Nombre_turno VARCHAR(100) NOT NULL,
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  PRIMARY KEY (Cod_turno)
);

DROP TABLE IF EXISTS Producto_Friday CASCADE;
CREATE TABLE Producto_Friday (
  Cod_prodFriday CHAR (10) NOT NULL,
  Nombre_producto VARCHAR(50) NOT NULL,
  Precio_producto NUMERIC(10,2) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Valoracion NUMERIC(10,2) NOT NULL,
  cod_categoria CHAR (5) NOT NULL,
  PRIMARY KEY (Cod_prodFriday)
);

DROP TABLE IF EXISTS Contrato CASCADE;
CREATE TABLE Contrato (
  Cod_contrato CHAR (10) NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  Cod_tipo_contrato CHAR (10) NOT NULL,
  PRIMARY KEY (Cod_contrato)
);

DROP TABLE IF EXISTS Empleado CASCADE;
CREATE TABLE Empleado (
  Direccion VARCHAR(50) NOT NULL,
  Contacto CHAR (9) NOT NULL,
  DNI CHAR (8) NOT NULL,
  Primer_nombre VARCHAR(50) NOT NULL,
  Primer_apellido VARCHAR(50) NOT NULL,
  Segundo_apellido VARCHAR(50) NOT NULL,
  Codigo_empleado CHAR (10) NOT NULL,
  Cod_turno CHAR (10) NOT NULL,
  Cod_contrato CHAR (10) NOT NULL,
  Cod_area CHAR (10) NOT NULL,
  Cod_cargo CHAR (10) NOT NULL,
  Cod_local CHAR (10) NOT NULL,
  PRIMARY KEY (Codigo_empleado)
);


drop table if exists Categoria_insumo;
CREATE TABLE Categoria_insumo (
  Cod_categoriainsumo CHAR (2) NOT NULL,
  Nombre_categoriainsumo VARCHAR(10) NOT NULL,
  PRIMARY KEY (Cod_categoriainsumo)
);

drop table if exists Subcategoria cascade;
CREATE TABLE Subcategoria (
  Cod_subcategoria CHAR (3) NOT NULL,
  Nombre_subcategoria VARCHAR(20) NOT NULL,
  Cod_categoria CHAR (2) NOT NULL,
  PRIMARY KEY (Cod_subcategoria)
);

drop table if exists Condiciones cascade;
CREATE TABLE Condiciones (
  Cod_condiciones CHAR (2) NOT NULL,
  Nombre_condiciones VARCHAR(20) NOT NULL,
  PRIMARY KEY (Cod_condiciones)
);

drop table if exists Unidad_medidad cascade;
CREATE TABLE Unidad_medidad (
  Cod_unidad CHAR (2) NOT NULL,
  Nombre_unidad VARCHAR(10) NOT NULL,
  PRIMARY KEY (Cod_unidad)
);


drop table if exists Tipo_Almacen cascade;
create table Tipo_Almacen(
	Cod_tipo_almacen CHAR (3) not null,
	Nombre_tipo_almacen VARCHAR(50) not null,
	primary key (Cod_tipo_almacen)
);


drop table if exists Proveedor cascade;
CREATE TABLE Proveedor (
  Cod_Proveedor CHAR (10) NOT NULL,
  Nombre_Empresa VARCHAR(50) NOT NULL,
  RUC CHAR (11) NOT NULL,
  Direccion_Proveedor VARCHAR(100) NOT NULL,
  Correo_Proveedor VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Proveedor)
);

drop table if exists Tipo_movimiento cascade;
CREATE TABLE Tipo_movimiento (
  Cod_tipomovimiento CHAR (1) NOT NULL,
  Nombre_tipomovimiento VARCHAR(10) NOT NULL,
  PRIMARY KEY (Cod_tipomovimiento)
);

drop table if exists HojaProduccion cascade;
CREATE TABLE HojaProduccion (
  Cod_Hoja VARCHAR(5) NOT NULL,
  Fecha_elaboracion DATE NOT NULL,
  Codigo_empleado CHAR (10) NOT NULL,
  PRIMARY KEY (Cod_Hoja)
);

drop table if exists Almacen cascade;
CREATE TABLE Almacen (
  Cod_Almacen VARCHAR(5) NOT NULL,
  Nombre_Almacen VARCHAR(100) NOT NULL,
  Cod_tipo_almacen CHAR(3) NOT NULL,
  PRIMARY KEY (Cod_Almacen)
);

drop table if exists Insumo cascade;
CREATE TABLE Insumo (
  Cod_Insumo CHAR (5) NOT NULL,
  Nombre_Insumo VARCHAR(20) NOT NULL,
  Cantidad_total NUMERIC(10,2) NOT NULL,
  Cod_unidad CHAR (2) NOT NULL,
  Cod_condiciones CHAR (2) NOT NULL,
  Cod_subcategoria CHAR (3) NOT NULL,
  Cod_categoriainsumo CHAR (2) NOT NULL,
  PRIMARY KEY (Cod_Insumo)
);

drop table if exists Almacenado cascade;
CREATE TABLE Almacenado (
  Cod_Insumo CHAR (5) NOT NULL,
  Cod_Almacen VARCHAR(5) NOT NULL,
  PRIMARY KEY (Cod_Insumo, Cod_Almacen)
);

drop table if exists Tiene cascade;
CREATE TABLE Tiene (
  Cod_Proveedor CHAR (10) NOT NULL,
  Cod_Insumo CHAR (5) NOT NULL,
  PRIMARY KEY (Cod_Proveedor, Cod_Insumo)
);

drop table if exists SeConviertenEn cascade;
CREATE TABLE SeConviertenEn (
  Cantidad_Receta INT NOT NULL,
  Cod_Insumo CHAR (5) NOT NULL,
  Cod_Producto CHAR (10) NOT NULL,
  PRIMARY KEY (Cod_Insumo, Cod_Producto)
);

drop table if exists Incluye cascade;
CREATE TABLE Incluye (
  Cantidad INT NOT NULL,
  Cod_Hoja VARCHAR(5) NOT NULL,
  Cod_prodFriday CHAR (10) NOT NULL,
  PRIMARY KEY (Cod_Hoja, Cod_prodFriday)
);


drop table if exists Movimiento cascade;
CREATE TABLE Movimiento (
  Fecha_Movimiento DATE NOT NULL,
  Hora_inicio TIME NOT NULL,
  Cantidad_movimiento NUMERIC(10,2) NOT NULL,
  Hora_fin TIME NOT NULL,
  Cod_Movimiento CHAR (5) NOT NULL,
  Codigo_empleado CHAR (10) NOT NULL,
  Cod_Stock VARCHAR(5) NOT NULL,
  Cod_Insumo CHAR (5) NOT NULL,
  Cod_Almacen VARCHAR(5) NOT NULL,
  Cod_tipomovimiento CHAR (1) NOT NULL,
  PRIMARY KEY (Cod_Movimiento)
);

drop table if exists Stock cascade;
CREATE TABLE Stock (
  Fecha_Vencimiento DATE NOT NULL,
  Cantidad NUMERIC(10,2) NOT NULL,
  Cod_Stock VARCHAR(5) NOT NULL,
  Cod_Insumo CHAR (5) NOT NULL,
  Cod_Proveedor CHAR (10) NOT NULL,
  Cod_Almacen VARCHAR(5) NOT NULL,
  PRIMARY KEY (Cod_Stock)
);

drop table if exists Reporte_disponibilidad cascade;
CREATE TABLE Reporte_disponibilidad
(
  Cod_reporte_disponibilidad CHAR(10) NOT NULL,
  Fecha_reporte DATE NOT NULL,
  Hora_reporte TIME NOT NULL,
  Cod_Insumo CHAR(5) NOT NULL,
  Emisor CHAR(10) NOT NULL,
  Receptor CHAR(10) NOT NULL
);

ALTER TABLE Reporte_disponibilidad ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);
ALTER TABLE Reporte_disponibilidad ADD FOREIGN KEY (Emisor) REFERENCES Empleado (Codigo_empleado);
ALTER TABLE Reporte_disponibilidad ADD FOREIGN KEY (Receptor) REFERENCES Empleado (Codigo_empleado);


ALTER TABLE Producto_Friday ADD FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA (cod_categoria);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_contrato) REFERENCES Contrato (Cod_contrato);

ALTER TABLE Empleado ADD FOREIGN KEY (cod_area) REFERENCES Area (cod_area);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_cargo) REFERENCES Cargo (Cod_cargo);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_local) REFERENCES Local (Cod_local);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_turno) REFERENCES Turno (Cod_turno);

ALTER TABLE Subcategoria ADD FOREIGN KEY (Cod_categoria) REFERENCES Categoria_insumo (Cod_categoriainsumo);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_unidad) REFERENCES Unidad_medidad (Cod_unidad);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_condiciones) REFERENCES Condiciones (Cod_condiciones);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_subcategoria) REFERENCES Subcategoria (Cod_subcategoria);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_categoriainsumo) REFERENCES Categoria_insumo (Cod_categoriainsumo);



ALTER TABLE Stock ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);

ALTER TABLE Stock ADD FOREIGN KEY (Cod_Proveedor) REFERENCES Proveedor (Cod_Proveedor);

ALTER TABLE Stock ADD FOREIGN KEY (Cod_Almacen) REFERENCES Almacen (Cod_Almacen);

ALTER TABLE SeConviertenEn ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);

ALTER TABLE SeConviertenEn ADD FOREIGN KEY (Cod_Producto) REFERENCES Producto_Friday (Cod_prodFriday);

ALTER TABLE Tiene ADD FOREIGN KEY (Cod_Proveedor) REFERENCES Proveedor (Cod_Proveedor);

ALTER TABLE Tiene ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);

ALTER TABLE Almacenado ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);

ALTER TABLE Almacenado ADD FOREIGN KEY (Cod_Almacen) REFERENCES Almacen (Cod_Almacen);


ALTER TABLE Movimiento ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);


ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_Stock) REFERENCES Stock (Cod_Stock);

ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_Insumo) REFERENCES Insumo (Cod_Insumo);

ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_Almacen) REFERENCES Almacen (Cod_Almacen);

ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_tipomovimiento) REFERENCES Tipo_movimiento (Cod_tipomovimiento);

ALTER TABLE HojaProduccion ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);

ALTER TABLE Incluye ADD FOREIGN KEY (Cod_Hoja) REFERENCES HojaProduccion (Cod_Hoja);

ALTER TABLE Incluye ADD FOREIGN KEY (Cod_prodFriday) REFERENCES Producto_Friday (Cod_prodFriday);

ALTER TABLE Almacen ADD FOREIGN KEY (Cod_tipo_almacen) REFERENCES Tipo_Almacen(Cod_tipo_almacen);




DROP TABLE IF EXISTS Solicitud cascade;
DROP TABLE IF EXISTS Informe_RC cascade;
DROP TABLE IF EXISTS Gasto cascade;
drop table if exists Orden_compra cascade;
drop table if exists solicitud_reportecostos cascade;



CREATE TABLE Informe_RC
(
  Cod_RC CHAR(10) NOT NULL,
  Fecha DATE NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Fecha_InicioRC DATE NOT NULL,
  Fecha_FinRC DATE NOT NULL,
  Local_RC VARCHAR(50) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_RC),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);

CREATE TABLE Gasto
(
  Cod_Gasto CHAR(10) NOT NULL,
  Area_Gasto VARCHAR(50) NOT NULL,
  Monto_Gasto FLOAT NOT NULL,
  Local_Gasto VARCHAR(50) NOT NULL,
  Fecha_Gasto DATE NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_RC CHAR(10),
  PRIMARY KEY (Cod_Gasto),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_RC) REFERENCES Informe_RC(Cod_RC)
);

CREATE TABLE Orden_compra
(
  Cod_odencompra CHAR(20) NOT NULL,
  fecha_ordencompra DATE NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  fecha_requeridaentrega DATE NOT NULL,
  Cod_RC CHAR(10),
  PRIMARY KEY (Cod_odencompra),
  FOREIGN KEY (Cod_RC) REFERENCES Informe_RC(Cod_RC)
);

CREATE TABLE Solicitud_ReporteCostos
(
  Cod_Solicitud CHAR(10) NOT NULL,
  Correo_Solicitante VARCHAR(100) NOT NULL,
  Fecha_Solicitud DATE NOT NULL,
  Estado_Solicitud VARCHAR(50) NOT NULL,
  Descripcion_Solicitud VARCHAR(50) NOT NULL,
  Fecha_Entrega DATE NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  SolicitaCodigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_Solicitud),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (SolicitaCodigo_empleado) REFERENCES Empleado(Codigo_empleado)
);



DROP TABLE IF EXISTS Orden_comprainsumo cascade;
DROP TABLE IF EXISTS Solicitud_comprainsumo cascade;
DROP TABLE IF EXISTS Cotizacion cascade;
DROP TABLE IF EXISTS Solicitud_compra cascade;
DROP TABLE IF EXISTS Orden_compra cascade;

CREATE TABLE Solicitud_compra
(
  cod_solicitudcompra CHAR(10) NOT NULL,
  fecha_creacion DATE NOT NULL,
  Estado_solicicompra CHAR(20) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (cod_solicitudcompra),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);
CREATE TABLE Orden_compra
(
  cod_ordencompra CHAR(20) NOT NULL,
  fecha_ordencompra DATE NOT NULL,
  fecha_requeridaentrega DATE NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (cod_ordencompra),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);
CREATE TABLE Cotizacion
(
  Cod_cotizacion CHAR(10) NOT NULL,
  Fecha_vencimiento DATE NOT NULL,
  Fecha_creacion DATE NOT NULL,
  Monto NUMERIC NOT NULL,
  Estado_cotizacion CHAR(20) NOT NULL,
  Fecha_entregaestimada DATE NOT NULL,
  cod_solicitudcompra CHAR(10) NOT NULL,
  Cod_Proveedor CHAR(10) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_cotizacion),
  FOREIGN KEY (cod_solicitudcompra) REFERENCES Solicitud_compra(cod_solicitudcompra),
  FOREIGN KEY (Cod_Proveedor) REFERENCES Proveedor(Cod_Proveedor),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);
CREATE TABLE Orden_comprainsumo
(
  cantidad_compra NUMERIC NOT NULL,
  cod_ordencompra CHAR(20) NOT NULL,
  Cod_Insumo CHAR(2) NOT NULL,
  PRIMARY KEY (cod_ordencompra, Cod_Insumo),
  FOREIGN KEY (cod_ordencompra) REFERENCES Orden_compra(cod_ordencompra),
  FOREIGN KEY (Cod_Insumo) REFERENCES Insumo(Cod_Insumo)
);

CREATE TABLE Solicitud_comprainsumo
(
  cantidad_solicitud INT NOT NULL,
  cod_solicitudcompra CHAR(10) NOT NULL,
  Cod_Insumo CHAR(2) NOT NULL,
  PRIMARY KEY (cod_solicitudcompra, Cod_Insumo),
  FOREIGN KEY (cod_solicitudcompra) REFERENCES Solicitud_compra(cod_solicitudcompra),
  FOREIGN KEY (Cod_Insumo) REFERENCES Insumo(Cod_Insumo)
);




DROP TABLE IF EXISTS TAMANO CASCADE;
CREATE TABLE TAMANO (
  cod_tamano CHAR (2) NOT NULL,
  descripcion_tamano VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_tamano)
);

DROP TABLE IF EXISTS TIPO_DE_MESA CASCADE;
CREATE TABLE TIPO_DE_MESA (
  cod_tipo_de_mesa CHAR (10) NOT NULL,
  descripcion_tipo_mesa VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_tipo_de_mesa)
);

DROP TABLE IF EXISTS ESTADO_PM CASCADE;
CREATE TABLE ESTADO_PM (
  cod_estado_pm CHAR (2) NOT NULL,
  descripcion_estado_pm VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_pm)
);

DROP TABLE IF EXISTS ESTADO_DP CASCADE;
CREATE TABLE ESTADO_DP (
  cod_estado_dp CHAR (2) NOT NULL,
  descripcion_estado_dp VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_dp)
);

DROP TABLE IF EXISTS AREA_EC CASCADE;
CREATE TABLE AREA_EC (
  cod_area_ec CHAR (2) NOT NULL,
  descripcion_ec VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_area_ec)
);

DROP TABLE IF EXISTS ESTADO_KDS CASCADE;
CREATE TABLE ESTADO_KDS (
  cod_estado_kds CHAR (2) NOT NULL,
  descripcion_kds VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_kds)
);

DROP TABLE IF EXISTS ESTADO_ITEM_DP CASCADE;
CREATE TABLE ESTADO_ITEM_DP (
  cod_estado_item_dp CHAR (10) NOT NULL,
  descripcion_estado_item_dp VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_item_dp)
);

DROP TABLE IF EXISTS ESTADO_IM CASCADE;
CREATE TABLE ESTADO_IM (
  cod_estado_im CHAR (10) NOT NULL,
  descripcion_estado_im VARCHAR(20) NOT NULL,
  PRIMARY KEY (cod_estado_im)
);

DROP TABLE IF EXISTS IDENTIFICACION_MESERO CASCADE;
CREATE TABLE IDENTIFICACION_MESERO (
  cod_im CHAR (10) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Codigo_empleado CHAR (10) NOT NULL,
  cod_estado_im CHAR (10) NOT NULL,
  PRIMARY KEY (cod_im)
);

DROP TABLE IF EXISTS MESA CASCADE;
CREATE TABLE MESA (
  cod_mesa CHAR (10) NOT NULL,
  num_sillas NUMERIC(10,2) NOT NULL,
  cod_tipo_de_mesa CHAR (10) NOT NULL,
  cod_tamano CHAR (2) NOT NULL,
  PRIMARY KEY (cod_mesa)
);

DROP TABLE IF EXISTS PEDIDO_DE_MESA CASCADE;
CREATE TABLE PEDIDO_DE_MESA (
  cod_pm CHAR (10) NOT NULL,
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  cod_im CHAR (10) NOT NULL,
  cod_mesa CHAR (10) NOT NULL,
  cod_estado_pm CHAR (2) NOT NULL,
  PRIMARY KEY (cod_pm)
);

DROP TABLE IF EXISTS DETALLE_PEDIDO CASCADE;
CREATE TABLE DETALLE_PEDIDO (
  cod_dp CHAR (10) NOT NULL,
  precio_total NUMERIC(10,2) NOT NULL,
  cantidad_total NUMERIC(10,2) NOT NULL,
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  cod_pm CHAR (10) NOT NULL,
  cod_estado_dp CHAR (2) NOT NULL,
  PRIMARY KEY (cod_dp)
);

DROP TABLE IF EXISTS ITEM_DETALLE_PEDIDO CASCADE;
CREATE TABLE ITEM_DETALLE_PEDIDO (
  cod_item_dp CHAR (10) NOT NULL,
  Cod_prodFriday CHAR (10) NOT NULL,
  cantidad NUMERIC(10,2) NOT NULL,
  precio NUMERIC(10,2) NOT NULL,
  cod_dp CHAR (10) NOT NULL,
  cod_estado_item_dp CHAR (10) NOT NULL,
  PRIMARY KEY (cod_item_dp)
);

DROP TABLE IF EXISTS KDS CASCADE;
CREATE TABLE KDS (
  cod_kds CHAR (10) NOT NULL,
  cod_area_ec CHAR (2) NOT NULL,
  cod_estado_kds CHAR (2) NOT NULL,
  cod_item_dp CHAR (10) NOT NULL,
  PRIMARY KEY (cod_kds)
);

DROP TABLE IF EXISTS EMPLEADO_ITEMDETALLEPEDIDO CASCADE;
CREATE TABLE EMPLEADO_ITEMDETALLEPEDIDO (
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Codigo_empleado CHAR (10) NOT NULL,
  cod_item_dp CHAR (10) NOT NULL,
  cod_estado_item_dp CHAR (2) NOT NULL,
  PRIMARY KEY (Codigo_empleado, cod_item_dp)
);

ALTER TABLE Producto_Friday ADD FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA (cod_categoria);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_contrato) REFERENCES Contrato (Cod_contrato);

ALTER TABLE Empleado ADD FOREIGN KEY (cod_area) REFERENCES Area (cod_area);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_cargo) REFERENCES Cargo (Cod_cargo);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_local) REFERENCES Local (Cod_local);

ALTER TABLE Empleado ADD FOREIGN KEY (Cod_turno) REFERENCES Turno (Cod_turno);

ALTER TABLE IDENTIFICACION_MESERO ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);

ALTER TABLE IDENTIFICACION_MESERO ADD FOREIGN KEY (cod_estado_im) REFERENCES ESTADO_IM (cod_estado_im);

ALTER TABLE MESA ADD FOREIGN KEY (cod_tipo_de_mesa) REFERENCES TIPO_DE_MESA (cod_tipo_de_mesa);

ALTER TABLE MESA ADD FOREIGN KEY (cod_tamano) REFERENCES TAMANO (cod_tamano);

ALTER TABLE PEDIDO_DE_MESA ADD FOREIGN KEY (cod_im) REFERENCES IDENTIFICACION_MESERO (cod_im);

ALTER TABLE PEDIDO_DE_MESA ADD FOREIGN KEY (cod_mesa) REFERENCES MESA (cod_mesa);

ALTER TABLE PEDIDO_DE_MESA ADD FOREIGN KEY (cod_estado_pm) REFERENCES ESTADO_PM (cod_estado_pm);

ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_pm) REFERENCES PEDIDO_DE_MESA (cod_pm);

ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_dp) REFERENCES ESTADO_DP (cod_estado_dp);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_dp) REFERENCES DETALLE_PEDIDO (cod_dp);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (Cod_prodFriday) REFERENCES Producto_Friday (Cod_prodFriday);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);

ALTER TABLE KDS ADD FOREIGN KEY (cod_area_ec) REFERENCES AREA_EC (cod_area_ec);

ALTER TABLE KDS ADD FOREIGN KEY (cod_estado_kds) REFERENCES ESTADO_KDS (cod_estado_kds);

ALTER TABLE KDS ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE EMPLEADO_ITEMDETALLEPEDIDO ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);

ALTER TABLE EMPLEADO_ITEMDETALLEPEDIDO ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE EMPLEADO_ITEMDETALLEPEDIDO ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);



DROP TABLE IF EXISTS Estado_Asistencia cascade;
DROP TABLE IF EXISTS Habilidad cascade;
DROP TABLE IF EXISTS Estado_usuario cascade;
DROP TABLE IF EXISTS Tipo_generacion cascade;
DROP TABLE IF EXISTS Tipo_notificacion cascade;
DROP TABLE IF EXISTS Tipo_SD cascade;
DROP TABLE IF EXISTS Estado_SD cascade;
DROP TABLE IF EXISTS Asistencia cascade;
DROP TABLE IF EXISTS Registra cascade;
DROP TABLE IF EXISTS Posee cascade;
DROP TABLE IF EXISTS Notificacion cascade;
DROP TABLE IF EXISTS Solicitud_o_descargo cascade;
DROP TABLE IF EXISTS Historial_laboral cascade;
DROP TABLE IF EXISTS Horario_libre_Dias cascade;
DROP TABLE IF EXISTS Horario_libre cascade;
DROP TABLE IF EXISTS usuario cascade;


CREATE TABLE Habilidad
(
  Nombre_habilidad VARCHAR(100) NOT NULL,
  Descripcion TEXT NOT NULL,
  Cod_habilidad CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_habilidad)
);

CREATE TABLE Estado_Asistencia
(
  Cod_estado CHAR(10) NOT NULL,
  Nombre_Estado VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_estado)
);

CREATE TABLE Estado_SD
(
  Cod_estado_SD CHAR(10) NOT NULL,
  Nombre_estado_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_SD)
);

CREATE TABLE Tipo_SD
(
  Cod_tipo_sd CHAR(10) NOT NULL,
  Nombre_tipo_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_sd)
);

CREATE TABLE Tipo_notificacion
(
  Cod_tipo_notificacion CHAR(10) NOT NULL,
  Nombre_tipo_notificacion VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_notificacion)
);

CREATE TABLE Tipo_generacion
(
  Cod_tipo_generacion CHAR(10) NOT NULL,
  Nombre_tipo_generacion VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_generacion)
);

CREATE TABLE Estado_usuario
(
  Cod_estado_usuario CHAR(10) NOT NULL,
  Nombre_estado_usuario VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_usuario)
);

CREATE TABLE Asistencia
(
  Cod_asistencia CHAR(10) NOT NULL,
  Fecha DATE NOT NULL,
  Hora_ingreso TIME NOT NULL,
  Hora_salida TIME NOT NULL,
  Cod_estado CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_asistencia),
  FOREIGN KEY (Cod_estado) REFERENCES Estado_Asistencia(Cod_estado)
);

CREATE TABLE Horario_libre
(
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  Cod_horario CHAR(10) NOT NULL,
  Codigo CHAR(10),
  PRIMARY KEY (Cod_horario),
  FOREIGN KEY (Codigo) REFERENCES Empleado(Codigo_empleado)
);

CREATE TABLE Historial_laboral
(
  Cod_his_lab CHAR(10) NOT NULL,
  Empresa VARCHAR(100) NOT NULL,
  Cargo VARCHAR(100) NOT NULL,
  Duración FLOAT NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_his_lab),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);

CREATE TABLE Solicitud_o_descargo
(
  Cod_sd CHAR(10) NOT NULL,
  Titulo VARCHAR(100) NOT NULL,
  Descripcion TEXT NOT NULL,
  Evidencia VARCHAR(100) NOT NULL,
  Respuesta TEXT,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_estado_SD CHAR(10) NOT NULL,
  Cod_tipo_sd CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_sd),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_estado_SD) REFERENCES Estado_SD(Cod_estado_SD),
  FOREIGN KEY (Cod_tipo_sd) REFERENCES Tipo_SD(Cod_tipo_sd)
);

CREATE TABLE Notificacion
(
  Cod_notificacion CHAR(10) PRIMARY KEY,
  Fecha_envio DATE NOT NULL,
  Hora_envio TIME NOT NULL,
  Mensaje TEXT NOT NULL,
  Origen VARCHAR(50) NOT NULL,
  Destino VARCHAR(50) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_tipo_notificacion CHAR(10) NOT NULL,
  Cod_tipo_generacion CHAR(10) NOT NULL,
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_tipo_notificacion) REFERENCES Tipo_notificacion(Cod_tipo_notificacion),
  FOREIGN KEY (Cod_tipo_generacion) REFERENCES Tipo_generacion(Cod_tipo_generacion)
);

CREATE TABLE Posee
(
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_habilidad CHAR(10) NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_habilidad),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_habilidad) REFERENCES Habilidad(Cod_habilidad)
);

CREATE TABLE Registra
(
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_asistencia CHAR(10) NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_asistencia),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_asistencia) REFERENCES Asistencia(Cod_asistencia)
);

CREATE TABLE Horario_libre_Dias
(
  Dias VARCHAR(20) NOT NULL,
  Cod_horario CHAR(10) NOT NULL,
  PRIMARY KEY (Dias, Cod_horario),
  FOREIGN KEY (Cod_horario) REFERENCES Horario_libre(Cod_horario)
);

CREATE TABLE Usuario
(
  Username VARCHAR(50) NOT NULL,
  Contraseña VARCHAR(100) NOT NULL,
  Gmail VARCHAR(50) NOT NULL,
  Fecha_creacion DATE NOT NULL,
  Rol VARCHAR(50) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_estado_usuario CHAR(10) NOT NULL,
  PRIMARY KEY (Username),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_estado_usuario) REFERENCES Estado_usuario(Cod_estado_usuario)
);