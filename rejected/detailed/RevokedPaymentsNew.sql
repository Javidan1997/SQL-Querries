---RevokedPayments

 SELECT 
*
 
 from TURALTEST.[dbo].[RejectedPayments] a where 
len (RetryStatusName) >13 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name like '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName like '%OSMP_STATUS_REV_SUCCESS%' and   CreateTime between '2020-01-01' and '2020-02-01'---bu ay 

union 

---RevokedPayments

SELECT 
*

  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue!=RevokeValue and   CreateTime between '2020-01-01' and '2020-02-01'---bu ay 


------------------------------------------------------------------------


---RevokedPayments 

SELECT *
  FROM [TURALTEST].[dbo].RusRevokedPayments m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month) and   CreateTime between '2020-01-01' and '2020-02-01'---bu ay 
union
SELECT*
  FROM [TURALTEST].[dbo].YarRevokedPayments m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month) and   CreateTime between '2020-01-01' and '2020-02-01'---bu ay 
