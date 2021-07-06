
update gate.dbo.Payment

SET extraparams = REPLACE(CAST(extraparams AS NVARCHAR(MAX)), '<ailerrn>0</ailerrn>', '<ailerrn>50348870</ailerrn>')

 where AgentID=1 and AgentPaymentID=476851968
----select * from gate.dbo.Payment where AgentID=1 and AgentPaymentID=476851968
