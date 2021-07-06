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
into aprel2019.[dbo].isiqall
FROM [gate211].[dbo].[Payment]
where (PayDate between '2019-04-01' and '2019-05-01' )and ServiceID in ( 277,  720);
