DECLARE @MyCursor CURSOR;
DECLARE @MyField VARCHAR(100);
BEGIN
    SET @MyCursor = CURSOR FOR

	select PaymentID FROM [gate1].[dbo].[Payment] with (nolock) 
	Where
	AgentID=1 
	and AgentPaymentID in 
	(
	Select PaymentID FROM [main1].[dbo].[Payment] with (nolock)
	WHERE ([RevokeStatusTime] between '2019-05-29' and '2019-06-01') and [RevokeStatus] in (4,5)
	)
        --where StatusID = 7      

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
      /*
         YOUR ALGORITHM GOES HERE   
      */
	  print @MyField;

      FETCH NEXT FROM @MyCursor 
      INTO @MyField 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;
