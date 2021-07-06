	DECLARE @today_date DATE
	DECLARE @yesday_date DATE
	DECLARE @month_start DATE
	SET @today_date = GETDATE();
	SET @yesday_date = DATEADD(day, -1, GETDATE());
	SET @month_start = DATEADD(month, DATEDIFF(month, 0, @today_date), 0);
begin
	 

	print @today_date;

	DECLARE @MyCursor CURSOR;
	DECLARE @MyField varchar(50);
BEGIN
    SET @MyCursor = CURSOR FOR
	select p.PaymentID as UPGPaymentID
	FROM [gate].[dbo].[Payment] p with (nolock)
	Join
	(
	SELECT [PaymentID]


	FROM [Main].[dbo].[Payment] with (nolock)
	WHERE ([RevokeStatusTime] between @month_start  and @today_date) and [RevokeStatus] in (4,5)

	) m ON p.AgentPaymentID=m.PaymentID and p.AgentID=1
	Join [gate].[dbo].[Service] s on s.ServiceID=p.ServiceID
	Where
	p.Status=2
	

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
      /*
         YOUR ALGORITHM START HERE   
      */

	  PRINT @MyField
	  EXECUTE gate.[dbo].[CSModifyPayment] @CSUserID=1037,@CSRoleID=1,@Status=3,@Code=200,@GateStatus=100,@PaymentID=@MyField

	  ---algorith ends here

      FETCH NEXT FROM @MyCursor 
      INTO @MyField 

	  
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;



end
