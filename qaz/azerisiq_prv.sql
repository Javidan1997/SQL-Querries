/****** Script for SelectTopNRows command from SSMS  ******/
select * into dbo].[ehaliall] from (SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dbo].[ehali1]
union all
SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dbo].[ehali2]
union all
SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dbo].[ehali3]) e
