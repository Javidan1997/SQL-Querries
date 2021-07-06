with account_balance as (SELECT gt_tx.source_amount,
						gt_tx_def.received_amount  
						 ,gt_tx.id,em_coin.serial,(ha.performedat),gt_tx_def.status,gt_tx_def.external_status,CAST(gt_tx.payer_data::json->(1)->(-2)->(1)->'value' as text) as nm
FROM public.gate_tx_purchase_via_gate via_gate
left join gate_tx gt_tx on via_gate.tx_id=gt_tx.id
left join gate_tx_def gt_tx_def on gt_tx_def.id=gt_tx.def_id
left join emitent_coin em_coin
on em_coin.id = gt_tx.coin_id
left join org_organization src_org
on em_coin.organization_id = src_org.id
--left join gate_tx_def gt_tx_def 
--on gt_tx_def.tx_id=gt_tx.id
left join org_prof_profile dest_profile
on src_org.profile_id = dest_profile.id
inner join org_prof_person_def dest_contact_def
on dest_contact_def.id = dest_profile.persondef_id
left join emitent_coin_def coin_def
on coin_def.coin_id = em_coin.id

inner join history_action ha
on ha.id = gt_tx.creationaction_id
						 

--where gt_tx.id = '016c5310-2484-4c47-9dfa-6bab743e2c93'
where gt_tx_def.status='SUCCESS' and ha.performedat  between  '2020-02-01 04:00:00' and '2020-03-01 04:00:00')


select max(performedat) perform_date,status,nm,serial,id,source_amount,received_amount from account_balance group by serial,status,nm,id,source_amount,received_amount
