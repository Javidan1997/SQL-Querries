select     
PaymentInfo.value('(r/transactionid/text())[1]', 'varchar(10)') as 'trn' ,
PaymentInfo.value('(r/yxo/text())[1]', 'varchar(10)') as 'yxo' ,
Paysum,
Number,
* from gate211.dbo.Paymentnew where AgentID =1 and AgentPaymentID in (

372100176,
372038442,
372038275,
371998390,
371897771,
371897770,
364066872,
364066736,
364066627,
364066495,
359965292,
348687961,
341415727,
335357745,
332356001,
330264273,
308858246



)
