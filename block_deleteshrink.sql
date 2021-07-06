DECLARE @mon INT
DECLARE @YEAR INT

DECLARE @tomon INT
DECLARE @toyear INT

SET @mon = 1
SET @YEAR = 2017

SET @tomon = 12
SET @toyear = 2017


WHILE (@YEAR <=@toyear-1)
BEGIN
PRINT @YEAR

SET @mon = 1
WHILE (@mon <=12)
BEGIN

--select top 10 * from TURALTEST.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @YEAR;
delete from gate.dbo.Payment where Month(RDate) = @mon and YEAR(RDate) = @YEAR;

ALTER DATABASE gate
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate_log, 10)
ALTER DATABASE gate
SET RECOVERY FULL


PRINT @mon
SET @mon = @mon + 1

--select datefromparts(@YEAR, @mon, 1),datefromparts(@YEAR, @mon+1, 1)
END
SET @YEAR = @YEAR + 1
END


SET @mon = 1
WHILE (@mon <=@tomon)
BEGIN

--select top 10 * from TURALTEST.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @YEAR;
delete from gate.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @toyear;

ALTER DATABASE gate
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate_log, 10)
ALTER DATABASE gate
SET RECOVERY FULL


PRINT @mon
SET @mon = @mon + 1

--select datefromparts(@YEAR, @mon, 1),datefromparts(@YEAR, @mon+1, 1)
END


GO
