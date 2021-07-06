select Paydate,
CAST(PaymentInfo.query('data(r/sessionid)') as nvarchar) RRN,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) TRN_id,Number,PaySum,AgentPaymentID,PaymentID,
 * from gate.dbo.Payment with(nolock) where AgentID=1 and AgentPaymentID= 370906011
