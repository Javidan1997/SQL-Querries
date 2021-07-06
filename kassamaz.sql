select  *
into Iyun_2019.dbo.Kassamaz

from gate211.dbo.Payment where 
(StatusDate between '2019-06-01' and '2019-07-01' ) and
CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) = '12' AND Status = 2 
