---SuccessCurrentMonth
SELECT *
FROM [TURALTEST].[dbo].RusSuccessCurrentMonth where ServiceValue=RevokeValue and Month(CreateTime)<10---bu ay
and PaymentID in (select PaymentID from REJECTED.[dbo].PerRejectedPayments r )


---SuccessCurrentMonth
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue=RevokeValue and Month(CreateTime)<10---bu ay
  and PaymentID in  (select PaymentID from  REJECTED.[dbo].PerRejectedPayments r  )

-----------------------------------yeni--------------

---SuccessCurrentMonth
SELECT *
FROM [TURALTEST].[dbo].RusSuccessCurrentMonth where ServiceValue=RevokeValue and CreateTime between '2020-01-01' and '2020-02-01'---bu ay---bu ay
and PaymentID in (select PaymentID from REJECTED.[dbo].PerRejectedPayments r )


---SuccessCurrentMonth
SELECT *
  FROM [TURALTEST].[dbo].[PartialPayments] where ServiceValue=RevokeValue and CreateTime between '2020-01-01' and '2020-02-01'---bu ay----bu ay
  and PaymentID in  (select PaymentID from  REJECTED.[dbo].PerRejectedPayments r  )
