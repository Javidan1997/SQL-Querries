select * 
into Dekabr2020t.dbo.PaymentAgent18
from gate211.dbo.Payment 

 where (StatusDate between '2020-12-01' and '2021-01-01' )
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) = '18'
