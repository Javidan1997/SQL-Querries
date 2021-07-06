/****** Script for SelectTopNRows command from SSMS  ******/
select  [Услуга],
([Принято]) Amount,(ceiling (CAST ([Принято] as numeric (9, 4))*0.05*100)/100) as comission ,[Принято]*0.05 as comission2
--,count(*) count
	   FROM [Mart2020].[dbo].[2128_yeni] where
    [Код] ='OK'
	--group by [Услуга]
