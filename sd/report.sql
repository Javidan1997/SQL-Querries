select COALESCE(id_service, case type
when 'CHARGE' then '1018'
when 'gate_charge' then '1018'
when 'GATE_CHARGE' then '1018'
when 'bank_topup' then '1017'
when 'PURCHASE' then 'E-Wallet balansdan provayderə ödəniş(PURCHASE)'
when 'GATE_PURCHASE' then 'E-Wallet balansdan provayderə ödəniş(PURCHASE)'

when 'CLIENT_TRANSACTION_TRANSFER' then '1005'

when 'merchant_invoice' then '1014'
when 'merchant_payment' then 'Terminaldan- E-Wallet İvoice ödənilməsi(merchant_payment)'
when 'bank_redeem' then '1012'
when 'cash_desk_redeem' then '1011'
when 'client_create_prepaid' then 'E-Wallet balansdan -Vaucher yaranması(client_create_prepaid)'
when 'client_charge_prepaid' then '1009'
when 'exchange_transaction' then '1008'

when 'cash_desk_charge' then '1007'
when 'client_transaction_issue' then 'Userin yaranması(client_transaction_issue)'
when 'client_transaction_transfer' then '1005'
when 'REDEEM' then '1003'
when 'gate_redeem' then '1003'

when 'cash_collect' then 'Kassalar arası pul dövriyəsi yığım (cash_collect)'
when 'cash_input' then 'Kassalar arası pul dövriyəsi mədaxil (cash_input)'
when 'cash_investment' then 'Kassya investisiya (cash_investment)'
else id_service
end ) as id_service


,COALESCE (service_name,type),sum(COALESCE(amount,0)),sum(COALESCE(provider_amount,0)),sum(COALESCE(commission_amount,0)),count(*),case agent when 15 then 10 else agent end as agent,COALESCE(provider_name,service_name)
, case type
when 'CHARGE' then 'Terminaldan vs. balansın doldurulması(CHARGE)'
when 'GATE_CHARGE' then 'Terminaldan vs. balansın doldurulması(CHARGE)'

when 'bank_topup' then 'Kartdan balansın doldurulması(bank_topup)'
when 'PURCHASE' then 'E-Wallet balansdan provayderə ödəniş(PURCHASE)'
when 'GATE_PURCHASE' then 'E-Wallet balansdan provayderə ödəniş(PURCHASE)'

when 'merchant_invoice' then 'Terminaldan- E-Wallet İvoice ödənilməsi(merchant_invoice)'
when 'merchant_payment' then 'Terminaldan- E-Wallet İvoice ödənilməsi(merchant_payment)'
when 'bank_redeem' then 'E-Wallet balansdan -karta məxaric(bank_redeem)'
when 'cash_desk_redeem' then 'E-Wallet balansdan -karta məxaric(cash_desk_redeem)'
when 'client_create_prepaid' then 'E-Wallet balansdan -Vaucher yaranması(client_create_prepaid)'
when 'client_charge_prepaid' then 'Vaucherin istifadəsi-Balansa mədaxili(client_charge_prepaid)'
when 'exchange_transaction' then 'Bonusun istifadəsi-Balansa mədaxil(exchange_transaction)'

when 'cash_desk_charge' then 'E-Wallet balansdan -kassa mədaxil(cash_desk_charge)'
when 'client_transaction_issue' then 'Userin yaranması(client_transaction_issue)'
when 'client_transaction_transfer' then 'Balansdan balansa köçürmədir(client_transaction_transfer)'
when 'REDEEM' then 'E-Wallet balansdan məxaric(REDEEM)'
when 'gate_redeem' then 'E-Wallet balansdan məxaric(REDEEM)'

when 'cash_collect' then 'Kassalar arası pul dövriyəsi yığım (cash_collect)'
when 'cash_input' then 'Kassalar arası pul dövriyəsi mədaxil (cash_input)'
when 'cash_investment' then 'Kassya investisiya (cash_investment)'
else type -----'Unknown'
end as comment


from transaction_report_record where (date between  '2020-02-01 04:00:00' and '2020-03-01 04:00:00') --and agent='15' --and type='GATE_PURCHASE_VIA_GATE'
group by id_service,type,service_name,agent,provider_name
