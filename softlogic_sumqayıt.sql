select sum(PaySum),day(StatusDate),count(*) from gate211.dbo.Payment where serviceid=1046 and StatusDate Between '2021-02-01'and'2021-03-01' and status=2
group by day(StatusDate) 
