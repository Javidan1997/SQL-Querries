---rejected
  SELECT  * from TURALTEST.[dbo].[RejectedPayments] a where 
len (RetryStatusName) >14 and DealerName not like '%Kassam.az%' and DealerName not like '%test%'

and Name not like '%OSMP_STATUS_WINDOWS_TERMINAL_OSMP%' and RevokeStatusName not like '%OSMP_STATUS_REV_SUCCESS%' and  convert(numeric(7,2) ,payvalue)!= 0.0 and (comment not like '%uncomp%' or comment is null)


--RusRejectedPayments

SELECT *
FROM [TURALTEST].[dbo].RusRejectedPayments where CAST (PayValue AS numeric) != 0
