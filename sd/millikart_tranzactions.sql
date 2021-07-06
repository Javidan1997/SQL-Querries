SELECT id, process_id, tx_id, creationaction_id, deleteaction_id, version
	FROM public.gate_tx_purchase_via_gate where tx_id = 'dc036aad-0a80-4b90-8f22-f11052565319' 

select * from gate_tx
where id = 'dc036aad-0a80-4b90-8f22-f11052565319' 


select * from tx_business_base
--where id ='016c5310-2484-4c47-9dfa-6bab743e2c93' 
limit 10;




SELECT gt_tx_def.status,gt_tx_def.external_status,*
	FROM public.gate_tx_purchase_via_gate via_gate
	left join gate_tx gt_tx on via_gate.tx_id=gt_tx.id
	left join gate_tx_def gt_tx_def on gt_tx_def.id=gt_tx.def_id
	left join emitent_coin em_coin
	on em_coin.id = gt_tx.coin_id
	left join org_organization src_org
	on em_coin.organization_id = src_org.id
	left join org_prof_profile dest_profile
	on src_org.profile_id = dest_profile.id 
	inner join org_prof_person_def dest_contact_def
	on dest_contact_def.id = dest_profile.persondef_id
	--left join emitent_coin_def coin_def
	--on coin_def.coin_id = em_coin.id
	where gt_tx_def.status='SUCCESS'
