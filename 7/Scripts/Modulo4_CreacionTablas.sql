DROP TABLE IF EXISTS Registra CASCADE;
DROP TABLE IF EXISTS Posee CASCADE;
DROP TABLE IF EXISTS Notificacion CASCADE;
DROP TABLE IF EXISTS Solicitud_o_descargo CASCADE;
DROP TABLE IF EXISTS Historial_laboral CASCADE;
DROP TABLE IF EXISTS Horario_libre_Dias CASCADE;
DROP TABLE IF EXISTS Horario_libre CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS ContratoCASCADE CASCADE;
DROP TABLE IF EXISTS Asistencia CASCADE;
DROP TABLE IF EXISTS Tipo_contrato CASCADE;
DROP TABLE IF EXISTS Cargo CASCADE;
DROP TABLE IF EXISTS Area CASCADE;
DROP TABLE IF EXISTS Local CASCADE;
DROP TABLE IF EXISTS Estado_usuario CASCADE;
DROP TABLE IF EXISTS Tipo_generación CASCADE;
DROP TABLE IF EXISTS Tipo_notificacion CASCADE;
DROP TABLE IF EXISTS Tipo_SD CASCADE;
DROP TABLE IF EXISTS Estado_SD CASCADE;
DROP TABLE IF EXISTS Estado_Asistencia CASCADE;
DROP TABLE IF EXISTS Habilidad CASCADE;
DROP TABLE IF EXISTS Turno CASCADE;

-- Crear las tablas
CREATE TABLE Turno
(
  Cod_turno CHAR(10) NOT NULL,
  Nombre_turno VARCHAR(50) NOT NULL,
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  PRIMARY KEY (Cod_turno)
);

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

CREATE TABLE Tipo_generación
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

CREATE TABLE Local
(
  Cod_local CHAR(10) NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

CREATE TABLE Area
(
  Cod_area CHAR(10) NOT NULL,
  Nombre_area VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_area)
);

CREATE TABLE Cargo
(
  Cod_cargo CHAR(10) NOT NULL,
  Nombre_cargo VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_cargo)
);

CREATE TABLE Tipo_contrato
(
  Cod_tipo_contrato CHAR(10) NOT NULL,
  Nombre_tipo_contrato VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_contrato)
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

CREATE TABLE Contrato
(
  Cod_contrato CHAR(10) NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  Cod_tipo_contrato CHAR(10) NOT NULL,
  PRIMARY KEY (Cod_contrato),
  FOREIGN KEY (Cod_tipo_contrato) REFERENCES Tipo_contrato(Cod_tipo_contrato)
);

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
  PRIMARY KEY (Codigo_empleado),
  FOREIGN KEY (Cod_turno) REFERENCES Turno(Cod_turno),
  FOREIGN KEY (Cod_contrato) REFERENCES Contrato(Cod_contrato),
  FOREIGN KEY (Cod_area) REFERENCES Area(Cod_area),
  FOREIGN KEY (Cod_cargo) REFERENCES Cargo(Cod_cargo),
  FOREIGN KEY (Cod_local) REFERENCES Local(Cod_local)
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
  FOREIGN KEY (Cod_tipo_generacion) REFERENCES Tipo_generación(Cod_tipo_generacion)
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

