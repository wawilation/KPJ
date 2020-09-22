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

SET client_min_messages = error;

DROP TABLE IF EXISTS tmp_patients;

SET client_min_messages = notice;


INSERT INTO datawarehouse.patient 
		(
		    id, created_by, created_date, updated_by, updated_date, "index", birth_dt, birthplace, citizenship, death_dt, deceased, gender, identity_reliability,
		    pin, unknown_identity, ethnic_group, language, marital_status, nationality, occupation, prod_class, race, religion, strain, degree, family_name, given_name,
		    middle_name, prefix, suffix, reservation_flag, version, email_address, absconded, absconded_dt, alias, alias_actual_path, alias_content_type, alias_filename,
		    alias_uuid, use_alias, allergy_id, deactivated, deactivated_dt, deactivated_reason, photo_actual_path, photo_content_type, photo_filename, photo_uuid,
		    encounter_id, height, weight, height_unit, weight_unit, business_company_name, old_patient_id, extract_flag, maiden_family_name, maiden_given_name,
		    maiden_middle_name, maiden_suffix, maiden_prefix, maiden_degree, dual_citizenship, dms_extract_flag, created_by_name, phic_flag, phic_pat_id
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
		ON LOWER(X.name) = LOWER(B.name) AND
		X.dateofbirth = B.dateofbirth AND
		LOWER(X.gender) = LOWER(B.gender) AND
		X.updatedate = B.lastupdate AND
		X.mrnnumber = B.lastmrnnumber AND
		X.id = B.lastid) V;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

/******************** DQ **********************/

/**update PIN with padded ID**/
UPDATE datawarehouse.patient SET pin = LPAD(id::text, 10, '0');

/**dedup, 2nd pass**/
CREATE TEMPORARY TABLE tmp_patients
(	"areaid" varchar(36),
	"active" boolean,
	"addresstypeid" varchar(36),
	"admitic" varchar(50),
	"admitperson" varchar(50),
	"aeapproveuserid" varchar(36),
	"age" int,
	"bloodgroup" varchar(36),
	"childno" int,
	"citizenshipid" varchar(36),
	"city" varchar(50),
	"companyid" varchar(36),
	"companyname" varchar(50),
	"confidential" boolean,
	"corpinfo" varchar(50),
	"dateofbirth" timestamp,
	"email" varchar(60),
	"financialstatus" varchar(50),
	"firstname" varchar(200),
	"firstvisit" timestamp,
	"gender" varchar(50),
	"h_pphoneno" varchar(50),
	"homephoneno" varchar(50),
	"housingarea" varchar(50),
	"idtypeid" varchar(36),
	"languageid" varchar(36),
	"lastname" varchar(200),
	"lastvisit" timestamp,
	"maritalstatusid" varchar(36),
	"medrecord" boolean,
	"mrnnumber" int,
	"mrntext" varchar(50),
	"mrntype" varchar(50),
	"name" varchar(200),
	"newic" varchar(50),
	"newmrn" int,
	"noteexist" boolean,
	"occupationid" varchar(36),
	"officetelno" varchar(50),
	"oldic" varchar(50),
	"oldmrn" int,
	"otherno" int,
	"othernumber" varchar(50),
	"personalemail" varchar(50),
	"postalcodeid" varchar(36),
	"raceid" varchar(36),
	"registrationdate" timestamp,
	"relationshipid" varchar(36),
	"religionid" varchar(36),
	"staffid" varchar(36),
	"stateid" varchar(36),
	"status" varchar(15),
	"street1" varchar(50),
	"street2" varchar(50),
	"street3" varchar(50),
	"titleid" varchar(36),
	"patienttype" varchar(4),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"id" varchar(36),
	"picturepath" varchar(250),
	"recordstatus" varchar(5),
	"description" varchar(250),
	"convertedpatientid" varchar(36),
	"ismedcare" boolean,
	"ofcaddresstypeid" varchar(36),
	"ofcstreet1" varchar(50),
	"ofcstreet2" varchar(50),
	"ofcstreet3" varchar(50),
	"ofch_pphoneno" varchar(50),
	"ofccity" varchar(50),
	"blockno" varchar(50),
	"ofcemail" varchar(50),
	"ofcpostalcodeid" varchar(36),
	"ofcareaid" varchar(36),
	"ofcstateid" varchar(36),
	dw_patient_id bigint) 
