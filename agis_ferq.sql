SELECT  count(*), a.TRN,a.PUL,m.PaySum,m.AzeriQazID,m.Status,CASE WHEN m.PaySum > 0 THEN 'MUSBET' ELSE 'MENFI' END from [Aprel2019].[dbo].[AzerqazAgisM] m
full join [Aprel2019].[dbo].[agis] a
on a.TRN =m.AzeriQazID
and a.PUL = m.PaySum  
WHERE  
 --or 

  (a.TRN is null and m.Status='OK') or
 m.AzeriQazID is  null 
 or (a.TRN is not null and m.Status<>'OK' and not exists (select * from [Aprel2019].[dbo].[AzerqazAgisM] c where c.AzeriQazID =m.AzeriQazID and c.status='OK'))
  
group by a.TRN,m.PaySum,m.AzeriQazID,a.PUL,m.Status 
