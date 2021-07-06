
select 
CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max) ) TRN,
*
into fevral2021.dbo.Payment17
from gate211.dbo.Payment p

where 

 (StatusDate between '2020-12-01' and '2021-01-01' )
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) = '17'
