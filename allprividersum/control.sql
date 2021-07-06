SELECT TOP 1000 [ID]
      ,[ServiceName]
      ,[Amount]
      ,[ProviderAmount]
      ,[CommissionAmount]
      ,[Count]
      ,[Agent]
      ,[ProviderName],
	  CASE 
	  when [ProviderName] LIKE '%Azeriqaz%' THEN 1
	  when [ProviderName] LIKE '%Az%rsu%' THEN 2
	  WHEN [ProviderName] LIKE '%Freenet%' THEN 6
	  WHEN [ProviderName] LIKE '%modus%'  THEN 7
	  WHEN [ProviderName] LIKE '%smart home%'  THEN 8
	  WHEN [ProviderName] LIKE '%Access%bank%'  THEN 9
	  WHEN [ProviderName] LIKE '%Amrah%'  THEN 10
	  WHEN [ProviderName] LIKE '%ABB%'  THEN 11
	  WHEN [ProviderName] LIKE '%AT%nk%'  THEN 12
	  WHEN [ProviderName] LIKE '%Avras%'  THEN 13
	  WHEN [ProviderName] LIKE '%btb%'  THEN 14
	  WHEN [ProviderName] LIKE '%baku%'  THEN 15
	  WHEN [ProviderName] LIKE '%respub%'  THEN 16
	  WHEN [ProviderName] LIKE '%vtb%'  THEN 17
	  WHEN [ProviderName] LIKE '%emba%'  THEN 18
	  WHEN [ProviderName] LIKE '%ideal%'  THEN 19
	  WHEN [ProviderName] LIKE '%qafqaz%B%'  THEN 20
	  WHEN [ProviderName] LIKE '%finca%'  THEN 21
	  WHEN [ProviderName] LIKE '%nk%maliyy%'  THEN 22	  
	  WHEN [ProviderName] LIKE '%kapi%'  THEN 23
	  WHEN [ProviderName] LIKE '%kredit%'  THEN 24
	  WHEN [ProviderName] LIKE '%Merkuri Yeni%'  THEN 25	  
	  WHEN [ProviderName] LIKE 'M%F%'  THEN 26
	  WHEN [ProviderName] LIKE '%MolBulak%'  THEN 27
	  WHEN [ProviderName] LIKE '%MuganBank%'  THEN 28
	  WHEN [ProviderName] LIKE '%NBCBank%'  THEN 29
	  WHEN [ProviderName] LIKE '%niko%'  THEN 30
	  WHEN [ProviderName] LIKE '%paynet%'  THEN 31
	  WHEN [ProviderName] LIKE '%psg%'  THEN 32
	  WHEN [ProviderName] LIKE '%barat%'  THEN 33
	  WHEN [ProviderName] LIKE '%rabita%'  THEN 34
	  WHEN [ProviderName] LIKE '%tbcc%'  THEN 35
	  WHEN [ProviderName] LIKE '%turan%'  THEN 36

	  WHEN [ProviderName] LIKE '%uniba%'  THEN 37
	  WHEN [ProviderName] LIKE '%yap%kred%'  THEN 38
	  WHEN [ProviderName] LIKE '%stan%nce%'  THEN 39
	  WHEN [ProviderName] LIKE '%atas%'  THEN 40
	  WHEN [ProviderName] LIKE '%meqa%s%'  THEN 41
	  WHEN [ProviderName] LIKE '%PasaHeyat%'  THEN 42
	  WHEN [ProviderName] LIKE '%KATV%'  THEN 43
	  WHEN [ProviderName] LIKE '%alfa%'  THEN 44
	  WHEN [ProviderName] LIKE '%an%media%'  THEN 45
	  WHEN [ProviderName] LIKE '%atv%plus%'  THEN 46
	  WHEN [ProviderName] LIKE '%avirtel%'  THEN 47

	  WHEN [ProviderName] LIKE '%azeronline%'  THEN 48

	  WHEN [ProviderName] LIKE '%az%fiber%net%'  THEN 49
	  WHEN [ProviderName] LIKE '%caspian%'  THEN 50
	  WHEN [ProviderName] LIKE '%clip%'  THEN 51
	  WHEN [ProviderName] LIKE '%data%'  THEN 52	  
	  WHEN [ProviderName] LIKE '%enginet%'  THEN 53
	  WHEN [ProviderName] LIKE '%fibernet%new%'  THEN 54
	  WHEN [ProviderName] LIKE '%fibernet%tel%'  THEN 55
	  WHEN [ProviderName] LIKE '%gsp%'  THEN 56

	  WHEN [ProviderName] LIKE '%izone%'  THEN 57
	  WHEN [ProviderName] LIKE '%connect%new%'  THEN 58

	  WHEN [ProviderName] LIKE '%metro%net%'  THEN 59

	  WHEN [ProviderName] LIKE '%mhm%'  THEN 60

	  WHEN [ProviderName] LIKE '%rahat%'  THEN 61

	  WHEN [ProviderName] LIKE '%smart%'  THEN 62

	  WHEN [ProviderName] LIKE '%odtv%'  THEN 63
	  WHEN [ProviderName] LIKE '%teleport%'  THEN 64

	  WHEN [ProviderName] LIKE '%ultel%'  THEN 65

	  WHEN [ProviderName] LIKE '%ultranet%'  THEN 66


	  WHEN [ProviderName] LIKE '%konakt%home%'  THEN 68


	  WHEN [ProviderName] LIKE '%lalaf%'  THEN 69


	  WHEN [ProviderName] LIKE '%m%r%'  THEN 70


	  WHEN [ProviderName] LIKE '%cyfral%'  THEN 71


	  WHEN [ProviderName] LIKE '%dim%'  THEN 72


	  WHEN [ProviderName] LIKE '%y%m'  THEN 73

	  
	  WHEN [ProviderName] LIKE '%s%naq%'  THEN 74

	  
	  WHEN [ProviderName] LIKE '%lisenzi%'  THEN 75


	  WHEN [ProviderName] LIKE '%yenie%k'  THEN 76


	  WHEN ServiceName LIKE '%us%po%'  THEN 77

	  WHEN ServiceName LIKE '%faberlic%'  THEN 78

	  WHEN ServiceName LIKE '%edu%tec%'  THEN 79


	  WHEN ServiceName LIKE '%nay%'  THEN 80


	  WHEN ServiceName LIKE '%nab%'  THEN 81


	  WHEN [ProviderName] LIKE '%asan%pay%'  THEN 82

	  
	  WHEN [ProviderName] LIKE 'invest'  THEN 83

	  
	  WHEN [ProviderName] LIKE '%rahat%ya%'  THEN 84


	  WHEN [ProviderName] LIKE '%rsad'  THEN 85


	 WHEN ServiceName LIKE '%Socar Petroleum%'  THEN 86

	  --WHEN [ProviderName] LIKE '%d%n%'  THEN 87

	  WHEN [ProviderName] LIKE '%At%ah%'  THEN 88
	  
	  WHEN [ProviderName] LIKE '%LSP%'  THEN 89
	  WHEN ServiceName LIKE '%GameBuy%'  THEN 600
	  WHEN ServiceName LIKE '%KontaktHome%'  THEN 700
	  WHEN ServiceName LIKE '%Leykemiya%'  THEN 800
	  WHEN ServiceName LIKE '%NETMANAT%'  THEN 801
	  WHEN ServiceName LIKE '%tep%'  THEN 900

	  WHEN [ProviderName] LIKE '%mobile%'  THEN 992
	  WHEN [ProviderName] LIKE '%topaz%'  THEN 993
	  WHEN ServiceName LIKE '%Med%nvest%'  THEN 994
	  WHEN [ProviderName] LIKE '%MegaLink%'  THEN 995
	  WHEN [ProviderName] LIKE '%mmko%'  THEN 996
	  WHEN ServiceName LIKE '%n%ro%'  THEN 997
	  
	  WHEN ServiceName LIKE '%socar%'  THEN 997
	  WHEN ServiceName LIKE '%kassam%az%'  THEN 998
	  WHEN ServiceName LIKE '%or%me%'  THEN 999
	  WHEN [ProviderName] LIKE '%raz%n%'  THEN 1000
	  WHEN [ProviderName] LIKE '%starex%'  THEN 1004
	  	 -- WHEN ServiceName LIKE '%bank%'  THEN 12
	   ELSE 100 END qrup
  FROM [TURALTEST].[dbo].iyul 
  -- WHERE [ProviderName] LIKE '%CELL%' 
   order by qrup,ProviderName
