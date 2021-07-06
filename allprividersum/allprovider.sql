Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2020-01-01'
 set @DateTo = '2020-02-01'


select MONth(@DateFrom);
select MONth(@DateTo);



 select * into Yanvar2020.dbo.Reportchecknew from (
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount,
SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent ,p.ProviderName  
from (select CAST(OsmpProviderID as nvarchar) ID ,pp.ProviderName
,ServiceName,
	  PaySum,ProviderSum,
 CASE 
	  WHEN OsmpProviderID in (17217, 17218, 17219, 17220) THEN 1.00
	  ELSE CommissionSum END AS CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
--and (OsmpProviderID<>17328 or (OsmpProviderID=17328 and PaySum>1))
--and 17381
and p.ServiceID not in(126,127,291,312,355,618,631,632,649) and s.ProviderID not in (135,42,51)
)p 
group by ID, ServiceName, Agent ,p.ProviderName


UNION ALL -- Azersu
SELECT ID,ServiceName, 
SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount,SUM(CommissionSum) CommissionAmount, count(*) Count,
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
END ServiceName,
	  PaySum,ProviderSum,CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate BETWEEN @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and s.ProviderID=51) p
group by ID, ServiceName, Agent,p.ProviderName


UNION ALL -- MONEX
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount,
 SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (
select CASE WHEN PaySum<200 THEN 
CAST(OsmpProviderID as nvarchar)+'200'
ELSE CAST(OsmpProviderID as nvarchar) END as ID, pp.ProviderName,
CASE WHEN PaySum<200 THEN ServiceName+' 200 az' ELSE ServiceName END as ServiceName,
	  PaySum,ProviderSum,
 CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and OsmpProviderID=17381
)p 
group by ID, ServiceName, Agent ,p.ProviderName

UNION ALL --RabitaBankBarat
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount,
 SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (
select CASE WHEN PaySum<500 THEN 
CAST(OsmpProviderID as nvarchar)+'500'
ELSE CAST(OsmpProviderID as nvarchar) END as ID, pp.ProviderName,
CASE WHEN PaySum<500 THEN ServiceName+' 500 az' ELSE ServiceName+' 500 çox' END as ServiceName,
	  PaySum,ProviderSum,
 CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and OsmpProviderID=17404
)p 
group by ID, ServiceName, Agent ,p.ProviderName

UNION ALL  --BANK RESPUBLIKA
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount, SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (select Cast(OsmpProviderID as nvarchar(30)) ID,pp.ProviderName,ServiceName,
	  PaySum,ProviderSum,CAST(CAST([PayFields].query('data(fields/field4)') as nvarchar) as float) CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and p.ServiceID in(126,127))p
group by ID, ServiceName, Agent,p.ProviderName

UNION ALL --- Alkredit
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount, 0.236*count(*) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (select Cast(OsmpProviderID as nvarchar(30)) ID,pp.ProviderName,ServiceName,
	  PaySum,ProviderSum,CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID  join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate BETWEEN @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and s.ProviderID = 135)p
group by ID, ServiceName, Agent,p.ProviderName

UNION ALL  --Meqa Sigorta HOP
select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) -SUM(CommissionSum) ProviderAmount, SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (select Cast(OsmpProviderID as nvarchar(30)) ID,pp.ProviderName,ServiceName,
	  PaySum,ProviderSum,CAST(CAST ([PaymentInfo].query('data(r/qaliq)') as nvarchar) as float) CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between @DateFrom and @DateTo) and ReceiveDate >'2018-12-01' and Status=2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and p.ServiceID in(355))p
group by ID, ServiceName, Agent,p.ProviderName



UNION ALL  --Voyage

select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount, SUM(CommissionSum) CommissionAmount, count(*) Count,
Agent,p.ProviderName from (select Cast(OsmpProviderID as nvarchar(30)) ID,pp.ProviderName,ServiceName,
	 CAST(CAST ([PaymentInfo].query('data(root/paid)') as nvarchar) as float)  PaySum,
	 CAST(CAST ([PaymentInfo].query('data(root/payable)') as nvarchar) as float) ProviderSum,
	 CAST(CAST ([PaymentInfo].query('data(root/residual)') as nvarchar) as float) CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between  @DateFrom and @DateTo ) and ReceiveDate >'2019-11-01' and Status=2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and p.ServiceID in(618))p
group by ID, ServiceName, Agent,p.ProviderName


UNION ALL -- ASAN PAY

select ID,ServiceName, SUM(PaySum) Amount,SUM(ProviderSum) ProviderAmount, SUM(CommissionSum) CommissionAmount,count(*) Count,Agent,p.ProviderName from (
select Cast(OsmpProviderID as nvarchar(30)) ID,pp.ProviderName,ServiceName,
	 PaySum,
	 (CAST(CAST ([PaymentInfo].query('data(root/debt)') as nvarchar) as float)) as ProviderSum,
	 (CommissionSum+CAST(CAST ([PaymentInfo].query('data(root/overpaid)') as nvarchar) as float)) CommissionSum
	  , CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) as Agent
	 --, CAST(ReceiveDate AS DATE) as ReceiveDate,
	 -- CAST(CAST ([PaymentInfo].query('data(root/overpaid)') as nvarchar) as float) Overpaid
  FROM [dbo].[Payment] p with (nolock)
join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where (StatusDate Between   @DateFrom and @DateTo  ) and ReceiveDate >'2019-11-01' and Status=2
 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
and p.ServiceID in(631,632,649))p
group by ID, ServiceName, Agent,p.ProviderName
) a order by ProviderName,ServiceName
