select * into yanvar2021.dbo.AzerisiqQehali from (SELECT 
CASE 
WHEN ServiceID in (719, 720) THEN ProviderPaymentIDString
ELSE AgentPaymentID END as trn_id, 
      [ProviderPaymentIDString]
      ,[PaymentID]
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
--into Sentyabr2019.[dbo].AzerisiqEhaliM
FROM [gate211].[dbo].[Payment]
where (StatusDate between '2021-01-01' and '2021-02-01' ) and ServiceID in ( 277,  720)
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
union all

SELECT 

	  LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10)  trm_prv_id 
      ,[AgentPaymentID]
      ,[PaymentID]
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
FROM [gate211].[dbo].[Payment]
where (StatusDate between '2021-01-01' and '2021-02-01' )and ServiceID in (  990,991,998,999)
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3' and
len(CAST(ExtraParams.query('data(r/ai_subscriber_type)') as nvarchar))>7 ) a
