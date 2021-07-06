SELECT  count(*), a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id,m.Status from dekabr2020e.[dbo].azerqehalim m
full join dekabr2020e.[dbo].[Azerisiq_QeyriEhaliA] a
on a.TRANSACTION_ID = m.trn_id
and a.PAYMENT_AMOUNT = m.PaySum  
WHERE  
 --or 

  (a.TRANSACTION_ID is null and m.Status=2) or
 m.trn_id is  null 
 or (a.TRANSACTION_ID is not null and m.Status=3 and not exists (select * from dbo.azerqehalim c where c.trn_id =m.trn_id and c.status=2))
  
group by a.TRANSACTION_ID,m.PaySum,m.trn_id,a.PAYMENT_AMOUNT,m.Status 
