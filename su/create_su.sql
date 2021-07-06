SELECT -- AzersuAll
AgentPaymentID,
 COALESCE(ProviderPaymentID, ProviderPaymentIDString,PaymentID) AzersuId,
  ReceiveDate, Number, PaySum,
CAST([ExtraParams].query('data(r/acc_type)') as nvarchar) AccType ,
CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trm_prv_id,
 Case 
 --When ServiceID=24 then 'old_electromed'
 When ServiceID=278 then 'DIRECT'
 When ServiceID=560 then 'new_electromed'
 When ServiceID=563 then 'metlab'
 when ServiceID=566 then 'baylan'
 when ServiceID=583 then 'azersu_cerime'
 else 'Undefined'
 end as PayType
,
CASE 
WHEN LEFT(Number, 2) in ('01','02','03','04','05','06','07','08','09','10','11','13','15','18','22') THEN N'01'
WHEN LEFT(Number, 2) = '27' THEN N'02'
WHEN LEFT(Number, 2) = '28' THEN N'03'
WHEN LEFT(Number, 2) = '29' THEN N'04'
WHEN LEFT(Number, 2) = '80' THEN N'05'
WHEN LEFT(Number, 2) in ('31','32','33','34','35','36','37','38','39','40','41','42','43','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','81','82','83','84','85','86','44','64') THEN N'06'

ELSE
' 00'
END ID,
CASE 
WHEN LEFT(Number, 2) in ('01','02','03','04','05','06','07','08','09','10','11','13','15','18','22') THEN N' Azərsu ASC'
WHEN LEFT(Number, 2) = '27' THEN N' Şəki TSC'
WHEN LEFT(Number, 2) = '28' THEN N' Göyçay TSC Birləşmiş sukanal MMC'
WHEN LEFT(Number, 2) = '29' THEN N' Agdash TSC Birləşmiş sukanal MMC'
WHEN LEFT(Number, 2) = '80' THEN N' Gəncə TSC'
WHEN LEFT(Number, 2) in ('31','32','33','34','35','36','37','38','39','40','41','42','43','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','81','82','83','84','85','86','44','64') THEN N' Birləşmiş sukanal MMC'
ELSE
' Unknown'
END ServiceName
 INTO Avqust_2019.[dbo].AzersuAll
  FROM 
  [gate].[dbo].[Payment]
  where 
--  ServiceID in (24, 6, 67, 69, 73, 99) 24 u sildim cunki old elektromeddi
  ServiceID in ( 278, 560, 563, 566, 583) and
   StatusDate Between '2019-07-01'and'2019-08-01'
  and Status=2
  and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

  order by StatusDate
