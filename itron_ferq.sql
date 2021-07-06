SELECT  count(*), a.[tranzaksiya_id],(try_convert(numeric(38, 12),a.odeme_meblegi) ),m.payvalue,m.[AzerqazId],m.Status,CASE WHEN m.payvalue > 0 THEN 'MUSBET' ELSE 'MENFI' END from [AzerqazItronM] m
full join [Aprel2019].[dbo].itronall a
on a.[tranzaksiya_id] = m.[AzerqazId]
--and a.[paymentamnt] = m.[paymentamnt]  
WHERE  
 --or 

  (a.[tranzaksiya_id] is null and m.Status=2) or
 m.[AzerqazId] is  null 
 or (a.[tranzaksiya_id] is not null and m.Status=3 and not exists (select * from [AzerqazItronM] c where c.[AzerqazId] =m.[AzerqazId] and c.status=2))
  
group by a.[tranzaksiya_id],m.payvalue,m.[AzerqazId],a.odeme_meblegi,m.Status 
