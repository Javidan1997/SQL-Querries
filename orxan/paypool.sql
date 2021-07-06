Select Status,Number ,StatusDate,AgentPaymentID,PaySum,Case when CAST([ExtraParams].query('data(r/agt_id)') as nvarchar)='3'  then 'Test' else CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) end Agent,* from gate211.dbo.Payment where ServiceID in
(895,896 ,897,898,899,900,901,902,
903,
908 ,
909 ,
910 ,
911 ,
912 ,
913 ,
914 ,
915 ,
916 ,
917 ,
918 ,
919 ,
920 ,
921 ,
922 ) and StatusDate between '2020-03-01' and '2020-04-01' and Status=2
order by 3 desc
