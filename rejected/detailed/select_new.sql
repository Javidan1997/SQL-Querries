[PaymentID]
      ,[PointID]
      ,[TransactionID]
      ,[UserID]
      ,[PayTime]
      ,[CreateTime]
      ,[StatusTime]
      ,[Number]
      ,[PayValue]
      ,[ServiceValue]
      ,[ConvFee]
      ,[Status]
      ,[Code]
      ,[ProcessStatus]
      ,[PayType]
      ,[PayTypeName]
      ,[ServiceID]
      ,[ServiceName]
      ,[UserName]
      ,[DealerID]
      ,[DealerName]
      ,[OuterTransactionID]
      ,[StatusName]
      ,[USD_PayValue]
      ,[USD_ServiceValue]
      ,[ReceiptNumber]
      , REPLACE(REPLACE(REPLACE([PointName], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as [PointName]
      ,[UserEnabled]
      ,[PointEnabled]
      ,[DealerEnabled]
      ,[ProcessTryCount]
      ,[ProcessTryTime]
      ,[CodeName]
      ,[UserPointID]
      ,[Retried]
      ,[RetryStatus]
      ,[RetryStatusName]
      ,[RetryTime]
      ,[FromPaymentID]
      ,[ToPaymentID]
      ,[RetryTime1]
      ,[RetryUserID]
      ,[RetryUserName]
      ,[RevokeStatus]
      ,[RevokeStatusName]
      ,[RevokeTime]
      ,[RevokeValue]
      ,[USD_RevokeValue]
      ,[RevokeUserID]
      ,[RevokeUserName]
      ,[Refunded]
      ,[RefundedTime]
      ,[RefundedUserID]
      ,[RefundedUserName]
      ,[UseConfirmation]
      ,[IsConfirmed]
      ,[IsConfirmedDate]
      ,[CanChangeConfirmationStatus]
      ,[PointType]
      ,[PointAddressCode]
      ,[Name]
      ,[AllowRetry]
      ,[AllowRefund]
      ,[AllowRefundCancel]
      
      , REPLACE(REPLACE(REPLACE([Comment], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as [Comment]
	  ,REPLACE(REPLACE(REPLACE([PortalComment], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as [PortalComment]
      , [NomenclatureID]
      ,[NomenclatureName]
      ,[NomenclatureCode]
      ,[CardPaymentStatus]
      ,[CardPaymentStatusName]
	  ,'' as IsFishing 
