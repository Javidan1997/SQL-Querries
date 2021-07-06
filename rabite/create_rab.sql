
select [ServiceName],[MONTH],[AgentTerminalID],
      SUM([PaySum]) Sum
      ,Count(*) Count
	  ,sessionid from 
(SELECT 

-- [PaymentID]  ,
   s.[ServiceName] ,
   MONTH(StatusDate) Month,
      --,[Number]
      [AgentTerminalID],
      [PaySum] ,
	  CAST([ExtraParams].query('data(r/sessionid)') as nvarchar) as sessionid
  FROM [dbo].[Payment] p 
  JOIN Service s ON s.ServiceID=p.ServiceID
WHERE p.ServiceID in (312) and Status=2 
and StatusDate between '2019-04-01' and '2019-05-01' and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
) a GROUP BY MONTH,[ServiceName],[AgentTerminalID],sessionid;


SELECT 
-- [PaymentID]  ,
   [ServiceName] ,
   MONTH(StatusDate) Month,
      --,[Number]
      [AgentTerminalID],
      SUM([PaySum]) Sum
      ,Count(*) Count
  FROM [dbo].[Payment] p 
  JOIN Service s ON s.ServiceID=p.ServiceID
WHERE p.ServiceID in (312) and Status=2 
and StatusDate between '2019-04-01' and '2019-05-01' and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
GROUP BY MONTH(StatusDate),[AgentTerminalID],[ServiceName]
