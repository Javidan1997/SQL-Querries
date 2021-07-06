select statusdate,Number ,Paysum, CAST(ExtraParams.query('data(r/emba_loanid)') as nvarchar) emba_loanid ,CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) trm_prv_id ,* from gate211.dbo.Payment where StatusDate between '2020-08-27' and '2020-09-01'  and ServiceID in (
340,341

) and status=2
