e-de olmayan ve a-da olmayan

SELECT  count(*), a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id,m.Status from [Aprel2019].[dbo].[Azerishiq_QEhaliMP] m
full join [Aprel2019].[dbo].[Azerisiq_QeyriEhaliA] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE (m.Status = 2 and a.TRANSACTION_ID is  null) or m.trn_id is  null
group by a.TRANSACTION_ID,m.PaySum,m.trn_id,a.PAYMENT_AMOUNT,m.Status

hem a-da hem e-de olan
SELECT  count(*), a.TRANSACTION_ID,m.PaySum,m.trn_id from [Aprel2019].[dbo].[Azerishiq_QEhaliMP] m
full join [Aprel2019].[dbo].[Azerisiq_QeyriEhaliA] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2 
group by a.TRANSACTION_ID,m.PaySum,m.trn_id


her iki ferq

SELECT  count(*), a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id,m.Status from [Aprel2019].[dbo].[Azerishiq_QEhaliMP] m
full join [Aprel2019].[dbo].[Azerisiq_QeyriEhaliA] a
on a.TRANSACTION_ID = m.trn_id
and a.PAYMENT_AMOUNT = m.PaySum  
WHERE  
 --or 

  (a.TRANSACTION_ID is null and m.Status=2) or
 m.trn_id is  null 
 or (a.TRANSACTION_ID is not null and m.Status=3 and not exists (select * from [Azerishiq_QEhaliMP] c where c.trn_id =m.trn_id and c.status=2))
  
group by a.TRANSACTION_ID,m.PaySum,m.trn_id,a.PAYMENT_AMOUNT,m.Status 
