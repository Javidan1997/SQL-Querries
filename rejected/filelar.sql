---RevokedPayments
  SELECT  * from TURALTEST.[dbo].[RejectedPayments] a where 
len (RetryStatusName) =12 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name like '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName like '%OSMP_STATUS_REV_SUCCESS%'




---rejected
  SELECT  * from TURALTEST.[dbo].[RejectedPayments] a where 
len (RetryStatusName) =12 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name not like '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName not like '%OSMP_STATUS_REV_SUCCESS%' and  convert(numeric(7,2) ,payvalue)!= 0.0 and (comment not like '%uncomp%' or comment is null)


---RevokedCurrentMonth

SELECT *
  FROM [TURALTEST].[dbo].RevokedPayments m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month)

----retried

SELECT *
  FROM [TURALTEST].[dbo].[RetryPayments] m where PaymentID in (select PaymentID from  REJECTED.[dbo].PerRejectedPayments r  )


---SuccessCurrentMonth
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue=RevokeValue and Month(CreateTime)<9---bu ay
  and PaymentID in  (select PaymentID from  REJECTED.[dbo].PerRejectedPayments r  )



---RevokedCurrentMonth
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue!=RevokeValue and Month(CreateTime)<9---bu ay



---RevokedPayments

SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue!=RevokeValue and Month(CreateTime)=9---bu ay
