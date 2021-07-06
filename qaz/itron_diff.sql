SELECT  count(*) as count, a.[tranzaksiya_id],(try_convert(numeric(38, 12),a.odeme_meblegi) ) as amount ,m.payvalue,m.[AzerqazId],m.Status,CASE WHEN m.payvalue > 0 THEN 'MUSBET' ELSE 'MENFI' END,m.[ServiceID] from [May_2019].[dbo].AzerqazItronMWService m
full join [May_2019].[dbo].itronall a
on a.[tranzaksiya_id] = m.[AzerqazId]
--and a.[paymentamnt] = m.[paymentamnt]  
WHERE  
 --or 

  (a.[tranzaksiya_id] is null and m.Status=2) or
 m.[AzerqazId] is  null 
 or (a.[tranzaksiya_id] is not null and m.Status=3 and not exists (select * from [May_2019].[dbo].AzerqazItronMWService c where c.[AzerqazId] =m.[AzerqazId] and c.status=2))
  
group by a.[tranzaksiya_id],m.payvalue,m.[AzerqazId],a.odeme_meblegi,m.Status ,m.[ServiceID]

----------------------yeni-------------------

SELECT  count(*) as count, a.[tranzaksiya_id],(try_convert(numeric(38, 12),a.odeme_meblegi) ) as amount ,m.payvalue,m.[AzerqazId],m.Status,CASE WHEN m.payvalue > 0 THEN 'MUSBET' ELSE 'MENFI' END,m.[ServiceID] from Avqust2019.[dbo].AzerqazItron m
full join Avqust2019.[dbo].itronall a
on a.[tranzaksiya_id] = m.[AzerqazId]
--and a.[paymentamnt] = m.[paymentamnt]  
WHERE  
 --or 

  (a.[tranzaksiya_id] is null and m.Status=2) or
 m.[AzerqazId] is  null 
 or (a.[tranzaksiya_id] is not null and m.Status=3 and not exists (select * from Avqust2019.[dbo].AzerqazItron c where c.[AzerqazId] =m.[AzerqazId] and c.status=2))
  
group by a.[tranzaksiya_id],m.payvalue,m.[AzerqazId],a.odeme_meblegi,m.Status ,m.[ServiceID]


-----------------son


SELECT  count(*) as count, a.[tranzaksiya_id] trn,try_convert(numeric(38, 12),a.odeme_meblegi)  as amount ,m.payvalue mamount,m.[AzerqazId] mtrn,m.Status mstatus,CASE WHEN m.payvalue > 0 THEN 'MUSBET' ELSE 'MENFI' END mnf,m.[ServiceID] 

from [dbo].[AzerqazItron] m
full join [dbo].itronall a
on a.[tranzaksiya_id] = m.[AzerqazId]
--and try_convert(numeric(38, 12),a.odeme_meblegi) = m.payvalue  
WHERE  
 --or 

  (a.[tranzaksiya_id] is  null and m.Status=2) or
 m.[AzerqazId] is   null 
 or (a.[tranzaksiya_id] is not null and m.Status!=2 and not exists (select * from [dbo].AzerqazItron c where c.[AzerqazId] =m.[AzerqazId] and c.status=2))
  
group by a.[tranzaksiya_id],m.payvalue,m.[AzerqazId],a.odeme_meblegi,m.Status ,m.[ServiceID] 

--having count(*)=1
