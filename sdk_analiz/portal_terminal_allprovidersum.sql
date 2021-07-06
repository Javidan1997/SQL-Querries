SELECT CAST(p.OsmpProviderID as nvarchar) ID,[Услуга] Servicename
      ,sum([Принято]) Amount
      ,sum([Принято]) prividerAmount
	  ,count([Принято]) count
	  ,s.ServiceName ProviderName
	  --,[Статус]
	  into [Noyabr2020].[dbo].portalterminalaps
  FROM [Noyabr2020].[dbo].portalterminal mk
  left join gate211.dbo.Paymentyeni1 p on mk.[ID платежа]= p.AgentPaymentid
  left join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
    group by [Услуга],CAST(p.OsmpProviderID as nvarchar),s.ServiceName --,[Статус]
  order by 1
