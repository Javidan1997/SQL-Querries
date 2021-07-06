USE [gate211]
GO

/****** Object:  StoredProcedure [dbo].[delete_shrink_no_gas]    Script Date: 6/1/2019 9:38:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delete_shrink_no_gas] ( @tomon INT, @toyear INT)

AS BEGIN


DECLARE @mon INT
DECLARE @YEAR INT



SET @mon = 1
SET @YEAR = 2017



WHILE (@YEAR <=@toyear-1)
BEGIN
PRINT @YEAR

SET @mon = 1
WHILE (@mon <=12)
BEGIN

--select top 10 * from TURALTEST.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @YEAR;
delete from gate211.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @YEAR and ServiceID not in (175,176,177,275,604,388,575);

ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate211_log, 10)
ALTER DATABASE gate211
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
delete from gate211.dbo.Payment where Month(ReceiveDate) = @mon and YEAR(ReceiveDate) = @toyear and ServiceID not in (175,176,177,275,604,388,575);

ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate211_log, 10)
ALTER DATABASE gate211
SET RECOVERY FULL


PRINT @mon
SET @mon = @mon + 1

--select datefromparts(@YEAR, @mon, 1),datefromparts(@YEAR, @mon+1, 1)
END



END


GO


