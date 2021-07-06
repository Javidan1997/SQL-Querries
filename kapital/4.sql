select * from [Oktyabrr2020].[dbo].Kapital_m m
 join 
 [Oktyabrr2020].[dbo].[Kapital_Intra] i on 
   left (m.[RRN],20) = i.[FullTranzaksiyaId] and m.AMOUNT!=i.PaySum




  select * from
  [Oktyabrr2020].[dbo].Kapital_m m  where 
  not exists 
  ( select * from [Oktyabrr2020].[dbo].[Kapital_Intra] i where 
   left (m.[RRN],20) = i.[FullTranzaksiyaId]
   )


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [UpgPaymentID]
      ,[PortalPaymentID]
      ,[TransactionID]
      ,[FullTranzaksiyaId]
      ,[FullName]
      ,[ReceiveDate]
      ,[Number/Account]
      ,[TerminalID]
      ,[PaySum]
      ,[ProviderSum]
      ,[CommissionSum]
      ,[StatusName]
      ,[ServiceName]
      ,[ProviderName]
  FROM [Oktyabrr2020].[dbo].[Kapital_Intra] i where
  ([StatusName]='Success' or [StatusName]='s') and not exists (
  select [RRN] from
  [Oktyabrr2020].[dbo].Kapital_m m  where left (m.[RRN],20) = i.[FullTranzaksiyaId]
  )
  
  
  
  SELECT 

	--PortalPaymentID,
      [FullTranzaksiyaId]

      ,([PaySum]),
	  count(*)
  FROM [Oktyabrr2020].[dbo].[Kapital_Intra] km
  full join [Oktyabrr2020].[dbo].Kapital_m kapital
  on left(kapital.RRN,20)=km.FullTranzaksiyaId
  where ([StatusName]='Success' or [StatusName]='s')
  group by --PortalPaymentID, 
  [FullTranzaksiyaId],[PaySum]
  having count(*)>1
  
  
