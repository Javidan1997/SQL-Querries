  DECLARE @TempPayment TABLE
(
	 UPGPaymentID nvarchar(200),
	status tinyint,
	PaySum decimal(18, 2),
	[RevokeValue] decimal(18, 2),
	[RevokeStatus] tinyint,
	ServiceName nvarchar(200),
	Number nvarchar(200),
	[RevokeStatusTime] DATETIME
);
INSERT INTO 
    @TempPayment
select p.PaymentID as UPGPaymentID, status, PaySum,[RevokeValue], [RevokeStatus], s.ServiceName,Number, [RevokeStatusTime] FROM [gate].[dbo].[Payment] p with (nolock)
Join
(
SELECT [PaymentID]
,[ServiceID]
,[RevokeStatus]
,[RevokeStatusTime]
,[RevokeValue]

FROM [Main].[dbo].[Payment] with (nolock)
WHERE ([RevokeStatusTime] between '2020-04-01' and '2020-04-30') and [RevokeStatus] in (4,5)

) m ON p.AgentPaymentID=m.PaymentID and p.AgentID=1
Join [gate].[dbo].[Service] s on s.ServiceID=p.ServiceID
Where
p.Status=2
order by RevokeStatusTime desc

select * from @TempPayment


DECLARE @MyCursor CURSOR;
DECLARE @MyField nvarchar(200);
BEGIN
    SET @MyCursor = CURSOR FOR
    SELECT 
		UPGPaymentID--,name2

	FROM   @TempPayment   

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
      /*
         YOUR ALGORITHM GOES HERE   
      */

	  PRINT @MyField

      FETCH NEXT FROM @MyCursor 
      INTO @MyField 

	  
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;
