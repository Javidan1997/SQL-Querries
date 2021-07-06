select *
FROM [gate].[dbo].[Payment] with (nolock)
where AgentID=1
-- Status=1 and PayDate<'2019-05-30'
and AgentPaymentID in (
SELECT TOP 100 [PaymentID]
FROM [Main].[dbo].[Payment]
with (nolock)
where Status=1 and CreateTime<DATEADD(HOUR,-3,@MyDate)) and Status = 2



select *
FROM [gate].[dbo].[Payment] with (nolock)
where AgentID=1
-- Status=1 and PayDate<'2019-05-30'
and AgentPaymentID in (
SELECT TOP 100 [PaymentID]
FROM [Main].[dbo].[Payment]
with (nolock)
where Status=1 and CreateTime<DATEADD(HOUR,-3,@MyDate)) and Status = 3
