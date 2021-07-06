/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 	  CAST(PaymentInfo.query('data(r/serviceName)') as nvarchar) as serviceName,
   CAST([ExtraParams].query('data(r/classification_code)') as nvarchar) as classification_code,

      [AgentPaymentID]

      ,[StatusDate]
      ,[Number]
      ,[PaySum]
      ,[ProviderSum]
      ,[CommissionSum]
      ,[ProviderComission]
      ,[AgentProfit]
      ,[ProviderProfit]
      ,[Status]
      ,[Code]
      ,[GateStatus]
      ,[IsTest]
      ,[TestMode]
      ,[GateCode]
      ,[GateCodeString]
      ,[GateErrorMessage]
      ,[GateTryCount]
      ,[PayFields]
      ,[ReservedID]
      ,[ExtraParams]
      ,[ProviderDateTimeZoneID]
      ,[OsmpProviderID]
  FROM [gate211].[dbo].[Paymentnew] where AgentID=1 and AgentPaymentID in  (
  
  426246646,
429803440,
423934062,
430067455,
436112362,
439080930,
439080662,
439080362,
428911265,
428692317,
420320151,
427933035,
424125065

  
  )
