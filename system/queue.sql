DECLARE @MyDate datetime
DECLARE @NewDate datetime

SET @MyDate = GETDATE()
SET @NewDate = DATEADD(HOUR,-3,@MyDate);

PRINT @MyDate
PRINT @NewDate 


select *
FROM [gate].[dbo].[Payment] with (nolock)
where AgentID=1
-- Status=1 and PayDate<'2019-05-30'
and AgentPaymentID in (
SELECT TOP 100 [PaymentID]
FROM [Main].[dbo].[Payment]
with (nolock)
where Status=1 and CreateTime<@NewDate) and Status = 2



select *
FROM [gate].[dbo].[Payment] with (nolock)
where AgentID=1
-- Status=1 and PayDate<'2019-05-30'
and AgentPaymentID in (
SELECT TOP 100 [PaymentID]
FROM [Main].[dbo].[Payment]
with (nolock)
where Status=1 and CreateTime<@NewDate) and Status = 3
