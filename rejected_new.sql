--RejectedPaymentsdir

select top 10 RetryStatusName,  len (RetryStatusName),* from RejectedPayments2019August  a where 
len (RetryStatusName) =12 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name !=  '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName != '%OSMP_STATUS_REV_SUCCESS%' --and uncomplited  !=0 olmal;d;r tapa bilmedim



--RevokedPayments sheetine atilacaq

select top 10 RetryStatusName,  len (RetryStatusName),* from RejectedPayments2019August  a where 
len (RetryStatusName) =12 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name !=  '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName = '%OSMP_STATUS_REV_SUCCESS%'


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments2019August] a where ServiceValue = RevokeValue and CreateTime < '01.09.2019'
