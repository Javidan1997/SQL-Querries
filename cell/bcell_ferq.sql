select * from Bakcell b full outer join  BakcellM211 m on b.txnid=m.txnid and m.Status =2 where m.txnid is null or cast(m.paymentamnt as decimal)<>cast(b.paymentamnt as decimal)



Select * from BakcellM211 m full outer join Bakcell b on m.txnid = b.txnid and m.status=2 where m.txnid is null or b.txnid is null or cast(m.paymentamnt as decimal)<>cast(b.paymentamnt as decimal)




SELECT  count(*), a.txnid,a.paymentamnt,m.paymentamnt,m.txnid,m.Status,CASE WHEN m.paymentamnt > 0 THEN 'MUSBET' ELSE 'MENFI' END
 from [Aprel2019].[dbo].BakcellM2 m
full join [Aprel2019].[dbo].[Bakcell201904] a
on a.txnid =m.txnid
and a.paymentamnt = m.paymentamnt  
WHERE  
 --or 

  (a.txnid is null and m.Status=2) or
 m.txnid is  null 
 or (a.txnid is not null and m.Status<>2 and not exists (select * from [Aprel2019].[dbo].BakcellM2 c where c.txnid =m.txnid and c.status=2))
  
group by a.txnid,m.paymentamnt,m.txnid,a.paymentamnt,m.Status 
