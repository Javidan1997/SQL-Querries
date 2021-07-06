/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 
      [ID платежа]
      ,[ID транзакции]
      ,[Номер чека]
      ,[Услуга]
      ,[Телефон/Счет]
      ,[Принято]
	  ,AgentPaymentID
	  ,Paysum
	  ,status
  FROM [Mart2020].[dbo].paccess port

  full  join [Mart2020].[dbo].access a
  on CAST(a.AgentPaymentID as nvarchar)=port.[ID платежа] 
