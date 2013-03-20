USE CARPOOL
;

--  Drop Foreign Key Constraints 
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Calificacion_Evaluado') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE CALIFICACION DROP CONSTRAINT FK_Calificacion_Evaluado
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Calificacion_Evaluador') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE CALIFICACION DROP CONSTRAINT FK_Calificacion_Evaluador
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Calificacion_Viaje') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE CALIFICACION DROP CONSTRAINT FK_Calificacion_Viaje
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Ciudad_Departamento') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE CIUDAD DROP CONSTRAINT FK_Ciudad_Departamento
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Departamento_Pais') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE DEPARTAMENTO DROP CONSTRAINT FK_Departamento_Pais
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Parada_Trayecto') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PARADA DROP CONSTRAINT FK_Parada_Trayecto
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Pregunta_Usuario') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PREGUNTA DROP CONSTRAINT FK_Pregunta_Usuario
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Pregunta_Viaje') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE PREGUNTA DROP CONSTRAINT FK_Pregunta_Viaje
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Solicitud_Trayecto') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE SOLICITUD DROP CONSTRAINT FK_Solicitud_Trayecto
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Solicitud_Usuario') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE SOLICITUD DROP CONSTRAINT FK_Solicitud_Usuario
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Trayecto_Viaje') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE TRAYECTO DROP CONSTRAINT FK_Trayecto_Viaje
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Usuario_Ciudad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE USUARIO DROP CONSTRAINT FK_Usuario_Ciudad
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Usuario_Ocupacion') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE USUARIO DROP CONSTRAINT FK_Usuario_Ocupacion
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('FK_Viaje_Usuario') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE VIAJE DROP CONSTRAINT FK_Viaje_Usuario
;


--  Drop Tables, Stored Procedures and Views 

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('CALIFICACION') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE CALIFICACION
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('CIUDAD') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE CIUDAD
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('DEPARTAMENTO') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE DEPARTAMENTO
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('OCUPACION') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE OCUPACION
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PAIS') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PAIS
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PARADA') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PARADA
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('PREGUNTA') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE PREGUNTA
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('SOLICITUD') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE SOLICITUD
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('TRAYECTO') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE TRAYECTO
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('USUARIO') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE USUARIO
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('VIAJE') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE VIAJE
;


--  Create Tables 
CREATE TABLE CALIFICACION ( 
	IdCalificacion bigint identity(1,1)  NOT NULL,
	Puntaje decimal(3,2) NOT NULL,
	IdViaje bigint NOT NULL,
	IdEvaluador varchar(20) NOT NULL,
	IdEvaluado varchar(20) NOT NULL,
	FechaRealizacion datetime NULL,
	Comentario varchar(250) NULL
)
;

CREATE TABLE CIUDAD ( 
	IdCiudad int NOT NULL,
	NombreCiudad varchar(30) NOT NULL,
	IdDepartamento int NULL
)
;

CREATE TABLE DEPARTAMENTO ( 
	IdDepartamento int NOT NULL,
	NombreDepartamento varchar(30) NOT NULL,
	IdPais int NOT NULL
)
;

CREATE TABLE OCUPACION ( 
	IdOcupacion int identity(1,1)  NOT NULL,
	NombreOcupacion varchar(50) NOT NULL
)
;

CREATE TABLE PAIS ( 
	IdPais int NOT NULL,
	NombrePais varchar(30) NOT NULL
)
;

CREATE TABLE PARADA ( 
	IdParada bigint identity(1,1)  NOT NULL,
	IdTrayecto bigint NOT NULL,
	Latitud decimal(10,6) NOT NULL,
	Lontitud decimal(10,6) NOT NULL,
	Direccion varchar(100) NOT NULL,
	NumeroParada int NOT NULL,
	TipoParada char(1) NOT NULL    --  Tipo parada: Origen o Destino 
)
;

CREATE TABLE PREGUNTA ( 
	IdPregunta bigint identity(1,1)  NOT NULL,
	IdViaje bigint NOT NULL,
	IdCreadorPregunta varchar(20) NOT NULL,
	TextoPregunta varchar(500) NOT NULL,
	TextoRespuesta varchar(500) NULL
)
;

CREATE TABLE SOLICITUD ( 
	IdSolicitud bigint identity(1,1)  NOT NULL,
	IdTrayecto bigint NOT NULL,
	IdPasajero varchar(20) NOT NULL,
	CuposSolicitados int NOT NULL,
	Comentario varchar(250) NULL,
	Estado int NOT NULL,    --  Estados: Pendiente por responder Aprobada  
)
;

CREATE TABLE TRAYECTO ( 
	IdTrayecto bigint identity(1,1)  NOT NULL,
	IdViaje bigint NOT NULL,
	Cupos int NOT NULL,
	TrayectoSimple bit NOT NULL
)
;

CREATE TABLE USUARIO ( 
	IdUsuario varchar(20) NOT NULL,
	Contrasenia varchar(50) NOT NULL,
	Nombre varchar(30) NOT NULL,
	Apellido varchar(30) NOT NULL,
	Email varchar(50) NOT NULL,
	FechaNacimiento date NOT NULL,
	FechaUltimoIngreso datetime NOT NULL,
	Genero char(1) NOT NULL,
	IdCiudadResidencia int NOT NULL,
	IdOcupacion int NOT NULL,
	TelefonoMovil varchar(15) NULL,
	TelefonoFijo varchar(15) NULL,
	VehiculoPropio bit NOT NULL,
	Fumador bit NOT NULL,
	Foto image NULL,
	InformacionAdicional varchar(800) NULL,
	Reputacion decimal(4,2) NULL
)
;

