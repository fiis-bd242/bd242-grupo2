DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Solicitud compra;
DROP TABLE IF EXISTS Orden_compra;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Unidad_medida;
DROP TABLE IF EXISTS Categoria_insumo;
DROP TABLE IF EXISTS Condiciones;
DROP TABLE IF EXISTS Cotizacion;
DROP TABLE IF EXISTS Subcategoria;
DROP TABLE IF EXISTS Insumo;
DROP TABLE IF EXISTS Orden_comprainsumo;
DROP TABLE IF EXISTS Solicitud_comprainsumo;

CREATE TABLE Empleado
(
  Direccion VARCHAR(100) NOT NULL,
  Contacto CHAR(9) NOT NULL,
  DNI CHAR(8) NOT NULL,
  Primer_nombre VARCHAR(100) NOT NULL,
  Primer_apellido VARCHAR(100) NOT NULL,
  Segundo_apellido VARCHAR(100) NOT NULL,
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_turno CHAR(10),
  Cod_contrato CHAR(10) NOT NULL,
  Cod_area CHAR(10) NOT NULL,
  Cod_cargo CHAR(10) NOT NULL,
  Cod_local CHAR(10) NOT NULL,
  PRIMARY KEY (Codigo_empleado)
);

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

CREATE TABLE Proveedor
(
  Cod_Proveedor CHAR(10) NOT NULL,
  Nombre_Empresa VARCHAR(50) NOT NULL,
  RUC CHAR(11) NOT NULL,
  Direccion_Proveedor VARCHAR(100) NOT NULL,
  Correo_Proveedor VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_Proveedor)
);

CREATE TABLE Unidad_medida
(
  Cod_unidad INT NOT NULL,
  Nombre_unidad INT NOT NULL,
  PRIMARY KEY (Cod_unidad)
);

CREATE TABLE Categoria_insumo
(
  Cod_categoriainsumo INT NOT NULL,
  Nombre_categoriainsumo INT NOT NULL,
  PRIMARY KEY (Cod_categoriainsumo)
);

CREATE TABLE Condiciones
(
  Cod_condiciones INT NOT NULL,
  Nombre_condiciones INT NOT NULL,
  PRIMARY KEY (Cod_condiciones)
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

CREATE TABLE Subcategoria
(
  Cod_subcategoria INT NOT NULL,
  Nombre_subcategoria INT NOT NULL,
  Cod_categoriainsumo INT NOT NULL,
  PRIMARY KEY (Cod_subcategoria),
  FOREIGN KEY (Cod_categoriainsumo) REFERENCES Categoria_insumo(Cod_categoriainsumo)
);

CREATE TABLE Insumo
(
  Cod_Insumo CHAR(2) NOT NULL,
  Nombre_Insumo VARCHAR(20) NOT NULL,
  Cantidad_total NUMERIC NOT NULL,
  Cod_subcategoria INT NOT NULL,
  Cod_unidad INT NOT NULL,
  Cod_categoriainsumo INT NOT NULL,
  Cod_condiciones INT NOT NULL,
  PRIMARY KEY (Cod_Insumo),
  FOREIGN KEY (Cod_subcategoria) REFERENCES Subcategoria(Cod_subcategoria),
  FOREIGN KEY (Cod_unidad) REFERENCES Unidad_medida(Cod_unidad),
  FOREIGN KEY (Cod_categoriainsumo) REFERENCES Categoria_insumo(Cod_categoriainsumo),
  FOREIGN KEY (Cod_condiciones) REFERENCES Condiciones(Cod_condiciones)
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