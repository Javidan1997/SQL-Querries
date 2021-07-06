--Get Report Success
select "P_ID","ID","Service Name", "Amount", "Description", "Agent", "ChargeCommission", "PurchaseCommission", "OtherCommissions"  from (

with commissions as 
	(			
				select cms.* from (select cm."Id",cm."Action",coalesce(cm."ChargeCommission",0) "ChargeCommission",coalesce(cm."PurchaseCommission",0) "PurchaseCommission",0 "OtherCommissions"
				from crosstab( 'select coalesce (tbb.parent_id,tbb.id) id_or_parentid,tbb.creationaction_id, tbb.type, coalesce(tbg.commission,0) from tx_business_gate tbg 
					left join tx_business_base tbb ON tbg.id=tbb.id
					left join tx_business_base_def tbbd on tbb.def_id =tbbd.id 
					where tbbd.status=''processed''
					order by 1,2'
							,$$VALUES ('gate_charge'::text), ('gate_purchase'::text) $$) 
				as cm ("Id" text, "Action" text,"ChargeCommission" numeric, "PurchaseCommission" numeric)
				union
				select  tbb.id "Id",tbb.creationaction_id "Action",0 "ChargeCommission",0 "PurchaseCommission",coalesce(commission,0) "OtherCommissions"
					from tx_business_base tbb 
					left join tx_business_base_def tbbd on tbb.def_id =tbbd.id  
					left join tx_business_gate tbg on tbb.id=tbg.id 
					where tbb.type not in ('gate_purchase_via_gate','gate_charge','gate_purchase') and tbbd.status ='processed') cms
				
				left join history_action ha on ha.id=cms."Action"
				where ha.performedat >='2021-02-01' and ha.performedat <'2021-03-01'
	)
	,product_purchases as ( 
			select
				 gpp.tx_id,
				 gpd.id prdef_id,
				 gp.external_id, 
				 egpd.emanat_details::json -> 'details'  ->> 'lName' display_name,
				 egpd.emanat_details::json -> 'details'  ->> 'sName' description
				 from gate_product_purchase gpp 
				 left join gate_product_def gpd on gpp.product_id =gpd.id 
				 inner join gate_product gp on gpd.product_id =gp.id 
				 inner join emanat_gate_product egp on gp.external_id =egp.external_id 
				 inner join emanat_gate_product_def egpd on egp.def_id =egpd.id 
	)
	select gtd.external_id "P_ID",pp.external_id::text  "ID",pp.display_name "Service Name",pp.description "Description",tbb.id "Process ID", gtd.amount_to_send "Amount", t."ChargeCommission",t."PurchaseCommission",t."OtherCommissions",gtd.amount_to_send+t."ChargeCommission"+t."PurchaseCommission" "Total",'17' "Agent" from commissions t 
		inner join tx_business_base tbb on tbb.parent_id =t."Id" and tbb."type" ='gate_purchase'
		left join tx_business_base_def tbbd on tbb.def_id =tbbd.id
		inner join gate_tx gt on gt.process_id =tbb.id
		inner join gate_tx_def gtd on gt.def_id =gtd.id
		left join product_purchases pp on gt.id=pp.tx_id
		where  gtd.status='SUCCESS'
	union 
	select gtd.external_id "P_ID",pp.external_id::text  "ID",pp.display_name "Service Name",pp.description "Description",tbb.id "Process ID", gtd.amount_to_send "Amount", t."ChargeCommission",t."PurchaseCommission",t."OtherCommissions",gtd.amount_to_send+t."ChargeCommission"+t."PurchaseCommission" "Total",'18' "Agent" from commissions t 
		inner join tx_business_base tbb on tbb.id =t."Id" and tbb."type" ='gate_purchase'
		left join tx_business_base_def tbbd on tbb.def_id =tbbd.id
		inner join gate_tx gt on gt.process_id =tbb.id
		inner join gate_tx_def gtd on gt.def_id =gtd.id
		left join product_purchases pp on gt.id=pp.tx_id
		where  gtd.status='SUCCESS'
) a
where "Agent"='17'
--"Service Name" = 'Bakcell' and
--group by "Agent","ID","Service Name", "Description"
--order by "Description";
