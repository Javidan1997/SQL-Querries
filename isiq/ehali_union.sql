select * into [noyabr2020].[dbo].azerqehalim from (

SELECT [trn_id]
      ,[ProviderPaymentIDString]
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
      ,[isiq_counter]
      ,[isiq_subid]
      ,[OsmpProviderID]
  FROM [noyabr2020].[dbo].[AzerisiqEhaliM]

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
      ,[isiq_counter]
      ,[isiq_subid]
      ,[OsmpProviderID]--CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar)  trm_prv_id
  FROM [noyabr2020].[dbo].[Azerisiq] where len([ai_subscriber_type])<7 ) e
