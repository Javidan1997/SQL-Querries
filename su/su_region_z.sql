/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      sum([Amount])
      ,sum([Count])
	  ,s2.Column1
  FROM [sentyabr2020].[dbo].[su] s1 left join  [TURALTEST].[dbo].[su1] s2
  on s1.[ID]=s2. [ID]
  group by s2.Column1
