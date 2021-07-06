USE gate211;
CREATE USER reportuser FOR LOGIN reportuser;


GRANT SELECT TO reportuser;
GO





*********************************************

CREATE LOGIN USER1
WITH PASSWORD = 'password';
GO

CREATE DATABASE my_database;
ALTER AUTHORIZATION ON DATABASE ::my_database TO USER1;

CREATE LOGIN USER2
WITH PASSWORD = 'password';
GO
USE my_database;
GO
CREATE USER USER2 FOR LOGIN USER2;
GO

