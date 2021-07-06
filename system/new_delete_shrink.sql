--drop procedure delete_shrink

CREATE PROCEDURE dbo.delete_shrink ( @tomon INT, @toyear INT)

AS BEGIN

DECLARE @mon INT
DECLARE @YEAR INT


SET @mon = 1
SET @YEAR = 2016



WHILE (@YEAR <=@toyear-1)
BEGIN
PRINT @YEAR

SET @mon = 1
WHILE (@mon <=12)
BEGIN


BEGIN TRANSACTION;
delete from gate211.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @YEAR;
COMMIT TRANSACTION;
CHECKPOINT;

ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate_log, 100);
ALTER DATABASE gate211
SET RECOVERY FULL


alter database gate211 set recovery simple

dbcc shrinkfile('gate_log',100)

alter database gate211 set recovery FULL


PRINT @mon
SET @mon = @mon + 1

--select datefromparts(@YEAR, @mon, 1),datefromparts(@YEAR, @mon+1, 1)
END
SET @YEAR = @YEAR + 1
END


SET @mon = 1
WHILE (@mon <=@tomon)
BEGIN

BEGIN TRANSACTION;

delete from gate211.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @toyear;

COMMIT TRANSACTION;
CHECKPOINT;



alter database gate211 set recovery simple

dbcc shrinkfile('gate_log',100)

alter database gate211 set recovery FULL



ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate_log, 100)

ALTER DATABASE gate211
SET RECOVERY FULL


PRINT @mon
SET @mon = @mon + 1

--select datefromparts(@YEAR, @mon, 1),datefromparts(@YEAR, @mon+1, 1)
END

END
