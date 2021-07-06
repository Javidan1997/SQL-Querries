select CAST([ExtraParams].query('data(r/providercreditid)') as varchar(max))  providercreditid,
CAST([ExtraParams].query('data(r/trm_prv_id)') as varchar(max)) trm_prv_id,
CAST([ExtraParams].query('data(r/receipt_num)') as varchar(max)) receipt_num,
StatusDate,
AgentPaymentID,
Number,
PaySum,
* from gate211.dbo.Paymentnew where serviceid =832 and
statusdate between '2020-07-01' and '2020-08-01'
 and Status=2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
