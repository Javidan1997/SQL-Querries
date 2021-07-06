select  Paydate,
CAST(PaymentInfo.query('data(r/sessionid)') as nvarchar) RRN,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) TRN_id,Number,PaySum,AgentPaymentID,PaymentID
into [Noyabr2020t].dbo.Kassamaz

from gate211.dbo.Paymentyeni1 where CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) = '12' and
(StatusDate  between '2020-11-01' and '2020-12-01' ) and
  Status = 2 
