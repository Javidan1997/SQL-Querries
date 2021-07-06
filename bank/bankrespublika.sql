select 
CAST([ExtraParams].query('data(r/bankRespub_account)') as nvarchar) bankRespub_account,

CAST([ExtraParams].query('data(r/bankRespub_bank_id)') as nvarchar) bankRespub_bank_id,

CAST([ExtraParams].query('data(r/bankRespub_loan_id)') as nvarchar) bankRespub_loan_id,

CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trm_prv_id,

Number ,StatusDate,AgentPaymentID,PaySum,
* from gate211.dbo.Payment where 



select  
CAST(ExtraParams.query('data(r/bank_id)') as varchar(max)) bank_id,
CAST(ExtraParams.query('data(r/bankRespub_account)') as varchar(max)) bankRespub_account,
CAST(ExtraParams.query('data(r/rrn)') as varchar(max)) rrn,
AgentPaymentID,Number,PaySum,StatusDate,ServiceName,pp.ProviderName
 FROM gate211.dbo.Payment p with(nolock) join gate211.dbo.Service s on p.ServiceID=s.ServiceID join gate211.dbo.Provider pp on pp.ProviderID=s.ProviderID
  where p.ServiceID in (126,127,439,776) and StatusDate between '2020-11-01' and '2020-12-01' and status=2
