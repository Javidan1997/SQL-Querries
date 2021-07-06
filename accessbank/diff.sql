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
	  CAST(PayFields.query('data(fields/field1)') as nvarchar) field1 --into Iyul_2019.dbo.DimMM	 
from gate211.dbo.Payment where ServiceID in (371,372)
-- and StatusDate between '2020-01-01'and'2020-02-01'   --and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 -- and Status=3 
-- and CAST(PayFields.query('data(fields/field1)') as nvarchar)in ( '2198276071873660','2872418828586930')

AND CAST([ExtraParams].query('data(r/transID)') as nvarchar) IN (
'98158820200129213326630073771',
'98158820200116084720080081810'

)
