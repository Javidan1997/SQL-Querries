GRANT SELECT TO reportuser;
GO

USE [master];
GO
ALTER DATABASE gate SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
EXEC sp_renamedb N'gate', N'gate211'


USE MASTER;

-- Add users
ALTER DATABASE gate211 SET MULTI_USER
GO
