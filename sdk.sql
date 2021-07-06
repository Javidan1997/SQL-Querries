select case type
when 'CHARGE' then 'Terminaldan vs. balansın doldurulması(CHARGE)'
when 'gate_charge' then 'Terminaldan vs. balansın doldurulması(CHARGE)'

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
end as tipler,service_name,sum(amount),sum(provider_amount),sum(commission_amount),count(*),agent,provider_name from transaction_report_record where date between  '2020-01-01' and '2020-02-01'
group by type,service_name,agent,provider_name
