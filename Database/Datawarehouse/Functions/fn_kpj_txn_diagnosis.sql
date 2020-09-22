CREATE OR REPLACE FUNCTION fn_kpj_txn_diagnosis() RETURNS VOID AS $$
BEGIN

INSERT INTO txn_diagnosis
SELECT NEXTVAL('txn_diagnosis_seq') - 1, V.*
FROM
(SELECT
	CURRENT_DATE,
	pdiag.diagnosisdatetime,
	CURRENT_DATE,
	pdiag.diagnosisdatetime,
	0,
	0,
	NULL,
	CAST(NULL AS bigint),
	1,
	'DDIAGSTAT2',
	pdiag.text,
	CAST(NULL AS bigint),
	--pdiag.isfinal,
	CAST('t' AS boolean),
	dw_pat.pin
FROM staging_medcubeskpj.patientdiagnosis pdiag JOIN staging_medcubeskpj.patient stg_pat
	ON pdiag.patientid = stg_pat.patientid
JOIN datawarehouse.patient dw_pat
	ON dw_pat.id = stg_pat.dw_patient_id

UNION

SELECT
	CURRENT_DATE,
	pdiag.diagnosisdatetime,
	CURRENT_DATE,
	pdiag.diagnosisdatetime,
	0,
	0,
	NULL,
	CAST(NULL AS bigint),
	1,
	'DDIAGSTAT2',
	pdiag.text,
	CAST(NULL AS bigint),
	--pdiag.isfinal,
	CAST('t' AS boolean),
	dw_pat.pin
FROM staging_medcubeskpj_selangor.patientdiagnosis pdiag JOIN staging_medcubeskpj_selangor.patient stg_pat
	ON pdiag.patientid = stg_pat.patientid
JOIN datawarehouse.patient dw_pat
	ON dw_pat.id = stg_pat.dw_patient_id) V;

END;
$$ LANGUAGE plpgsql;
