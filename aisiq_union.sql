/****** Script for SelectTopNRows command from SSMS  ******/
select * into [Aprel2019].[dbo].AzerisiqAllE   from (SELECT   [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [Aprel2019].[dbo].[AzerisiqE1]

union all
SELECT  [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [Aprel2019].[dbo].[AzerisiqE2]
  union all
  SELECT  [POST_ID]
      ,[WS_USER_NAME]
      ,[TRANSACTION_DATE]
      ,[TARGET_SUBSCRIBER_ID]
      ,[PAYMENT_AMOUNT]
      ,[TRANSACTION_ID]
  FROM [Aprel2019].[dbo].[AzerisiqE3]) as a
