/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [Услуга]
      ,sum([Принято])
	  ,count(*)
  FROM [Iyul2020].[dbo].[3139]
  group by [Услуга]
  order by 1
