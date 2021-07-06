USE [gate211]
GO

/****** Object:  StoredProcedure [dbo].[delete_shrink_service]    Script Date: 6/1/2019 9:38:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

----drop procedure dbo.delete_shrink_service;

CREATE  PROCEDURE [dbo].[delete_shrink_service] ( @tomon INT, @toyear INT)

AS BEGIN


DECLARE @DateFrom date, @DateTo date 

DECLARE @mon INT, @YEAR INT


SET @mon = 1
SET @YEAR = 2017



WHILE (@YEAR <=@toyear-1)
BEGIN
PRINT @YEAR

SET @mon = 1

WHILE (@mon <=12)
BEGIN

Set @DateFrom = datefromparts(@YEAR, @mon, 1)
	


Set @DateTo = case
	when @mon=12 then
		datefromparts(@YEAR+1, 1, 1)
	else 
		datefromparts(@YEAR, @mon+1, 1)
	end;


delete from gate211.dbo.Payment where ReceiveDate Between @DateFrom and @DateTo;




PRINT 'DateFrom'
print @DateFrom



PRINT 'DateTo'
print @DateTo



ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate211_log, 1)
ALTER DATABASE gate211
SET RECOVERY FULL


PRINT 'mon'

PRINT @mon
SET @mon = @mon + 1



END
SET @YEAR = @YEAR + 1
END




-------------------------



PRINT @YEAR

SET @mon = 1

WHILE (@mon <=@tomon)
BEGIN

Set @DateFrom = datefromparts(@YEAR, @mon, 1)
	


Set @DateTo = case
	when @mon=12 then
		datefromparts(@YEAR+1, 1, 1)
	else 
		datefromparts(@YEAR, @mon+1, 1)
	end;


delete from gate211.dbo.Payment where ReceiveDate Between @DateFrom and @DateTo;




PRINT 'DateFrom'
print @DateFrom



PRINT 'DateTo'
print @DateTo



ALTER DATABASE gate211
SET RECOVERY SIMPLE
DBCC SHRINKFILE (gate211_log, 1)
ALTER DATABASE gate211
SET RECOVERY FULL


PRINT 'mon'

PRINT @mon
SET @mon = @mon + 1


END




END

GO


