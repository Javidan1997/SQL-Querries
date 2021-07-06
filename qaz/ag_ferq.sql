SELECT  count(*), a.TRN,a.PUL,m.PaySum,m.AzeriQazID,m.Status,CASE WHEN m.PaySum > 0 THEN 'MUSBET' ELSE 'MENFI' END from [M2019].[dbo].[AzAgism] m
full join [M2019].[dbo].[AzerqazAgis] a
on a.TRN =m.AzeriQazID
and a.PUL = m.PaySum  
WHERE  
 --or 

  (a.TRN is null and m.Status=2) or
 m.AzeriQazID is  null 
 or (a.TRN is not null and m.Status<>2 and not exists (select * from [A2019].[dbo].[AzgisM] c where c.AzeriQazID =m.AzeriQazID and c.status=2))
  
group by a.TRN,m.PaySum,m.AzeriQazID,a.PUL,m.Status 


---------------------------------------

SELECT  count(*), a.TRN,a.PUL,m.PaySum,m.AzeriQazID,m.Status,CASE WHEN m.PaySum > 0 THEN 'MUSBET' ELSE 'MENFI' END from [dbo].[AzerqazAgis] m
full join [dbo].Agis a
on a.TRN =m.AzeriQazID
and a.PUL = m.PaySum  
WHERE  
 --or 

  (a.TRN is null and m.Status=2) or
 m.AzeriQazID is  null 
 or (a.TRN is not null and m.Status<>2 and not exists (select * from [dbo].[AzerqazAgis] c where c.AzeriQazID =m.AzeriQazID and c.status=2))
  
group by a.TRN,m.PaySum,m.AzeriQazID,a.PUL,m.Status 
