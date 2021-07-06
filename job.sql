DECLARE @MyCursor CURSOR;
DECLARE @MyField VARCHAR(100);
BEGIN
    SET @MyCursor = CURSOR FOR
	Select gate.paymentid FROM [dbo].[Payment] portal 
LEFT JOIN [gate211].[dbo].[Payment] gate
ON gate.agentpaymentId = portal.paymentId
WHERE (portal.[RevokeStatusTime] between '2019-05-29' and '2019-06-01') and portal.[RevokeStatus] in (4,5)
    --select  AgentPaymentID from Aprel2019.dbo.Azerfon
        --where StatusID = 7      

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
      /*
         YOUR ALGORITHM GOES HERE   
      */
	  PRINT @MyField;

      FETCH NEXT FROM @MyCursor 
      INTO @MyField 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;
