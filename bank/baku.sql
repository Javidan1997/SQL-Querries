SELECT 
PaymentID,AgentPaymentID,Number,PaySum,ProviderSum,
CAST([PaymentInfo].query('data(r/transactionid)') as nvarchar) transactionid ,
CAST([PaymentInfo].query('data(r/providerpaymentid)') as nvarchar) providerpaymentid ,
CAST([PaymentInfo].query('data(r/batchid)') as nvarchar) batchid --,
--*
into May_2019.dbo.BankOfBakuS
FROM gate211.dbo.Payment WHERE AgentID = 1 AND ServiceID in (323,324,325,326)
 --(323,324,325)

and (StatusDate between '2019-05-01' and '2019-06-01') and Status =2

