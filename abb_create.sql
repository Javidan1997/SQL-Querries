 select  [PaymentID]
      ,[AgentPaymentID]
      ,[ProviderPaymentIDString]
      ,[StatusDate]
      ,[Number]
      ,[AgentTerminalID]
      ,[PaySum]
      ,CAST([ExtraParams].query('data(r/abb_rrn)') as nvarchar) RrnID 
	  ,CAST([ExtraParams].query('data(r/abb_card_number)') as nvarchar) abb_card_number 
	  ,CAST([ExtraParams].query('data(r/undefined)') as nvarchar) undefined 
	  ,CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trm_prv_id 
	  ,CAST([ExtraParams].query('data(r/abb_accountnumber)') as nvarchar) abb_accountnumber 


	  ,CAST([ExtraParams].query('data(r/abb_customer_number)') as nvarchar) abb_customer_number 
	  ,CAST([ExtraParams].query('data(r/abb_cardtype)') as nvarchar) abb_cardtype 
	  ,CAST([ExtraParams].query('data(r/abbfinkod)') as nvarchar) abbfinkod 

	  ,[ExtraParams]
	  -- into Sentyabr2019.dbo.AbbM
 from gate.dbo.Payment with (nolock)
 
 where
 ServiceID in ( 
722
 )
 and StatusDate between '2020-12-25'and'2021-08-01' --and Status = 2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 
 
 
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
      ,[IsTest]
      ,[TestMode],CAST([ExtraParams].query('data(r/abb_rrn)') as nvarchar) RrnID into May_2019.dbo.AbbM
 from gate.dbo.Payment where
 ServiceID in ( 
 722,723,765 ,766 ,767 ,768,
 769,770 ,771 ,772,773 ,774,
 652,653 ,654,655 ,656,657
 )
 and StatusDate between '2019-05-01'and'2019-06-01' and Status = 2


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
      ,[IsTest]
      ,[TestMode],CAST([ExtraParams].query('data(r/abb_rrn)') as nvarchar) RrnID into Sentyabr2019.dbo.AbbM
 from gate211.dbo.Payment where
 ServiceID in ( 
 722,723,765 ,766 ,767 ,768,
 769,770 ,771 ,772,773 ,774,
 652,653 ,654,655 ,656,657
 )
 and StatusDate between '2019-09-01'and'2019-10-01' and Status = 2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
