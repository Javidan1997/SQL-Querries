/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [number],
	  day(insertDate),
	  count(*) 
  FROM [SMSGateway].[dbo].[MSISDN] where insertDate between '2019-11-01' and '2019-12-01'
  group by [number],
	  day(insertDate)
	order by 1

----------------------------


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT SUBSTRING( CAST(msisdn as varchar(20)),1,6),count(*)
  FROM [Yanvar2020].[dbo].[sms] group by SUBSTRING( CAST(msisdn as varchar(20)),1,6)
							 
---------------------------
							 
SELECT

SUBSTRING(number,1,5),sms_prv_id, -- status_id,
COUNT(*)
FROM [SMSGateway].[dbo].[MSISDN]
where insertDate between '2019-11-01' and '2019-12-01' --and SUBSTRING(number,1,5)='99456'

GROUP BY SUBSTRING(number,1,5),sms_prv_id --,status_id
