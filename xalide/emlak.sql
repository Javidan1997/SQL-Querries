declare 
@DateFrom date
declare
@DateTo date

set @DateFrom='2020-06-01'

set @DateTo='2020-07-01'



SELECT 
CAST([PaymentInfo].query('data(r/id)') as nvarchar) as id,pp.ProviderName, 
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as ServiceName,
ServiceName,
CAST([PaymentInfo].query('data(r/yxo)') as nvarchar(MAX)) as YXO,
CAST([PaymentInfo].query('data(r/sba)') as nvarchar(MAX)) as SBA,AgentTerminalID,
CAST([PaymentInfo].query('data(r/transactionid)') as nvarchar) TransactionId,Number,
	PaySum,ProviderSum,CommissionSum, CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent,StatusDate---,*
FROM [dbo].[Paymentnew] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo  and p.ReceiveDate >'2018-12-01'

) 
and Status=2

and p.ServiceID in (257,258,259,260,261,262,263,264,254,255) and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <>3
