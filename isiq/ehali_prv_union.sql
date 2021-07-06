/****** Script for SelectTopNRows command from SSMS  ******/
select *

into [dekabr2020t].[dbo].[ehaliall]
 from (SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dekabr2020t].[dbo].[ehali1]
union all
SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dekabr2020t].[dbo].[ehali2]
union all
SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dekabr2020t].[dbo].[ehali3]
union all
SELECT [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [dekabr2020t].[dbo].[ehali4]) a
