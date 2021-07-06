select 
 CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) agt_id,
 Number,
 AgentPaymentID,
 PaySum,


* from gate211.dbo.Payment p
left join gate211.dbo.Service s on
s.ServiceID=p.ServiceID
left join gate211.dbo.Provider pp
on pp.ProviderID=s.ProviderID
where 

 (StatusDate between '2020-12-01' and '2021-01-01' ) and pp.ProviderID =101 and status=2 
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
