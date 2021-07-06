select 
 CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) agt_id,
 Number,
 AgentPaymentID,
 PaySum,


* from gate.dbo.Payment p with (nolock) 
left join gate.dbo.Service s on
s.ServiceID=p.ServiceID
left join gate.dbo.Provider  pp
on pp.ProviderID=s.ProviderID
where 
p.ServiceID in (1040 ,
1041 	,
1042) and
 (StatusDate between '2021-03-01' and '2021-04-01' ) and    status=2 
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
