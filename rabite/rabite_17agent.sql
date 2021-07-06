SELECT 

AgentPaymentID  ,
   s.[ServiceName] ,
   StatusDate ,
      [Number]
      [AgentTerminalID],
      [PaySum] ,
	  CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) as trm_prv_id,
	  CAST([ExtraParams].query('data(r/sessionid)') as nvarchar) as sessionid,
	  pp.ProviderName,
	  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) 
  FROM dekabr2020t.dbo.[PaymentAgent17] p 
  JOIN Service s ON s.ServiceID=p.ServiceID
  join Provider pp on s.ProviderID=pp.ProviderID
WHERE p.ServiceID in (312,
606,987,546,547,355


) and Status=2 
and StatusDate between '2020-12-01' and '2021-01-01' and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3' 
and  CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) in (

SELECT 
      [payment_id]
  FROM [dekabr2020t].[dbo].[lucky_purchase_via_card]
)
