Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2020-12-01'
 set @DateTo = '2021-01-01'
 


SELECT AgentPaymentid,
 CAST([ExtraParams].query('data(r/classification_code)') as nvarchar(MAX)),
CAST([PaymentInfo].query('data(r/id)') as nvarchar(MAX)) as id,pp.ProviderName, 
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as serviceName,
PaySum
,
CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent

FROM

[dbo].[Payment] p with (nolock) join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar(MAX)) not in ( '3','10','14')
) 
and Status=2
and p.ServiceID  in (254,255)
union all

SELECT AgentPaymentid,
 CAST([ExtraParams].query('data(r/classification_code)') as nvarchar(MAX)),
CAST([PaymentInfo].query('data(r/id)') as nvarchar(MAX)) as id,pp.ProviderName, 
CAST([PaymentInfo].query('data(r/serviceName)') as nvarchar(MAX)) as serviceName,
paysum,
CAST([ExtraParams].query('data(r/agt_id)') as nvarchar(MAX)) as Agent
FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
WHERE  (StatusDate BETWEEN @DateFrom and @DateTo and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar(MAX)) not in ( '3','10','14')
) 
and Status=2

and p.ServiceID in (257,258,259,260,261,262,263,264)