DISTRIBUTED BY (name, dateofbirth, gender);

INSERT INTO tmp_patients
SELECT * FROM (SELECT * FROM staging_mdmhits2_klgsh.patients UNION SELECT * FROM staging_mdmhits2_kslg.patients) X
WHERE (X.name, X.gender, X.dateofbirth) IN 
((SELECT name, gender, dateofbirth FROM staging_mdmhits2_klgsh.patients UNION SELECT name, gender, dateofbirth FROM staging_mdmhits2_kslg.patients)
EXCEPT
(SELECT given_name, gender, birth_dt FROM datawarehouse.patient));

INSERT INTO datawarehouse.patient 
		(
		    id, created_by, created_date, updated_by, updated_date, "index", birth_dt, birthplace, citizenship, death_dt, deceased,  gender, identity_reliability,
		    pin, unknown_identity, ethnic_group, language, marital_status, nationality, occupation, prod_class, race, religion, strain, degree, family_name, given_name,
		    middle_name, prefix, suffix, reservation_flag, version, email_address, absconded, absconded_dt, alias, alias_actual_path, alias_content_type, alias_filename,
		    alias_uuid, use_alias, allergy_id, deactivated, deactivated_dt, deactivated_reason, photo_actual_path, photo_content_type, photo_filename, photo_uuid,
		    encounter_id, height, weight, height_unit, weight_unit, business_company_name, old_patient_id, extract_flag, maiden_family_name, maiden_given_name,
		    maiden_middle_name, maiden_suffix, maiden_prefix, maiden_degree, dual_citizenship, dms_extract_flag, created_by_name, phic_flag, phic_pat_id
		)
SELECT NEXTVAL('patient_seq') - 1, CURRENT_DATE, V.updatedate, CURRENT_DATE, V.updatedate, 'f', V.dateofbirth, NULL, V.citizenshipid, NULL, 'f', V.gender, NULL, NULL, 'f', NULL, 
V.languageid, V.maritalstatusid, NULL, V.occupationid, NULL, V.raceid, V.religionid, NULL, NULL, NULL, V.name, NULL, NULL, NULL, 'f', NULL, V.email, 'f', NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, V.companyname, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
NULL, NULL, NULL
FROM
(SELECT 
		DISTINCT X.areaid, X.active, X.addresstypeid, X.admitic, X.admitperson, X.aeapproveuserid, X.age, X.bloodgroup, X.childno, X.citizenshipid, X.city, 
		X.companyid, X.companyname, X.confidential, X.corpinfo, X.dateofbirth, X.email, X.financialstatus, firstname, X.firstvisit, X.gender, X.h_pphoneno, X.homephoneno, 
		X.housingarea, X.idtypeid, X.languageid, X.lastname, X.lastvisit, X.maritalstatusid, X.medrecord, X.mrnnumber, X.mrntext, X.mrntype, X.name, X.newic, X.newmrn, X.noteexist, 
		X.occupationid, X.officetelno, X.oldic, X.oldmrn, X.otherno, X.othernumber, X.personalemail, X.postalcodeid, X.raceid, X.registrationdate, X.relationshipid, X.religionid, 
		X.staffid, X.stateid, X.status, X.street1, X.street2, X.street3, X.titleid, X.patienttype, X.updatedate, X.updateuserid, X.id, X.picturepath, X.recordstatus, X.description, 
		X.convertedpatientid, X.ismedcare, X.ofcaddresstypeid, X.ofcstreet1, X.ofcstreet2, X.ofcstreet3, ofch_pphoneno, X.ofccity, X.blockno, X.ofcemail, X.ofcpostalcodeid, 
		X.ofcareaid, X.ofcstateid
	FROM (SELECT * FROM tmp_patients) X
		JOIN (SELECT name, dateofbirth, gender, MAX(updatedate) AS lastupdate
		FROM (SELECT * FROM tmp_patients) A 
		GROUP BY name, dateofbirth, gender) Y
		ON LOWER(X.name) = LOWER(Y.name) AND
		X.dateofbirth = Y.dateofbirth AND
		LOWER(X.gender) = LOWER(Y.gender) AND
		X.updatedate = Y.lastupdate) V;

