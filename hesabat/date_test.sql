Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2019-04-01'
 set @DateTo = '2019-04-01'

------------
set @DateFrom = DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0);

set @DateTo =  DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0);


------------
set @DateFrom = DATEADD(mm, DATEDIFF(mm, 0, @DateFrom) - 1, 0);

set @DateTo =  DATEADD(month, DATEDIFF(month, 0, @DateTo), 0);



SELECT @DateFrom,@DateTo;

