SELECT -- AzerQazDirect 
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status
  INTO May_2019.[dbo].AzerqazAgisMNEW
  FROM [gate211].[dbo].[Payment]  
where
  ServiceID = 275 and 
  StatusDate Between '2019-05-01'and'2019-06-01'
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 order by ProviderDate


-------------------

SELECT -- AzerQazDirect 
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status
  INTO May2020.[dbo].AgisM
  FROM [gate211].[dbo].[Payment]  
where
  ServiceID = 275 and 
  StatusDate Between '2020-05-01'and'2020-06-01'
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 order by ProviderDate


SELECT --top 120-- AzerQazDirect 
OsmpProviderID,
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status
  INTO Noyabr2020.[dbo].AgisM
  FROM [gate211].[dbo].[Payment]  
where
  ServiceID = 275 and 
  StatusDate Between '2020-11-01'and'2020-12-01'
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 order by ProviderDate
