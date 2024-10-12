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

DROP TABLE IF EXISTS DETALLE_PEDIDO CASCADE;
CREATE TABLE DETALLE_PEDIDO (
  cod_dp CHAR (10) NOT NULL,
  precio_total NUMERIC(10,2) NOT NULL,
  cantidad_total NUMERIC(10,2) NOT NULL,
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  cod_estado_dp CHAR (2) NOT NULL,
  cod_im CHAR (10) NOT NULL,
  cod_mesa CHAR (10) NOT NULL,
  PRIMARY KEY (cod_dp)
);

DROP TABLE IF EXISTS ITEM_DETALLE_PEDIDO CASCADE;
CREATE TABLE ITEM_DETALLE_PEDIDO (
  cod_item_dp CHAR (10) NOT NULL,
  Cod_prodFriday CHAR (10) NOT NULL,
  cantidad NUMERIC(10,2) NOT NULL,
  precio NUMERIC(10,2) NOT NULL,
  cod_estado_item_dp CHAR (10) NOT NULL,
  cod_dp CHAR (10) NOT NULL,
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

DROP TABLE IF EXISTS EVENTO_ACTUALIZA CASCADE;
CREATE TABLE EVENTO_ACTUALIZA (
  cod_evento_actualza SERIAL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  cod_item_dp CHAR (10) NOT NULL,
  cod_estado_item_dp CHAR (2) NOT NULL,
  PRIMARY KEY (cod_evento_actualza)
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



ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_im) REFERENCES IDENTIFICACION_MESERO (cod_im);

ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_mesa) REFERENCES MESA (cod_mesa);



ALTER TABLE DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_dp) REFERENCES ESTADO_DP (cod_estado_dp);


ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (Cod_prodFriday) REFERENCES Producto_Friday (Cod_prodFriday);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_dp) REFERENCES DETALLE_PEDIDO (cod_dp);

ALTER TABLE ITEM_DETALLE_PEDIDO ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);

ALTER TABLE KDS ADD FOREIGN KEY (cod_area_ec) REFERENCES AREA_EC (cod_area_ec);

ALTER TABLE KDS ADD FOREIGN KEY (cod_estado_kds) REFERENCES ESTADO_KDS (cod_estado_kds);

ALTER TABLE KDS ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE EVENTO_ACTUALIZA ADD FOREIGN KEY (cod_item_dp) REFERENCES ITEM_DETALLE_PEDIDO (cod_item_dp);

ALTER TABLE EVENTO_ACTUALIZA ADD FOREIGN KEY (cod_estado_item_dp) REFERENCES ESTADO_ITEM_DP (cod_estado_item_dp);
