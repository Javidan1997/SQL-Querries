SET IDENTITY_INSERT [gate211].[dbo].[Paymentyeni] ON

INSERT into [gate211].[dbo].[Paymentyeni] ([PaymentID]
      ,[OuterPaymentID]
      ,[AgentID]
      ,[AgentPaymentID]
      ,[ProviderPaymentID]
      ,[ProviderPaymentIDString]
      ,[ServiceID]
      ,[GateServiceID]
      ,[PayDate]
      ,[AgentDate]
      ,[ReceiveDate]
      ,[WaitToDate]
      ,[ProviderDate]
      ,[StatusDate]
      ,[RegistryDate]
      ,[Number]
      ,[GateNumber]
      ,[PaymentInfo]
      ,[AgentTerminalID]
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
      ,[GateNextTryDate]
      ,[RegistryMessageID]
      ,[ExtraAccount]
      ,[ARDate]
      ,[ARProviderDate]
      ,[ARStatus]
      ,[ARStatusDate]
      ,[ARReceiveDate]
      ,[ARQueryID]
      ,[ARComment]
      ,[ARGateCode]
      ,[ARPaymentInfo]
      ,[AgentReceipteDate]
      ,[AgentReceipteNumber]
      ,[PrePaymentInfo]
      ,[PayFields]
      ,[FiscalMode]
      ,[Pay_ID]
      ,[ARGateCodeString]
      ,[RevokeID]
      ,[AROsmpCode]
      ,[ARAgentDate]
      ,[ARAgentCancelDate]
      ,[ReservedID]
      ,[ExtraParams]
      ,[ProviderDateTimeZoneID]
      ,[OsmpProviderID]
      ,[OsmpServiceID]
      ,[ExactlyOnLinePay]
      ,[RawWrappedAnswer]
      ,[WaitingAsyncAnswer])
SELECT --top 100 

[PaymentID]
      ,[OuterPaymentID]
      ,[AgentID]
      ,[AgentPaymentID]
      ,[ProviderPaymentID]
      ,[ProviderPaymentIDString]
      ,[ServiceID]
      ,[GateServiceID]
      ,[PayDate]
      ,[AgentDate]
      ,[ReceiveDate]
      ,[WaitToDate]
      ,[ProviderDate]
      ,[StatusDate]
      ,[RegistryDate]
      ,[Number]
      ,[GateNumber]
      ,[PaymentInfo]
      ,[AgentTerminalID]
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
      ,[GateNextTryDate]
      ,[RegistryMessageID]
      ,[ExtraAccount]
      ,[ARDate]
      ,[ARProviderDate]
      ,[ARStatus]
      ,[ARStatusDate]
      ,[ARReceiveDate]
      ,[ARQueryID]
      ,[ARComment]
      ,[ARGateCode]
      ,[ARPaymentInfo]
      ,[AgentReceipteDate]
      ,[AgentReceipteNumber]
      ,[PrePaymentInfo]
      ,[PayFields]
      ,[FiscalMode]
      ,[Pay_ID]
      ,[ARGateCodeString]
      ,[RevokeID]
      ,[AROsmpCode]
      ,[ARAgentDate]
      ,[ARAgentCancelDate]
      ,[ReservedID]
      ,[ExtraParams]
      ,[ProviderDateTimeZoneID]
      ,[OsmpProviderID]
      ,[OsmpServiceID]
      ,[ExactlyOnLinePay]
      ,[RawWrappedAnswer]
      ,[WaitingAsyncAnswer]

  FROM [gate211].[dbo].[Payment] 
  
  where StatusDate between '2020-02-25' and '2020-05-01'

