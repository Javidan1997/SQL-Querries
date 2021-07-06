DECLARE @DateFrom DATETIME
DECLARE @DateTo DATETIME

SET @DateFrom='2019-05-29'

SET @DateTo='2019-06-30'

select * from (
SELECT PaymentID,
AgentPaymentID,Number,PayDate,
CAST(PaymentInfo.query('data(r/transactionid)') as nvarchar) txn_id,
CAST([PaymentInfo].query('data(r/id)') as nvarchar) as id,
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as serviceName,
PaySum,
[ProviderSum] - CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2)) as ProviderSum
 ,([CommissionSum] + CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2))) as Comission,
CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
,pp.ProviderName,PaymentInfo
FROM

[dbo].[Payment] p with (nolock) join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo
) 
and Status=2
and p.ServiceID  in (254,255) 
) a where serviceName like '%00%'
