select AgentPaymentID as AzeriQazID, StatusDate,ReceiveDate, Number, PaySum, Status , CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) Tranzaction

from gate211.dbo.Payment where AgentID=1 and AgentPaymentID in (
359790013,
361650654)
