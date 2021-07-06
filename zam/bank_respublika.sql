select  
CAST(ExtraParams.query('data(r/bank_id)') as varchar) bank_id,
CAST(ExtraParams.query('data(r/bankRespub_account)') as varchar) bankRespub_account,
CAST(ExtraParams.query('data(r/rrn)') as varchar) rrn,
AgentPaymentID,Number,PaySum,StatusDate,ServiceName,pp.ProviderName
 FROM gate211.dbo.Payment p with(nolock) join gate211.dbo.Service s on p.ServiceID=s.ServiceID join gate211.dbo.Provider pp on pp.ProviderID=s.ProviderID
  where p.ServiceID in (126,127,439,776) and StatusDate between '2020-05-01' and '2020-06-01' and status=2
  
