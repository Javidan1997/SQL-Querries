DECLARE @DateFrom DATETIME
DECLARE @DateTo DATETIME

SET @DateFrom='2020-08-01'

SET @DateTo='2020-09-01'


SELECT '21' reqtype
,ProviderDate
,AgentPaymentID
      ,[ProviderPaymentIDString] txnid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/inrefid)') as nvarchar) inrefid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/spid)') as nvarchar) spid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/serviceid)') as nvarchar)  serviceid
      ,'994'+[Number] msisdn
         ,[PaySum] paymentamnt,
		 Status

,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/pos_id)') as nvarchar) '06_pos-id'

,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/origintransactionid)') as nvarchar) '37_origintransactionid'
,CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) alma

,Number

into Avqust2020.dbo.BakcellM
  FROM [gate211].[dbo].[Payment] with (nolock) 
  where ServiceID=163
  and (StatusDate between @DateFrom and @DateTo )
  and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
