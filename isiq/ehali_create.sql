SELECT 
CASE 
WHEN ServiceID in (719, 720) THEN ProviderPaymentIDString
ELSE AgentPaymentID END as trn_id, 
ProviderPaymentIDString, [PaymentID]
,[AgentPaymentID]
,[ServiceID]
,[GateServiceID]
,[PayDate]
,[StatusDate]
,[Number]
,[PaymentInfo]
,[AgentTerminalID]
,[PaySum]
,[Status]
,[GateErrorMessage]
,[ExtraParams]
,CAST(ExtraParams.query('data(r/isiq_counter)') as nvarchar) isiq_counter
,CAST(ExtraParams.query('data(r/isiq_subid)') as nvarchar) isiq_subid
,[OsmpProviderID]
into Sentyabr2019.[dbo].AzerisiqEhaliM
FROM [gate].[dbo].[Payment]
where (StatusDate between '2019-09-01' and '2019-10-01' ) and ServiceID in (276,  719)
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

