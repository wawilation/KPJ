CREATE OR REPLACE FUNCTION fn_kpj_order_billing_detail() RETURNS VOID AS $$
DECLARE insert_rec_count numeric;
DECLARE insert_rec_count2 numeric;
DECLARE update_rec_count numeric;
DECLARE start_time timestamp with time zone;
DECLARE end_time timestamp with time zone;
DECLARE sqlText TEXT;
DECLARE seqCtr bigint;

BEGIN

start_time := clock_timestamp();
insert_rec_count := 0;
seqCtr := 0;


SET client_min_messages = notice;

INSERT INTO order_billing_detail
SELECT NEXTVAL('order_billing_detail_seq') - 1, V.* FROM
(SELECT 
	CURRENT_DATE AS created_by,
	ctxn.updatedate AS created_date,
	CURRENT_DATE AS updated_by,
	ctxn.updatedate AS updated_date,
	ctxn.amount AS amount,
	cmast.description AS description,
	ctxn.chargemasterid AS item_code,
	ctxn.transdate AS order_date,
	'KLGSH' || ctxn.id AS order_no,
	ctxn.quantity AS quantity,
	cmast.description AS service_item_code,
	bh.id AS billing_header_id,
	dep.dw_dept_id AS department_id,
	'DEFERRED' AS order_payment_status,
	'OTHERS' AS classification,
	CAST('f' AS boolean) AS hmo_item,
	NULL AS immediate_payment_receipt_no,
	(SELECT dw_dept_id FROM staging_mdmhits2_klgsh.departments WHERE id = COALESCE(ctxn.issuedepartmentid, ctxn.departmentid)) AS perf_department_id,
	CAST('f' AS boolean) AS cancelled,		
	CAST('f' AS boolean) AS stat,
	CAST(NULL AS timestamp) AS scheduled_date,
	COALESCE(ctxn.discountamount,0) * (-1) AS discount_amount_immediate,
	0 AS discount_amount_auto,
	NULL AS discount_type_auto,
	ctxn.discountcode AS discount_type_immediate,
	'KLGSH' || ctxn.packageheaderid AS package_order_no,
	ctxn.billed AS dispensed,
	ctxn.billdate AS dispense_date,
	CAST('f' AS boolean) AS doh,
	CAST('f' AS boolean) AS credit_limit,
	NULL AS item_tag,
	CAST('f' AS boolean) AS free_good,
	NULL AS queue_no,
	0 AS package_item_amount,
	CAST('f' AS boolean) AS auto_dispense,
	NULL
FROM
staging_mdmhits2_klgsh.chargetransactions ctxn JOIN staging_mdmhits2_klgsh.chargemasters cmast
	ON ctxn.chargemasterid = cmast.id
JOIN staging_mdmhits2_klgsh.episodes ep
	ON ep.id = ctxn.episodeid
JOIN datawarehouse.billing_header bh
	ON ep.dw_encounter_id = bh.billing_encounter
JOIN staging_mdmhits2_klgsh.departments dep
	ON dep.id = COALESCE(ctxn.departmentid, ctxn.issuedepartmentid)
WHERE bh.billing_header_type = 'IMMEDIATE' AND (ctxn.departmentid IS NOT NULL OR ctxn.issuedepartmentid IS NOT NULL)

UNION

SELECT 
	CURRENT_DATE AS created_by,
	ctxn.updatedate AS created_date,
	CURRENT_DATE AS updated_by,
	ctxn.updatedate AS updated_date,
	ctxn.amount AS amount,
	cmast.description AS description,
	ctxn.chargemasterid AS item_code,
	ctxn.transdate AS order_date,
	'KSLG' || ctxn.id AS order_no,
	ctxn.quantity AS quantity,
	cmast.description AS service_item_code,
	bh.id AS billing_header_id,
	dep.dw_dept_id AS department_id,
	'DEFERRED' AS order_payment_status,
	'OTHERS' AS classification,
	CAST('f' AS boolean) AS hmo_item,
	NULL AS immediate_payment_receipt_no,
	(SELECT dw_dept_id FROM staging_mdmhits2_kslg.departments WHERE id = COALESCE(ctxn.issuedepartmentid, ctxn.departmentid)) AS perf_department_id,
	CAST('f' AS boolean) AS cancelled,		
	CAST('f' AS boolean) AS stat,
	CAST(NULL AS timestamp) AS scheduled_date,
	COALESCE(ctxn.discountamount,0) * (-1) AS discount_amount_immediate,
	0 AS discount_amount_auto,
	NULL AS discount_type_auto,
	ctxn.discountcode AS discount_type_immediate,
	'KSLG' || ctxn.packageheaderid AS package_order_no,
	ctxn.billed AS dispensed,
	ctxn.billdate AS dispense_date,
	CAST('f' AS boolean) AS doh,
	CAST('f' AS boolean) AS credit_limit,
	NULL AS item_tag,
	CAST('f' AS boolean) AS free_good,
	NULL AS queue_no,
	0 AS package_item_amount,
	CAST('f' AS boolean) AS auto_dispense,
	NULL
FROM
staging_mdmhits2_kslg.chargetransactions ctxn JOIN staging_mdmhits2_kslg.chargemasters cmast
	ON ctxn.chargemasterid = cmast.id
JOIN staging_mdmhits2_kslg.episodes ep
	ON ep.id = ctxn.episodeid
JOIN datawarehouse.billing_header bh
	ON ep.dw_encounter_id = bh.billing_encounter
JOIN staging_mdmhits2_kslg.departments dep
	ON dep.id = COALESCE(ctxn.departmentid, ctxn.issuedepartmentid)
WHERE bh.billing_header_type = 'IMMEDIATE' AND (ctxn.departmentid IS NOT NULL OR ctxn.issuedepartmentid IS NOT NULL)) V;


GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.order_billing_detail';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows inserted', insert_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


END;
$$ LANGUAGE plpgsql;
