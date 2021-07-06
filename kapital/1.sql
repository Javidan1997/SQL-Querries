SELECT 
      sum([PaySum]),count(*),count(distinct [TransactionID])

  FROM [Oktyabrr2020].[dbo].[Kapital_Intra] where statusname='Success' or 
  statusname='S' 
union all
SELECT sum([AMOUNT]),count(*),count(distinct left([RRN],20))

  FROM [Oktyabrr2020].[dbo].[Kapital_m]  
