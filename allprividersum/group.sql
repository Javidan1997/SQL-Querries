/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID]
      ,[ServiceName]
      ,[Amount]
      ,[ProviderAmount]
      ,[CommissionAmount]
      ,[Count]
      ,[Agent]
      ,[ProviderName],
	  CASE 
	  WHEN [ProviderName] LIKE '%Azeriqaz%' THEN '1 Kütlevi xidmet'
	  WHEN [ProviderName] LIKE '%Az%r%q'  THEN '1 Kütlevi xidmet'
	  WHEN [ProviderName] LIKE 'Az%rsu'  THEN '1 Kütlevi xidmet'
	  WHEN [ProviderName] LIKE '%CELL%'  THEN '2 Mobil operatorlar'
	  WHEN [ProviderName] LIKE '%bank%'  THEN '3 Banklar ve kredit teşkilatı'
	  WHEN [ProviderName] LIKE '%B%l%diyy%s%'  THEN '4 EMDK'
	   ELSE 'OTHER' END qrup
  FROM [TURALTEST].[dbo].[REPORT] 
  -- WHERE [ProviderName] LIKE '%CELL%' 
   order by qrup,ProviderName
