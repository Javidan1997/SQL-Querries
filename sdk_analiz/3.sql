SELECT 
      [Услуга]
      ,sum([Принято])
      ,sum([Принято])
	  ,count([Принято])
	  --,[Статус]


  FROM [Noyabr2020].[dbo].[portalterminal]
  group by [Услуга]--,[Статус]
  order by 1
