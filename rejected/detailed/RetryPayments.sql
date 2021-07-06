----retried

SELECT *
FROM [TURALTEST].[dbo].[RusRetryPayments] m where PaymentID in (select PaymentID from REJECTED.[dbo].PerRejectedPayments r ) order by 1



----retried

SELECT *
  FROM [TURALTEST].[dbo].[RetryPayments] m where PaymentID in (select PaymentID from  REJECTED.[dbo].PerRejectedPayments r  )order by 1
