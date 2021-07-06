SELECT 
      [Msisdn ]
	 , Day([Trans Date ]) as day 
	  ,count(*) as count
	  into [Yanvar2020].[dbo].atl_sms
  FROM [Yanvar2020].[dbo].[trn] group by 
      [Msisdn ] ,Day([Trans Date ])
	  order by 1
