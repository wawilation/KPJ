CREATE OR REPLACE FUNCTION fn_kpj_patient_cdc() RETURNS VOID AS $$
DECLARE update_rec_count numeric;
DECLARE insert_rec_count numeric;
DECLARE del_rec_count numeric;
DECLARE start_time timestamp with time zone;
DECLARE end_time timestamp with time zone;

BEGIN

start_time := clock_timestamp();
update_rec_count := 0;
insert_rec_count := 0;

SET client_min_messages = error;

DROP TABLE IF EXISTS tmp_patient;

SET client_min_messages = notice;

CREATE TEMPORARY TABLE tmp_patient
(name varchar,
mrnnumber int) DISTRIBUTED BY (name);

INSERT INTO tmp_patient SELECT name, mrnnumber FROM staging_mdmhits2_klgsh.pxf_patients EXCEPT SELECT name, mrnnumber FROM staging_mdmhits2_klgsh.patients;

LOCK TABLE staging_mdmhits2_klgsh.pxf_patients IN EXCLUSIVE MODE;

UPDATE staging_mdmhits2_klgsh.patients
SET 
	name = tmp_patient.name
FROM tmp_patient
WHERE tmp_patient.mrnnumber = staging_mdmhits2_klgsh.patients.mrnnumber;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_mdmhits2_klgsh.patients';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows updated; % rows inserted; % rows deleted', update_rec_count, insert_rec_count, del_rec_count;
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

UPDATE datawarehouse.patient X
SET given_name = Y.name
FROM tmp_patient Y JOIN datawarehouse.patient_identifier Z on Y.mrnnumber = CAST(Z.identifier AS int)
WHERE X.id = Z.patient_id AND Z.id_type = 'KLGSH_MRN';

END;
$$ LANGUAGE plpgsql;
