SELECT TOP 1000 [ID]
      ,[ServiceName]
      ,[Amount]
      ,[ProviderAmount]
      ,[CommissionAmount]
      ,[Count]
      ,[Agent]
      ,[ProviderName],
	  CASE 
	  when [ProviderName] LIKE '%Azeriqaz%' THEN 1
	  WHEN [ProviderName] LIKE '%Freenet%' THEN 6
	  WHEN [ProviderName] LIKE '%modus%'  THEN 7
	  WHEN [ProviderName] LIKE '%smart home%'  THEN 8
	  WHEN [ProviderName] LIKE '%Access%bank%'  THEN 9
	  WHEN [ProviderName] LIKE '%Amrah%'  THEN 10
	  WHEN [ProviderName] LIKE '%ABB%'  THEN 11
	  WHEN [ProviderName] LIKE '%AT%nk%'  THEN 12
	  WHEN [ProviderName] LIKE '%Avras%'  THEN 13
	  WHEN [ProviderName] LIKE '%btb%'  THEN 14
	  WHEN [ProviderName] LIKE '%baku%'  THEN 15
	  WHEN [ProviderName] LIKE '%respub%'  THEN 16
	  WHEN [ProviderName] LIKE '%vtb%'  THEN 17
	  WHEN [ProviderName] LIKE '%emba%'  THEN 18
	  WHEN [ProviderName] LIKE '%ideal%'  THEN 19
	  WHEN [ProviderName] LIKE '%ideal%'  THEN 19
	  	 -- WHEN ServiceName LIKE '%bank%'  THEN 12
	   ELSE 100 END qrup
  FROM [TURALTEST].[dbo].[REPORT] 
  -- WHERE [ProviderName] LIKE '%CELL%' 
   order by qrup,ProviderName
