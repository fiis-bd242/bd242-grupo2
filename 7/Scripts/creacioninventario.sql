

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
  umbral NUMERIC(5, 2) NOT NULL,
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




