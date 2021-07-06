/
SELECT sum(PaySum)
  FROM [Aprel2019].[dbo].[AzerisiqEhali] where Status = 2;

select sum(PAYMENT_AMOUNT) from Aprel2019.dbo.AzerisiqAllE;



ede olan a da olmayan

SELECT  a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE]  a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2 and (a.TRANSACTION_ID is null or m.Paysum is null)


ada olub e de olmayan

SELECT count(*), a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE]  a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status != 2 and (a.TRANSACTION_ID is not null and m.Paysum is not null) and not exists (select * from AzerisiqEhali e where e.trn_id = m.trn_id and e.PaySum = m.PaySum and e.Status=2)

group by a.TRANSACTION_ID,m.PaySum,m.trn_id

ada ve ede eyni olan 

SELECT  count(*),a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2
group by a.TRANSACTION_ID,m.PaySum,m.trn_id
