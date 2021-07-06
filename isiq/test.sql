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
,CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) trm_prv_id
,[OsmpProviderID]
into sentyabr2020.[dbo].Azerisiqtest
FROM [gate211].[dbo].[Payment]
where (StatusDate between '2020-09-01' and '2020-10-01' )and ServiceID in (  990,998,991,999,277,  720,719, 720,276,  719)
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) = '3'
