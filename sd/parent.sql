
WITH tran AS(

select *  
from transactions('2019-06-01 00:00:00.000000 +00:00',

'2019-07-01 00:00:00.000000 +00:00') )

select * from tran parent 
left join tran child
on parent.receiver_wallet_id=child.payer_wallet_id
--and parent.date_time>child.date_time
and parent.amount=child.amount

