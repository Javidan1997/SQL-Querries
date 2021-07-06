select  Paydate,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,Number,PaySum,
case status when 2 then 'success' else 'rejected' end status , 
* from gate211.dbo.Payment 

where 
ServiceID=391 
and StatusDate between '2019-09-01' and '2019-10-01'
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

----------------------


select  Paydate,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,Number,PaySum,
case status when 2 then 'success' else 'rejected' end status , StatusDate,AgentPaymentID,ServiceID
 from gate211.dbo.Payment 

where 
ServiceID=391 
and StatusDate between '2019-09-01' and '2019-10-01'
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

------------------------------------



select  Paydate,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,Number,PaySum,
case status when 2 then 'success' else 'rejected' end status , StatusDate,AgentPaymentID,ServiceID
into Yanvar2020.dbo.DrakarisAll
 from gate211.dbo.Payment 

where 
ServiceID in (
391 ,392,856 , 857 ,
834 ,835 ,836 ,837,
795 ,796 ,797, 798 ,
799 ,800 ,801 ,802 ,
803 ,804 ,805, 806 ,
807 ,808 ,809 ,810 ,
811 ,812 ,813 ,814 ,
815 ,816 ,817 ,818 ,
819 ,820 ,821 ,822,
823,824 ,825 , 826 ,
827 )

and StatusDate between '2020-01-01' and '2020-02-01' and ReceiveDate >'2018-12-01'
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'




select  Paydate,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,Number,PaySum,
case status when 2 then 'success' else 'rejected' end status , StatusDate,AgentPaymentID,ServiceID
into Fevral2019.dbo.DrakarisAll
 from gate211.dbo.Payment 

where 
ServiceID in (
391 ,392,856 , 857 ,
834 ,835 ,836 ,837,
795 ,796 ,797, 798 ,
799 ,800 ,801 ,802 ,
803 ,804 ,805, 806 ,
807 ,808 ,809 ,810 ,
811 ,812 ,813 ,814 ,
815 ,816 ,817 ,818 ,
819 ,820 ,821 ,822,
823,824 ,825 , 826 ,
827,886,885,856,857,837,836,835,834,827,826 )

and StatusDate between '2020-02-01' and '2020-03-01' --and ReceiveDate >'2018-12-01'
and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
