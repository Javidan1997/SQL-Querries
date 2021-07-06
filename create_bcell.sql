SELECT  '21' reqtype
,CONVERT(VARCHAR(10), ProviderDate, 101) date
      ,[ProviderPaymentIDString] txnid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/inrefid)') as nvarchar) inrefid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/spid)') as nvarchar) spid
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/serviceid)') as nvarchar)  serviceid
      ,'994'+[Number] msisdn
         ,[PaySum] paymentamnt,Status
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/country_id)') as nvarchar) '01_country-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/bank_id)') as nvarchar) '02_bank-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/branch_id)') as nvarchar) '03_branch-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/cashier_id)') as nvarchar) '04_cashier-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/atm_id)') as nvarchar) '05_atm-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/pos_id)') as nvarchar) '06_pos-id'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/cashier_name)') as nvarchar) '10_cashier-name'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/branchaddress)') as nvarchar) '11_branchaddress'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/spsubid)') as nvarchar) '30_spsubid'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/servicetype)') as nvarchar) '31_servicetype'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/bank_code)') as nvarchar) '32_bank-code'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/parenttransid)') as nvarchar) '33_parenttransid'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/origintransactionid)') as nvarchar) '37_origintransactionid'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/originuserid)') as nvarchar) '38_originuserid'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/originreceiverid)') as nvarchar) '39_originreceiverid'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/gppservicecode)') as nvarchar) '40_gppservicecode'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/gppuccode)') as nvarchar) '41_gppuccode'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/originreciptnumber)') as nvarchar) '42_originreciptnumber'
,CAST([PaymentInfo].query('data(root/PaymentInfo/parameterset/origintransactiontime)') as nvarchar) '43_origintransactiontime'
,CAST([PaymentInfo].query('data(root/PaymentInfo/paymentresponse/cause)') as nvarchar) 'cause'
into Aprel2019.dbo.BakcellM211
  FROM [gate].[dbo].[Payment] with (nolock) 
  where ServiceID=163
  and (ReceiveDate between '2019-04-01' and '2019-05-01' )
--and status=2
