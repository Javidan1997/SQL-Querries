/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID]
      ,[ServiceName]
      ,[Amount]
      ,[ProviderAmount]
      ,[CommissionAmount]
      ,[Count]
      ,[Agent]
      ,[ProviderName]
  FROM [Noyabr2020].[dbo].[allprovidersum] where Agent in (17)
  order by 2
