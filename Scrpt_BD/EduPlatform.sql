USE master
GO

CREATE DATABASE EDUPlatform
ON PRIMARY
(
--NOMBRE LOGICO
--UBICACION Y NOMBRE F�SICO
--TAMA�O
--TAMA�O M�XIMO
--CRECIMIENTO (AUTOM�TICO)

NAME =		'Bd_EduPlatform',
FILENAME =	'C:\BD\mdf\EduPlatform_Data.mdf',
SIZE =		25MB,
MAXSIZE =	200MB,
FILEGROWTH =100MB 
)
LOG ON
(
NAME =		'Bd_EduPlatform_Log',
FILENAME =	'C:\BD\Log\EduPlatform_Log.ldf',
SIZE =		50MB,
MAXSIZE =	200MB,
FILEGROWTH =25% 
)

use EDUPlatform
CREATE SCHEMA Adm;


--TABLA USUARIOS
use EDUPlatform
CREATE TABLE Adm.Usuarios(
ID_Carnet varchar(25) primary key not null,
Correo varchar(30),
Contraseña VARBINARY(256),/*Encriptacion PWDENCRYPT --> Utilizando el algoritmo AES256*/
Estado int,
Huella_Digital varbinary(max),/*para almacenar binario de las minucias obtenidas*/
Fecha_Creacion dateTime
)ON [PRIMARY]
/********** USUARIO **************************************************************************************************************/
/*Ejemplo de una Insersion  del Usuario*/
	Insert Adm.Usuarios values ('S119WQW','darwinrvargas@gmail.com',PWDENCRYPT('4219*DarwinAndreAndrea'),0,0,GETDATE())
/*Ejemplo de una extraccion de Usuario*/
	declare @usuario varchar(30) = 'S119WQW';
	declare @contrasena_input varchar(30) = '4219*DarwinAndreAndrea';
	declare @contrasena_in varbinary(256);
	declare @bandera int = 0;

	set @contrasena_in = (SELECT Contraseña FROM Adm.Usuarios where ID_Carnet = @usuario)

	IF PWDCOMPARE(@contrasena_input, @contrasena_in) = 1
	
	set @bandera = 1
		ELSE
		set @bandera = 0
	select @bandera
	print @bandera
/*********************************************************************************************************************************/





