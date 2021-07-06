/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	  sum(ceiling([Принято]*1000*5/10000)/100)
	  ,sum([Принято]/1000*5)
	  ,count(*)
  FROM [Avqust2020].[dbo].[T3138202008] where [Услуга] like 'Faberlic'
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Дата]
      ,[ID платежа]
      ,[ID транзакции]
      ,[Номер чека]
      ,[Услуга]
      ,[Телефон/Счет]
      ,[Значение ExtraAccount]
      ,[Принято]
	  ,ceiling([Принято]*1000*5/10000)/100
	  ,[Принято]/1000*5
      ,[Проведено]
      ,[Статус]
      ,[Код]
      ,[Агент]
      ,[Терминал]
      ,[Персона]
      ,[Услуга провайдера]
      ,[Комментарий]
  FROM [Avqust2020].[dbo].[T3138202008] where [Услуга] like 'Faberlic'


SELECT   
sum([Принято]) Amount ,

sum([Принято]) -sum(ceiling([Принято]*1000*5/10000)/100) ProviderAmount,

sum(ceiling([Принято]*1000*5/10000)/100)
	  --,sum([Принято]/1000*5)
	  ,count(*) count 
  FROM [Oktyabr202010].[dbo].[faberlik_terminal]
