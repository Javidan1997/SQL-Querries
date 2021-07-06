SELECT CAST(p.OsmpProviderID as nvarchar) ID,mk.[Услуга]
      ,sum(pu.Принято)
      ,sum(pu.[Принято])
	  ,count(pu.[Принято])
	  ,s.ServiceName
	  --,[Статус]
	  into [Noyabr2020].[dbo].millikart legv
  FROM [Noyabr2020].[dbo].[millikartportal] mk
  left join Noyabr2020.dbo.portal_ugursuz pu on pu.[ID платежа]=mk.[ID платежа]
  left join gate211.dbo.Paymentyeni p on mk.[ID платежа]= p.AgentPaymentid
  left join Service s on p.ServiceID=s.ServiceID --join Provider pp on s.ProviderID=pp.ProviderID
    group by mk.[Услуга],CAST(p.OsmpProviderID as nvarchar),s.ServiceName --,[Статус]
  order by 2
