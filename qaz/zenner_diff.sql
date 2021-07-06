SELECT 
      [TOTAL_AMOUNT]
      ,[REF_NUM]
	  ,trnextra
	  ,trn
	  ,[PaySum]
	  ,m.status 
	  , m.zennernfc_subscriberid
	  ,count(*) kount
	 -- into Dekabr2020t.[dbo].[zennerjoin] 
  FROM Dekabr2020t.[dbo].[zennery] a
  full join Dekabr2020t.dbo.ZennerM m
  on a.ref_num=m.trn or a.ref_num=m.trnextra
   -- m.[zennernfc_subscriberid]=a.[SUBSCRIBER_ID]
  and m.[PaySum]=a.[TOTAL_AMOUNT]
  group by 
  [TOTAL_AMOUNT]
      ,[REF_NUM]
	  ,trn
	  ,[PaySum],m.status ,m.zennernfc_subscriberid,trnextra
  
  
  --------------------------------------
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [F1]
      ,[payvalue]
      ,[number]
      ,[status]
      ,[StatusTime]
      ,[PaymentID]
      ,[PointID]
      ,[TransactionID],
	  concat ([TransactionID]  ,
	   RIGHT( '0000000000'+cast(pointid as varchar(10)) ,10))
  FROM [Yanvar2021].[dbo].[zc2]
  where concat ([TransactionID]  ,
	   RIGHT( '0000000000'+cast(pointid as varchar(10)) ,10)) 
  in (
  '59052437550000003302',
  
  )
