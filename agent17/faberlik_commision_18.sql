/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [OsmpProviderID]

,s.ServiceName
      
,sum([PaySum]) millikartamont
,sum([PaySum]) paysum

,-sum([PaySum])+sum( [PaySum])
,count(*)

,
sum([PaySum]) Amount ,

sum([PaySum]) -sum(ceiling([PaySum]*1000*5/10000)/100) ProviderAmount,

sum(ceiling([PaySum]*1000*5/10000)/100)


,pp.ProviderName
  FROM [dekabr2020t].[dbo].[PaymentAgent18] pa18
 -- join [dekabr2020t].[dbo].[portal18noyabr] pn
 -- on pn.[ID платежа]=pa18.[AgentPaymentID]
  
join Service s on pa18.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where status=2 and s.ServiceName like '%fab%'
group by [OsmpProviderID]
,s.ServiceName,pp.ProviderName
