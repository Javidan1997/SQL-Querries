SELECT id, business_type_class, performedat, type, creationaction_id, def_id, parent_id, version
	FROM public.tx_business_base where id = 'a49e90e4-c801-49b9-a796-a2f17eefab38'
	
	
SELECT id, process_id, tx_id, creationaction_id, deleteaction_id, version
	FROM public.gate_tx_purchase_via_gate where tx_id = 'dc036aad-0a80-4b90-8f22-f11052565319' 
