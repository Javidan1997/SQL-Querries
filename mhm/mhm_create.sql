select 
 CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) agt_id,
 Number,
 AgentPaymentID,
 PaySum,
 CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar(MAX)) as trm_prv_id,

* from gate211.dbo.Payment p
left join gate211.dbo.Service s on
s.ServiceID=p.ServiceID
left join gate211.dbo.Provider pp
on pp.ProviderID=s.ProviderID
where 

 (StatusDate between '2021-01-01' and '2021-02-01' ) and pp.ProviderID =87 and status=2 
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
