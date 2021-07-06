(Select * from 
(Select Number,sum(cast(amount as decimal(18,2))) sum_M from [dbo].[AzercellM] where Status=2 group by Number ) m
Full Join 
(Select Number,sum(cast([Pay Amount] as decimal(18,2))) SUM_A from [dbo].[AzercellAll] group by Number) a
on m.Number = a.Number
Where CAST(a.SUM_A as decimal(18,2))<>CAST(m.sum_M as decimal(18,2)) or a.Number is null or m.Number is null
) 
