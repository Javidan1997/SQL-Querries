select * into May_2019.dbo.DimM from gate211.dbo.Payment where ServiceID in (371,372)
 and StatusDate between '2019-05-01'and'2019-06-01'   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'



select
	  [PaymentID]
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
      ,[IsTest]
      ,[TestMode],
	  CAST([ExtraParams].query('data(r/transID)') as nvarchar) transID,
	  CAST(PayFields.query('data(fields/field1)') as nvarchar) field1 into Iyul_2019.dbo.DimMM	 
from gate211.dbo.Payment where ServiceID in (371,372)
 and StatusDate between '2019-07-01'and'2019-08-01'   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3' and Status=2
