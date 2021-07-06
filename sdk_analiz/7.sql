/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [Услуга]
      ,sum([Принято])
      ,[Статус]

  FROM [Noyabr2020].[dbo].[millikartportal]
  group by [Услуга],[Статус]
  order by 1
