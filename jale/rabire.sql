SELECT 

-- [PaymentID]  ,
   s.[ServiceName] ,
   StatusDate ,
      [Number]
      [AgentTerminalID],
      [PaySum] ,
	  CAST([ExtraParams].query('data(r/sessionid)') as nvarchar) as sessionid,
	  pp.ProviderName
  FROM [dbo].[Payment] p 
  JOIN Service s ON s.ServiceID=p.ServiceID
  join Provider pp on s.ProviderID=pp.ProviderID
WHERE p.ServiceID in (312,
606,987,546,547,355


) and Status=2 
and StatusDate between '2020-08-01' and '2020-09-01' and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3' 
