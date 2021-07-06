 select  [PaymentID]
      ,[AgentID]
      ,[AgentPaymentID]
      ,[ProviderPaymentID]
      ,[ProviderPaymentIDString]
      ,[ServiceID]
      ,[StatusDate]
      ,[Number]
      ,[AgentTerminalID]
      ,[PaySum]
      ,[CommissionSum]
      ,[ProviderComission]
	   ,CAST([ExtraParams].query('data(r/abb_rrn)') as nvarchar) RrnID,
	   CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) Agent
	   into Mart2020.dbo.AbbM
 from gate211.dbo.Payment where
 ServiceID in ( 
 722,723,765 ,766 ,767 ,768,
 769,770 ,771 ,772,773 ,774,
 652,653 ,654,655 ,656,657
 )
 and StatusDate between '2020-03-01'and'2020-04-01' and Status = 2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
