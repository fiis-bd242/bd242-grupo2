DROP TABLE IF EXISTS Registra CASCADE;
DROP TABLE IF EXISTS Posee CASCADE;
DROP TABLE IF EXISTS Notificacion CASCADE;
DROP TABLE IF EXISTS Solicitud_o_descargo CASCADE;
DROP TABLE IF EXISTS Historial_laboral CASCADE;
DROP TABLE IF EXISTS Horario_libre_Dias CASCADE;
DROP TABLE IF EXISTS Horario_libre CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Contrato CASCADE;
DROP TABLE IF EXISTS Asistencia CASCADE;
DROP TABLE IF EXISTS Tipo_contrato CASCADE;
DROP TABLE IF EXISTS Cargo CASCADE;
DROP TABLE IF EXISTS Area CASCADE;
DROP TABLE IF EXISTS Local CASCADE;
DROP TABLE IF EXISTS Estado_usuario CASCADE;
DROP TABLE IF EXISTS Tipo_generacion CASCADE;
DROP TABLE IF EXISTS Tipo_notificacion CASCADE;
DROP TABLE IF EXISTS Tipo_SD CASCADE;
DROP TABLE IF EXISTS Estado_SD CASCADE;
DROP TABLE IF EXISTS Estado_Asistencia CASCADE;
DROP TABLE IF EXISTS Habilidad CASCADE;
DROP TABLE IF EXISTS Turno CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
-- Crear las tablas
CREATE TABLE Turno
(
  Cod_turno SERIAL NOT NULL,
  Nombre_turno VARCHAR(50) NOT NULL,
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  PRIMARY KEY (Cod_turno)
);

CREATE TABLE Habilidad
(
  Nombre_habilidad VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(300) NOT NULL,
  Cod_habilidad SERIAL NOT NULL,
  PRIMARY KEY (Cod_habilidad)
);

CREATE TABLE Estado_Asistencia
(
  Cod_estado SERIAL NOT NULL,
  Nombre_Estado VARCHAR(100) NOT NULL,
  Descripcion_estado varchar(300) NOT NULL,
  PRIMARY KEY (Cod_estado)
);

CREATE TABLE Estado_SD
(
  Cod_estado_SD SERIAL NOT NULL,
  Nombre_estado_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_SD)
);

CREATE TABLE Tipo_SD
(
  Cod_tipo_sd SERIAL NOT NULL,
  Nombre_tipo_sd VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_sd)
);


CREATE TABLE Tipo_generacion
(
  Cod_tipo_generacion SERIAL NOT NULL,
  Nombre_tipo_generacion VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_tipo_generacion)
);

CREATE TABLE Tipo_notificacion
(
  Cod_tipo_notificacion SERIAL NOT NULL,
  Nombre_tipo_notificacion VARCHAR(100) NOT NULL,
  Cod_tipo_generacion INT NOT NULL,
  PRIMARY KEY (Cod_tipo_notificacion),
  FOREIGN KEY(Cod_tipo_generacion) REFERENCES Tipo_generacion(Cod_tipo_generacion)
);

CREATE TABLE Estado_usuario
(
  Cod_estado_usuario SERIAL NOT NULL,
  Nombre_estado_usuario VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_estado_usuario)
);

CREATE TABLE Local
(
  Cod_local SERIAL NOT NULL,
  Ubicacion_local VARCHAR(100) NOT NULL,
  Nombre_local VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_local)
);

CREATE TABLE Cargo
(
  Cod_cargo SERIAL NOT NULL,
  Nombre_cargo VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cod_cargo)
);

CREATE TABLE Area
(
  Cod_area SERIAL NOT NULL,
  Nombre_area VARCHAR(50) NOT NULL,
  Cod_cargo INT NOT NULL,
  PRIMARY KEY (Cod_area),
  FOREIGN KEY(Cod_cargo) REFERENCES Cargo(Cod_cargo)
);

CREATE TABLE Tipo_contrato
(
  Cod_tipo_contrato SERIAL NOT NULL,
  Nombre_tipo_contrato VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_tipo_contrato)
);

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

CREATE TABLE Contrato
(
  Cod_contrato SERIAL NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  Cod_tipo_contrato INT NOT NULL,
  PRIMARY KEY (Cod_contrato),
  FOREIGN KEY (Cod_tipo_contrato) REFERENCES Tipo_contrato(Cod_tipo_contrato)
);

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

CREATE TABLE Horario_libre
(
  Hora_inicio TIME NOT NULL,
  Hora_fin TIME NOT NULL,
  Cod_horario SERIAL NOT NULL,
  Codigo_empleado INT NOT NULL,
  PRIMARY KEY (Cod_horario),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado)
);

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

CREATE TABLE Posee
(
  Codigo_empleado INT NOT NULL,
  Cod_habilidad INT NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_habilidad),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_habilidad) REFERENCES Habilidad(Cod_habilidad)
);

CREATE TABLE Registra
(
  Codigo_empleado INT NOT NULL,
  Cod_asistencia INT NOT NULL,
  PRIMARY KEY (Codigo_empleado, Cod_asistencia),
  FOREIGN KEY (Codigo_empleado) REFERENCES Empleado(Codigo_empleado),
  FOREIGN KEY (Cod_asistencia) REFERENCES Asistencia(Cod_asistencia)
);

CREATE TABLE Horario_libre_Dias
(
  Dias VARCHAR(20) NOT NULL,
  Cod_horario SERIAL NOT NULL,
  PRIMARY KEY (Dias, Cod_horario),
  FOREIGN KEY (Cod_horario) REFERENCES Horario_libre(Cod_horario)
);

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