GET DIAGNOSTICS insert_rec_count2 = ROW_COUNT;

/**update PIN with padded ID**/
UPDATE datawarehouse.patient SET pin = LPAD(id::text, 10, '0');


RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows inserted', insert_rec_count + insert_rec_count2; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


set optimizer=off;
/**update dw_patient_id on source tables (PART 1)**/
start_time := clock_timestamp();
UPDATE staging_mdmhits2_klgsh.patients stg
	SET dw_patient_id = dw.id 
FROM datawarehouse.patient dw
WHERE LOWER(stg.name) = LOWER(dw.given_name) AND stg.dateofbirth = dw.birth_dt AND LOWER(stg.gender) = LOWER(dw.gender);
--WHERE stg.name = dw.given_name AND stg.dateofbirth = dw.birth_dt AND stg.gender = dw.gender;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_mdmhits2_klgsh.patients';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

start_time := clock_timestamp();	
UPDATE staging_mdmhits2_kslg.patients stg
	SET dw_patient_id = dw.id 
FROM datawarehouse.patient dw
WHERE LOWER(stg.name) = LOWER(dw.given_name) AND stg.dateofbirth = dw.birth_dt AND LOWER(stg.gender) = LOWER(dw.gender);
--WHERE stg.name = dw.given_name AND stg.dateofbirth = dw.birth_dt AND stg.gender = dw.gender;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;	

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_mdmhits2_kslg.patients';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

set optimizer=on;



/**insert into patient_identifer**/
--national id, staging_mdmhits2_klgsh (newic)
start_time := clock_timestamp();
INSERT INTO datawarehouse.patient_identifier (patient_id, identifier, id_type, voided)
SELECT dw.id, stg.newic, 'NATIONAL_ID', 'f'
FROM datawarehouse.patient dw JOIN
(SELECT dw_patient_id, newic FROM staging_mdmhits2_klgsh.patients WHERE newic IS NOT NULL UNION SELECT dw_patient_id, newic FROM staging_mdmhits2_kslg.patients WHERE newic IS NOT NULL) stg
ON dw.id = stg.dw_patient_id;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient_identifier';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: NATIONAL_ID (% rows inserted)', insert_rec_count;
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

--KLGSH_MRN (mrn)
start_time := clock_timestamp();
INSERT INTO datawarehouse.patient_identifier (patient_id, identifier, id_type, voided)
	SELECT DISTINCT dw.id, stg.mrnnumber, 'KLGSH_MRN', CAST('f' AS boolean)
	FROM datawarehouse.patient dw JOIN staging_mdmhits2_klgsh.patients stg 
		ON dw.id = stg.dw_patient_id
	WHERE stg.mrnnumber IS NOT NULL;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient_identifier';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: KLGSH_MRN (% rows inserted)', insert_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


--KSLG_MRN (mrn)
start_time := clock_timestamp();
INSERT INTO datawarehouse.patient_identifier (patient_id, identifier, id_type, voided)
	SELECT DISTINCT dw.id, stg.mrnnumber, 'KSLG_MRN', CAST('f' AS boolean)
	FROM datawarehouse.patient dw JOIN staging_mdmhits2_kslg.patients stg 
		ON dw.id = stg.dw_patient_id
	WHERE stg.mrnnumber IS NOT NULL;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient_identifier';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: KSLG_MRN (% rows inserted)', insert_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

set optimizer=off;
/**update dw_patient_id on source tables (PART 2)**/
start_time := clock_timestamp();
UPDATE staging_mdmhits2_klgsh.patients stg
	SET dw_patient_id = dw.id 
FROM datawarehouse.patient dw
JOIN datawarehouse.patient_identifier pi
	ON dw.id = pi.patient_id
WHERE stg.mrnnumber = CAST(pi.identifier AS int) AND pi.id_type = 'KLGSH_MRN';

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_mdmhits2_klgsh.patients';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

start_time := clock_timestamp();	
UPDATE staging_mdmhits2_kslg.patients stg
	SET dw_patient_id = dw.id 
FROM datawarehouse.patient dw
JOIN datawarehouse.patient_identifier pi
	ON dw.id = pi.patient_id
WHERE stg.mrnnumber = CAST(pi.identifier AS int) AND pi.id_type = 'KSLG_MRN';

