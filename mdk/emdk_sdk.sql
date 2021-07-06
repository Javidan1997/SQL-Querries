Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2020-08-01'
 set @DateTo = '2020-09-01'
 
 SELECT id,serviceName,SUM(PaySum) as Amount,SUM(ProviderSum) as ProviderAmount,SUM(Comission) as ComissionAmount, Count(*) as Count,Agent,ProviderName FROM
(SELECT 
CAST([PaymentInfo].query('data(r/id)') as nvarchar) as id,
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as serviceName,
PaySum,
[ProviderSum] - CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2)) as ProviderSum
 ,([CommissionSum] + CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2))) as Comission,
CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
,pp.ProviderName
FROM

[dbo].[Payment] p with (nolock) join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar)  in ( '10','14')
) 
and Status=2
and p.ServiceID  in (254,255)
)t GROUP BY id,serviceName,Agent,ProviderName
--HAVING Agent>3

union all

select -- XH digər xidmətlər
id, 
serviceName as ServiceName,SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount,SUM(CommissionSum) CommissionAmount,
count(*) Count, Agent,t.ProviderName FROM
( SELECT 
CAST([PaymentInfo].query('data(r/id)') as nvarchar) as id,pp.ProviderName, 
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as serviceName,

	PaySum,ProviderSum,CommissionSum, CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar)  in ( '10','14')
) 
and Status=2

and p.ServiceID in (257,258,259,260,261,262,263,264)
) t GROUP BY id , ServiceName,  Agent,t.ProviderName
--HAVING Agent<>3
