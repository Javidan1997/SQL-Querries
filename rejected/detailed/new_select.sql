
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
	  ,case when DealerID =16 then [ConvFee] else '0.00' end ConvFeeMpay
      ,case when DealerID !=16 then [ConvFee] else '0.00' end [ConvFee]
      ,'' [Status]
      ,REPLACE(REPLACE(REPLACE([Code], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [Code]
      ,REPLACE(REPLACE(REPLACE([ProcessStatus], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [ProcessStatus]
      ,REPLACE(REPLACE(REPLACE([PayType], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [PayType]
      ,[PayTypeName]
      ,[ServiceID]
      
	  , ''  [ServiceName] --REPLACE(REPLACE(REPLACE([ServiceName], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as [ServiceName]
      ,REPLACE(REPLACE(REPLACE([UserName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [UserName]
      ,[DealerID]

	  , -- REPLACE(REPLACE(REPLACE([DealerName], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as
	   '' [DealerName]
      ,[OuterTransactionID]
      ,REPLACE(REPLACE(REPLACE([StatusName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [StatusName]
      ,REPLACE(REPLACE(REPLACE([USD_PayValue], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [USD_PayValue]
      ,REPLACE(REPLACE(REPLACE([USD_ServiceValue], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [USD_ServiceValue]
      ,REPLACE(REPLACE(REPLACE([ReceiptNumber], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [ReceiptNumber]
      , --REPLACE(REPLACE(REPLACE([PointName], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,'')as 
	  '' [PointName]
      ,'' [UserEnabled]
      ,'' [PointEnabled]
      ,'' [DealerEnabled]
      ,REPLACE(REPLACE(REPLACE([ProcessTryCount], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [ProcessTryCount]
      ,REPLACE(REPLACE(REPLACE([ProcessTryTime], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [ProcessTryTime]
      ,REPLACE(REPLACE(REPLACE([CodeName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [CodeName]
      ,REPLACE(REPLACE(REPLACE([UserPointID], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [UserPointID]
      ,REPLACE(REPLACE(REPLACE([Retried], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [Retried]
      ,REPLACE(REPLACE(REPLACE([RetryStatus], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryStatus]
      ,REPLACE(REPLACE(REPLACE([RetryStatusName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryStatusName]
      ,REPLACE(REPLACE(REPLACE([RetryTime], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryTime]
      ,REPLACE(REPLACE(REPLACE([FromPaymentID], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [FromPaymentID]
      ,REPLACE(REPLACE(REPLACE([ToPaymentID], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [ToPaymentID]
      ,REPLACE(REPLACE(REPLACE([RetryTime1], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryTime1]
      ,REPLACE(REPLACE(REPLACE([RetryUserID], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryUserID]
      ,REPLACE(REPLACE(REPLACE([RetryUserName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RetryUserName]
      ,REPLACE(REPLACE(REPLACE([RevokeStatus], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RevokeStatus]
      ,REPLACE(REPLACE(REPLACE([RevokeStatusName], ' ', ''), CHAR(10), ''),CHAR(9) ,'')as [RevokeStatusName]
	  ,case when DealerID =16 then [RevokeValue] else '0.00' end [RevokeValueMpay]
	  ,case when DealerID !=16 then [RevokeValue] else '0.00' end [RevokeValue]
      
      ,'' [USD_RevokeValue]
      ,'' [RevokeUserID]
      ,'' [RevokeUserName]
      ,'' [Refunded]
      ,'' [RefundedTime]
      ,'' [RefundedUserID]
      ,'' [RefundedUserName]
      ,'' [UseConfirmation]
      ,'' [IsConfirmed]
      ,'' [IsConfirmedDate]
      ,'' [CanChangeConfirmationStatus]
      ,'' [PointType]
      ,'' [PointAddressCode]
      ,'' [Name]
      ,'' [AllowRetry]
      ,'' [AllowRefund]
      ,'' [AllowRefundCancel]
      ,case when [Comment] is null then  '' else REPLACE (REPLACE(REPLACE(REPLACE([Comment], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,''), ' ','') end as [Comment]
	  ,case when [PortalComment] is null then  '' else  REPLACE (REPLACE(REPLACE(REPLACE([PortalComment], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,''), ' ','') end as [PortalComment]
      ,[NomenclatureID]
      ,REPLACE (REPLACE(REPLACE(REPLACE([NomenclatureName], CHAR(13), ''), CHAR(10), ''),CHAR(9) ,''), ' ','&')  [NomenclatureName]
      ,[NomenclatureCode]
      ,[CardPaymentStatus]
      ,[CardPaymentStatusName]
	  ,'' as IsFishing 
	  ,[RevokeTime]
  