GET DIAGNOSTICS update_rec_count = ROW_COUNT;	

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_mdmhits2_kslg.patients';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

set optimizer=on;

/**update citizenhip column**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET citizenship = 
(CASE citizenship
WHEN 'AFG' THEN 'AFGHANISTAN'
WHEN 'ALB' THEN 'ALBANIA'
WHEN 'DZA' THEN 'ALGERIA'
WHEN 'ASM' THEN 'AMERICAN_SAMOA'
WHEN 'AND' THEN 'ANDORRA'
WHEN 'AGO' THEN 'ANGOLA'
WHEN 'AIA' THEN 'ANGUILLA'
WHEN 'ATA' THEN 'ANTARCTICA'
WHEN 'ARG' THEN 'ARGENTINA'
WHEN 'ABW' THEN 'ARUBA'
WHEN 'AUS' THEN 'AUSTRALIA'
WHEN 'AUT' THEN 'AUSTRIA'
WHEN 'AZE' THEN 'AZERBAIJAN'
WHEN 'BHR' THEN 'BAHRAIN'
WHEN 'BGD' THEN 'BANGLADESH'
WHEN 'BRB' THEN 'BARBADOS'
WHEN 'BLR' THEN 'BELARUS'
WHEN 'BEL' THEN 'BELGIUM'
WHEN 'BEN' THEN 'BENIN'
WHEN 'BTN' THEN 'BHUTAN'
WHEN 'BOL' THEN 'BOLIVIA_PLURINATIONAL_STATE'
WHEN 'BIH' THEN 'BOSNIA_AND_HERZEGOVINA'
WHEN 'BWA' THEN 'BOTSWANA'
WHEN 'BRA' THEN 'BRAZIL'
WHEN 'IOT' THEN 'BRITISH_INDIAN_OCEAN_TERRITORY'
WHEN 'BRN' THEN 'BRUNEI_DARUSSALAM'
WHEN 'BGR' THEN 'BULGARIA'
WHEN 'BFA' THEN 'BURKINA_FASO'
WHEN 'BDI' THEN 'BURUNDI'
WHEN 'KHM' THEN 'CAMBODIA'
WHEN 'CMR' THEN 'CAMEROON'
WHEN 'CAN' THEN 'CANADA'
WHEN 'CAF' THEN 'CENTRAL_AFRICAN_REPUBLIC'
WHEN 'TCD' THEN 'CHAD'
WHEN 'CHL' THEN 'CHILE'
WHEN 'CHN' THEN 'CHINA'
WHEN 'COL' THEN 'COLOMBIA'
WHEN 'COM' THEN 'COMOROS'
WHEN 'CRI' THEN 'COSTA_RICA'
WHEN 'CIV' THEN 'COTE_D_IVOIRE'
WHEN 'HRV' THEN 'CROATIA'
WHEN 'CZE' THEN 'CZECH_REPUBLIC'
WHEN 'DNK' THEN 'DENMARK'
WHEN 'DJI' THEN 'DJIBOUTI'
WHEN 'EGY' THEN 'EGYPT'
WHEN 'GNQ' THEN 'EQUATORIAL_GUINEA'
WHEN 'ERI' THEN 'ERITREA'
WHEN 'ETH' THEN 'ETHIOPIA'
WHEN 'FLK' THEN 'FALKLAND_ISLANDS'
WHEN 'FJI' THEN 'FIJI'
WHEN 'FIN' THEN 'FINLAND'
WHEN 'FRA' THEN 'FRANCE'
WHEN 'GUF' THEN 'FRENCH_GUIANA'
WHEN 'ATF' THEN 'FRENCH_SOUTHERN_TERRITORIES'
WHEN 'GMB' THEN 'GAMBIA'
WHEN 'GEO' THEN 'GEORGIA'
WHEN 'DEU' THEN 'GERMANY'
WHEN 'GHA' THEN 'GHANA'
WHEN 'GRC' THEN 'GREECE'
WHEN 'GRL' THEN 'GREENLAND'
WHEN 'GIN' THEN 'GUINEA'
WHEN 'GNB' THEN 'GUINEA'
WHEN 'HND' THEN 'HONDURAS'
WHEN 'HKG' THEN 'HONG_KONG'
WHEN 'HUN' THEN 'HUNGARY'
WHEN 'ISL' THEN 'ICELAND'
WHEN 'IND' THEN 'INDIA'
WHEN 'IDN' THEN 'INDONESIA'
WHEN 'IRN' THEN 'IRAN'
WHEN 'IRQ' THEN 'IRAQ'
WHEN 'IRL' THEN 'IRELAND'
WHEN 'ITA' THEN 'ITALY'
WHEN 'JPN' THEN 'JAPAN'
WHEN 'JOR' THEN 'JORDAN'
WHEN 'KAZ' THEN 'KAZAKHSTAN'
WHEN 'KEN' THEN 'KENYA'
WHEN 'KWT' THEN 'KUWAIT'
WHEN 'KGZ' THEN 'KYRGYZSTAN'
WHEN 'LAO' THEN 'LAO_PEOPLES_DEMOCRATIC_REPUBLIC'
WHEN 'LVA' THEN 'LATVIA'
WHEN 'LBN' THEN 'LEBANON'
WHEN 'LSO' THEN 'LESOTHO'
WHEN 'LBR' THEN 'LIBERIA'
WHEN 'LBY' THEN 'LIBYA'
WHEN 'LIE' THEN 'LIECHTENSTEIN'
WHEN 'LTU' THEN 'LITHUANIA'
WHEN 'LUX' THEN 'LUXEMBOURG'
WHEN 'MAC' THEN 'MACAO'
WHEN 'MDG' THEN 'MADAGASCAR'
WHEN 'MWI' THEN 'MALAWI'
WHEN 'MYS' THEN 'MALAYSIA'
WHEN 'MDV' THEN 'MALDIVES'
WHEN 'MTQ' THEN 'MARTINIQUE'
WHEN 'MRT' THEN 'MAURITANIA'
WHEN 'MUS' THEN 'MAURITIUS'
WHEN 'MYT' THEN 'MAYOTTE'
WHEN 'MEX' THEN 'MEXICO'
WHEN 'MCO' THEN 'MONACO'
WHEN 'MNG' THEN 'MONGOLIA'
WHEN 'MAR' THEN 'MOROCCO'
WHEN 'MMR' THEN 'MYANMAR'
WHEN 'NPL' THEN 'NEPAL'
WHEN 'NIC' THEN 'NICARAGUA'
WHEN 'NGA' THEN 'NIGERIA'
WHEN 'NOR' THEN 'NORWAY'
WHEN 'OMN' THEN 'OMAN'
WHEN 'PAK' THEN 'PAKISTAN'
WHEN 'PRT' THEN 'PORTUGAL'
WHEN 'QAT' THEN 'QATAR'
WHEN 'ROU' THEN 'ROMANIA'
WHEN 'LCA' THEN 'SAINT_LUCIA'
WHEN 'SEN' THEN 'SENEGAL'
WHEN 'SYC' THEN 'SEYCHELLES'
WHEN 'SGP' THEN 'SINGAPORE'
WHEN 'SVK' THEN 'SLOVAKIA'
WHEN 'SOM' THEN 'SOMALIA'
WHEN 'KOR' THEN 'NORTH_KOREA'
WHEN 'ESP' THEN 'SPAIN'
WHEN 'LKA' THEN 'SRI_LANKA'
WHEN 'SUR' THEN 'SURINAME'
WHEN 'SWZ' THEN 'SWAZILAND'
WHEN 'SWE' THEN 'SWEDEN'
WHEN 'CHE' THEN 'SWITZERLAND'
WHEN 'TJK' THEN 'TAJIKISTAN'
WHEN 'THA' THEN 'THAILAND'
WHEN 'TUN' THEN 'TUNISIA'
WHEN 'TUR' THEN 'TURKEY'
WHEN 'TKM' THEN 'TURKMENISTAN'
WHEN 'TUV' THEN 'TUVALU'
WHEN 'UGA' THEN 'UGANDA'
WHEN 'UKR' THEN 'UKRAINE'
WHEN 'ARE' THEN 'UNITED_ARAB_EMIRATES'
WHEN 'GBR' THEN 'UNITED_KINGDOM'
WHEN 'UZB' THEN 'UZBEKISTAN'
WHEN 'YEM' THEN 'YEMEN'
WHEN 'ZMB' THEN 'ZAMBIA'
WHEN 'ZWE' THEN 'ZIMBABWE'
WHEN 'MDA' THEN 'MOLDOVA_REPUBLIC'
WHEN 'NER' THEN 'NIGER'
WHEN 'NLD' THEN 'NETHERLANDS'
WHEN 'NZL' THEN 'NEW_ZEALAND'
WHEN 'PHL' THEN 'PHILIPPINES'
WHEN 'PNG' THEN 'PAPUA_NEW_GUINEA'
WHEN 'PRK' THEN 'SOUTH_KOREA'
WHEN 'PRS' THEN 'MALAYSIA'
WHEN 'PSE' THEN 'PALESTINE_STATE'
WHEN 'RUS' THEN 'RUSSIAN_FEDERATION'
WHEN 'SAU' THEN 'SAUDI_ARABIA'
WHEN 'SDN' THEN 'SUDAN'
WHEN 'SLB' THEN 'SOLOMON_ISLANDS'
WHEN 'SLE' THEN 'SIERRA_LEONE'
WHEN 'SYR' THEN 'SYRIAN_ARAB_REPUBLIC'
WHEN 'TCA' THEN 'TURKS_AND_CAICOS_ISLANDS'
WHEN 'TLS' THEN 'TIMOR_LESTE'
WHEN 'TTO' THEN 'TRINIDAD_AND_TOBAGO'
WHEN 'TWN' THEN 'TAIWAN_PROVINCE_OF_CHINA'
WHEN 'TZA' THEN 'TANZANIA'
WHEN 'USA' THEN 'UNITED_STATES'
WHEN 'VAT' THEN 'HOLY_SEE'
WHEN 'VGB' THEN 'VIRGIN_ISLANDS_BRITISH'
WHEN 'VNM' THEN 'VIETNAM'
WHEN 'WLF' THEN 'WALLIS_AND_FUTUNA'
WHEN 'ZAF' THEN 'SOUTH_AFRICA'
ELSE citizenship
END);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;	

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: citizenship (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

/**update gender**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET gender = 
(CASE WHEN gender IN ('1','male','Male', 'MALE') THEN 'MALE'
WHEN gender IN ('female', 'Female', 'FEMALE') THEN 'FEMALE'
ELSE 'UNKNOWN'
END);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;	

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: gender (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

/**update religion**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET religion = 
(CASE religion
WHEN 'C' THEN 'CHRISTIAN_ROMAN_CATHOLIC'
WHEN 'H' THEN 'HINDU'
WHEN 'B' THEN 'BUDDHIST'
WHEN 'I' THEN 'MUSLIM'
WHEN 'O' THEN 'OTHER'
ELSE NULL
END);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: religion (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

/**update marital_status**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET marital_status = 
(CASE marital_status
WHEN 'M' THEN 'MARRIED'
WHEN 'S' THEN 'SINGLE'
ELSE NULL
END);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: marital_status (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


/**update language**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET language = 
(CASE language
WHEN 'TAM' THEN 'TAMIL'
WHEN 'CHI' THEN 'CHINESE'
WHEN 'ENG' THEN 'ENGLISH'
WHEN 'MAL' THEN 'MALAY'
WHEN 'OTH' THEN NULL
ELSE NULL
END);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: language (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


/**update allow_deferred**/
start_time := clock_timestamp();
UPDATE datawarehouse.patient
SET allow_deferred = CAST('f' AS boolean);

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: datawarehouse.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: allow_deferred (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


/**MEDCUBES patient**/
set optimizer=off;
UPDATE staging_medcubeskpj.patient a
SET dw_patient_id = b.dw_patient_id
FROM staging_mdmhits2_klgsh.patients b
WHERE a.pkid = b.mrnnumber;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_medcubeskpj.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';


UPDATE staging_medcubeskpj_selangor.patient a
SET dw_patient_id = b.dw_patient_id
FROM (SELECT DISTINCT dw_patient_id, mrnnumber FROM staging_mdmhits2_kslg.patients) b
WHERE a.pkid = b.mrnnumber;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: staging_medcubeskpj_selangor.patient';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: dw_patient_id (% rows updated)', update_rec_count; 
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

set optimizer=on;


END;
$$ LANGUAGE plpgsql;
