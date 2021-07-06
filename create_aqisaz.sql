SELECT -- AzerQazDirect 
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum,
 Case 
     When Status=2 
  then 'OK'
     When Status=3 
  then 'FAIL'
  else 'Undefined'
 end as Status
  INTO aprel2019.[dbo].AzerqazAgisM
  FROM [gate].[dbo].[Payment]  
   ServiceID = 275 and 

  StatusDate Between '2019-05-01'and'2019-06-01'
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
 order by ProviderDate
