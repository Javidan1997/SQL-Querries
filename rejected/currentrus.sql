--RusRejectedPayments

SELECT *
FROM [TURALTEST].[dbo].RusRejectedPayments where CAST (PayValue AS numeric) != 0


---RevokedCurrentMonth

SELECT *
  FROM [TURALTEST].[dbo].RusRevokeCurrentMonth m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month)




---RevokedPayments 

SELECT *
  FROM [TURALTEST].[dbo].RusRevokedPayments m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month)




----retried

SELECT *
FROM [TURALTEST].[dbo].[RusRetryPayments] m where PaymentID in (select PaymentID from REJECTED.[dbo].PerRejectedPayments r )


----Partial

SELECT *
  FROM [TURALTEST].[dbo].[YarRevokedPayments]
union all
SELECT *
  FROM [TURALTEST].[dbo].[YarRevokedCurrentMonth]



---SuccessCurrentMonth
SELECT *
FROM [TURALTEST].[dbo].RusSuccessCurrentMonth where ServiceValue=RevokeValue and Month(CreateTime)<10---bu ay
and PaymentID in (select PaymentID from REJECTED.[dbo].PerRejectedPayments r )
