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



drop table if exists Categoria_insumo cascade;
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

drop table if exists Proveedor cascade;
CREATE TABLE Proveedor (
  Cod_Proveedor CHAR (10) NOT NULL,
  Nombre_Empresa VARCHAR(50) NOT NULL,
  RUC CHAR (11) NOT NULL,
  Direccion_Proveedor VARCHAR(100) NOT NULL,
  Correo_Proveedor VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Proveedor)
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