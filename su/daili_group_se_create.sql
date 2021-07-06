DECLARE @DateFrom DATETIME
DECLARE @DateTo DATETIME

SET @DateFrom='2019-09-01'

SET @DateTo='2019-09-10'


SELECT ID,ServiceName, 
SUM(PaySum) Amount,day(StatusDate),SUM(ProviderSum) ProviderAmount,SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName 

 from (

select Cast(OsmpProviderID as nvarchar(30))+
CASE 
WHEN LEFT(Number, 2) in ('01','02','03','04','05','06','07','08','09','10','11','13','15','18','22','31','32','33','34','35','36','37','38','39','40','41','42','43','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','81','82','83','84','85','86') THEN N'01'
WHEN LEFT(Number, 2) = '27' THEN N'02'
--WHEN LEFT(Number, 2) = '28' THEN N'03'
--WHEN LEFT(Number, 2) = '29' THEN N'04'
WHEN LEFT(Number, 2) = '80' THEN N'05'
WHEN LEFT(Number, 2) in ('28','29','44','64') THEN N'06'

ELSE
' 00'
END ID,pp.ProviderName,ServiceName+
CASE 
WHEN LEFT(Number, 2) in ('01','02','03','04','05','06','07','08','09','10','11','13','15','18','22','31','32','33','34','35','36','37','38','39','40','41','42','43','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','81','82','83','84','85','86') THEN N' Azərsu ASC'
WHEN LEFT(Number, 2) = '27' THEN N' Şəki TSC'
--WHEN LEFT(Number, 2) = '28' THEN N' Göyçay TSC Birləşmiş sukanal MMC'
--WHEN LEFT(Number, 2) = '29' THEN N' Agdash TSC Birləşmiş sukanal MMC'
WHEN LEFT(Number, 2) = '80' THEN N' Gəncə TSC'
WHEN LEFT(Number, 2) in ('28','29','44','64') THEN N' Birləşmiş sukanal MMC'
ELSE
' Unknown'
END ServiceName,StatusDate,
	  PaySum,ProviderSum,CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate BETWEEN @DateFrom and @DateTo) and Status=2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and s.ProviderID=51) p
group by ID, ServiceName, Agent,p.ProviderName,day(StatusDate)

order by 4,p.ProviderName,ServiceName
