SELECT 

 CAST(ExtraParams.query('data(r/ai_subscriber_type)') as nvarchar) ai_subscriber_type
	   ,CAST(ExtraParams.query('data(r/abon_type)') as nvarchar) abon_type,
 AgentPaymentID  trn_id, 
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
into Avqust2020.[dbo].Azerisiq
FROM [gate211].[dbo].[Payment]
where (StatusDate between '2020-08-01' and '2020-09-01' )and ServiceID in (  990,991)
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
