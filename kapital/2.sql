/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [TransactionID]

  FROM [Oktyabrr2020].[dbo].[Kapital_Intra] where statusname='Success' or 
  statusname='S' 
