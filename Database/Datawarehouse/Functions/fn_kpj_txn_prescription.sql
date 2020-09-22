CREATE OR REPLACE FUNCTION fn_kpj_txn_prescription() RETURNS VOID AS $$

BEGIN

SET client_min_messages = error;
DROP TABLE IF EXISTS tmp_txn_prescription;
SET client_min_messages = notice;

CREATE TEMPORARY TABLE tmp_txn_prescription
(id bigint,
created_date timestamp,
updated_date timestamp,
pin varchar(16),
pmeddos_createddatetime timestamp,
pmeddos_dosage varchar(2000),
pmeddos_end_date timestamp,
pmeddos_item_code varchar(255),
pmeddos_quantity double precision,
pmeddos_sig_remarks varchar(2000),
pmeddos_start_date timestamp)
DISTRIBUTED BY (id);	

INSERT INTO tmp_txn_prescription
SELECT NEXTVAL('txn_prescription_seq') - 1, V.*
FROM
(		SELECT
			pmed.createddatetime AS created_date,
			pmed.createddatetime AS updated_date,
			dw_pat.pin AS pin,
			--txn_prescription_detail cols
			pmeddos.createddatetime AS pmeddos_createddatetime,
			pmeddos.syntaxfulltext AS pmeddos_dosage,
			pmeddos.validto AS pmeddos_end_date,
			pmeddos.medicationdrugid AS pmeddos_item_code,
			COALESCE(pmeddos.chargeqty,0) AS pmeddos_quantity,
			pmeddos.syntax AS pmeddos_sig_remarks,
			pmeddos.validfrom AS pmeddos_start_date

		FROM staging_medcubeskpj.patientmedprescription pmed JOIN staging_medcubeskpj.patient stg_pat
			ON pmed.patientid = stg_pat.patientid
		JOIN datawarehouse.patient dw_pat
			ON dw_pat.id = stg_pat.dw_patient_id
		JOIN staging_medcubeskpj.patientmeddosage pmeddos
			ON pmeddos.patientmedprescriptionpkid = pmed.pkid
		WHERE pmeddos.medicationdrugid IS NOT NULL

		UNION

		SELECT
			pmed.createddatetime AS created_date,
			pmed.createddatetime AS updated_date,
			dw_pat.pin AS pin,
			--txn_prescription_detail cols
			pmeddos.createddatetime AS pmeddos_createddatetime,
			pmeddos.syntaxfulltext AS pmeddos_dosage,
			pmeddos.validto AS pmeddos_end_date,
			pmeddos.medicationdrugid AS pmeddos_item_code,
			COALESCE(pmeddos.chargeqty,0) AS pmeddos_quantity,
			pmeddos.syntax AS pmeddos_sig_remarks,
			pmeddos.validfrom AS pmeddos_start_date

		FROM staging_medcubeskpj_selangor.patientmedprescription pmed JOIN staging_medcubeskpj_selangor.patient stg_pat
			ON pmed.patientid = stg_pat.patientid
		JOIN datawarehouse.patient dw_pat
			ON dw_pat.id = stg_pat.dw_patient_id
		JOIN staging_medcubeskpj_selangor.patientmeddosage pmeddos
			ON pmeddos.patientmedprescriptionpkid = pmed.pkid
		WHERE pmeddos.medicationdrugid IS NOT NULL
) V;		

INSERT INTO datawarehouse.txn_prescription
SELECT 
	id,
	CURRENT_DATE,
	created_date,
	CURRENT_DATE,
	updated_date,
	0,
	0,
	NULL,
	'DPRESCTYPE1' AS type,
	pin
FROM tmp_txn_prescription;

INSERT INTO datawarehouse.txn_prescription_detail
SELECT 
	id,
	CURRENT_DATE,
	pmeddos_createddatetime,
	CURRENT_DATE,
	pmeddos_createddatetime,
	0,
	pmeddos_dosage,
	pmeddos_end_date,
	pmeddos_item_code,
	0,
	pmeddos_quantity,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	pmeddos_sig_remarks,
	pmeddos_start_date,
	id,
	NULL
FROM tmp_txn_prescription;

END;
$$ LANGUAGE plpgsql;
