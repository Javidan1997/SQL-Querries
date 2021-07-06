/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [AMOUNT]

      ,left ([RRN],20),
	  count(left ([RRN],20))
  FROM [Oktyabrr2020].[dbo].[Kapital_m]
  group by [AMOUNT]
      ,left ([RRN],20)
	  having count(left ([RRN],20))>1