CREATE TABLE VIAJE ( 
	IdViaje bigint identity(1,1)  NOT NULL,
	FechaCreacion datetime NOT NULL,
	FechaHoraPartida datetime NOT NULL,
	IdConductor varchar(20) NULL,
	AporteEconomico decimal(8,2) NOT NULL,
	InformacionAdicional varchar(800) NULL,
	Estado int NOT NULL,    --  Los estados posibles: Publicado, Cancelado Realizado... Documentarlos 
)
;


--  Create Primary Key Constraints 
ALTER TABLE CALIFICACION ADD CONSTRAINT PK_Calificacion 
	PRIMARY KEY CLUSTERED (IdCalificacion)
;

ALTER TABLE CIUDAD ADD CONSTRAINT PK_Ciudad 
	PRIMARY KEY CLUSTERED (IdCiudad)
;

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT PK_Departamento 
	PRIMARY KEY CLUSTERED (IdDepartamento)
;

ALTER TABLE OCUPACION ADD CONSTRAINT PK_Ocupacion 
	PRIMARY KEY CLUSTERED (IdOcupacion)
;

ALTER TABLE PAIS ADD CONSTRAINT PK_Pais 
	PRIMARY KEY CLUSTERED (IdPais)
;

ALTER TABLE PARADA ADD CONSTRAINT PK_Parada 
	PRIMARY KEY CLUSTERED (IdParada)
;

ALTER TABLE PREGUNTA ADD CONSTRAINT PK_Pregunta 
	PRIMARY KEY CLUSTERED (IdPregunta)
;

ALTER TABLE SOLICITUD ADD CONSTRAINT PK_Solicitud 
	PRIMARY KEY CLUSTERED (IdSolicitud)
;

ALTER TABLE TRAYECTO ADD CONSTRAINT PK_Trayecto 
	PRIMARY KEY CLUSTERED (IdTrayecto)
;

ALTER TABLE USUARIO ADD CONSTRAINT PK_Usuario 
	PRIMARY KEY CLUSTERED (IdUsuario)
;

ALTER TABLE VIAJE ADD CONSTRAINT PK_Viaje 
	PRIMARY KEY CLUSTERED (IdViaje)
;


--  Create Indexes 
ALTER TABLE USUARIO
	ADD CONSTRAINT UQ_Usuario_Email UNIQUE (Email)
;


--  Create Foreign Key Constraints 
ALTER TABLE CALIFICACION ADD CONSTRAINT FK_Calificacion_Evaluado 
	FOREIGN KEY (IdEvaluado) REFERENCES USUARIO (IdUsuario)
;

ALTER TABLE CALIFICACION ADD CONSTRAINT FK_Calificacion_Evaluador 
	FOREIGN KEY (IdEvaluador) REFERENCES USUARIO (IdUsuario)
;

ALTER TABLE CALIFICACION ADD CONSTRAINT FK_Calificacion_Viaje 
	FOREIGN KEY (IdViaje) REFERENCES VIAJE (IdViaje)
;

ALTER TABLE CIUDAD ADD CONSTRAINT FK_Ciudad_Departamento 
	FOREIGN KEY (IdDepartamento) REFERENCES DEPARTAMENTO (IdDepartamento)
;

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_Departamento_Pais 
	FOREIGN KEY (IdPais) REFERENCES PAIS (IdPais)
;

ALTER TABLE PARADA ADD CONSTRAINT FK_Parada_Trayecto 
	FOREIGN KEY (IdTrayecto) REFERENCES TRAYECTO (IdTrayecto)
;

ALTER TABLE PREGUNTA ADD CONSTRAINT FK_Pregunta_Usuario 
	FOREIGN KEY (IdCreadorPregunta) REFERENCES USUARIO (IdUsuario)
;

ALTER TABLE PREGUNTA ADD CONSTRAINT FK_Pregunta_Viaje 
	FOREIGN KEY (IdViaje) REFERENCES VIAJE (IdViaje)
;

ALTER TABLE SOLICITUD ADD CONSTRAINT FK_Solicitud_Trayecto 
	FOREIGN KEY (IdTrayecto) REFERENCES TRAYECTO (IdTrayecto)
;

ALTER TABLE SOLICITUD ADD CONSTRAINT FK_Solicitud_Usuario 
	FOREIGN KEY (IdPasajero) REFERENCES USUARIO (IdUsuario)
;

ALTER TABLE TRAYECTO ADD CONSTRAINT FK_Trayecto_Viaje 
	FOREIGN KEY (IdViaje) REFERENCES VIAJE (IdViaje)
;

ALTER TABLE USUARIO ADD CONSTRAINT FK_Usuario_Ciudad 
	FOREIGN KEY (IdCiudadResidencia) REFERENCES CIUDAD (IdCiudad)
;

ALTER TABLE USUARIO ADD CONSTRAINT FK_Usuario_Ocupacion 
	FOREIGN KEY (IdOcupacion) REFERENCES OCUPACION (IdOcupacion)
;

ALTER TABLE VIAJE ADD CONSTRAINT FK_Viaje_Usuario 
	FOREIGN KEY (IdConductor) REFERENCES USUARIO (IdUsuario)
;