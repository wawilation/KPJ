CREATE OR REPLACE FUNCTION fn_kpj_encounter() RETURNS VOID AS $$
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

INSERT INTO datawarehouse.encounter (id, created_by,created_date,updated_by,updated_date,acct_class,admission_dt,admission_type,discharge_dt,discharge_disposition,
patient_class,room,room_type,visit_no,patient_id,room_class,room_in,credit_limit,version,admitted_by,vip,isolation,admission_case,guest,notify,migrate_flag,pathologic,turn_in,encounter_status,department_id, source_id, has_credit_balance)
SELECT NEXTVAL('encounter_seq') - 1, V.* FROM
(SELECT 
CURRENT_DATE AS created_by,
ep.updatedate AS created_date,
CURRENT_DATE AS updated_by,
ep.updatedate AS updated_date,
'INDIVIDUAL' AS acct_class,
ep.admissiondate AS admission_dt, 
CASE WHEN ep.episodetypeid IN ('OTC','OP') THEN NULL
     WHEN ep.episodetypeid IN ('IP','DP') THEN 'ROUTINE'
     ELSE NULL
END AS admission_type,
ep.dischargedate AS discharge_dt, 
CASE
	WHEN ep.dischargedate IS NOT NULL THEN 'IMPROVED'
	ELSE NULL
END AS discharge_disposition,
CASE
	WHEN ep.episodetypeid = 'IP' THEN 'INPATIENT'
	WHEN ep.episodetypeid IN ('OTC','OP','DP') THEN 'INPATIENT'
END AS patient_class,
ep.wardid AS room,
'DEFAULT' AS room_type,
'KLGSH' || ep.episodeno AS visit_no,
pt.dw_patient_id AS patient_id,
'DEFAULT' AS room_class,
CAST('f' AS boolean) AS room_in,
0 AS credit_limit,
0 AS version,
CURRENT_DATE AS admitted_by,
CAST('f' AS boolean) AS vip,
CAST('f' AS boolean) AS isolation,
CASE ep.casetypeid
	WHEN 'CONS' THEN 'CON' 
	WHEN 'MATE' THEN 'MAT'
	WHEN 'ORTO' THEN 'ORTH'
	WHEN 'PAED' THEN 'PAE'
	WHEN 'SURG' THEN 'SUR'
	WHEN 'MRpt' THEN 'MR'
	WHEN 'P.SG' THEN 'PSG'
	WHEN 'O&G'THEN 'OG'
END AS admission_case,
CAST('f' AS boolean) AS guest,
'N' as notify,
'N' AS migrate_flag,
CAST('f' AS boolean) AS pathologic,
CAST('f' AS boolean) AS turn_in,
CASE ep.dischargedate
	WHEN NULL THEN 'ADMITTED'
	ELSE 'DISCHARGED'
END AS encounter_status,
(SELECT dep.dw_dept_id FROM staging_mdmhits2_klgsh.departments dep WHERE ep.registrationdeptid = dep.code),
'KLGSH-' || ep.id,
CAST('f' AS boolean) AS has_credit_balance
FROM staging_mdmhits2_klgsh.episodes ep JOIN (SELECT DISTINCT id, dw_patient_id FROM staging_mdmhits2_klgsh.patients) pt
	ON ep.patientid = pt.id
WHERE ep.status <> 'CAN' AND dw_patient_id IS NOT NULL

UNION

SELECT 
CURRENT_DATE AS created_by,
ep.updatedate AS created_date,
CURRENT_DATE AS updated_by,
ep.updatedate AS updated_date,
'INDIVIDUAL' AS acct_class,
ep.admissiondate AS admission_dt, 
CASE WHEN ep.episodetypeid IN ('OTC','OP') THEN NULL
     WHEN ep.episodetypeid IN ('IP','DP') THEN 'ROUTINE'
     ELSE NULL
END AS admission_type,
ep.dischargedate AS discharge_dt, 
CASE
	WHEN ep.dischargedate IS NOT NULL THEN 'IMPROVED'
	ELSE NULL
END AS discharge_disposition,
CASE
	WHEN ep.episodetypeid = 'IP' THEN 'INPATIENT'
	WHEN ep.episodetypeid IN ('OTC','OP','DP') THEN 'INPATIENT'
END AS patient_class,
ep.wardid AS room,
'DEFAULT' AS room_type,
'KSLG' || ep.episodeno AS visit_no,
pt.dw_patient_id AS patient_id,
'DEFAULT' AS room_class,
CAST('f' AS boolean) AS room_in,
0 AS credit_limit,
0 AS version,
CURRENT_DATE AS admitted_by,
CAST('f' AS boolean) AS vip,
CAST('f' AS boolean) AS isolation,
CASE ep.casetypeid
	WHEN 'CON' THEN 'CONS' 
	WHEN 'MAT' THEN 'MATE'
	WHEN 'ORTH' THEN 'ORTO'
	WHEN 'PAE' THEN 'PAED'
	WHEN 'SUR' THEN 'SURG'
	WHEN 'MR' THEN 'MRpt'
	WHEN 'PSG' THEN 'P.SG'
	WHEN 'OG'THEN 'O&G'
END AS admission_case,
CAST('f' AS boolean) AS guest,
'N' as notify,
'N' AS migrate_flag,
CAST('f' AS boolean) AS pathologic,
CAST('f' AS boolean) AS turn_in,
CASE ep.dischargedate
	WHEN NULL THEN 'ADMITTED'
	ELSE 'DISCHARGED'
END AS encounter_status,
(SELECT dep.dw_dept_id FROM staging_mdmhits2_kslg.departments dep WHERE ep.registrationdeptid = dep.code),
'KSLG-' || ep.id,
CAST('f' AS boolean) AS has_credit_balance
FROM staging_mdmhits2_kslg.episodes ep JOIN (SELECT DISTINCT id, dw_patient_id FROM staging_mdmhits2_kslg.patients) pt
	ON ep.patientid = pt.id
WHERE ep.status <> 'CAN' AND dw_patient_id IS NOT NULL) V;


GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.encounter';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows inserted', insert_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


/******************** DQ **********************/
/**update visit_no with padded ID**/
--KPJ prefix temp. Fix!
UPDATE datawarehouse.encounter SET visit_no = 'KPJ' || LPAD(id::text, 10, '0');

/**update backdate to false**/
UPDATE datawarehouse.encounter SET backdate = CAST('f' AS boolean);


/**update dw_encounter_id on source tables**/
--start_time := clock_timestamp();
UPDATE staging_mdmhits2_klgsh.episodes stg
	SET dw_encounter_id = dw.id 
FROM datawarehouse.encounter dw
WHERE LEFT(dw.source_id, 5) = 'KLGSH' AND stg.id = SUBSTRING(source_id from 7 for LENGTH(source_id) - 6);

--start_time := clock_timestamp();
UPDATE staging_mdmhits2_kslg.episodes stg
	SET dw_encounter_id = dw.id 
FROM datawarehouse.encounter dw
WHERE LEFT(dw.source_id, 4) = 'KSLG' AND stg.id = SUBSTRING(source_id from 6 for LENGTH(source_id) - 5);


/**billing_header**/
INSERT INTO datawarehouse.billing_header (id, created_by, created_date, updated_by, updated_date, open, billing_header_type, billing_encounter)
SELECT NEXTVAL('billing_header_seq') - 1, dw.created_by, dw.created_date, dw.updated_by, dw.updated_date, CAST('f' AS boolean), 'IMMEDIATE', dw.id
FROM datawarehouse.encounter dw;

INSERT INTO datawarehouse.billing_header (id, created_by, created_date, updated_by, updated_date, open, billing_header_type, billing_encounter)
SELECT NEXTVAL('billing_header_seq') - 1, dw.created_by, dw.created_date, dw.updated_by, dw.updated_date, CAST('f' AS boolean), 'PROFESSIONAL_FEE', dw.id
FROM datawarehouse.encounter dw;

