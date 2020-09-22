\SET ON_ERROR_STOP on

CREATE EXTERNAL TABLE "pxf_assignedconsultant"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"isprimary" boolean,
	"userid" bigint,
	"casedatauniqueid" bigint,
	"consultanttype" int,
	"serviceunitid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.assignedconsultant?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_casedata"( 
	"casedatauniqueid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"caseid" varchar(16),
	"admissiontype" int,
	"admissiondatetime" timestamp,
	"dischargetype" int,
	"dischargedatetime" timestamp,
	"planneddischargedatetime" timestamp,
	"internaldoctor" bigint,
	"patientid" varchar,
	"medicalrecordid" bigint,
	"admissionstatus" int,
	"isvirtualpatient" boolean,
	"plannedstate" boolean,
	"referringdoctor" varchar,
	"admissionsourcetype" int,
	"casecodetype" int,
	"paytypetype" int,
	"payermode" int,
	"billtype" int,
	"payercode" varchar,
	"dischargedestinationtype" int,
	"admissiondiagnosisid" varchar,
	"comment" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.casedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_employer"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientid" varchar,
	"companyname" varchar(200),
	"phonenumber" varchar(50),
	"profession" varchar(200),
	"addressstreet" varchar(200),
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"professiontype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.employer?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_insuredperson"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"salutation" int,
	"title" int,
	"firstname" varchar(50),
	"lastname" varchar(50),
	"dateofbirth" date,
	"socialsecuritynumber" varchar(50),
	"relationship" int,
	"addressstreet" varchar(200),
	"profession" varchar(200),
	"companyname" varchar(200),
	"addressstreetcompany" varchar(200),
	"patientid" varchar,
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"addresscitycompany" varchar(200),
	"addresszipcodecompany" varchar(200),
	"addresscountrycodecompany" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.insuredperson?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicalcasedata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"casedatauniqueid" bigint,
	"departmentid" bigint,
	"serviceunitid" bigint,
	"validfrom" timestamp,
	"validuntil" timestamp,
	"medicalcaseid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.medicalcasedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_medicalrecord"( 
	"pkid" bigint,
	"patientid" varchar,
	"name" varchar(50),
	"departmentid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.medicalrecord?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patient"( 
	"pkid" bigint,
	"patientid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dobapprox" boolean,
	"title" int,
	"sex" int,
	"dateofbirth" date,
	"vip" boolean,
	"photoid" varchar,
	"identitydocumentnumbertype" int,
	"salutation" int,
	"citizenship" int,
	"maritalstatus" int,
	"religion" int,
	"bloodgroup" int,
	"race" int,
	"language" int,
	"socialsecuritynumber" varchar(50),
	"maidenname" varchar(50),
	"phonenumber" varchar(50),
	"mobilenumber" varchar(50),
	"middlename" varchar(50),
	"firstname" varchar(50),
	"lastname" varchar,
	"email" varchar(100),
	"addressstreet" varchar(200),
	"placeofbirth" varchar(200),
	"additionalinformation" varchar,
	"identitydocumentnumber" varchar(50),
	"visibleid" varchar(50),
	"familydoctorid" varchar,
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"areacode" int,
	"appointmentreminder" int) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patient?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientappointmenttimepoint"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientid" varchar,
	"referencetype" int,
	"referencepkid" bigint,
	"plannedtimeid" bigint,
	"uniqueappointmentid" varchar(100),
	"serviceid" varchar,
	"bookinguserid" bigint,
	"planneddatetime" timestamp,
	"bookingdatetime" timestamp,
	"completiondatetimefrom" timestamp,
	"completiondatetimeuntil" timestamp,
	"duration" smallint,
	"staff" varchar,
	"appointmentstate" int,
	"information" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientappointmenttimepoint?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientappointmenttimepointmaterial"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"createdatetime" timestamp,
	"materialid" varchar,
	"quantity" int,
	"name" varchar,
	"patientappointmenttimepointpkid" bigint,
	"patientnursingmaterialpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientappointmenttimepointmaterial?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientcontact"( 
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pkid" bigint,
	"patientid" varchar,
	"name" varchar(50),
	"addressstreet" varchar(200),
	"phonenumber" varchar(50),
	"mobilephonenumber" varchar(50),
	"email" varchar(50),
	"additionalinformation" varchar,
	"relationship" int,
	"salutation" int,
	"sourcepatientid" varchar,
	"title" int,
	"externalcontactid" varchar,
	"validfrom" timestamp,
	"validto" timestamp,
	"hasresidencekey" boolean,
	"emergencynotify" boolean,
	"sortorder" boolean,
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"contacttype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientcontact?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientinsurance"( 
	"pkid" bigint,
	"tenantid" bigint,
	"customerid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"patientid" varchar,
	"validfrom" date,
	"validto" date,
	"debtorid" varchar,
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientinsurance?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_patientservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"casedatauniqueid" bigint,
	"medicalcasepkid" bigint,
	"servicecode" varchar(200),
	"servicetext" varchar,
	"quantity" numeric(8, 2),
	"completeddatetimefrom" timestamp,
	"completeddatetimeto" timestamp,
	"completinguserid" bigint,
	"completingserviceunitid" bigint,
	"completingexamunitid" bigint,
	"servicetopic" varchar,
	"servicemark" int,
	"isorderservice" boolean,
	"islaboratoryservice" boolean,
	"isnursingservice" boolean,
	"isbillable" boolean,
	"hasmaterials" boolean,
	"staff" varchar,
	"price" numeric(8, 2),
	"patientservicevariablepricepkid" bigint,
	"location" int,
	"iseditable" boolean,
	"serviceid" varchar,
	"servicetype" int,
	"nursingcategory" int,
	"nursingarea" int,
	"discountpercent" numeric(5, 2),
	"taxrate" numeric(5, 2),
	"discountabsolute" numeric(8, 2)) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientservicebill"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"invoicenumber" varchar(50),
	"payermode" int,
	"paymentdatetime" timestamp,
	"cancellationdatetime" timestamp,
	"price" numeric(10, 2),
	"taxrate" numeric(5, 2),
	"createduserid" bigint,
	"createddatetime" timestamp,
	"istransmitted" boolean,
	"patientservicepkid" bigint,
	"patientid" varchar,
	"accountingunitpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientservicebill?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientservicematerialrelationship"( 
	"pkid" bigint,
	"materialpkid" bigint,
	"patientservicepkid" bigint,
	"sortorder" int,
	"quantity" int,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientservicematerialrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientservicevariableprice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"type" int,
	"sequence" int,
	"maxprice" numeric(8, 2),
	"minprice" numeric(8, 2),
	"bookingdatetime" timestamp,
	"comment" varchar,
	"bookinguserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.patientservicevariableprice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_physicalcasedata"( 
	"physicalcaseid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"casedatauniqueid" bigint,
	"serviceunitid" bigint,
	"class" int,
	"roomid" bigint,
	"bedid" bigint,
	"phoneno" varchar(50),
	"validfrom" timestamp,
	"validuntil" timestamp,
	"bedtype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.physicalcasedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_physicalcasevacation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"physicalcaseid" bigint,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"validfrom" timestamp,
	"validuntil" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.physicalcasevacation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_plannedcasedataextension"( 
	"plannedcasedataextensionid" bigint,
	"casedatauniqueid" bigint,
	"priority" int,
	"datecreated" date,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"comment" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.plannedcasedataextension?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vipinfo"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(500),
	"nic" varchar(50),
	"oic" varchar(50),
	"passport" varchar(50),
	"type" varchar(100),
	"relationship" varchar(100),
	"comment" varchar(300),
	"patientpkid" varchar,
	"progressrecid" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.vipinfo?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_virtualpatient"( 
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pkid" bigint,
	"patientid" varchar,
	"name" varchar(50),
	"dateofbirth" date,
	"sex" int,
	"phonenumber" varchar(50),
	"admissionreason" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.patientmanagement.virtualpatient?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_accountingunit"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"accountingid" varchar(50),
	"accountingunittype" int,
	"shortcut" varchar(4),
	"userid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.accountingunit?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_bed"( 
	"bedid" bigint,
	"shortname" varchar(50),
	"name" varchar(500),
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"roomid" bigint,
	"validfrom" date,
	"validto" date,
	"additionalinformation" varchar,
	"isactive" boolean,
	"phone" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.bed?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_city"( 
	"cityid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"countrycode" varchar(10),
	"zipcode" varchar(10),
	"name" varchar(200),
	"areadialingcode" varchar(5)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.city?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_closetime"( 
	"pkid" bigint,
	"parenttype" smallint,
	"type" smallint,
	"specialdatetimefrom" timestamp,
	"specialdatetimeto" timestamp,
	"weeklydayfrom" smallint,
	"weeklydayto" smallint,
	"weeklystarttime" timestamp,
	"weeklyendtime" timestamp,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"parentid" bigint,
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.closetime?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_debtor"( 
	"pkid" bigint,
	"debtorid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"debtorkey" varchar(50),
	"shortname" varchar(50),
	"name" varchar(500),
	"description" varchar,
	"isactive" boolean,
	"fromdatetime" timestamp,
	"todatetime" timestamp,
	"addressstreet" varchar(200),
	"phonenumber" varchar(50),
	"faxnumber" varchar(50),
	"email" varchar(100),
	"contact" varchar(200),
	"position" varchar(200),
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"financialclass" varchar(50),
	"progressrecid" varchar(100),
	"debtortype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.debtor?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_department"( 
	"departmentid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(500),
	"shortname" varchar(50),
	"validfrom" date,
	"validuntil" date,
	"departmentkey" varchar(50),
	"information" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.department?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_examinationunit"( 
	"examunitid" bigint,
	"name" varchar(500),
	"shortname" varchar(50),
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"isactive" boolean,
	"additionalinformation" varchar,
	"fromtime" timestamp,
	"untiltime" timestamp,
	"serviceunitid" bigint,
	"validfrom" date,
	"validuntil" date) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.examinationunit?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_externalcontact"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"externalcontactuniqueid" varchar,
	"contacttype" int,
	"doctorno" varchar(50),
	"title" int,
	"owner" bigint,
	"name" varchar(150),
	"addressstreet" varchar(200),
	"phoneno" varchar(50),
	"email" varchar(100),
	"specialisation" int,
	"website" varchar(200),
	"info" varchar,
	"correspondent" varchar(150),
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"firstname" varchar(100),
	"additionaladress" varchar,
	"referencenumber1" varchar(50),
	"referencenumber2" varchar(50),
	"faxno" varchar(50),
	"salutation" int,
	"correspondentfirstname" varchar(150),
	"correspondentsalutation" int,
	"correspondenttitle" int,
	"correspondentcontact" varchar(100),
	"usecorrespondentinletter" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.externalcontact?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_material"( 
	"pkid" bigint,
	"materialid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"cost" numeric(19, 4),
	"categorypopupkey" int,
	"materialkey" varchar(100),
	"name" varchar,
	"centralpharmaceuticalnumber" varchar,
	"literaturesource" varchar,
	"materialtype" varchar,
	"defaultdispunitamount" numeric(19, 4),
	"defaultdispunituom" int,
	"priceperdispunit" numeric(19, 4),
	"packagesize" varchar(50),
	"producer" varchar(200),
	"externalid" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.material?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_materialdocumentrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"materialid" varchar,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.materialdocumentrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_room"( 
	"roomid" bigint,
	"shortname" varchar(50),
	"name" varchar(500),
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceunitid" bigint,
	"validfrom" date,
	"validto" date) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.room?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_service"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceid" varchar,
	"validfrom" date,
	"validto" date,
	"isactive" boolean,
	"priority" int,
	"servicetype" int,
	"servicegroup" int,
	"displayalternativetext" boolean,
	"approximateduration" smallint,
	"staffquantity" int,
	"nursingcategory" int,
	"nursingarea" int,
	"nursingpreferredtimefrom" timestamp,
	"nursingpreferredtimeto" timestamp,
	"patientgender" varchar(50),
	"patientagefrom" int,
	"patientageto" int,
	"staffqualification" int,
	"servicecode" varchar(200),
	"servicedefinition" varchar,
	"servicetext" varchar,
	"alternativetext" varchar,
	"serviceassignmode" int,
	"evaluationdays" int,
	"schedulesyntax" varchar(100),
	"defaultprice" numeric(8, 2),
	"maxprice" numeric(8, 2),
	"minprice" numeric(8, 2),
	"variableprice" boolean,
	"location" boolean,
	"taskid" varchar,
	"literaturesource" varchar,
	"progressrecid" varchar(100),
	"xrefcode" varchar(200),
	"taxrate" numeric(5, 2),
	"isexternal" boolean,
	"planningtaskid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.service?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_servicedocumentrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceid" varchar,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.servicedocumentrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_servicematerialrelationship"( 
	"pkid" bigint,
	"materialid" varchar,
	"serviceid" varchar,
	"sortorder" int,
	"quantity" int,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.servicematerialrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_servicereference"( 
	"pkid" bigint,
	"serviceidparent" varchar,
	"serviceid" varchar,
	"quantity" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"sortorder" smallint) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.servicereference?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_serviceunit"( 
	"serviceunitid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"shortname" varchar(50),
	"name" varchar(500),
	"admissiontypes" varchar(50),
	"departmentid" bigint,
	"description" varchar(500),
	"serviceunitkey" varchar(50),
	"validfrom" date,
	"validuntil" date,
	"taskid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.serviceunit?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_serviceunitreportextension"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"adressblock" varchar,
	"footer" varchar,
	"logo" bytea,
	"logoheader" bytea,
	"logofooter" bytea,
	"serviceunitpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.serviceunitreportextension?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_syntaxformofapplication"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"syntax" varchar(20),
	"syntaxfulltext" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.syntaxformofapplication?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_timeduration"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"syntax" varchar(20),
	"durationtype" int,
	"durationvalue" int,
	"syntaxfulltext" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.timeduration?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_timeinterval"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(250),
	"syntax" varchar(20),
	"weekday" varchar(50),
	"interval" int,
	"intervalvalue" int,
	"syntaxfulltext" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.timeinterval?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_timescheme"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(250),
	"syntax" varchar(20),
	"ondemand" boolean,
	"timeranges" varchar,
	"syntaxfulltext" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.maindata.timescheme?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientcalendarentry"( 
	"pkid" bigint,
	"patientcalendarentryid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(256),
	"startdatetime" timestamp,
	"enddatetime" timestamp,
	"additionalinfo" varchar(1000),
	"patientid" varchar,
	"entrytypeid" int,
	"serviceunitid" bigint,
	"planningstate" int,
	"serviceid" varchar,
	"seriesid" varchar,
	"seriesdefinition" varchar(1000)) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.patientcalendarentry?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientcalendarentryresourcerelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientcalendarentryid" varchar,
	"resourceid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.patientcalendarentryresourcerelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_resource"( 
	"pkid" bigint,
	"resourceid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceunitid" bigint,
	"type" int,
	"maindataid" bigint,
	"name" varchar(500),
	"createorder" boolean,
	"orderserviceunitid" bigint,
	"orderexamunitid" bigint,
	"orderuserid" bigint,
	"icon" bytea,
	"color" varchar(25),
	"additionalinfo" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.resource?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_resourcegroup"( 
	"pkid" bigint,
	"resourcegroupid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceunitid" bigint,
	"type" int,
	"name" varchar(500),
	"allowmultiple" boolean,
	"maximumcount" int) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.resourcegroup?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_resourceresourcegrouprelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"resourceid" varchar,
	"resourcegroupid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.resourceresourcegrouprelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_resourcetime"( 
	"pkid" bigint,
	"resourcetimeid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"resourceid" varchar,
	"type" int,
	"weekday" int,
	"timefrom" timestamp,
	"timeuntil" timestamp,
	"comment" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.resourcetime?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_serviceresourcegrouprelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceunitid" bigint,
	"serviceid" varchar,
	"resourcegroupid" varchar,
	"duration" int) LOCATION ('pxf://MedCubesKPJ_Selangor.appointment.serviceresourcegrouprelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_documentinfo"( 
	"content" bytea,
	"customerkey" varchar,
	"tenantid" bigint,
	"documentid" bigint,
	"documentkey" varchar,
	"version" int,
	"documenttype" int,
	"mimetype" varchar(50),
	"primaryidentifier" varchar(50),
	"secondaryidentifier" varchar(50),
	"docrelation" varchar(500),
	"status" int,
	"rowversion" bytea,
	"recordstate" smallint,
	"password" bytea,
	"keywords" varchar,
	"isfinalized" boolean,
	"comment" varchar,
	"customerid" bigint,
	"createdbyuser" varchar(50),
	"createdbyuserid" bigint,
	"createddate" timestamp,
	"title" varchar(100),
	"externalreference" varchar(100),
	"externalreferencemodel" varchar(200),
	"annotationpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.documentsystem.documentinfo?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_documentstatus"( 
	"pkid" bigint,
	"documentid" bigint,
	"statustype" smallint,
	"changinguser" varchar(50),
	"dateofchange" timestamp,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"changinguserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.documentsystem.documentstatus?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_documenttype"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"description" varchar(200),
	"relation" varchar(200),
	"activityforedit" varchar,
	"activityforview" varchar,
	"icon" bytea,
	"documenttypeid" varchar,
	"appassemblyid" varchar,
	"activityfordelete" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.documentsystem.documenttype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_actiontile"( 
	"pkid" bigint,
	"actiontileid" varchar,
	"type" smallint,
	"tilestyleid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"query" varchar,
	"description" varchar,
	"mastertables" varchar,
	"name" varchar(40),
	"uiappclassname" varchar(128)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.actiontile?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_activeusers"( 
	"pkid" bigint,
	"userid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"workstation" varchar(300),
	"currentlogins" int) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.activeusers?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_annotation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"annotationstring" varchar,
	"referenceid" varchar(50),
	"referencetype" varchar(500),
	"mediastoreageid" varchar,
	"width" int,
	"height" int,
	"scale" numeric(18, 0)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.annotation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_appassembly"( 
	"appassemblyid" varchar,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"name" varchar(64),
	"description" varchar(256),
	"vendor" varchar(64),
	"version" varchar(64),
	"assemblyname" varchar(256),
	"xapfilename" varchar(256),
	"rowversion" bytea,
	"assemblynameserviceproxy" varchar(256),
	"assemblynameserver" varchar(256),
	"xapfilehash" varchar(256),
	"apppartnerid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.appassembly?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_appassemblyreference"( 
	"pkid" bigint,
	"xapfilenamesource" varchar(256),
	"xapfilenameparent" varchar(256),
	"description" varchar(300)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.appassemblyreference?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_apppartner"( 
	"apppartnerid" varchar,
	"name" varchar(100),
	"schemaname" varchar(20)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.apppartner?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_clientcachedata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"schemaname" varchar(200),
	"tablename" varchar(500),
	"hashvalue" varchar(500),
	"culture" varchar(10),
	"addkey" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.clientcachedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_culture"( 
	"pkid" bigint,
	"cultureid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"shortname" varchar(50),
	"dictionary" bytea,
	"mimetype" varchar(50),
	"isdefault" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.culture?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_customer"( 
	"customerid" bigint,
	"customerkey" varchar,
	"name" varchar(100),
	"recordstate" smallint,
	"rowversion" bytea,
	"email" varchar(50),
	"validfrom" date,
	"validto" date,
	"phoneno" varchar(50),
	"homepage" varchar(50),
	"information" varchar(500),
	"code" varchar(20),
	"culture" int,
	"faxno" varchar(150)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.customer?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_desktoponprofile"( 
	"desktoponprofileid" bigint,
	"uidesktopid" varchar,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"isdefault" boolean,
	"profileid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.desktoponprofile?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_doctornote"( 
	"messageid" bigint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"isread" boolean,
	"title" varchar(1000),
	"description" varchar(1000),
	"priority" smallint,
	"username" varchar(100),
	"datesent" timestamp,
	"dateaccepted" timestamp,
	"sendingusername" varchar(100),
	"recordingmediastorageid" varchar,
	"patientname" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.doctornote?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_doctornoteanswer"( 
	"messageid" bigint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"originalmessageid" bigint,
	"newmessageid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.doctornoteanswer?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_dynamicappdatatoprefill"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicappkey" varchar,
	"fullfieldname" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicappdatatoprefill?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_dynamicappmasterdata"( 
	"dynamicappmasterdataid" varchar,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"name" varchar(200),
	"description" varchar,
	"xamlforview" varchar,
	"validfrom" date,
	"validto" date,
	"version" bigint,
	"width" double precision,
	"height" double precision,
	"category" int,
	"dynamicappkey" varchar,
	"mediastorageid" varchar,
	"savedtrigger" varchar,
	"loadedtrigger" varchar,
	"iswizardpage" boolean,
	"validationtrigger" varchar,
	"hasmcrichtextboxcontrol" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicappmasterdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_dynamicapppageofwizard"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicappwizardmasterdataid" varchar,
	"dynamicappmasterdataid" varchar,
	"dynamicappkey" varchar,
	"sortorder" int,
	"info" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicapppageofwizard?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_dynamicappwizardmasterdata"( 
	"pkid" bigint,
	"dynamicappwizardmasterdataid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(250),
	"width" double precision,
	"height" double precision,
	"category" int,
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicappwizardmasterdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_dynamicdatacontent"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicappmasterdataid" varchar,
	"datetimecreated" timestamp,
	"identifiervaluepairs" varchar(300),
	"dynamicappname" varchar(100),
	"dynamicappkey" varchar,
	"controlvalues" varchar,
	"userid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicdatacontent?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_dynamicdatacontentwizardrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicdatarecordpkid" bigint,
	"dynamicdatacontentpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicdatacontentwizardrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_dynamicdatarecord"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"datetimecreated" timestamp,
	"usernamecreated" varchar(50),
	"useridcreated" bigint,
	"tablename" varchar(50),
	"parenttableid" varchar,
	"tabletype" smallint,
	"parentrecordpkid" varchar(200),
	"fieldvalues" text,
	"dynamicdatacontentpkid" bigint,
	"schemaname" varchar(50),
	"isaquiredbywizard" boolean,
	"isfinalized" boolean,
	"finalizedbyuserid" bigint,
	"fieldname" varchar(50),
	"ismcrichtextboxfield" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicdatarecord?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_dynamicdatarecordscreenshot"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"mediastorageid" varchar,
	"dynamicdatarecordpkid" bigint,
	"parentrecordpkid" varchar(50),
	"controlname" varchar(100),
	"fieldname" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicdatarecordscreenshot?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_dynamicextendabletables"( 
	"tableid" varchar,
	"rowversion" bytea,
	"customerid" bigint,
	"recordstate" smallint,
	"tablename" varchar(50),
	"appassemblyid" varchar,
	"serviceproxyclassname" varchar(128),
	"dataobjectclassname" varchar(128),
	"identifiername" varchar(50),
	"serviceclassname" varchar(256),
	"schemaname" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicextendabletables?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_dynamicfields"( 
	"fieldid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"name" varchar(50),
	"type" int,
	"parent" varchar,
	"popupkey" varchar(300),
	"frozen" int,
	"pkid" bigint,
	"label" varchar(50),
	"defaultvalue" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicfields?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_dynamicsubtables"( 
	"subtableid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"name" varchar(50),
	"parent" varchar,
	"dynamicappkey" varchar,
	"pkid" bigint,
	"description" varchar,
	"label" varchar(256),
	"iswizardforedit" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.dynamicsubtables?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_function"( 
	"functionid" varchar,
	"functionkey" varchar(50),
	"name" varchar(50),
	"description" varchar(1000),
	"module" varchar(50),
	"functiongroup" varchar(50),
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"defaultpermissiontype" int,
	"referencecontent" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.dbo.vw_function?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_functionofpermissiongrid"( 
	"pkid" bigint,
	"permissiongridid" varchar,
	"functionid" varchar,
	"permissiontype" int,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.functionofpermissiongrid?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_globaltables"( 
	"tableid" bigint,
	"tablename" varchar(150),
	"globaltype" smallint,
	"customerid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"tableshortname" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.globaltables?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_headlinefields"( 
	"pkid" int,
	"table" varchar(256),
	"headlinelabel" varchar(100),
	"headlinesqlcode" varchar(4000),
	"headlineindexcolumns" varchar(4000),
	"okbydeveloper" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.headlinefields?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_history"( 
	"historyid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"historykey" varchar(100),
	"historytext" text,
	"userid" varchar(50),
	"actiontype" varchar(20),
	"date" timestamp,
	"historytable" varchar(200),
	"parentkey" varchar(100),
	"parenttable" varchar(200),
	"servicename" varchar(300),
	"classname" varchar(300),
	"primaryforeignidentifier" varchar(50),
	"secondaryforeignidentifier" varchar(50),
	"transactionid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.history?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_icon"( 
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"iconid" varchar,
	"name" varchar(50),
	"type" varchar(50),
	"mediastorageid" varchar,
	"pkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.icon?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


/***loading***/
CREATE EXTERNAL TABLE "pxf_logentry"( 
	"logentryid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"level" varchar(50),
	"machinename" varchar(50),
	"filename" varchar(250),
	"linenumber" int,
	"date" timestamp,
	"message" varchar,
	"stacktrace" varchar,
	"userid" bigint,
	"username" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.logentry?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

/***loading***/


CREATE EXTERNAL TABLE "pxf_manualactiontilestate"( 
	"pkid" bigint,
	"type" smallint,
	"parentkey" varchar(200),
	"description" varchar,
	"status" boolean,
	"username" varchar,
	"userid" bigint,
	"date" timestamp,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"actiontileid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.manualactiontilestate?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_masterdataexporttables"( 
	"exporttableid" bigint,
	"tablename" varchar(50),
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"description" varchar(500),
	"appassemblyid" varchar,
	"serviceproxyclassname" varchar(128),
	"serviceproxyclassassembly" varchar(128)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.masterdataexporttables?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_mcrichtextboxdatacontent"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicdatacontentpkid" bigint,
	"controlname" varchar(100),
	"raddocumentxaml" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.mcrichtextboxdatacontent?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_mcrichtextboxdatarecord"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicdatarecordpkid" bigint,
	"fieldname" varchar(50),
	"parentrecordpkid" varchar(50),
	"raddocumentxaml" varchar,
	"unformattedtext" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.mcrichtextboxdatarecord?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_mcrichtextboxdefaultvalue"( 
	"pkid" bigint,
	"mcrichtextboxdefaultvalueid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicfieldid" varchar,
	"raddocumentxaml" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.mcrichtextboxdefaultvalue?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_moduleinfo"( 
	"moduleinfoid" int,
	"name" varchar(100),
	"majorversion" int,
	"minorversion" int,
	"sprintversion" int,
	"hotfixversion" int) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.moduleinfo?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_option"( 
	"optionid" bigint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"isactive" boolean,
	"key" varchar(100),
	"description" varchar(500),
	"value" varchar(4000),
	"validationexpression" varchar,
	"isoverwriteable" boolean,
	"appassemblyid" varchar,
	"type" int,
	"typeentries" varchar,
	"workstationid" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.dbo.vw_option?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_patidokhistory"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientid" varchar,
	"casedatauniqueid" bigint,
	"table" varchar(50),
	"actiontype" varchar(20),
	"date" timestamp,
	"externalreferenceid" varchar(50),
	"useridcreated" bigint,
	"historytext" text) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.patidokhistory?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_permissiongrid"( 
	"pkid" bigint,
	"permissiongridid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"name" varchar(50),
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.permissiongrid?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_phoneconnection"( 
	"phoneconnectionid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"tenantid" bigint,
	"customerid" bigint,
	"channeluri" varchar(500),
	"username" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.phoneconnection?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_popupentry"( 
	"popupentryid" varchar,
	"popupheaderid" varchar,
	"popupkey" varchar(300),
	"sortorder" int,
	"popupentrycode" int,
	"text" varchar(256),
	"description" varchar(1000),
	"additionalparameters" varchar(1000),
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"icon" bytea,
	"iscustomerentry" boolean,
	"pkid" bigint,
	"color" varchar(25)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.popupentry?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_popupheader"( 
	"popupkey" varchar(64),
	"name" varchar(70),
	"popupheaderid" varchar,
	"description" varchar(1000),
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"isallowedtomodifyentries" boolean,
	"pkid" bigint,
	"category" varchar(50),
	"installedbyassembly" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.popupheader?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_popupmapping"( 
	"pkid" int,
	"popupkey" varchar(128),
	"schemaname" varchar(128),
	"tablename" varchar(128),
	"columnname" varchar(128)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.popupmapping?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_profile"( 
	"name" varchar(50),
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"profileid" varchar,
	"pkid" bigint,
	"validfrom" date,
	"validto" date) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.profile?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_profileofuser"( 
	"profileofuserid" bigint,
	"userid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"isdefault" boolean,
	"profileid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.profileofuser?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_refreshstate"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"primarykey" varchar(50),
	"filtercriteria1" varchar(50),
	"filtercriteria2" varchar(50),
	"topic" varchar(50),
	"updatetime" timestamp,
	"action" varchar(6),
	"changedbyclientuserid" int,
	"changedbyapp" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.refreshstate?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_reportofapp"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"appobjectid" varchar,
	"reportpath" varchar(1000)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.reportofapp?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_reportpermission"( 
	"username" varchar(128),
	"customerid" bigint,
	"tenantid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.reportpermission?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_rssitem"( 
	"rssitemid" bigint,
	"title" varchar(200),
	"description" varchar(200),
	"content" varchar,
	"publishdate" timestamp,
	"link" varchar(500),
	"author" varchar(500),
	"authoremail" varchar(500),
	"authoruri" varchar(500),
	"issue" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.rssitem?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_scopepermissiongridrelationship"( 
	"pkid" bigint,
	"permissiongridid" varchar,
	"scopeid" varchar,
	"scopetype" smallint,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"profileid" varchar,
	"groupkey" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.scopepermissiongridrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_searchstructure"( 
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"nodeid" varchar,
	"parentnodeid" varchar,
	"sortorder" int,
	"type" varchar(24),
	"subtype" varchar(50),
	"label" varchar(250),
	"pkid" bigint,
	"owner" bigint,
	"fontsettings" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.searchstructure?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_searchstructureconfig"( 
	"pkid" bigint,
	"searchstructureconfigid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"modename" varchar(50),
	"typename" varchar(50),
	"assemblyname" varchar(50),
	"dataloaderclass" varchar(50),
	"subtypepopup" varchar(50),
	"enableusermode" boolean,
	"allowkeyusermode" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.searchstructureconfig?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_searchstructuredata"( 
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"nodeid" varchar,
	"sortorder" int,
	"dataid" varchar(50),
	"searchstructuredataid" bigint,
	"type" varchar(24),
	"subtype" varchar(50),
	"owner" bigint,
	"customstring" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.searchstructuredata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_searchstructurefilter"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nodeid" varchar(50),
	"key" varchar(500),
	"value" varchar(500),
	"valuebyid" varchar(500),
	"requiredformatch" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.searchstructurefilter?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_searchstructurehidden"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"userid" bigint,
	"nodeid" varchar(50),
	"type" varchar(24),
	"subtype" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.searchstructurehidden?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_sequences"( 
	"pkid" bigint,
	"name" varchar(100),
	"seed" bigint,
	"incremental" bigint,
	"currentvalue" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.sequences?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_serverconfig"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"key" varchar(200),
	"bytevalue" bytea,
	"stringvalue" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.serverconfig?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_tempreportingobjects"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"authenticationtoken" varchar(4000),
	"reportname" varchar(250),
	"objectname" varchar(250),
	"binaryobject" bytea,
	"textobject" varchar,
	"sourceid" bigint,
	"createddatetime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.tempreportingobjects?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_tenant"( 
	"tenantid" bigint,
	"name" varchar(100),
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"validfrom" date,
	"validto" date,
	"key" varchar(20),
	"reportingpassword" bytea,
	"culture" int,
	"addresscountrycode" varchar(10),
	"addresszipcode" varchar(10),
	"addresscityname" varchar(200),
	"addressstreet" varchar(200),
	"email" varchar(100),
	"website" varchar(200),
	"contactperson" varchar(100),
	"logo" bytea,
	"logoheaderportrait" bytea,
	"logoheaderlandscape" bytea,
	"logofooterportrait" bytea,
	"logofooterlandscape" bytea,
	"nationality" int,
	"faxno" varchar(150),
	"phoneno" varchar(150)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.tenant?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_tenantofuser"( 
	"tenantofuserid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"userid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"isdefaulttenant" boolean,
	"usercode" varchar(20)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.tenantofuser?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_textphrase"( 
	"rowversion" bytea,
	"customerid" bigint,
	"recordstate" smallint,
	"tenantid" bigint,
	"textphraseid" varchar,
	"label" varchar(50),
	"text" varchar,
	"shortcut" varchar(50),
	"parenttype" bigint,
	"pkid" bigint,
	"owner" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.textphrase?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_tilecontext"( 
	"pkid" bigint,
	"tilecontextid" varchar,
	"actiontileid" varchar,
	"sortorder" int,
	"mediastorageid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"condition" varchar,
	"title" varchar,
	"titlefontsettings" varchar,
	"text" varchar,
	"textfontsettings" varchar,
	"backgroundsettings" varchar,
	"action" varchar,
	"tooltip" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.tilecontext?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_tilestyle"( 
	"pkid" bigint,
	"tilestyleid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"customerid" bigint,
	"tenantid" bigint,
	"xamldefinition" varchar,
	"type" varchar,
	"name" varchar,
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.tilestyle?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_timetracking"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"timestampdata" timestamp,
	"description" varchar(100),
	"primaryidentifier" varchar(50),
	"secondaryidentifier" varchar(50),
	"username" varchar(100),
	"userserviceunit" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.timetracking?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_timetrackingkeyword"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"keyword" varchar(150)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.timetrackingkeyword?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_traceables"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"tableshortname" varchar(50),
	"tracingenabled" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.traceables?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_translationdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"language" varchar(20),
	"translatedtext" varchar,
	"sourcepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.translationdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_translationdataclientcache"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"classname" varchar,
	"hashvalue" varchar,
	"language" varchar(10)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.translationdataclientcache?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_translationsource"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"sourcestring" varchar,
	"classname" varchar(256),
	"fieldname" varchar(256),
	"appassemblyid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.translationsource?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_translationtable"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"schema" varchar(80),
	"tablename" varchar(80),
	"appassemblyid" varchar,
	"fieldname" varchar(80)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.translationtable?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_uiapp"( 
	"uiappid" varchar,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"name" varchar(64),
	"description" varchar(256),
	"appassemblyid" varchar,
	"classname" varchar(128),
	"rowversion" bytea,
	"mediastorageid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.uiapp?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_uibuttononpage"( 
	"buttonid" varchar,
	"parentbuttonid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"position" int,
	"uipageid" varchar,
	"buttontype" int,
	"targetxap" varchar(128),
	"targetassembly" varchar(128),
	"targetuipageid" varchar,
	"targetcmdid" varchar(128),
	"targetprocessid" varchar(128),
	"parameter" varchar,
	"lockapplication" boolean,
	"buttonicon" bytea,
	"label" varchar(50),
	"tooltip" varchar(256),
	"rowversion" bytea,
	"pkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.uibuttononpage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_uidesktop"( 
	"uidesktopid" varchar,
	"title" varchar(50),
	"description" varchar(256),
	"layoutxaml" varchar,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"icon" bytea,
	"pkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.uidesktop?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_uipage"( 
	"uipageid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"icon" bytea,
	"title" varchar(50),
	"description" varchar(256),
	"layoutxaml" varchar,
	"mainpagevisible" boolean,
	"rowversion" bytea,
	"pkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.uipage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_uipageondesktop"( 
	"uidesktopid" varchar,
	"uipageid" varchar,
	"position" int,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"uipageondesktopid" bigint,
	"rowversion" bytea) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.uipageondesktop?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_user"( 
	"userid" bigint,
	"username" varchar(106),
	"recordstate" smallint,
	"rowversion" bytea,
	"isactive" boolean,
	"firstname" varchar(50),
	"middlename" varchar(50),
	"lastname" varchar(50),
	"sex" int,
	"title" int,
	"email" varchar(50),
	"phone" varchar(50),
	"additionalinformation" varchar(1000),
	"password" bytea,
	"usermustchangepassword" boolean,
	"photoid" varchar,
	"userstate" smallint,
	"validfrom" date,
	"validto" date,
	"userqualifications" varchar(50),
	"culture" int,
	"userkey" varchar(20),
	"additionaluserkey" varchar(20),
	"passwordchangeddate" date) LOCATION ('pxf://MedCubesKPJ_Selangor.dbo.vw_user?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_userconfig"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"userid" bigint,
	"topic" varchar(100),
	"referenceid" varchar(100),
	"configkey" varchar(100),
	"configvalue" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.userconfig?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_userenvironment"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"username" varchar(150)) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.userenvironment?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_wfactivity"( 
	"pkid" bigint,
	"activityid" varchar,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"name" varchar(200),
	"type" int,
	"assemblyfilename" varchar(100),
	"displayname" varchar(100),
	"description" varchar(1000),
	"appassemblyid" varchar,
	"issystemactivity" boolean,
	"area" varchar(100),
	"iscustomizable" boolean,
	"isschedulerenabled" boolean,
	"isvisibleintaskdesigner" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.wfactivity?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_wftask"( 
	"pkid" bigint,
	"taskid" varchar,
	"recordstate" smallint,
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"name" varchar(100),
	"definition" varchar,
	"description" varchar(500),
	"design" varchar,
	"active" boolean,
	"isscheduledtask" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.wftask?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_wfcustomizedactivitytask"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"activityid" varchar,
	"taskid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.wfcustomizedactivitytask?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7component"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7fieldid" bigint,
	"name" varchar(100),
	"description" varchar(1000),
	"position" smallint,
	"mandatory" boolean,
	"issubcomponent" boolean,
	"parentcomponentpkid" bigint,
	"hassubcomponents" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7component?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7component2property"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7componentid" bigint,
	"propertyname" varchar(150),
	"hl7devicepkid" bigint,
	"append" boolean,
	"separator" varchar(10),
	"order" int) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7component2property?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7device"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"description" varchar(1000),
	"active" boolean,
	"address" varchar(1000),
	"contactdata" varchar(1000),
	"url" varchar(500),
	"fileurl" varchar(500),
	"encoding" varchar(10),
	"linuxlinecharacter" varchar(10),
	"acknowledgecharacter" varchar(10),
	"hl7version" varchar(10),
	"socketport" int,
	"webserviceurl" varchar(500),
	"socketipaddress" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7device?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7devicemessagetype"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7devicepkid" bigint,
	"messagetype" varchar(15),
	"active" smallint,
	"filter1" varchar,
	"filter2" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7devicemessagetype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_hl7event"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"description" varchar(1000),
	"active" boolean,
	"hl7version" varchar(10),
	"hl7messagetypepkid" bigint,
	"incoming" boolean,
	"outgoing" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7event?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');


--

CREATE EXTERNAL TABLE "pxf_hl7eventsegmentconfiguration"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7eventpkid" bigint,
	"hl7segmentpkid" bigint,
	"mandatory" boolean,
	"repeatable" boolean,
	"position" smallint,
	"cardinalitymin" varchar(3),
	"cardinalitymax" varchar(4)) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7eventsegmentconfiguration?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_hl7field"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7segmentid" bigint,
	"name" varchar(100),
	"description" varchar(1000),
	"position" smallint,
	"length" smallint,
	"cardinalitymin" varchar(3),
	"cardinalitymax" varchar(4),
	"datatype" int,
	"mandatory" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7field?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7idmapper"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"tablename" varchar(100),
	"sourceidentifier" varchar(20),
	"targetidentifier" varchar(20)) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7idmapper?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7mapper"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7deviceid" bigint,
	"name" varchar(100),
	"description" varchar(1000),
	"isformatprovider" boolean,
	"sourceformat" varchar(50),
	"targetformat" varchar(50),
	"popupheaderid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7mapper?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7mapper2component"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7componentpkid" bigint,
	"hl7devicepkid" bigint,
	"hl7mapperpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7mapper2component?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7mappingvalue"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"hl7mapperid" bigint,
	"sourcevalue" varchar(1000),
	"targetvalue" varchar(1000),
	"isdefault" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7mappingvalue?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7messagelog"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"messagetext" varchar,
	"iserror" boolean,
	"sendtime" timestamp,
	"isincoming" boolean,
	"status" smallint,
	"deviceid" bigint,
	"errormessage" varchar,
	"fullfilename" varchar(250)) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7messagelog?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_hl7messagetype"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"description" varchar(1000),
	"hl7version" varchar(10),
	"hl7deviceid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7messagetype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_hl7segment"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"description" varchar(1000)) LOCATION ('pxf://MedCubesKPJ_Selangor.hl7.hl7segment?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_clientmission"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"modifieddatetimeoffset" timestamp,
	"modifieduserid" bigint,
	"executiveuserid" bigint,
	"missiontypeid" varchar,
	"patientid" varchar,
	"plannedstarttime" timestamp,
	"plannedendtime" timestamp,
	"plannedduration" numeric(8, 2),
	"durationunit" smallint,
	"fixedappointment" boolean,
	"administrativenote" varchar,
	"staffqualification" int,
	"actualstarttime" timestamp,
	"actualendtime" timestamp,
	"usernote" varchar,
	"confirmedflag" timestamp,
	"currentstate" int,
	"signaturemediaid" varchar,
	"nonsignaturereason" int,
	"nonsignatureremark" varchar(512),
	"description" varchar,
	"userprovidessignature" boolean,
	"roundedduration" time(7),
	"actualduration" time(7),
	"roundedstarttime" timestamp,
	"roundedendtime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.mobilenursing.clientmission?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_missiontype"( 
	"pkid" bigint,
	"missiontypeid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"shortname" varchar(3),
	"name" varchar(255),
	"description" varchar,
	"validfrom" timestamp,
	"validto" timestamp,
	"group" int,
	"manuallyplannable" boolean,
	"commentminletters" int,
	"requiressignature" boolean,
	"mustbeassignedtoclient" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.mobilenursing.missiontype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_workflowmessage"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"messagestate" int,
	"datetimesent" timestamp,
	"sendinguserid" bigint,
	"sendingserviceunitid" bigint,
	"patientid" varchar,
	"casedatauniqueid" bigint,
	"text" varchar,
	"workflowtopicpkid" bigint,
	"modifieddatetime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.workflowsystem.workflowmessage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_workflowtopic"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(150),
	"description" varchar(300)) LOCATION ('pxf://MedCubesKPJ_Selangor.workflowsystem.workflowtopic?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_workflowtopicofuser"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"userid" bigint,
	"workflowtopicpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.workflowsystem.workflowtopicofuser?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_assessment"( 
	"pkid" bigint,
	"assessmentid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"calculatedtriagescore" int,
	"triagescore" int,
	"userid" varchar(200),
	"assessmenttimestarted" timestamp,
	"assessmenttimesent" timestamp,
	"assessmenttimeanswered" timestamp,
	"assessmenttimeclosed" timestamp,
	"assessmentstate" smallint,
	"assessmenttimeclosedbydoc" timestamp,
	"doctoruserid" bigint,
	"patientid" varchar,
	"unitid" varchar,
	"requestimmediatecallback" boolean,
	"requestimmediatecallbackdone" boolean,
	"latitude" varchar(12),
	"longitude" varchar(12),
	"timezone" varchar(100),
	"culture" varchar(7),
	"timeoffset" numeric(4, 2),
	"accuracy" int) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.assessment?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_measurement"( 
	"pkid" bigint,
	"measurementid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"datecreated" timestamp,
	"measurementtype" varchar,
	"assessmentid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.measurement?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medcaseconfig"( 
	"pkid" bigint,
	"medcaseconfigid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"isenabled" boolean,
	"departmentid" varchar(200),
	"serviceunitid" varchar(200),
	"reportnotetype" varchar,
	"reportnotecategory" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.medcaseconfig?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_parameter"( 
	"pkid" bigint,
	"parameterid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(150),
	"description" varchar(400)) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.parameter?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_unit"( 
	"pkid" bigint,
	"unitid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(200),
	"location" varchar(200),
	"sourceaddress" varchar(200),
	"latitude" double precision,
	"longitude" double precision,
	"mediastorageimageid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.unit?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_value"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"timestamp" timestamp,
	"value" varchar,
	"mediaid" varchar,
	"measurementid" varchar,
	"parameterid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.teleassessment.value?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_anamnesis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"caremodel" int,
	"createuserid" bigint,
	"createdatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp,
	"nodename" varchar(50),
	"casedatapkid" bigint,
	"dynamicdatarecordpkidlistforsubtables" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.anamnesis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_anamnesisdiagnosis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"anamnesispkid" bigint,
	"dynamicfieldid" varchar,
	"nursingdiagnosisdataid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.anamnesisdiagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_anamnesisdynamicappdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"anamnesispkid" bigint,
	"dynamicappkey" varchar,
	"dynamicappmasterdataid" varchar,
	"dynamicdatacontentpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.anamnesisdynamicappdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_anamnesispathway"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"anamnesispkid" bigint,
	"dynamicfieldid" varchar,
	"pathwayid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.anamnesispathway?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_lesionannotationstyle"( 
	"pkid" bigint,
	"lesionannotationstyleid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(150),
	"description" varchar(500),
	"color" varchar(25),
	"protocoltype" int,
	"strokethickness" int) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.lesionannotationstyle?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_lesionassessment"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"protocoltype" int,
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"casedatauniqueid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.lesionassessment?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_lesiondata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"text" varchar(500),
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"lesionannotationstyleid" varchar,
	"lesionassessmentpkid" bigint,
	"mediastorageids" varchar,
	"shapeid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.lesiondata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingbasedata"( 
	"pkid" bigint,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"basedatacatalogue" int,
	"type" int,
	"name" varchar(500),
	"isactive" boolean,
	"nursingbasedataid" varchar,
	"basedatacode" varchar(50),
	"literaturesource" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingbasedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingbasedocumentrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingbasedataid" varchar,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingbasedocumentrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingcaregiver"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"physicalcasepkid" bigint,
	"userpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingcaregiver?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingcaregroup"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(250),
	"serviceunitpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingcaregroup?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingcaregroupbedrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"caregrouppkid" bigint,
	"bedpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingcaregroupbedrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingcaregroupphysicalcasedatarelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"caregrouppkid" bigint,
	"physicalcasepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingcaregroupphysicalcasedatarelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdiagnosisbasedatarelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"nursingdiagnosisbasedatarelationshipid" varchar,
	"nursingdiagnosisdataid" varchar,
	"nursingbasedataid" varchar,
	"rowversion" bytea,
	"recordstate" smallint,
	"basedatatype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdiagnosisbasedatarelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdiagnosisdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingdiagnosisdataid" varchar,
	"diagnosiscatalogue" int,
	"diagnosiscode" varchar(50),
	"type" int,
	"validfrom" date,
	"validto" date,
	"patientagefrom" int,
	"patientageto" int,
	"gender" varchar(50),
	"evaluationdays" int,
	"priority" int,
	"definition" varchar,
	"name" varchar(500),
	"infolink" varchar,
	"literaturesource" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdiagnosisdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdiagnosisdatareferencerelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingdiagnosisdatareferencerelationshipid" varchar,
	"nursingdiagnosisdataid" varchar,
	"nursingreferenceid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdiagnosisdatareferencerelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdiagnosisdocumentrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingdiagnosisdataid" varchar,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdiagnosisdocumentrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdiagnosisoutcomerelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"nursingdiagnosisoutcomerelationshipid" varchar,
	"nursingdiagnosisdataid" varchar,
	"nursingoutcomedataid" varchar,
	"rowversion" bytea,
	"recordstate" smallint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdiagnosisoutcomerelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingdynfieldtodiagorpathwayrelationship"( 
	"pkid" bigint,
	"nursingdynfieldtodiagorpathwayrelationshipid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"dynamicfieldid" varchar,
	"referenceid" varchar,
	"referencetype" int,
	"value" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingdynfieldtodiagorpathwayrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingoutcomedata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingoutcomedataid" varchar,
	"outcomecatalogue" int,
	"outcomecode" varchar(50),
	"name" varchar(500),
	"isactive" boolean,
	"evaluationdays" int,
	"definition" varchar,
	"infolink" varchar,
	"priority" int,
	"literaturesource" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingoutcomedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingoutcomedocumentrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingoutcomedataid" varchar,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingoutcomedocumentrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingoutcomeservicerelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"nursingoutcomeservicerelationshipid" varchar,
	"nursingoutcomedataid" varchar,
	"serviceid" varchar,
	"rowversion" bytea,
	"recordstate" smallint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingoutcomeservicerelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingreference"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingreferenceid" varchar,
	"text" varchar,
	"referencetext" varchar,
	"referenceid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingreference?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_nursingtododata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"recipient" varchar(250),
	"text" varchar(50),
	"shorttext" varchar(3),
	"additionalinfo" varchar,
	"timesyntax" varchar(20),
	"createdatetimeoffset" timestamp,
	"createuserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.nursingtododata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pathway"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"pathwayid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathway?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_pathwaybasedata"( 
	"pkid" bigint,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingbasedataid" varchar,
	"name" varchar(500),
	"sortorder" int,
	"ischecked" boolean,
	"pathwaybasedataid" varchar,
	"pathwaydiagnosisid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathwaybasedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_pathwaydiagnosis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingdiagnosisdataid" varchar,
	"name" varchar(500),
	"evaluationdays" int,
	"sortorder" int,
	"ischecked" boolean,
	"pathwaydiagnosisid" varchar,
	"pathwayid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathwaydiagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_pathwaymaterial"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"materialid" varchar,
	"sortorder" int,
	"quantity" int,
	"ischecked" boolean,
	"pathwaymaterialid" varchar,
	"pathwayserviceid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathwaymaterial?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_pathwayoutcome"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingoutcomedataid" varchar,
	"name" varchar(500),
	"evaluationdays" int,
	"sortorder" int,
	"ischecked" boolean,
	"pathwayoutcomeid" varchar,
	"pathwaydiagnosisid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathwayoutcome?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pathwayservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceid" varchar,
	"servicetext" varchar,
	"sortorder" int,
	"ischecked" boolean,
	"evaluationdays" int,
	"staffqualification" int,
	"staffquantity" int,
	"schedulesyntax" varchar(100),
	"pathwayserviceid" varchar,
	"pathwayoutcomeid" varchar,
	"servicecode" varchar(200),
	"servicedefinition" varchar,
	"isexternal" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.pathwayservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_patientnursingbasedata"( 
	"pkid" bigint,
	"tenantid" bigint,
	"customerid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingbasedataid" varchar,
	"nursingdiagnosispkid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"name" varchar(500),
	"comment" varchar,
	"sortorder" int,
	"pathwayname" varchar(50),
	"basedatatype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingbasedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientnursingdiagnosis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingdiagnosisdataid" varchar,
	"casedatauniqueid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"name" varchar(500),
	"comment" varchar,
	"diagnosisstate" int,
	"evaluationdate" timestamp,
	"sortorder" int,
	"evaluationdays" int,
	"pathwayname" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingdiagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientnursingmaterial"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"materialid" varchar,
	"nursingservicepkid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"name" varchar(500),
	"comment" varchar,
	"sortorder" int,
	"quantity" int,
	"pathwayname" varchar(50),
	"materialtype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingmaterial?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientnursingoutcome"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"nursingoutcomedataid" varchar,
	"nursingdiagnosispkid" bigint,
	"name" varchar(500),
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"evaluationdate" timestamp,
	"comment" varchar,
	"outcomestate" int,
	"sortorder" int,
	"evaluationdays" int,
	"pathwayname" varchar(50)) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingoutcome?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientnursingservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"serviceid" varchar,
	"outcomepkid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"servicetext" varchar,
	"comment" varchar,
	"servicestate" int,
	"evaluationdate" timestamp,
	"sortorder" int,
	"evaluationdays" int,
	"staffquantity" int,
	"staffqualification" int,
	"pathwayname" varchar(50),
	"schedulesyntax" varchar(100),
	"location" int,
	"servicecode" varchar(200),
	"servicedefinition" varchar,
	"casedatauniqueid" bigint,
	"validfrom" timestamp,
	"validto" timestamp,
	"ondemand" boolean,
	"schedulesyntaxfullstring" varchar(150),
	"patientcontactpkid" bigint,
	"isexternal" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientnursingserviceduration"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"durationtype" int,
	"durationvalue" int,
	"patientnursingservicepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingserviceduration?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientnursingserviceinterval"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"weekdays" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"patientnursingservicepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingserviceinterval?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientnursingservicetimepoint"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"numminutes" int,
	"numminutesuntil" int,
	"patientnursingservicepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingservicetimepoint?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientnursingtodo"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"recipient" int,
	"additionalinfo" varchar,
	"todotext" varchar(50),
	"shorttext" varchar(3),
	"timesyntax" varchar(20),
	"createdatetimeoffset" timestamp,
	"validfrom" timestamp,
	"validto" timestamp,
	"nursingtododatapkid" bigint,
	"casedatauniqueid" bigint,
	"creatinguserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingtodo?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientnursingtodopause"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"createdatetime" timestamp,
	"modifieddatetime" timestamp,
	"validfrom" timestamp,
	"validto" timestamp,
	"reason" varchar,
	"createuserid" bigint,
	"modifieduserid" bigint,
	"patientnursingtodopkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.nursing.patientnursingtodopause?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_serviceunitsofuser"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"userid" bigint,
	"serviceunitid" bigint,
	"isdefault" boolean,
	"alternateuserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.infrastructure.serviceunitsofuser?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_drug"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"drugtype" int,
	"additionalinfo" varchar(500),
	"datetimefrom" timestamp,
	"drugstate" int,
	"patientid" varchar,
	"isinternal" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.drug?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_wound"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"majorwoundtype" int,
	"classificationmethod" int,
	"createddatetime" timestamp,
	"comment" varchar(500),
	"casedatauniqueid" bigint,
	"createdbyuserid" bigint,
	"existingsincerelapse" date,
	"existingsince" date,
	"relapsefreesince" date,
	"modifiedbyuserid" bigint,
	"modifieddatetime" timestamp,
	"isrelapse" boolean,
	"relapsecount" int,
	"localizationscreenshotid" varchar,
	"occuringreason" varchar(250),
	"patientdiagnosispkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.wound?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundassessment"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"assessmentdatetime" timestamp,
	"createdbyuserid" bigint,
	"createddatetime" timestamp,
	"modifiedbyuserid" bigint,
	"modifieddatetime" timestamp,
	"woundpkid" bigint,
	"referenceassessmentimagepkid" bigint,
	"assessmentclassification" bigint,
	"isdoctorinvolved" boolean,
	"isadditionalassessment" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundassessment?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundassessmentdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"createddatetime" timestamp,
	"dynamicappmasterdataid" varchar,
	"dynamicdatacontentpkid" bigint,
	"dynamicappkey" varchar,
	"woundassessmentpkid" bigint,
	"dynamicdatarecordpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundassessmentdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundassessmentimage"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"mediastorageid" varchar,
	"comment" varchar(500),
	"woundassessmentpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundassessmentimage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_wounddynamicrecordrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"createddatetime" timestamp,
	"dynamicappmasterdataid" varchar,
	"dynamicdatacontentpkid" bigint,
	"dynamicappkey" varchar,
	"dynamicdatarecordpkid" bigint,
	"woundpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.wounddynamicrecordrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundlocalizationcontrol"( 
	"pkid" bigint,
	"woundlocalizationcontrolid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(150),
	"layoutxaml" varchar,
	"gender" int,
	"createdbyuserid" bigint,
	"createddatetime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundlocalizationcontrol?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundlocalizationdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"woundlocalizationid" varchar(50),
	"name" varchar(100),
	"comment" varchar(500),
	"woundpkid" bigint,
	"woundlocalizationcontrolid" varchar,
	"parentlocalizationpkid" bigint,
	"isnotgraphical" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundlocalizationdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundmeasurement"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"adjustedscale" numeric(18, 2),
	"measuredscale" numeric(18, 2),
	"createddatetime" timestamp,
	"isaftercare" boolean,
	"screenshortmediastorageid" varchar,
	"woundassessmentimagepkid" bigint,
	"isciruclar" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundmeasurement?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundmeasurementarea"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"areatype" int,
	"area" numeric(18, 2),
	"isestimated" boolean,
	"length" numeric(18, 2),
	"woundmeasurementpkid" bigint,
	"iscircular" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundmeasurementarea?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_woundmeasurementpoint"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"xcoord" int,
	"ycoord" int,
	"order" int,
	"woundmeasurementareapkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundmeasurementpoint?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundpatientnursingdiagnosisrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"woundpkid" bigint,
	"patientnursingdiagnosispkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundpatientnursingdiagnosisrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_woundstate"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"datetimefrom" timestamp,
	"createddatetime" timestamp,
	"createdbyuserid" bigint,
	"woundstatus" int,
	"comment" varchar(500),
	"woundpkid" bigint,
	"closetype" int,
	"hospital" varchar(200),
	"department" varchar(200),
	"iswoundbased" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundstate?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundtype"( 
	"pkid" bigint,
	"woundtypeid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"additionalinfo" varchar(500),
	"validfrom" timestamp,
	"validto" timestamp,
	"exclusiveids" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundtype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_woundtyperelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"woundpkid" bigint,
	"woundtypeid" varchar,
	"additionaltext" varchar(500)) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundtyperelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_woundwizardpage"( 
	"pkid" bigint,
	"woundwizardpageid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"wizardtype" int,
	"pagenumber" int,
	"pagetype" int,
	"info" varchar,
	"pageidentifier" varchar(100),
	"name" varchar(500),
	"isdeletable" boolean,
	"exclusivepageids" varchar(200),
	"showinfoarea" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.woundmanagement.woundwizardpage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_allergy"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(20),
	"name" varchar(50),
	"type" int,
	"additionaltext" varchar,
	"description" varchar,
	"creatingdatetimeoffset" timestamp,
	"userpkid" bigint,
	"drugdbmappingid" varchar,
	"drugdbmappingtype" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.allergy?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_diagnosis"( 
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"pkid" bigint,
	"diagnosispopupkey" int,
	"diagnosiscode" varchar(10),
	"diagnosistext" varchar,
	"shortname" varchar,
	"validfrom" date,
	"validuntil" date,
	"thesaurus" varchar(250),
	"agefrom" int,
	"ageuntil" int,
	"eligibleasmaindiagnosis" boolean,
	"guideline" varchar,
	"compulsoryregistration" boolean,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"diagnosisid" varchar,
	"gender" int,
	"agefromdays" int,
	"ageuntildays" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.diagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--





CREATE EXTERNAL TABLE "pxf_growthchartmaindata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"category" int,
	"sex" int,
	"agemos" int,
	"p3" numeric(8, 2),
	"p5" numeric(8, 2),
	"p10" numeric(8, 2),
	"p25" numeric(8, 2),
	"p50" numeric(8, 2),
	"p75" numeric(8, 2),
	"p90" numeric(8, 2),
	"p95" numeric(8, 2),
	"p97" numeric(8, 2)) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.growthchartmaindata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_patientallergy"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(20),
	"name" varchar,
	"type" int,
	"additionaltext" varchar,
	"description" varchar,
	"infectiondate" date,
	"allergystate" int,
	"creatingdatetimeoffset" timestamp,
	"patientid" varchar,
	"createuserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.patientallergy?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientdiagnosis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"diagnosisid" varchar,
	"casedatauniqueid" bigint,
	"caseid" varchar(16),
	"patientid" varchar,
	"text" varchar,
	"orientation" int,
	"info" varchar,
	"ischronic" boolean,
	"diagnosisdatetime" timestamp,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"isfinal" boolean,
	"sortorder" int,
	"ismaindiagnosis" boolean,
	"departmentid" bigint,
	"reliabilitystate" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.patientdiagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patienttentativediagnosis"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientid" varchar,
	"text" varchar,
	"diagnosistype" int,
	"sortorder" int,
	"createuserpkid" bigint,
	"casedatauniqueid" bigint,
	"diagnosisid" varchar,
	"createdatetime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.patienttentativediagnosis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_reportnote"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"rowversion" bytea,
	"recordstate" smallint,
	"casedatauniqueid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"unformattedtext" varchar,
	"deletereason" varchar(500),
	"documentpkid" bigint,
	"reportnotecategoryid" varchar,
	"reportnotetypeid" varchar,
	"referenceid" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.reportnote?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_reportnotecategory"( 
	"pkid" bigint,
	"reportnotecategoryid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(256),
	"description" varchar(1000),
	"icon" bytea,
	"color" varchar(25)) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.reportnotecategory?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_reportnotetype"( 
	"pkid" bigint,
	"reportnotetypeid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(256),
	"description" varchar(1000),
	"icon" bytea,
	"color" varchar(25),
	"reportnotecategoryid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.reportnotetype?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparameter"( 
	"pkid" bigint,
	"vitalparameterid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"shortname" varchar(50),
	"iscontinuous" boolean,
	"ismessageenabled" boolean,
	"datatype" int,
	"isfutureentryenabled" boolean,
	"isstoppable" boolean,
	"format" varchar(50),
	"defaultvalue" varchar(50),
	"lowermaxlimit" numeric(18, 2),
	"lowerwarnlimit" numeric(18, 2),
	"uppermaxlimit" numeric(18, 2),
	"upperwarnlimit" numeric(18, 2),
	"unit" varchar(15),
	"dataorigin" int,
	"category" int,
	"medcasesource" varchar,
	"decimaldigits" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameter?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparameterarrangement"( 
	"pkid" bigint,
	"vitalparameterarrangementid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"type" int,
	"seperatingstring" varchar(25),
	"category" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameterarrangement?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparameterarrangementrelationship"( 
	"pkid" bigint,
	"vitalparameterarrangementrelationshipid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"sortorder" smallint,
	"vitalparameterarrangementid" varchar,
	"vitalparametercollectionid" varchar,
	"vitalparameterid" varchar,
	"showvalueinchart" boolean,
	"linethickness" int,
	"charttype" int,
	"scatterpointshape" int,
	"color" varchar(25),
	"yaxismin" numeric(18, 0),
	"yaxismax" numeric(18, 0),
	"vitalparameterparentcollectionid" varchar,
	"displaymode" int,
	"parentarrangementrelationshipid" varchar,
	"charfornovalue" varchar(25),
	"timeshifts" varchar(250),
	"showtotalsum" boolean,
	"isexpanded" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameterarrangementrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparametercollection"( 
	"pkid" bigint,
	"vitalparametercollectionid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"shortname" varchar(50),
	"collectiontype" int,
	"displayvalue" varchar(50),
	"unit" varchar(25),
	"lowerwarnlimit" numeric(18, 2),
	"upperwarnlimit" numeric(18, 2),
	"fillmissingvaluesforcalculation" boolean,
	"calculationexpression" varchar,
	"calculationexpressionids" varchar,
	"numberofcalculationdecimals" smallint,
	"category" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparametercollection?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparametercollectionrelationship"( 
	"pkid" bigint,
	"vitalparametercollectionrelationshipid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"sortorder" smallint,
	"vitalparameterparentcollectionid" varchar,
	"vitalparametercollectionid" varchar,
	"vitalparameterid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparametercollectionrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparameterdata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"customvalue" varchar(500),
	"enddatetime" timestamp,
	"createduserid" bigint,
	"createddatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"status" int,
	"comment" varchar(500),
	"assessmentdatetime" timestamp,
	"isnotassessed" boolean,
	"casedatauniqueid" bigint,
	"vitalparameterid" varchar,
	"value1" numeric(18, 2),
	"value2" numeric(18, 2),
	"secondaryidentifier" varchar(100)) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameterdata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--




CREATE EXTERNAL TABLE "pxf_vitalparameterdynamicappdataorigin"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"vitalparameterid" varchar,
	"subtableuniqueid" varchar,
	"dynamicfielduniqueid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameterdynamicappdataorigin?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--



CREATE EXTERNAL TABLE "pxf_vitalparametergrowthitem"( 
	"pkid" bigint,
	"vitalparametergrowthitemid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"sex" int,
	"agefrom" int,
	"ageto" int,
	"alertvalue1" numeric(18, 5),
	"alertvalue2" numeric(18, 5),
	"actionvalue1" numeric(18, 5),
	"actionvalue2" numeric(18, 5),
	"alerticon" bytea,
	"actionicon" bytea,
	"vitalparameterid" varchar,
	"alerthourfrom" numeric(9, 2),
	"alerthourto" numeric(9, 2),
	"actionhourfrom" numeric(9, 2),
	"actionhourto" numeric(9, 2)) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparametergrowthitem?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_vitalparameterlistitem"( 
	"pkid" bigint,
	"vitalparameterlistitemid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"text" varchar(500),
	"value" numeric(18, 2),
	"icon" bytea,
	"sortorder" int,
	"vitalparameterid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medicine.vitalparameterlistitem?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_laboratoryacquisition"( 
	"pkid" bigint,
	"laboratoryacquisitionid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"value" numeric(19, 4),
	"range" int,
	"validated" int,
	"createddatetime" timestamp,
	"acquisitiondatetime" timestamp,
	"createduserid" bigint,
	"unit" varchar(15),
	"comment" varchar,
	"laboratoryorderserviceid" varchar,
	"rangefrom" varchar(200),
	"rangeto" varchar(200),
	"resulttext" varchar,
	"valuestring" varchar,
	"sortorder" int) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryacquisition?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_laboratoryanalysis"( 
	"pkid" bigint,
	"laboratoryanalysisid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(50),
	"code" varchar(50),
	"analysistype" int,
	"servicetext" varchar,
	"comment" varchar,
	"manualinput" boolean,
	"active" boolean,
	"loinc" varchar(10),
	"serviceid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryanalysis?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_laboratoryordermaterialrelationship"( 
	"pkid" bigint,
	"laboratoryordermaterialrelationshipid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"quantity" int,
	"sortorder" int,
	"laboratoryorderserviceid" varchar,
	"materialid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryordermaterialrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_laboratoryorderservice"( 
	"pkid" bigint,
	"laboratoryorderserviceid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"servicecode" varchar(200),
	"quantity" int,
	"servicestate" int,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"servicetopic" varchar,
	"servicetext" varchar,
	"sortorder" int,
	"comment" varchar,
	"staff" varchar,
	"approximateduration" smallint,
	"laboratoryanalysisid" varchar,
	"analysisname" varchar,
	"profilename" varchar,
	"heading" varchar,
	"orderpkid" bigint,
	"laboratoryprofileid" varchar,
	"serviceid" varchar,
	"patientservicepkid" bigint,
	"externalreferenceid" varchar(200)) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryorderservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_laboratoryprofile"( 
	"pkid" bigint,
	"laboratoryprofileid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryprofile?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_laboratoryprofiletoanalysisrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"laboratoryanalysisid" varchar,
	"laboratoryprofileid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryprofiletoanalysisrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_laboratoryscreen"( 
	"pkid" bigint,
	"laboratoryscreenid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar,
	"urine" boolean,
	"pregnancy" boolean,
	"childdata" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryscreen?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_laboratoryscreenrelationship"( 
	"pkid" bigint,
	"laboratoryscreenrelationshipid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"heading" varchar(100),
	"typeofrelation" int,
	"sortorder" int,
	"contentsort" int,
	"referenceid" varchar,
	"laboratoryscreenid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.laboratoryscreenrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_order"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"parentpkid" bigint,
	"casedatauniqueid" bigint,
	"medicalcasepkid" bigint,
	"createuserid" bigint,
	"createdatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"sourceserviceunitid" bigint,
	"targetserviceunitid" bigint,
	"targetexamunitid" bigint,
	"targetuserid" bigint,
	"orderstate" int,
	"transporttype" int,
	"orderpriority" int,
	"duration" bigint,
	"appointmentdatetime" timestamp,
	"ordertopic" varchar,
	"comment" varchar,
	"analysismode" boolean,
	"senddirect" boolean,
	"amount" numeric(8, 3),
	"collectiontime" varchar,
	"pregnancyweek" int,
	"childnumber" bigint,
	"childname" varchar,
	"childdayofbirth" date,
	"childgender" int,
	"resultserviceunitid" bigint,
	"resulttargetuserid" bigint,
	"laboratoryscreenid" varchar,
	"orderkey" varchar(50),
	"sampledatetime" timestamp,
	"datetimesent" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.dbo.vw_order?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_orderservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"orderpkid" bigint,
	"servicecode" varchar(200),
	"quantity" int,
	"servicestate" int,
	"bookinguserid" bigint,
	"bookingdatetime" timestamp,
	"servicetopic" varchar,
	"servicetext" varchar,
	"sortorder" int,
	"comment" varchar,
	"staff" varchar,
	"approximateduration" smallint,
	"location" int,
	"serviceid" varchar,
	"patientservicepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.orderservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_orderservicematerialrelationship"( 
	"pkid" bigint,
	"materialpkid" bigint,
	"orderservicepkid" bigint,
	"sortorder" int,
	"quantity" int,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.orderservicematerialrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_serviceunitstoscreenrelationship"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"laboratoryscreenid" varchar,
	"serviceunitid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.ordermanagement.serviceunitstoscreenrelationship?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_atcgroup"( 
	"pkid" bigint,
	"atcgroupid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(20),
	"text" varchar,
	"description" varchar,
	"createuserid" bigint,
	"createdatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.atcgroup?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_drugdispenseconfirmation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"useridconfirmed" bigint,
	"datetimeconfirmed" timestamp,
	"additionalinfo" varchar,
	"patientmedexpensepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.drugdispenseconfirmation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_indicationgroup"( 
	"pkid" bigint,
	"indicationgroupid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(20),
	"text" varchar,
	"description" varchar,
	"createuserid" bigint,
	"createdatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.indicationgroup?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_meddosage"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"referencetype" int,
	"syntax" varchar(200),
	"uom" int,
	"isinfusionbase" boolean,
	"basevolume" numeric(12, 6),
	"infusionratetype" int,
	"infusionrate" int,
	"infusionrateuom" int,
	"medicationdrugid" varchar,
	"medprescriptionpkid" bigint,
	"medintervalpkid" bigint,
	"information" varchar,
	"sortorder" int,
	"medicationarticledataid" varchar,
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"indicationtext" varchar,
	"chargeqty" int,
	"sellinguom" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.meddosage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medinterval"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"weekday" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"medprescriptionpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medinterval?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medondemand"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"maxapplications" int,
	"maxdosage" numeric(8, 2),
	"mintimespanminutes" int,
	"medintervalpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medondemand?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medprescription"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"type" int,
	"applicationtype" int,
	"isondemand" boolean,
	"infusionmaxvolume" int,
	"sourcereferenceid" varchar(50),
	"sourcereferencetype" int,
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"category" int,
	"uom" int,
	"chargeqtymanualedited" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medprescription?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medtimepoint"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"numminutes" int,
	"dosageamount" numeric(8, 2),
	"meddosagepkid" bigint,
	"isprntp" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medtimepoint?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationactivesubstancedata"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"activesubstancecode" varchar(7),
	"activesubstancecategory" varchar(3),
	"activesubstancetext" varchar,
	"activesubstancecodeconversion" varchar(7),
	"createdatetime" timestamp,
	"modifydatetime" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationactivesubstancedata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationarticledata"( 
	"pkid" bigint,
	"medicationarticledataid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"articlecode" varchar(50),
	"articlename" varchar,
	"purchaseprice" numeric(8, 2),
	"sellingprice" numeric(8, 2),
	"packagesize" numeric(8, 2),
	"barcode" varchar(50),
	"searchable" boolean,
	"modifieddatatime" timestamp,
	"createdatatime" timestamp,
	"licenseno" varchar(50),
	"createuserid" bigint,
	"modifieduserid" bigint,
	"isdefault" boolean,
	"medicationdrugid" varchar,
	"serviceid" varchar,
	"sellingunituom" int,
	"sellingunitconversionfactor" numeric(12, 2),
	"labelunituom" int,
	"labelunitconversionfactor" numeric(8, 2),
	"boxtype" int,
	"additionalcashreference" int,
	"ismimsimported" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationarticledata?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdrug"( 
	"pkid" bigint,
	"medicationdrugid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(50),
	"name" varchar,
	"licenseno" varchar(50),
	"prescdefaultsyntax" varchar(20),
	"prescdefaultapptype" int,
	"prescdefaultuom" int,
	"dangerous" boolean,
	"dangerouscolor" varchar(25),
	"searchable" boolean,
	"usercreated" boolean,
	"information" varchar,
	"createuserid" bigint,
	"createdatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp,
	"drugdbmappingid" varchar,
	"concentrationdruguom" int,
	"concentrationactivesubstanceamount" numeric(14, 8),
	"concentrationactivesubstanceuom" int,
	"volume" numeric(8, 2),
	"iscustom" boolean,
	"concentrationdrugamount" numeric(14, 8),
	"syntaxfulltextdisplaydosageamount" int,
	"drugdbmappingtype" varchar,
	"warning1" varchar,
	"warning2" varchar,
	"link1" varchar,
	"link2" varchar,
	"classid" varchar,
	"isnarcotic" boolean,
	"genericdrug" varchar(200),
	"genericterm" varchar,
	"ismimsimported" boolean,
	"highalert" boolean,
	"highalertcolor" varchar(25)) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdrug?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdruginhousecatalogue"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"medicationdrugid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdruginhousecatalogue?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdrugtoactivesubstancerelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"currentnumber" varchar(25),
	"activesubstancecode" varchar(7),
	"activesubstancecodeconversion1" varchar(7),
	"activesubstancecodeconversion2" varchar(7),
	"activesubstancecategory" varchar(3),
	"amount" numeric(8, 2),
	"quantityunit" varchar(3),
	"basicunit" varchar(25),
	"sortorder" varchar(10),
	"indicator1" varchar(1),
	"indicator2" varchar(1),
	"createdatetime" timestamp,
	"modifydatetime" timestamp,
	"medicationdrugid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdrugtoactivesubstancerelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdrugtoatcgrouprelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"medicationdrugid" varchar,
	"atcgroupid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdrugtoatcgrouprelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdrugtoindicationgrouprelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"medicationdrugid" varchar,
	"indicationgroupid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdrugtoindicationgrouprelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationdrugtowarningrelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"medicationdrugid" varchar,
	"medicationwarningid" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationdrugtowarningrelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_medicationwarning"( 
	"pkid" bigint,
	"medicationwarningid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(20),
	"text" varchar,
	"createuserid" bigint,
	"createdatatime" timestamp,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp,
	"severity" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.medicationwarning?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_mimsrequest"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"casedatauniqueid" bigint,
	"datetimerequested" timestamp,
	"useridrequested" bigint,
	"mimsrequestxml" varchar,
	"mimsresponsexml" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.mimsrequest?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmeddosage"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"validfrom" timestamp,
	"validto" timestamp,
	"referencetype" int,
	"syntax" varchar(200),
	"uom" int,
	"isinfusionbase" boolean,
	"basevolume" numeric(12, 6),
	"infusionratetype" int,
	"infusionrate" int,
	"infusionrateuom" int,
	"medicationdrugid" varchar,
	"patientmedprescriptionpkid" bigint,
	"patientmedintervalpkid" bigint,
	"information" varchar,
	"prescdoctorid" bigint,
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"sortorder" int,
	"medicationarticledataid" varchar,
	"indicationtext" varchar,
	"syntaxfulltext" varchar(1000),
	"chargeqty" int,
	"sellinguom" int,
	"isstat" boolean,
	"discontinuedoctorid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmeddosage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmeddosagebalance"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientmeddosagepkid" bigint,
	"balance" numeric(19, 4)) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmeddosagebalance?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedexpense"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"expensetimeid" bigint,
	"createddatetime" timestamp,
	"dosageamount" numeric(19, 4),
	"expensetype" int,
	"bookingdatetime" timestamp,
	"information" varchar,
	"expensestate" int,
	"chargenr" varchar(20),
	"useddosageamount" numeric(19, 4),
	"patientmedprescriptionpkid" bigint,
	"createduserid" bigint,
	"casedatauniqueid" bigint,
	"patientmeddosagepkid" bigint,
	"ispharmacyinvalidated" boolean,
	"iobookingvitalparamid" bigint,
	"infusionvolume" int,
	"administeredmanually" boolean,
	"lasteditdatetime" timestamp,
	"stocklocation" bigint,
	"pharmacyorderpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedexpense?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedexpenseservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientservicepkid" bigint,
	"patientmedexpensepkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedexpenseservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedinterval"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"validfrom" timestamp,
	"validto" timestamp,
	"weekday" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"patientmedprescriptionpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedinterval?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedondemand"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"validfrom" timestamp,
	"validto" timestamp,
	"maxapplications" int,
	"maxdosage" numeric(8, 2),
	"mintimespanminutes" int,
	"patientmedintervalpkid" bigint,
	"fulltext" varchar(1000)) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedondemand?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedpause"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"validfrom" timestamp,
	"validto" timestamp,
	"type" int,
	"patientmedprescriptionpkid" bigint,
	"medicationdrugid" varchar,
	"startcomment" varchar,
	"endcomment" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedpause?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedprescription"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"name" varchar(100),
	"type" int,
	"category" int,
	"applicationtype" int,
	"isondemand" boolean,
	"validfrom" timestamp,
	"validto" timestamp,
	"infusionmaxvolume" int,
	"prescdoctorvalidationstate" int,
	"sourcereferenceid" varchar(50),
	"sourcereferencetype" int,
	"patientid" varchar,
	"casedatauniqueid" bigint,
	"prescdoctorid" bigint,
	"createduserid" bigint,
	"createddatetime" timestamp,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp,
	"information" varchar,
	"ispharmacyinvalidated" boolean,
	"dailyconfirmation" boolean,
	"prescdoctorworkplaceids" varchar(20),
	"isconfirmedasactive" boolean,
	"additionalcashreference" int,
	"chargeqtymanualedited" boolean,
	"deletereason" varchar(500),
	"discontinuedoctorid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedprescription?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedprescriptionconfirmed"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"confirmeddatetime" timestamp,
	"createddatetime" timestamp,
	"createduserid" bigint,
	"patientmedprescriptionpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedprescriptionconfirmed?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_patientmedtimepoint"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"numminutes" int,
	"dosageamount" numeric(8, 2),
	"patientmeddosagepkid" bigint,
	"isprntp" boolean) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedtimepoint?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_patientmedwarning"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"drugname" varchar(50),
	"warningtext" varchar,
	"createdatetime" timestamp,
	"createuserid" bigint,
	"patientmedprescriptionpkid" bigint,
	"patientmeddosagepkid" bigint,
	"patientid" varchar,
	"warningtype" int) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.patientmedwarning?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--

CREATE EXTERNAL TABLE "pxf_pharmacyorder"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"modifieddatetime" timestamp,
	"orderstate" int,
	"validfrom" timestamp,
	"validto" timestamp,
	"doctoruserid" bigint,
	"casedatauniqueid" bigint,
	"patientid" varchar,
	"pharmacystockid" varchar,
	"isinvalidated" boolean,
	"invalidatedpharmacyorderpkid" bigint,
	"prescriptioncategory" int,
	"stocklocation" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacyorder?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacyorderitem"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"amount" numeric(19, 2),
	"syntax" varchar(200),
	"pharmacyorderpkid" bigint,
	"medicationdrugid" varchar,
	"medicationarticledataid" varchar,
	"patientmedprescriptionpkid" bigint,
	"patientmeddosagepkid" bigint,
	"validfrom" timestamp,
	"validto" timestamp,
	"issuccessororderrequired" boolean,
	"iscorrection" boolean,
	"ismanual" boolean,
	"chargeqty" int,
	"sellinguom" int,
	"uom" int,
	"lastmodifiedprescribedbyscheduler" timestamp) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacyorderitem?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacyorderstatetransition"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pharmacyorderpkid" bigint,
	"fromorderstate" int,
	"toorderstate" int,
	"datetime" timestamp,
	"comment" varchar,
	"userid" bigint,
	"additionaluserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacyorderstatetransition?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacyservice"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"patientservicepkid" bigint,
	"pharmacyorderpkid" bigint,
	"pharmacyorderitempkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacyservice?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacystock"( 
	"pkid" bigint,
	"pharmacystockid" varchar,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"code" varchar(20),
	"text" varchar(50),
	"description" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacystock?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacystockarticle"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pharmacystockid" varchar,
	"medicationarticledataid" varchar,
	"amount" numeric(8, 2),
	"licenseno" varchar(20),
	"batchno" numeric(8, 0)) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacystockarticle?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacystocktodepartmentrelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pharmacystockid" varchar,
	"departmentid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacystocktodepartmentrelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacystocktoserviceunitrelation"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"pharmacystockid" varchar,
	"serviceunitid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacystocktoserviceunitrelation?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_pharmacywarning"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"drugname" varchar(50),
	"warningtext" varchar,
	"severity" int,
	"createdatetime" timestamp,
	"createuserid" bigint,
	"pharmacyorderstatetransitionpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.medication.pharmacywarning?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_casedatacommunication"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"topic" int,
	"datetimesent" timestamp,
	"iscolored" boolean,
	"text" varchar,
	"parentpkid" bigint,
	"casedatauniqueid" bigint,
	"sendinguserid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.messaging.casedatacommunication?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_casedatacommunicationread"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"userid" bigint,
	"casedatacommunicationpkid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.messaging.casedatacommunicationread?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_message"( 
	"pkid" bigint,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"rowversion" bytea,
	"subject" varchar(50),
	"messagetext" varchar(2000),
	"priority" int,
	"isread" boolean,
	"datesent" timestamp,
	"toemail" varchar(100),
	"tocontactid" varchar,
	"touserid" bigint,
	"topatientid" varchar,
	"fromuserid" bigint,
	"attacheddocumentid" bigint,
	"patientid" varchar,
	"referencedmessageid" bigint) LOCATION ('pxf://MedCubesKPJ_Selangor.messaging.message?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

--


CREATE EXTERNAL TABLE "pxf_mediastorage"( 
	"rowversion" bytea,
	"customerid" bigint,
	"tenantid" bigint,
	"recordstate" smallint,
	"thumbnail" bytea,
	"version" int,
	"mediastorageid" varchar,
	"mediastoragepk" int,
	"validfrom" timestamp,
	"validto" timestamp,
	"rowguid" varchar,
	"mediafile" bytea,
	"mediafiletextanonymized" varchar) LOCATION ('pxf://MedCubesKPJ_Selangor.framework.mediastorage?PROFILE=Jdbc&SERVER=sqlserver3&QUOTE_COLUMNS=true&BATCH_SIZE=100000&FETCH_SIZE=100000&POOL_SIZE=8')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





