CREATE OR REPLACE FUNCTION fn_kpj_patient() RETURNS VOID AS $$
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


INSERT INTO datawarehouse.patient_address 
		(
		    patient_id, city, postal_code, street, address_type, city_id, complete_address_desc, type, country_id, province_id
		)
SELECT NEXTVAL('patient_seq') - 1, CURRENT_DATE, V.updatedate, CURRENT_DATE, V.updatedate, 'f', V.dateofbirth, NULL, V.citizenshipid, NULL, 'f', V.gender, NULL, NULL, 'f', NULL, 
V.languageid, V.maritalstatusid, NULL, V.occupationid, NULL, V.raceid, V.religionid, NULL, NULL, NULL, V.name, NULL, NULL, NULL, 'f', NULL, V.email, 'f', NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, V.companyname, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
NULL, NULL, NULL
FROM
	(SELECT 
		DISTINCT X.areaid, X.active, X.addresstypeid, X.admitic, X.admitperson, X.aeapproveuserid, X.age, X.bloodgroup, X.childno, X.citizenshipid, X.city, 
		X.companyid, X.companyname, X.confidential, X.corpinfo, X.dateofbirth, X.email, X.financialstatus, firstname, X.firstvisit, X.gender, X.h_pphoneno, X.homephoneno, X.housingarea, 
		X.idtypeid, X.languageid, X.lastname, X.lastvisit, X.maritalstatusid, X.medrecord, X.mrnnumber, X.mrntext, X.mrntype, X.name, X.newic, X.newmrn, X.noteexist, X.occupationid, X.officetelno, 
		X.oldic, X.oldmrn, X.otherno, X.othernumber, X.personalemail, X.postalcodeid, X.raceid, X.registrationdate, X.relationshipid, X.religionid, X.staffid, X.stateid, X.status, X.street1, 
		X.street2, X.street3, X.titleid, X.patienttype, X.updatedate, X.updateuserid, X.id, X.picturepath, X.recordstatus, X.description, X.convertedpatientid, X.ismedcare, X.ofcaddresstypeid, 			X.ofcstreet1, X.ofcstreet2, X.ofcstreet3, ofch_pphoneno, X.ofccity, X.blockno, X.ofcemail, X.ofcpostalcodeid, X.ofcareaid, X.ofcstateid
		FROM (SELECT * FROM staging_mdmhits2_klgsh.patients UNION SELECT * FROM staging_mdmhits2_kslg.patients) X
		JOIN (SELECT name, dateofbirth, gender, MAX(updatedate) AS lastupdate, MAX(mrnnumber) AS lastmrnnumber, MAX(id) AS lastid
		FROM (SELECT * FROM staging_mdmhits2_klgsh.patients UNION SELECT * FROM staging_mdmhits2_kslg.patients) A 
		GROUP BY name, dateofbirth, gender) B
		ON X.name = B.name AND
		X.dateofbirth = B.dateofbirth AND
		X.gender = B.gender AND
		X.updatedate = B.lastupdate AND
		X.mrnnumber = B.lastmrnnumber AND
		X.id = B.lastid) V;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;


RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows inserted', insert_rec_count + insert_rec_count2; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';



END;
$$ LANGUAGE plpgsql;
