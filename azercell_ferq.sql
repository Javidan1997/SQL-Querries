

Select a.Number Number_A,a.SUM_A SUM_A,m.Number Number_M,m.sum_M Amount_M from 
(Select Number,sum(cast(amount as decimal(18,2))) sum_M from [dbo].[AzercellM] where Status='OK' group by Number ) m
Full Join 
(Select Number,sum(cast([Pay Amount] as decimal(18,2))) SUM_A from [dbo].[AzercellAll] group by Number) a
on m.Number = a.Number
Where CAST(a.SUM_A as decimal(18,2))<>CAST(m.sum_M as decimal(18,2)) or a.Number is null or m.Number is null;



Select * from [dbo].[AzercellAll]  where Number in (Select a.Number Number_M from 
(Select Number,sum(cast(amount as decimal(18,2))) sum_M from [dbo].[AzercellM] where Status='OK' group by Number ) m
Full Join 
(Select Number,sum(cast([Pay Amount] as decimal(18,2))) SUM_A from [dbo].[AzercellAll] group by Number) a
on m.Number = a.Number
Where CAST(a.SUM_A as decimal(18,2))<>CAST(m.sum_M as decimal(18,2)) or a.Number is null or m.Number is null
) order by 2;



Select * from [dbo].[AzercellM]  where Number in (Select m.Number Number_M from 
(Select Number,sum(cast(amount as decimal(18,2))) sum_M from [dbo].[AzercellM] where Status='OK' group by Number ) m
Full Join 
(Select Number,sum(cast([Pay Amount] as decimal(18,2))) SUM_A from [dbo].[AzercellAll] group by Number) a
on m.Number = a.Number
Where CAST(a.SUM_A as decimal(18,2))<>CAST(m.sum_M as decimal(18,2)) or a.Number is null or m.Number is null
) order by 3;
