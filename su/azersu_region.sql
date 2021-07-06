/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      sum([Amount])
       ,sum([Count]),
	  s.column1 from azersub azb join su1 s on
	  azb.[ID]=s.id
	  group by s.column1
