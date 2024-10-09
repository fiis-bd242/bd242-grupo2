CREATE TABLE Empleado
(
  Codigo_empleado CHAR(10) NOT NULL,
  Cod_cargo CHAR(10) NOT NULL,
  Contacto INT NOT NULL,
  Fecha_Contratacion DATE NOT NULL,
  DNI INT NOT NULL,
  Primer_nombre VARCHAR(50) NOT NULL,
  Primer_apellido VARCHAR(50) NOT NULL,
  Segundo_Apellido VARCHAR(50) NOT NULL,
  Cod_turno CHAR(10) NOT NULL,
  Cod_contrato CHAR(10) NOT NULL,
  Cod_area CHAR(10) NOT NULL,
  Cod_cargo CHAR(10) NOT NULL,
  Cod_local CHAR(10) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  PRIMARY KEY (Codigo_empleado)
);

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

CREATE TABLE Producto_Fridays
(
  Cod_prodFriday CHAR(10) NOT NULL,
  Valoracion VARCHAR(50) NOT NULL,
  Nombre_producto VARCHAR(50) NOT NULL,
  Precio_producto FLOAT NOT NULL,
  cod_categoria CHAR(10) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Cod_RC CHAR(10),
  PRIMARY KEY (Cod_prodFriday),
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
