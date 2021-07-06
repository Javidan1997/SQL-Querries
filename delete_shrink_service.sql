dbo.delete_shrink_service
@tomon =1, @toyear=2018
;


dbo.delete_shrink_service  @tomon = 9

,@toyear= 2018;


drop PROCEDURE dbo.delete_shrink_service;

CREATE PROCEDURE dbo.delete_shrink_service ( @tomon INT, @toyear INT)

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

Set @DateFrom = case 
	when @mon >=10 then
	 --'' + @YEAR + '-0' + @mon + '-' + '01'
	 datefromparts(@YEAR, @mon, 1)
	else

	-- '' + @YEAR + '-' + @mon + '-' + '01'
	datefromparts(@YEAR, @mon, 1)
	end;


Set @DateTo = case
	when @mon+1 >=10 and @mon<12 then
	--'' + @YEAR + '-' + @mon + '-' + '01'
	datefromparts(@YEAR, @mon+1, 1)
	when @mon=12 then

	--'' + @YEAR+1 + '-01' +  '-' + '01'
	datefromparts(@YEAR+1, 1, 1)

	else 

    --'' + @YEAR + '-0' + @mon+1 + '-' + '01'
	datefromparts(@YEAR, @mon+1, 1)
	end;



select top 10 * from TURALTEST.dbo.Payment where ReceiveDate Between @DateFrom and @DateTo;


PRINT 'DateFrom'
print @DateFrom



PRINT 'DateTo'
print @DateTo



PRINT 'mon'

PRINT @mon
SET @mon = @mon + 1







END
SET @YEAR = @YEAR + 1
END



END
