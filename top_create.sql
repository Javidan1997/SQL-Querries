select * into May_2019.dbo.eTopazM from gate.dbo.Payment
 where ServiceID in( 410,703) and 
 StatusDate between '2019-05-01' and '2019-06-01' and status =2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
