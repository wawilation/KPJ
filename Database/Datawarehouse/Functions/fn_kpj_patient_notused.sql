CREATE OR REPLACE FUNCTION fn_kpj_patient() RETURNS VOID AS $$
DECLARE insert_rec_count numeric;
DECLARE start_time timestamp with time zone;
DECLARE end_time timestamp with time zone;
DECLARE varID bigint;
DECLARE rec1 RECORD;
DECLARE sqlText TEXT;


BEGIN

start_time := clock_timestamp();
insert_rec_count := 0;

FOR rec1 IN

	SELECT 
		DISTINCT X.areaid, X.active, X.addresstypeid, X.admitic, X.admitperson, X.aeapproveuserid, X.age, X.bloodgroup, X.childno, X.citizenshipid, X.city, X.companyid, X.companyname, X.confidential, X.corpinfo, X.dateofbirth, X.email, X.financialstatus, firstname, X.firstvisit, X.gender, X.h_pphoneno, X.homephoneno, X.housingarea, X.idtypeid, X.languageid, X.lastname, X.lastvisit, X.maritalstatusid, X.medrecord, X.mrnnumber, X.mrntext, X.mrntype, X.name, X.newic, X.newmrn, noteexist, X.occupationid, X.officetelno, X.oldic, X.oldmrn, X.otherno, X.othernumber, X.personalemail, X.postalcodeid, X.raceid, X.registrationdate, X.relationshipid, X.religionid, X.staffid, X.stateid, X.status, X.street1, street2, X.street3, X.titleid, X.patienttype, X.updatedate, X.updateuserid, X.id, X.picturepath, X.recordstatus, X.description, X.convertedpatientid, X.ismedcare, X.ofcaddresstypeid, X.ofcstreet1, X.ofcstreet2, X.ofcstreet3, ofch_pphoneno, X.ofccity, X.blockno, X.ofcemail, X.ofcpostalcodeid, X.ofcareaid, X.ofcstateid
		FROM (SELECT * FROM staging_mdmhits2_klgsh.patients UNION SELECT * FROM staging_mdmhits2_kslg.patients) X
		JOIN (SELECT name, dateofbirth, gender, MAX(updatedate) AS lastupdate, MAX(mrnnumber) AS lastmrnnumber, MAX(id) AS lastid
		FROM (SELECT * FROM staging_mdmhits2_klgsh.patients UNION SELECT * FROM staging_mdmhits2_kslg.patients) A 
		GROUP BY name, dateofbirth, gender) B
		ON X.name = B.name AND
		X.dateofbirth = B.dateofbirth AND
		X.gender = B.gender AND
		X.updatedate = B.lastupdate AND
		X.mrnnumber = B.lastmrnnumber AND
		X.id = B.lastid
LOOP



sqlText := 'INSERT INTO datawarehouse.patient 
		(
		    id, created_by, created_date, updated_by, updated_date, "index", birth_dt, birthplace, citizenship, death_dt, deceased,  gender, identity_reliability,
		    pin, unknown_identity, ethnic_group, language, marital_status, nationality, occupation, prod_class, race, religion, strain, degree, family_name, given_name,
		    middle_name, prefix, suffix, reservation_flag, version, email_address, absconded, absconded_dt, alias, alias_actual_path, alias_content_type, alias_filename,
		    alias_uuid, use_alias, allergy_id, deactivated, deactivated_dt, deactivated_reason, photo_actual_path, photo_content_type, photo_filename, photo_uuid,
		    encounter_id, height, weight, height_unit, weight_unit, business_company_name, old_patient_id, extract_flag, maiden_family_name, maiden_given_name,
		    maiden_middle_name, maiden_suffix, maiden_prefix, maiden_degree, dual_citizenship, dms_extract_flag, created_by_name, phic_flag, phic_pat_id
		)
		VALUES
		(	
		   NEXTVAL(''patient_seq''), NULL,''' || COALESCE(rec1.updatedate,'1900-01-01') || ''', NULL,''' || COALESCE(rec1.updatedate,'1900-01-01') || ''', NULL,''' || COALESCE(rec1.dateofbirth,'1900-01-01') || ''', NULL,''' || COALESCE(rec1.citizenshipid,'') || ''', NULL, NULL,''' || COALESCE(rec1.gender,'') || ''', NULL,''' || COALESCE(rec1.mrnnumber,0) || ''', NULL, NULL,''' || COALESCE(rec1.languageid,'') || ''',''' || COALESCE(rec1.maritalstatusid, '') || ''', NULL,''' || COALESCE(rec1.occupationid,'') || ''', NULL,''' || COALESCE(rec1.raceid,'') || ''',''' || COALESCE(rec1.religionid,'') || ''', NULL, NULL, NULL,' || quote_literal(COALESCE(rec1.name,'')) || ', NULL, NULL, NULL, NULL, NULL,''' || COALESCE(rec1.email,'') || ''', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,' || quote_literal(COALESCE(rec1.companyname,'')) || ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)';

--RAISE INFO  'sqlText: %', sqlText;

	EXECUTE sqlText;

		--INSERT INTO datawarehouse.patient 
		--(
		 --   id, created_by, created_date, updated_by, updated_date, "index", birth_dt, birthplace, citizenship, death_dt, deceased,  gender, identity_reliability,
		  --  pin, unknown_identity, ethnic_group, language, marital_status, nationality, occupation, prod_class, race, religion, strain, degree, family_name, given_name,
		 --   middle_name, prefix, suffix, reservation_flag, version, email_address, absconded, absconded_dt, alias, alias_actual_path, alias_content_type, alias_filename,
		 --   alias_uuid, use_alias, allergy_id, deactivated, deactivated_dt, deactivated_reason, photo_actual_path, photo_content_type, photo_filename, photo_uuid,
		 --   encounter_id, height, weight, height_unit, weight_unit, business_company_name, old_patient_id, extract_flag, maiden_family_name, maiden_given_name,
		--    maiden_middle_name, maiden_suffix, maiden_prefix, maiden_degree, dual_citizenship, dms_extract_flag, created_by_name, phic_flag, phic_pat_id
		--)
		--VALUES
		--(	
		 --  NEXTVAL('patient_seq'), NULL, rec1.updatedate, NULL, rec1.updatedate, NULL, rec1.dateofbirth, NULL, rec1.citizenshipid, NULL, NULL, rec1.gender, NULL, rec1.mrnnumber, NULL, NULL, rec1.languageid, rec1.maritalstatusid, NULL, rec1.occupationid, NULL, rec1.raceid, rec1.religionid, NULL, NULL, NULL, rec1.name, NULL, NULL, NULL, NULL, NULL, rec1.email, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, rec1.companyname, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
		--)  RETURNING id INTO varID;	

		--UPDATE staging_mdmhits2_klgsh.patients SET dw_patient_id = varID WHERE name = rec1.name AND dateofbirth = rec1.dateofbirth AND gender = rec1.gender;
		--UPDATE staging_mdmhits2_kslg.patients SET dw_patient_id = varID WHERE name = rec1.name AND dateofbirth = rec1.dateofbirth AND gender = rec1.gender;
	
		--insert_rec_count = insert_rec_count + 1;

END LOOP;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows inserted', insert_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

END;
$$ LANGUAGE plpgsql;
