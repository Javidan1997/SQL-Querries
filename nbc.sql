SELECT
case
 When ServiceID=313 then 'NBC_Credit'
 When ServiceID=314 then 'NBC_Medaxil'
 else 'Undefined'
 end as ServiceName,
PaymentID, ReceiveDate, Number as Account, PaySum, ProviderSum,
CAST([PaymentInfo].query('data(mBilling/STAN)') as nvarchar) Stan,
Convert(varchar(max),ReceiveDate,112) + Left(Replace(Cast(Convert(varchar(max),ReceiveDate,114) as varchar(max)),':',''),6)+'0000/'+
CAST([ExtraParams].query('data(r/nbc_rrn)') as varchar(max)) RRN, 
CAST([PaymentInfo].query('data(mBilling/Payment/Date)') as nvarchar) NBCDate,
CAST([PaymentInfo].query('data(mBilling/Payment/Target)') as nvarchar(80)) Target,
CAST([PaymentInfo].query('data(mBilling/Payment/Time)') as nvarchar) NBCTime,
CAST([ExtraParams].query('data(r/nbc_account)') as nvarchar) CreditNo,
case
 When Status=2 then 'OK'
 When Status=3 then 'FAIL'
 else 'Undefined'
 end as Status
  FROM Payment with (nolock)
  where  ServiceID in(313,314)
 and (StatusDate BETWEEN '2018-07-01' and '2018-08-01') and Status=2 
-- and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
order by ServiceName,PayDate
