select 
CAST([ExtraParams].query('data(r/zb_acc_number)') as nvarchar) zb_acc_number,

CAST([ExtraParams].query('data(r/identification)') as nvarchar) identification,

CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trm_prv_id,
Number,PaySum,Status,ServiceName,ProviderName,* from gate211.dbo.Payment p
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID

where StatusDate between '2020-12-01' and '2021-01-01' and 
pp.ProviderID=228
-- p.ServiceID in (981,982,983, 984,985,986) 
and    status=2 and  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
