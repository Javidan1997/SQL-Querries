select CAST(PaymentInfo.query('data(r/serviceName)') as nvarchar), CAST([ExtraParams].query('data(r/classification_code)') as nvarchar),* from gate211.dbo.Payment where AgentID=1 and AgentPaymentID in (403460107,
403460137
--405002361
)
