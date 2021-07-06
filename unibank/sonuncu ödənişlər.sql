SELECT  [F1]
      ,[StatusDate]
      ,[AgentPaymentID]
      ,[ServiceName]
      ,[PaySum]
      ,[status]
      ,[number]
      ,[sessionunibank]
  FROM [dekabr2020t].[dbo].[unibank] u where [sessionunibank] in (
  
  SELECT 
      [Session ID]
      
  FROM [dekabr2020t].[dbo].[unibank_ferq] 
  ) and StatusDate = ( SELECT  max([StatusDate])

  FROM [dekabr2020t].[dbo].[unibank] u1 where u1.[sessionunibank]=u.[sessionunibank])
