SELECT --top 1 
CAST(ExtraParams.query('data(r/access_idnumber)') as nvarchar(MAX)) as access_idnumber,
CAST(ExtraParams.query('data(r/Access_counter)') as nvarchar(MAX)) as Access_counter,
AgentPaymentID,
PaySum,
case status when 2 then 'success' else 'rejected' end status ,
Number
--* 

FROM gate211.dbo.Payment WHERE StatusDate between '2020-02-01' and '2020-03-01' and

ServiceID in (418 ,419,420,421 ,422,423) ---and  ReceiveDate >'2018-12-01' and Number = '6900283441'
