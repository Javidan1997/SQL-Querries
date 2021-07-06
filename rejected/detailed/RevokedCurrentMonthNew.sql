---RevokedCurrentMonth

SELECT *
  FROM [TURALTEST].[dbo].RusRevokeCurrentMonth m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month) and  CreateTime not between '2020-01-01' and '2020-02-01'---bu ay 

---  and revokestatus=4 and retrystatus=1
union 

SELECT *
  FROM [TURALTEST].[dbo].[YarRevokedPayments] m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k  where k.Month < m.Month) and  CreateTime not between '2020-01-01' and '2020-02-01'---bu ay 




  ---RevokedCurrentMonth

SELECT *
  FROM [TURALTEST].[dbo].RevokedPayments m where PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k ) and  CreateTime not between '2020-01-01' and '2020-02-01'---bu ay 


union 

---RevokedCurrentMonth
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] m where ServiceValue!=RevokeValue and  CreateTime not between '2020-01-01' and '2020-02-01'---bu ay deyil
  and PaymentID not in (select PaymentID from  (select PaymentID,Month from  REJECTED.[dbo].PerRevokedCurrentMonth r1 union all  select PaymentID,Month from  REJECTED.[dbo].PerRevokedPayments r2) k )-- where k.Month < m.Month)

