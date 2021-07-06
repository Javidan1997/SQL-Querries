SELECT  [id]
,RIGHT([number],9) [number1]
      ,[number]
      ,[user_prv_id]
      ,[insertDate]
      ,[taskID]
      ,[body]
      ,[sms_prv_id]
      ,[status_id]
  FROM [SMSGateway].[dbo].[MSISDN] WHERE INSERTDATE BETWEEN '2021-01-01' AND '2021-02-01' AND 
  (NUMBER LIKE '99450%' OR NUMBER LIKE '99451%')
