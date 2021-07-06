SELECT  '21' reqtype
,CONVERT(VARCHAR(10), ProviderDate, 101) date,
AgentPaymentID
      ,[ProviderPaymentIDString] txnid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/inrefid)') as nvarchar) inrefid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/spid)') as nvarchar) spid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/serviceid)') as nvarchar)  serviceid
      ,'994'+[Number] msisdn
         ,[PaySum] paymentamnt,
		 Status

,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/pos_id)') as nvarchar) '06_pos-id'

,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/origintransactionid)') as nvarchar) '37_origintransactionid'

,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/originreciptnumber)') as nvarchar) '42_originreciptnumber'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/origintransactiontime)') as nvarchar) '43_origintransactiontime'
,Number
into .dbo.b
  FROM [gate].[dbo].[Payment] with (nolock) 
  where ServiceID=163
  and (ReceiveDate between '2019-05-01' and '2019-06-01' )
--and status=2