/**encounter_doctor**/
--DOCTOR 1:
INSERT INTO datawarehouse.encounter_doctor (visit_id, doctor_id, doctor_type, primary_flag,  phic_eligible, phic_eligible_as_of)
SELECT * FROM 
(SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	CAST('t' AS boolean) AS primary_flag,
	CAST('f' AS boolean) AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_klgsh.episodes a JOIN staging_mdmhits2_klgsh.doctors b 
	ON a.admittingdoctorid=b.id 
WHERE dw_encounter_id IS NOT NULL
UNION
SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	CAST('t' AS boolean) AS primary_flag,
	CAST('f' AS boolean) AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_kslg.episodes a JOIN staging_mdmhits2_kslg.doctors b 
ON a.admittingdoctorid=b.id WHERE dw_encounter_id IS NOT NULL) a;

--DOCTOR 2:
INSERT INTO datawarehouse.encounter_doctor (visit_id, doctor_id, doctor_type, primary_flag,  phic_eligible, phic_eligible_as_of)
SELECT * FROM 
(SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	CAST('f' AS boolean) AS primary_flag,
	CAST('f' AS boolean) AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_klgsh.episodes a JOIN staging_mdmhits2_klgsh.doctors b 
	ON a.attendingdoctorid=b.id 
WHERE dw_encounter_id IS NOT NULL
UNION
SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	CAST('f' AS boolean) AS primary_flag,
	CAST('f' AS boolean) AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_kslg.episodes a JOIN staging_mdmhits2_kslg.doctors b 
	ON a.attendingdoctorid=b.id 
WHERE dw_encounter_id IS NOT NULL) a;

--DOCTOR 3:
INSERT INTO datawarehouse.encounter_doctor (visit_id, doctor_id, doctor_type, primary_flag,  phic_eligible, phic_eligible_as_of)
SELECT * FROM 
(SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	false AS primary_flag,
	false AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_klgsh.episodes a JOIN staging_mdmhits2_klgsh.doctors b 
	ON a.referringdoctorid=b.id 
WHERE dw_encounter_id IS NOT NULL
UNION
SELECT 
	a.dw_encounter_id AS visit_id,
	b.dw_doctor_id AS doctor_id,
	'ATTENDING' AS doctor_type,
	CAST('f' AS boolean) AS primary_flag,
	CAST('f' AS boolean) AS phic_eligible,
	CAST(NULL AS timestamp) 
FROM staging_mdmhits2_kslg.episodes a JOIN staging_mdmhits2_kslg.doctors b 
	ON a.referringdoctorid=b.id 
WHERE dw_encounter_id IS NOT NULL) a;

/**encounter_diagnosis**/
INSERT INTO datawarehouse.encounter_diagnosis
SELECT 
	NEXTVAL('encounter_diagnosis_seq') - 1,
	CURRENT_DATE,
	V.diagnosisdate,
	CURRENT_DATE,
	V.diagnosisdate,
	NULL,
	'FINAL',
	V.dw_encounter_id,
	NULL,
	V.diagnosisid,
	NULL,		
	NULL
FROM
(SELECT ep.dw_encounter_id, epdiag.diagnosisid, epdiag.diagnosisdate
FROM staging_mdmhits2_klgsh.episodediagnosis epdiag JOIN staging_mdmhits2_klgsh.episodes ep
	ON epdiag.episodeid = ep.id 

UNION

SELECT ep.dw_encounter_id, epdiag.diagnosisid, epdiag.diagnosisdate
FROM staging_mdmhits2_kslg.episodediagnosis epdiag JOIN staging_mdmhits2_kslg.episodes ep
	ON epdiag.episodeid = ep.id) V;

--update description on encounter_diagnosis
UPDATE datawarehouse.encounter_diagnosis diag
SET description = ref.description
FROM datawarehouse.ref_icd10 ref
	WHERE diag.display_value = ref.code;

--update patient encounter_id 
UPDATE patient pat
	SET encounter_id = X.encounter_id
FROM (SELECT a.id AS patient_id, b.id AS encounter_id, b.admission_dt
FROM datawarehouse.patient a JOIN datawarehouse.encounter b
	ON a.id = b.patient_id) X
JOIN (SELECT patient_id, MAX(admission_dt) AS max_admission_dt FROM datawarehouse.encounter GROUP BY patient_id) c
	ON X.patient_id = c.patient_id
WHERE pat.id = X.patient_id AND X.admission_dt = c.max_admission_dt;


END;
$$ LANGUAGE plpgsql;
