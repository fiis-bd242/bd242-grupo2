
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
  PRIMARY KEY (Cod_subcategoria)
);


drop table if exists Insumo cascade;
CREATE TABLE Insumo (
  Cod_Insumo SERIAL,
  Nombre_Insumo VARCHAR(100) NOT NULL,
  umbral NUMERIC(5, 2) NOT NULL,
  tolerancia INT not null,
  Cod_unidad INT NOT NULL,
  Cod_condiciones INT NOT NULL,
  Cod_subcategoria INT NOT NULL,
  Cod_categoriainsumo INT NOT NULL,
  PRIMARY KEY (Cod_Insumo)
);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_unidad) REFERENCES Unidad_medidad (Cod_unidad);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_condiciones) REFERENCES Condiciones (Cod_condiciones);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_subcategoria) REFERENCES Subcategoria (Cod_subcategoria);

ALTER TABLE Insumo ADD FOREIGN KEY (Cod_categoriainsumo) REFERENCES Categoria_insumo (Cod_categoriainsumo);

--

DROP TABLE IF EXISTS Local CASCADE;
CREATE TABLE Local(
  Cod_local SERIAL NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

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


-- para el empleado

drop table if exists Turno cascade;
CREATE TABLE Turno
(
  Cod_turno SERIAL NOT NULL,
  Nombre_turno VARCHAR(50) NOT NULL,
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  PRIMARY KEY (Cod_turno)
);

drop table if exists Local cascade;
CREATE TABLE Local
(
  Cod_local SERIAL NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

drop table if exists Cargo cascade;
CREATE TABLE Cargo
(
  Cod_cargo SERIAL NOT NULL,
  Nombre_cargo VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_cargo)
);

drop table if exists Area cascade;
CREATE TABLE Area
(
  Cod_area SERIAL NOT NULL,
  Nombre_area VARCHAR(50) NOT NULL,
  Cod_cargo INT NOT NULL,
  PRIMARY KEY (Cod_area),
  FOREIGN KEY(Cod_cargo) REFERENCES Cargo(Cod_cargo)
);

drop table if exists Tipo_contrato cascade;
CREATE TABLE Tipo_contrato
(
  Cod_tipo_contrato SERIAL NOT NULL,
  Nombre_tipo_contrato VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_contrato)
);

drop table if exists Contrato cascade;
CREATE TABLE Contrato
(
  Cod_contrato SERIAL NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  Cod_tipo_contrato INT NOT NULL,
  PRIMARY KEY (Cod_contrato),
  FOREIGN KEY (Cod_tipo_contrato) REFERENCES Tipo_contrato(Cod_tipo_contrato)
);

drop table if exists Empleado cascade;
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




DROP TABLE IF EXISTS Revision_Cantidad CASCADE;
CREATE TABLE Revision_Cantidad (
    id_revision_cantidad SERIAL PRIMARY KEY,
    cod_ordencompra INT NOT NULL,
    cod_insumo INT,
    cantidad_revisada NUMERIC NOT NULL,  -- Cantidad revisada de insumo
    fecha_revision TIMESTAMP,
    Cod_supervisor INT not null,
    FOREIGN KEY (cod_supervisor) REFERENCES Empleado(codigo_empleado),
    FOREIGN KEY (cod_ordencompra) REFERENCES Orden_compra(cod_ordencompra),
    FOREIGN KEY (cod_insumo) REFERENCES Insumo(cod_insumo)
);


DROP TABLE IF EXISTS Calidad CASCADE;
CREATE TABLE Calidad (
    Cod_calidad SERIAL,
    Estado VARCHAR(15) not null,
    primary key(Cod_calidad)
);

drop table if exists Revision_Calidad cascade;
CREATE TABLE Revision_Calidad (
    Cod_revision_calidad SERIAL PRIMARY KEY,
    Cod_ordencompra INT NOT NULL,
    Cod_insumo INT,
    Cod_calidad int,
    fecha_revision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cod_supervisor INT not null,
    descripcion VARCHAR(200),
    foreign key (Cod_supervisor) references Empleado(Codigo_empleado),
    FOREIGN KEY (cod_ordencompra) REFERENCES Orden_compra(cod_ordencompra),
    FOREIGN KEY (Cod_calidad) REFERENCES Calidad(cod_calidad),
    FOREIGN KEY (Cod_insumo) REFERENCES Insumo(Cod_Insumo)
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
  Fecha_fin TIME NOT NULL,
  Cod_Movimiento SERIAL,
  Codigo_empleado INT NOT NULL,
  Cod_Stock INT NOT NULL,
  Cod_tipomovimiento INT NOT NULL,
  PRIMARY KEY (Cod_Movimiento)
);
ALTER TABLE Movimiento ADD FOREIGN KEY (Codigo_empleado) REFERENCES Empleado (Codigo_empleado);
ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_Stock) REFERENCES Stock (Cod_Stock);
ALTER TABLE Movimiento ADD FOREIGN KEY (Cod_tipomovimiento) REFERENCES Tipo_movimiento (Cod_tipomovimiento);



DROP TABLE IF EXISTS CATEGORIA CASCADE;
CREATE TABLE CATEGORIA (
  cod_categoria CHAR (2) NOT NULL,
  nombre_categoria VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_categoria)
);

DROP TABLE IF EXISTS AREA_EC CASCADE;
CREATE TABLE AREA_EC (
  cod_area_ec CHAR (2) NOT NULL,
  descripcion_ec VARCHAR(30) NOT NULL,
  PRIMARY KEY (cod_area_ec)
);

DROP TABLE IF EXISTS Producto_Friday CASCADE;
CREATE TABLE Producto_Friday (
  Cod_prodFriday CHAR (10) NOT NULL,
  Nombre_producto VARCHAR(50) NOT NULL,
  Precio_producto NUMERIC(10,2) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  cod_categoria CHAR (5) NOT NULL,
  cod_area_ec CHAR (2) NOT null,
  PRIMARY KEY (Cod_prodFriday)
);
ALTER TABLE Producto_Friday ADD FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA (cod_categoria);
ALTER TABLE Producto_Friday ADD FOREIGN KEY (cod_area_ec) REFERENCES AREA_EC (cod_area_ec);




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
