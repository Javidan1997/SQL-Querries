select 
    a.payment.value('(stan/text())[1]', 'varchar(20)') as 'stan' ,
    a.payment.value('(response_code/text())[1]', 'varchar(20)') as 'responsecode', 
    a.payment.value('(transaction_DateTime/text())[1]', 'varchar(20)') as 'time' ,
    a.payment.value('(transaction_DateTime/text())[1]', 'varchar(10)') as 'date' ,
    a.payment.value('(amount/text())[1]', 'decimal(18,2)') as 'amount' ,
'994'+Number as Number,PaySum,PaymentID,
 case
 When CAST(PaymentInfo.query('data(root/CheckXml/prepaid)') as varchar)='1' then 'prepaid'
 When CAST(PaymentInfo.query('data(root/CheckXml/partial)') as varchar)='1' then 'postpaid'
 else 'Undefined'
 end as ServiceType,
 case
 When Status=2 then 'OK'
 When Status=3 then 'FAIL'
 else 'Undefined'
 end as Status
 into test.[dbo].[AzercellM]
from 
    [gate].dbo.Payment r
    cross apply r.PaymentInfo.nodes('/root/payment') a(payment)
 where 
 -- Status=2
  ServiceID =543
  and MONTH(SDate)= 04
  and YEAR(SDate)=2019
 order by SDate
