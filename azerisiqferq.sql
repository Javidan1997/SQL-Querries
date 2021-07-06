SELECT  count(*), a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status != 2
group by a.TRANSACTION_ID,m.PaySum,m.trn_id
having count(*)>1



SELECT  count(*), a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2
group by a.TRANSACTION_ID,m.PaySum,m.trn_id
having count(*)>1





SELECT  count(*),a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE] a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2
group by a.TRANSACTION_ID,m.PaySum,m.trn_id





SELECT count(*), a.TRANSACTION_ID,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE]  a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE m.Status = 2 and (a.TRANSACTION_ID is null or m.Paysum is null)

group by a.TRANSACTION_ID,m.PaySum,m.trn_id



SELECT  a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id from AzerisiqEhali m
full join [AzerisiqAllE]  a
on a.TRANSACTION_ID = CONVERT(NVARCHAR,m.trn_id)
and a.PAYMENT_AMOUNT = m.PaySum
WHERE  (a.TRANSACTION_ID is null or m.Paysum is null)



--select * from Azerishiq_EhaliM where TRANSACTION_ID = '10000783580000001355'

--select * from AzerisiqE where trn_id = '10000783580000001355'


SELECT  count(*), a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id,m.Status,CASE WHEN m.PaySum > 0 THEN 'MUSBET' ELSE 'MENFI' END from [Aprel2019].[dbo].AzerisiqEhali m
full join [Aprel2019].[dbo].AzerisiqAllE a
on a.TRANSACTION_ID = m.trn_id
and a.PAYMENT_AMOUNT = m.PaySum  
WHERE  
 --or 

  (a.TRANSACTION_ID is null and m.Status=2) or
 m.trn_id is  null 
 or (a.TRANSACTION_ID is not null and m.Status=3 and not exists (select * from AzerisiqEhali c where c.trn_id =m.trn_id and c.status=2))
  
group by a.TRANSACTION_ID,m.PaySum,m.trn_id,a.PAYMENT_AMOUNT,m.Status 



------------------------------

SELECT  count(*), m.AgentPaymentID,m.Number,m.StatusDate, a.TRANSACTION_ID,a.PAYMENT_AMOUNT,m.PaySum,m.trn_id,m.Status,CASE WHEN m.PaySum > 0 THEN 'MUSBET' ELSE 'MENFI' END from Iyul_2019.[dbo].AzerisiqEhaliM m
full join Iyul_2019.[dbo].AzerisiqEhaliAll a
on a.TRANSACTION_ID = m.trn_id
and a.PAYMENT_AMOUNT = m.PaySum  

WHERE  
 --or 

  (a.TRANSACTION_ID is  null and m.Status=2)

-- m.trn_id is not  null 
 --or (a.TRANSACTION_ID is not null and m.Status=3 and not exists (select * from Iyul_2019.[dbo].AzerisiqEhaliM c where c.trn_id =m.trn_id and c.status=2))
  
group by  m.AgentPaymentID,m.Number, a.TRANSACTION_ID,m.PaySum,m.trn_id,a.PAYMENT_AMOUNT,m.Status ,m.StatusDate
order by StatusDate
