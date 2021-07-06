select *
FROM [g1].[dbo].[Payment] with (nolock)
where AgentID=1
-- Status=1 and PayDate<'2019-05-30'
and AgentPaymentID in (
SELECT TOP 100 [PaymentID]
  FROM [M1].[dbo].[Payment]
  with (nolock)
where Status=1 and CreateTime<'2019-05-31') 
and Status = 2
