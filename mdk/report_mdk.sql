Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2019-06-01'
 set @DateTo = '2019-07-01'
 
SELECT  CAST(PaymentInfo.query('data(r/transactionid)') as nvarchar) as TransactionID, CASE 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (001,002,003,004,005, 006, 007,008,009,010,011,012) THEN N'1 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (305,306,309) THEN N'2 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (200,201,202,506,507,508) THEN N'3 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) = 308 THEN N'4 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (301,302,303,304) THEN N'5 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (606,607,608,907) THEN N'6 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (509,510,610,611,609) THEN N'7 saylı ərazi idarəsi' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (804,805,806,808) THEN N'8 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (405,406,407) THEN N'9 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (801,802,803) THEN N'10 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (504,505) THEN N'11 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (403,404) THEN N'12 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (807,809,908,909,910,911) THEN N'13 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (307,409,410) THEN N'14 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (501,502,503) THEN N'15 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (408,904,905,906) THEN N'16 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (901,902,903) THEN N'17 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (401,402) THEN N'18 saylı ərazi idarəsi'
END as SBA
 ,N'Dövlət rüsumu' as XH_DR
, CASE 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (001,002,003,004,005, 006, 007,008,009,010,011,012) THEN N'Bakı şəhəri Vergilər Departamenti' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (200,201,202) THEN N'12 saylı ƏVİ' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=301 THEN N'Qusar YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=302 THEN N'Xaçmaz YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=303 THEN N'Quba YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=304 THEN N'Şabran YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=305 THEN N'Siyəzən YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=306 THEN N'Xızı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=307 THEN N'Qobustan YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=308 THEN N'Abşeron YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=309 THEN N'Sumqayıt YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=401 THEN N'Balakən YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=402 THEN N'Zaqatala YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=403 THEN N'Qax YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=404 THEN N'Şəki YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=405 THEN N'Oğuz YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=406 THEN N'Qəbələ YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=407 THEN N'İsmayıllı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=408 THEN N'Göyçay YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=409 THEN N'Ağsu YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=410 THEN N'Şamaxı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=501 THEN N'Qazax YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=502 THEN N'Ağstafa YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=503 THEN N'Tovuz YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=504 THEN N'Şəmkir YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=505 THEN N'Gədəbəy YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=506 THEN N'Daşkəsən YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=507 THEN N'Samux YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=508 THEN N'Göygöl YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=509 THEN N'GoranBoy YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=510 THEN N'Naftalan YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=606 THEN N'Füzuli YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=607 THEN N'Beyləqan YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=608 THEN N'Ağcabədi YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=609 THEN N'Ağdam YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=610 THEN N'Bərdə YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=611 THEN N'Tərtər YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=801 THEN N'Astara YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=802 THEN N'Lənkəran YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=803 THEN N'Lerik YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=804 THEN N'Yardımlı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=805 THEN N'Masallı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=806 THEN N'Cəlilabad YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=807 THEN N'Neftçala YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=808 THEN N'Biləsuvar YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=809 THEN N'Salyan YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=901 THEN N'Yevlax YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=902 THEN N'Mingəçevir YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=903 THEN N'Ağdaş YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=904 THEN N'Ucar YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=905 THEN N'Zərdab YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=906 THEN N'Kürdəmir YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=907 THEN N'İmişli YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=908 THEN N'Saatlı YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=909 THEN N'Sabirabad YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=910 THEN N'Hacıqabul YXO' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar)=911 THEN N'Şirvan YXO' 

	  END as YXO
     ,Number,  CONVERT(VARCHAR(19), ProviderDate, 120) DateTime, CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as overpaid, CAST(PaymentInfo.query('data(r/debt)') as nvarchar) as debt
	  
      ,[PaySum] Amount
      ,[ProviderSum] - CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2)) as ProviderSum
      ,[CommissionSum]
      ,([CommissionSum] + CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2))) as Comission
      ,CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) as accountCode
, AgentTerminalID
      
	  FROM [gate211].[dbo].[Payment] with (nolock) 

  where ServiceID=254 and Status=2 and  (PayDate BETWEEN @DateFrom and @DateTo)

  UNION ALL
  SELECT CAST(PaymentInfo.query('data(r/transactionid)') as nvarchar) as TransactionID, CASE 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (001,002,003,004,005, 006, 007,008,009,010,011,012) THEN N'1 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (305,306,309) THEN N'2 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (200,201,202,506,507,508) THEN N'3 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) = 308 THEN N'4 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (301,302,303,304) THEN N'5 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (606,607,608,907) THEN N'6 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (509,510,610,611,609) THEN N'7 saylı ərazi idarəsi' 
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (804,805,806,808) THEN N'8 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (405,406,407) THEN N'9 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (801,802,803) THEN N'10 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (504,505) THEN N'11 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (403,404) THEN N'12 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (807,809,908,909,910,911) THEN N'13 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (307,409,410) THEN N'14 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (501,502,503) THEN N'15 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (408,904,905,906) THEN N'16 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (901,902,903) THEN N'17 saylı ərazi idarəsi'
WHEN CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) in (401,402) THEN N'18 saylı ərazi idarəsi'
END as SBA

 ,N'Xidmət Haqqı' as XH_DR
 
, '' YXO
,Number,  CONVERT(VARCHAR(19), ProviderDate, 120) DateTime, CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as overpaid, 
CAST(PaymentInfo.query('data(r/debt)') as nvarchar) as debt
      ,[PaySum] Amount
      ,[ProviderSum] - CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2)) as ProviderSum
      ,[CommissionSum]
	  ,([CommissionSum] + CAST(CAST(PaymentInfo.query('data(r/overpaid)') as nvarchar) as decimal(7,2))) as Comission
      ,CAST(PaymentInfo.query('data(r/accountcode)') as nvarchar) as accountCode
, AgentTerminalID
	  FROM [gate211].[dbo].[Payment] with (nolock) 
  where ServiceID=255 and Status=2 and   (PayDate BETWEEN @DateFrom and @DateTo)
