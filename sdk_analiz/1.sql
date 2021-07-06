/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ID]
      ,[ServiceName]
      ,[Amount]
      ,[ProviderAmount]
      ,[CommissionAmount]
      ,[Count]
      ,[Agent]
      ,[ProviderName]
  FROM [Noyabr2020].[dbo].[allprovidersum] where Agent not in (17,18)
  order by 2
