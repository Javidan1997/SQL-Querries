select  
CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trn_id,
CAST([ExtraParams].query('data(r/ailerrn)') as nvarchar) ailerrn,
AgentPaymentID,
p.ServiceID,
ServiceName,
ProviderName,
StatusDate,

Number,
PaySum,
CASE when Status=2 then 'success'  
else  'reject' end Status
 into Yanvar2020.dbo.Caspian 
from gate211.dbo.Payment p
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID

 where p.ServiceID in ( 

394,395 ,396) and

 StatusDate between '2020-01-01' and '2020-02-01' and ReceiveDate> '2018-12-01'
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
