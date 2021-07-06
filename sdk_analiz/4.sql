/****** Script for SelectTopNRows command from SSMS  ******/
SELECT CAST(p.OsmpProviderID as nvarchar) ID,[Услуга]
      ,sum([Принято])
      ,sum([Принято])
	  ,count([Принято])
	  ,s.ServiceName
	  --,[Статус]

  FROM [Noyabr2020].[dbo].[millikartportal] mk
  left join gate211.dbo.Paymentyeni p on mk.[ID платежа]= p.AgentPaymentid
  left join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
    group by [Услуга],CAST(p.OsmpProviderID as nvarchar),s.ServiceName --,[Статус]
  order by 1
