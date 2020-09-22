\set ON_ERROR_STOP on
\set ECHO all
BEGIN;

CREATE TABLE "assignedconsultant"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"isprimary" boolean,
	"userid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"consultanttype" int,
	"serviceunitid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "casedata"( 
	"casedatauniqueid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"caseid" varchar(16) NOT NULL,
	"admissiontype" int,
	"admissiondatetime" timestamp with time zone,
	"dischargetype" int,
	"dischargedatetime" timestamp with time zone,
	"planneddischargedatetime" timestamp with time zone,
	"internaldoctor" bigint,
	"patientid" varchar NOT NULL,
	"medicalrecordid" bigint NOT NULL,
	"admissionstatus" int,
	"isvirtualpatient" boolean NOT NULL,
	"plannedstate" boolean NOT NULL,
	"referringdoctor" varchar,
	"admissionsourcetype" int,
	"casecodetype" int,
	"paytypetype" int,
	"payermode" int,
	"billtype" int,
	"payercode" varchar,
	"dischargedestinationtype" int,
	"admissiondiagnosisid" varchar,
	"comment" varchar) DISTRIBUTED BY (casedatauniqueid);


CREATE TABLE "employer"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientid" varchar NOT NULL,
	"companyname" varchar(200) NOT NULL,
	"phonenumber" varchar(50),
	"profession" varchar(200),
	"addressstreet" varchar(200),
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"professiontype" int) DISTRIBUTED BY (pkid);


CREATE TABLE "insuredperson"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
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
	"addresscountrycodecompany" varchar(200)) DISTRIBUTED BY (pkid);

CREATE TABLE "medicalcasedata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"departmentid" bigint NOT NULL,
	"serviceunitid" bigint,
	"validfrom" timestamp with time zone,
	"validuntil" timestamp with time zone,
	"medicalcaseid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "medicalrecord"( 
	"pkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"name" varchar(50) NOT NULL,
	"departmentid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "patient"( 
	"pkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dobapprox" boolean NOT NULL,
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
	"appointmentreminder" int) DISTRIBUTED BY (pkid);

CREATE TABLE "patientappointmenttimepoint"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientid" varchar NOT NULL,
	"referencetype" int NOT NULL,
	"referencepkid" bigint,
	"plannedtimeid" bigint NOT NULL,
	"uniqueappointmentid" varchar(100) NOT NULL,
	"serviceid" varchar NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"planneddatetime" timestamp with time zone NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"completiondatetimefrom" timestamp with time zone NOT NULL,
	"completiondatetimeuntil" timestamp with time zone NOT NULL,
	"duration" smallint NOT NULL,
	"staff" varchar,
	"appointmentstate" int NOT NULL,
	"information" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "patientappointmenttimepointmaterial"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"materialid" varchar,
	"quantity" int NOT NULL,
	"name" varchar,
	"patientappointmenttimepointpkid" bigint,
	"patientnursingmaterialpkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "patientcontact"( 
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"name" varchar(50) NOT NULL,
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
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"hasresidencekey" boolean NOT NULL,
	"emergencynotify" boolean NOT NULL,
	"sortorder" boolean NOT NULL,
	"addresscity" varchar(200),
	"addresszipcode" varchar(200),
	"addresscountrycode" varchar(200),
	"contacttype" int) DISTRIBUTED BY (customerid);

CREATE TABLE "patientinsurance"( 
	"pkid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"patientid" varchar NOT NULL,
	"validfrom" date,
	"validto" date,
	"debtorid" varchar NOT NULL,
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "patientservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"medicalcasepkid" bigint NOT NULL,
	"servicecode" varchar(200) NOT NULL,
	"servicetext" varchar NOT NULL,
	"quantity" numeric(8, 2) NOT NULL,
	"completeddatetimefrom" timestamp with time zone NOT NULL,
	"completeddatetimeto" timestamp with time zone NOT NULL,
	"completinguserid" bigint NOT NULL,
	"completingserviceunitid" bigint NOT NULL,
	"completingexamunitid" bigint,
	"servicetopic" varchar,
	"servicemark" int,
	"isorderservice" boolean,
	"islaboratoryservice" boolean,
	"isnursingservice" boolean,
	"isbillable" boolean,
	"hasmaterials" boolean,
	"staff" varchar,
	"price" numeric(8, 2) NOT NULL,
	"patientservicevariablepricepkid" bigint,
	"location" int,
	"iseditable" boolean NOT NULL,
	"serviceid" varchar NOT NULL,
	"servicetype" int,
	"nursingcategory" int,
	"nursingarea" int,
	"discountpercent" numeric(5, 2),
	"taxrate" numeric(5, 2) NOT NULL,
	"discountabsolute" numeric(8, 2)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientservicebill"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"invoicenumber" varchar(50) NOT NULL,
	"payermode" int,
	"paymentdatetime" timestamp with time zone NOT NULL,
	"cancellationdatetime" timestamp with time zone,
	"price" numeric(10, 2) NOT NULL,
	"taxrate" numeric(5, 2) NOT NULL,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"istransmitted" boolean NOT NULL,
	"patientservicepkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"accountingunitpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientservicematerialrelationship"( 
	"pkid" bigint NOT NULL,
	"materialpkid" bigint NOT NULL,
	"patientservicepkid" bigint NOT NULL,
	"sortorder" int NOT NULL,
	"quantity" int NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientservicevariableprice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"type" int,
	"sequence" int,
	"maxprice" numeric(8, 2) NOT NULL,
	"minprice" numeric(8, 2) NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"comment" varchar,
	"bookinguserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "physicalcasedata"( 
	"physicalcaseid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"class" int,
	"roomid" bigint,
	"bedid" bigint,
	"phoneno" varchar(50),
	"validfrom" timestamp with time zone,
	"validuntil" timestamp with time zone,
	"bedtype" int) DISTRIBUTED BY (physicalcaseid);

CREATE TABLE "physicalcasevacation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"physicalcaseid" bigint NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validuntil" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "plannedcasedataextension"( 
	"plannedcasedataextensionid" bigint NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"priority" int,
	"datecreated" date NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"comment" varchar) DISTRIBUTED BY (plannedcasedataextensionid);

CREATE TABLE "vipinfo"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(500) NOT NULL,
	"nic" varchar(50),
	"oic" varchar(50),
	"passport" varchar(50),
	"type" varchar(100),
	"relationship" varchar(100),
	"comment" varchar(300),
	"patientpkid" varchar,
	"progressrecid" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "virtualpatient"( 
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"name" varchar(50) NOT NULL,
	"dateofbirth" date,
	"sex" int,
	"phonenumber" varchar(50),
	"admissionreason" varchar) DISTRIBUTED BY (customerid);

CREATE TABLE "accountingunit"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"accountingid" varchar(50) NOT NULL,
	"accountingunittype" int NOT NULL,
	"shortcut" varchar(4) NOT NULL,
	"userid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "bed"( 
	"bedid" bigint NOT NULL,
	"shortname" varchar(50),
	"name" varchar(500),
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"roomid" bigint NOT NULL,
	"validfrom" date NOT NULL,
	"validto" date,
	"additionalinformation" varchar,
	"isactive" boolean,
	"phone" varchar(50)) DISTRIBUTED BY (bedid);

CREATE TABLE "city"( 
	"cityid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"countrycode" varchar(10) NOT NULL,
	"zipcode" varchar(10) NOT NULL,
	"name" varchar(200) NOT NULL,
	"areadialingcode" varchar(5)) DISTRIBUTED BY (cityid);

CREATE TABLE "closetime"( 
	"pkid" bigint NOT NULL,
	"parenttype" smallint NOT NULL,
	"type" smallint NOT NULL,
	"specialdatetimefrom" timestamp with time zone,
	"specialdatetimeto" timestamp with time zone,
	"weeklydayfrom" smallint,
	"weeklydayto" smallint,
	"weeklystarttime" timestamp with time zone,
	"weeklyendtime" timestamp with time zone,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"parentid" bigint NOT NULL,
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "debtor"( 
	"pkid" bigint NOT NULL,
	"debtorid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"debtorkey" varchar(50) NOT NULL,
	"shortname" varchar(50),
	"name" varchar(500),
	"description" varchar,
	"isactive" boolean NOT NULL,
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
	"debtortype" int) DISTRIBUTED BY (pkid);

CREATE TABLE "department"( 
	"departmentid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(500),
	"shortname" varchar(50),
	"validfrom" date,
	"validuntil" date,
	"departmentkey" varchar(50) NOT NULL,
	"information" varchar) DISTRIBUTED BY (departmentid);

CREATE TABLE "examinationunit"( 
	"examunitid" bigint NOT NULL,
	"name" varchar(500),
	"shortname" varchar(50),
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"isactive" boolean,
	"additionalinformation" varchar,
	"fromtime" timestamp with time zone,
	"untiltime" timestamp with time zone,
	"serviceunitid" bigint NOT NULL,
	"validfrom" date,
	"validuntil" date) DISTRIBUTED BY (examunitid);

CREATE TABLE "externalcontact"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"externalcontactuniqueid" varchar NOT NULL,
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
	"usecorrespondentinletter" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "material"( 
	"pkid" bigint NOT NULL,
	"materialid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"cost" numeric(19, 4) NOT NULL,
	"categorypopupkey" int,
	"materialkey" varchar(100) NOT NULL,
	"name" varchar NOT NULL,
	"centralpharmaceuticalnumber" varchar NOT NULL,
	"literaturesource" varchar,
	"materialtype" varchar,
	"defaultdispunitamount" numeric(19, 4),
	"defaultdispunituom" int,
	"priceperdispunit" numeric(19, 4),
	"packagesize" varchar(50),
	"producer" varchar(200),
	"externalid" varchar(200)) DISTRIBUTED BY (pkid);

CREATE TABLE "materialdocumentrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"materialid" varchar NOT NULL,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "room"( 
	"roomid" bigint NOT NULL,
	"shortname" varchar(50),
	"name" varchar(500),
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"validfrom" date NOT NULL,
	"validto" date) DISTRIBUTED BY (roomid);

CREATE TABLE "service"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceid" varchar NOT NULL,
	"validfrom" date NOT NULL,
	"validto" date,
	"isactive" boolean NOT NULL,
	"priority" int,
	"servicetype" int,
	"servicegroup" int,
	"displayalternativetext" boolean NOT NULL,
	"approximateduration" smallint NOT NULL,
	"staffquantity" int,
	"nursingcategory" int,
	"nursingarea" int,
	"nursingpreferredtimefrom" timestamp with time zone,
	"nursingpreferredtimeto" timestamp with time zone,
	"patientgender" varchar(50),
	"patientagefrom" int,
	"patientageto" int,
	"staffqualification" int,
	"servicecode" varchar(200) NOT NULL,
	"servicedefinition" varchar,
	"servicetext" varchar NOT NULL,
	"alternativetext" varchar,
	"serviceassignmode" int,
	"evaluationdays" int,
	"schedulesyntax" varchar(100),
	"defaultprice" numeric(8, 2) NOT NULL,
	"maxprice" numeric(8, 2) NOT NULL,
	"minprice" numeric(8, 2) NOT NULL,
	"variableprice" boolean NOT NULL,
	"location" boolean NOT NULL,
	"taskid" varchar,
	"literaturesource" varchar,
	"progressrecid" varchar(100),
	"xrefcode" varchar(200),
	"taxrate" numeric(5, 2) NOT NULL,
	"isexternal" boolean,
	"planningtaskid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "servicedocumentrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceid" varchar NOT NULL,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "servicematerialrelationship"( 
	"pkid" bigint NOT NULL,
	"materialid" varchar NOT NULL,
	"serviceid" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"quantity" int NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "servicereference"( 
	"pkid" bigint NOT NULL,
	"serviceidparent" varchar NOT NULL,
	"serviceid" varchar NOT NULL,
	"quantity" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"sortorder" smallint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "serviceunit"( 
	"serviceunitid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"shortname" varchar(50),
	"name" varchar(500),
	"admissiontypes" varchar(50),
	"departmentid" bigint NOT NULL,
	"description" varchar(500),
	"serviceunitkey" varchar(50) NOT NULL,
	"validfrom" date,
	"validuntil" date,
	"taskid" varchar) DISTRIBUTED BY (serviceunitid);

CREATE TABLE "serviceunitreportextension"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"adressblock" varchar,
	"footer" varchar,
	"logo" bytea,
	"logoheader" bytea,
	"logofooter" bytea,
	"serviceunitpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "syntaxformofapplication"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"syntax" varchar(20) NOT NULL,
	"syntaxfulltext" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "timeduration"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"syntax" varchar(20) NOT NULL,
	"durationtype" int,
	"durationvalue" int,
	"syntaxfulltext" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "timeinterval"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(250) NOT NULL,
	"syntax" varchar(20) NOT NULL,
	"weekday" varchar(50),
	"interval" int,
	"intervalvalue" int,
	"syntaxfulltext" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "timescheme"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(250) NOT NULL,
	"syntax" varchar(20) NOT NULL,
	"ondemand" boolean NOT NULL,
	"timeranges" varchar,
	"syntaxfulltext" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientcalendarentry"( 
	"pkid" bigint NOT NULL,
	"patientcalendarentryid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(256) NOT NULL,
	"startdatetime" timestamp with time zone NOT NULL,
	"enddatetime" timestamp with time zone,
	"additionalinfo" varchar(1000),
	"patientid" varchar NOT NULL,
	"entrytypeid" int,
	"serviceunitid" bigint,
	"planningstate" int,
	"serviceid" varchar,
	"seriesid" varchar,
	"seriesdefinition" varchar(1000)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientcalendarentryresourcerelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientcalendarentryid" varchar NOT NULL,
	"resourceid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "resource"( 
	"pkid" bigint NOT NULL,
	"resourceid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"type" int,
	"maindataid" bigint,
	"name" varchar(500) NOT NULL,
	"createorder" boolean,
	"orderserviceunitid" bigint,
	"orderexamunitid" bigint,
	"orderuserid" bigint,
	"icon" bytea,
	"color" varchar(25),
	"additionalinfo" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "resourcegroup"( 
	"pkid" bigint NOT NULL,
	"resourcegroupid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"type" int,
	"name" varchar(500) NOT NULL,
	"allowmultiple" boolean,
	"maximumcount" int) DISTRIBUTED BY (pkid);

CREATE TABLE "resourceresourcegrouprelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"resourceid" varchar NOT NULL,
	"resourcegroupid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "resourcetime"( 
	"pkid" bigint NOT NULL,
	"resourcetimeid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"resourceid" varchar NOT NULL,
	"type" int NOT NULL,
	"weekday" int,
	"timefrom" timestamp with time zone NOT NULL,
	"timeuntil" timestamp with time zone NOT NULL,
	"comment" varchar(500)) DISTRIBUTED BY (pkid);

CREATE TABLE "serviceresourcegrouprelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"serviceid" varchar NOT NULL,
	"resourcegroupid" varchar NOT NULL,
	"duration" int) DISTRIBUTED BY (pkid);

CREATE TABLE "documentinfo"( 
	"content" bytea,
	"customerkey" varchar NOT NULL,
	"tenantid" bigint NOT NULL,
	"documentid" bigint NOT NULL,
	"documentkey" varchar NOT NULL,
	"version" int,
	"documenttype" int,
	"mimetype" varchar(50) NOT NULL,
	"primaryidentifier" varchar(50),
	"secondaryidentifier" varchar(50),
	"docrelation" varchar(500),
	"status" int,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"password" bytea,
	"keywords" varchar,
	"isfinalized" boolean NOT NULL,
	"comment" varchar,
	"customerid" bigint NOT NULL,
	"createdbyuser" varchar(50) NOT NULL,
	"createdbyuserid" bigint NOT NULL,
	"createddate" timestamp with time zone,
	"title" varchar(100),
	"externalreference" varchar(100),
	"externalreferencemodel" varchar(200),
	"annotationpkid" bigint) DISTRIBUTED BY (documentid);

CREATE TABLE "documentstatus"( 
	"pkid" bigint NOT NULL,
	"documentid" bigint NOT NULL,
	"statustype" smallint NOT NULL,
	"changinguser" varchar(50) NOT NULL,
	"dateofchange" timestamp with time zone NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"changinguserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "documenttype"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(200),
	"relation" varchar(200) NOT NULL,
	"activityforedit" varchar,
	"activityforview" varchar,
	"icon" bytea,
	"documenttypeid" varchar NOT NULL,
	"appassemblyid" varchar NOT NULL,
	"activityfordelete" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "actiontile"( 
	"pkid" bigint NOT NULL,
	"actiontileid" varchar NOT NULL,
	"type" smallint NOT NULL,
	"tilestyleid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"query" varchar,
	"description" varchar,
	"mastertables" varchar,
	"name" varchar(40) NOT NULL,
	"uiappclassname" varchar(128)) DISTRIBUTED BY (pkid);

CREATE TABLE "activeusers"( 
	"pkid" bigint NOT NULL,
	"userid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"workstation" varchar(300) NOT NULL,
	"currentlogins" int NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "annotation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"annotationstring" varchar NOT NULL,
	"referenceid" varchar(50) NOT NULL,
	"referencetype" varchar(500) NOT NULL,
	"mediastoreageid" varchar,
	"width" int,
	"height" int,
	"scale" numeric(18, 0)) DISTRIBUTED BY (pkid);

CREATE TABLE "appassembly"( 
	"appassemblyid" varchar NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"name" varchar(64) NOT NULL,
	"description" varchar(256),
	"vendor" varchar(64),
	"version" varchar(64),
	"assemblyname" varchar(256) NOT NULL,
	"xapfilename" varchar(256) NOT NULL,
	"rowversion" bytea NOT NULL,
	"assemblynameserviceproxy" varchar(256),
	"assemblynameserver" varchar(256),
	"xapfilehash" varchar(256),
	"apppartnerid" varchar NOT NULL) DISTRIBUTED BY (appassemblyid);

CREATE TABLE "appassemblyreference"( 
	"pkid" bigint NOT NULL,
	"xapfilenamesource" varchar(256) NOT NULL,
	"xapfilenameparent" varchar(256) NOT NULL,
	"description" varchar(300)) DISTRIBUTED BY (pkid);

CREATE TABLE "apppartner"( 
	"apppartnerid" varchar NOT NULL,
	"name" varchar(100) NOT NULL,
	"schemaname" varchar(20) NOT NULL) DISTRIBUTED BY (apppartnerid);

CREATE TABLE "clientcachedata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"schemaname" varchar(200) NOT NULL,
	"tablename" varchar(500) NOT NULL,
	"hashvalue" varchar(500) NOT NULL,
	"culture" varchar(10),
	"addkey" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "culture"( 
	"pkid" bigint NOT NULL,
	"cultureid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"shortname" varchar(50),
	"dictionary" bytea,
	"mimetype" varchar(50),
	"isdefault" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "customer"( 
	"customerid" bigint NOT NULL,
	"customerkey" varchar NOT NULL,
	"name" varchar(100) NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"email" varchar(50),
	"validfrom" date,
	"validto" date,
	"phoneno" varchar(50),
	"homepage" varchar(50),
	"information" varchar(500),
	"code" varchar(20) NOT NULL,
	"culture" int,
	"faxno" varchar(150)) DISTRIBUTED BY (customerid);

CREATE TABLE "desktoponprofile"( 
	"desktoponprofileid" bigint NOT NULL,
	"uidesktopid" varchar NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"isdefault" boolean NOT NULL,
	"profileid" varchar NOT NULL) DISTRIBUTED BY (desktoponprofileid);

CREATE TABLE "doctornote"( 
	"messageid" bigint NOT NULL,
	"rowversion" bytea,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"isread" boolean NOT NULL,
	"title" varchar(1000) NOT NULL,
	"description" varchar(1000) NOT NULL,
	"priority" smallint,
	"username" varchar(100),
	"datesent" timestamp with time zone NOT NULL,
	"dateaccepted" timestamp with time zone,
	"sendingusername" varchar(100),
	"recordingmediastorageid" varchar,
	"patientname" varchar(200)) DISTRIBUTED BY (messageid);

CREATE TABLE "doctornoteanswer"( 
	"messageid" bigint NOT NULL,
	"rowversion" bytea,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"originalmessageid" bigint NOT NULL,
	"newmessageid" bigint NOT NULL) DISTRIBUTED BY (messageid);

CREATE TABLE "dynamicappdatatoprefill"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"fullfieldname" varchar(500) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicappmasterdata"( 
	"dynamicappmasterdataid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"name" varchar(200) NOT NULL,
	"description" varchar,
	"xamlforview" varchar,
	"validfrom" date,
	"validto" date,
	"version" bigint NOT NULL,
	"width" double precision NOT NULL,
	"height" double precision NOT NULL,
	"category" int,
	"dynamicappkey" varchar NOT NULL,
	"mediastorageid" varchar,
	"savedtrigger" varchar,
	"loadedtrigger" varchar,
	"iswizardpage" boolean NOT NULL,
	"validationtrigger" varchar,
	"hasmcrichtextboxcontrol" boolean) DISTRIBUTED BY (dynamicappmasterdataid);

CREATE TABLE "dynamicapppageofwizard"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicappwizardmasterdataid" varchar NOT NULL,
	"dynamicappmasterdataid" varchar NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"info" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicappwizardmasterdata"( 
	"pkid" bigint NOT NULL,
	"dynamicappwizardmasterdataid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(250) NOT NULL,
	"width" double precision NOT NULL,
	"height" double precision NOT NULL,
	"category" int,
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicdatacontent"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicappmasterdataid" varchar NOT NULL,
	"datetimecreated" timestamp with time zone NOT NULL,
	"identifiervaluepairs" varchar(300),
	"dynamicappname" varchar(100) NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"controlvalues" varchar,
	"userid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicdatacontentwizardrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicdatarecordpkid" bigint NOT NULL,
	"dynamicdatacontentpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicdatarecord"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"datetimecreated" timestamp with time zone NOT NULL,
	"usernamecreated" varchar(50) NOT NULL,
	"useridcreated" bigint NOT NULL,
	"tablename" varchar(50) NOT NULL,
	"parenttableid" varchar NOT NULL,
	"tabletype" smallint NOT NULL,
	"parentrecordpkid" varchar(200) NOT NULL,
	"fieldvalues" text NOT NULL,
	"dynamicdatacontentpkid" bigint,
	"schemaname" varchar(50),
	"isaquiredbywizard" boolean NOT NULL,
	"isfinalized" boolean NOT NULL,
	"finalizedbyuserid" bigint,
	"fieldname" varchar(50),
	"ismcrichtextboxfield" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicdatarecordscreenshot"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"mediastorageid" varchar NOT NULL,
	"dynamicdatarecordpkid" bigint NOT NULL,
	"parentrecordpkid" varchar(50) NOT NULL,
	"controlname" varchar(100) NOT NULL,
	"fieldname" varchar(50)) DISTRIBUTED BY (pkid);

CREATE TABLE "dynamicextendabletables"( 
	"tableid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"tablename" varchar(50) NOT NULL,
	"appassemblyid" varchar NOT NULL,
	"serviceproxyclassname" varchar(128) NOT NULL,
	"dataobjectclassname" varchar(128) NOT NULL,
	"identifiername" varchar(50) NOT NULL,
	"serviceclassname" varchar(256),
	"schemaname" varchar(50)) DISTRIBUTED BY (tableid);

CREATE TABLE "dynamicfields"( 
	"fieldid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"name" varchar(50) NOT NULL,
	"type" int,
	"parent" varchar NOT NULL,
	"popupkey" varchar(300),
	"frozen" int NOT NULL,
	"pkid" bigint NOT NULL,
	"label" varchar(50),
	"defaultvalue" varchar(200)) DISTRIBUTED BY (fieldid);

CREATE TABLE "dynamicsubtables"( 
	"subtableid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"name" varchar(50) NOT NULL,
	"parent" varchar NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"pkid" bigint NOT NULL,
	"description" varchar,
	"label" varchar(256),
	"iswizardforedit" boolean NOT NULL) DISTRIBUTED BY (subtableid);

CREATE TABLE "function"( 
	"functionid" varchar NOT NULL,
	"functionkey" varchar(50) NOT NULL,
	"name" varchar(50) NOT NULL,
	"description" varchar(1000),
	"module" varchar(50) NOT NULL,
	"functiongroup" varchar(50),
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"defaultpermissiontype" int NOT NULL,
	"referencecontent" varchar(500)) DISTRIBUTED BY (functionid);

CREATE TABLE "functionofpermissiongrid"( 
	"pkid" bigint NOT NULL,
	"permissiongridid" varchar NOT NULL,
	"functionid" varchar NOT NULL,
	"permissiontype" int,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "globaltables"( 
	"tableid" bigint NOT NULL,
	"tablename" varchar(150) NOT NULL,
	"globaltype" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"tableshortname" varchar(50) NOT NULL) DISTRIBUTED BY (tableid);

CREATE TABLE "headlinefields"( 
	"pkid" int NOT NULL,
	"table" varchar(256) NOT NULL,
	"headlinelabel" varchar(100),
	"headlinesqlcode" varchar(4000),
	"headlineindexcolumns" varchar(4000),
	"okbydeveloper" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "history"( 
	"historyid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"historykey" varchar(100) NOT NULL,
	"historytext" text NOT NULL,
	"userid" varchar(50) NOT NULL,
	"actiontype" varchar(20) NOT NULL,
	"date" timestamp with time zone NOT NULL,
	"historytable" varchar(200) NOT NULL,
	"parentkey" varchar(100),
	"parenttable" varchar(200),
	"servicename" varchar(300),
	"classname" varchar(300),
	"primaryforeignidentifier" varchar(50),
	"secondaryforeignidentifier" varchar(50),
	"transactionid" varchar NOT NULL) DISTRIBUTED BY (historyid);

CREATE TABLE "icon"( 
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"iconid" varchar NOT NULL,
	"name" varchar(50) NOT NULL,
	"type" varchar(50),
	"mediastorageid" varchar NOT NULL,
	"pkid" bigint NOT NULL) DISTRIBUTED BY (rowversion);

CREATE TABLE "logentry"( 
	"logentryid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"level" varchar(50) NOT NULL,
	"machinename" varchar(50) NOT NULL,
	"filename" varchar(250),
	"linenumber" int,
	"date" timestamp NOT NULL,
	"message" varchar,
	"stacktrace" varchar,
	"userid" bigint NOT NULL,
	"username" varchar(100)) DISTRIBUTED BY (logentryid);

CREATE TABLE "manualactiontilestate"( 
	"pkid" bigint NOT NULL,
	"type" smallint NOT NULL,
	"parentkey" varchar(200) NOT NULL,
	"description" varchar,
	"status" boolean NOT NULL,
	"username" varchar NOT NULL,
	"userid" bigint NOT NULL,
	"date" timestamp with time zone NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"actiontileid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "masterdataexporttables"( 
	"exporttableid" bigint NOT NULL,
	"tablename" varchar(50) NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"description" varchar(500),
	"appassemblyid" varchar NOT NULL,
	"serviceproxyclassname" varchar(128) NOT NULL,
	"serviceproxyclassassembly" varchar(128) NOT NULL) DISTRIBUTED BY (exporttableid);

CREATE TABLE "mcrichtextboxdatacontent"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicdatacontentpkid" bigint NOT NULL,
	"controlname" varchar(100) NOT NULL,
	"raddocumentxaml" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "mcrichtextboxdatarecord"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicdatarecordpkid" bigint NOT NULL,
	"fieldname" varchar(50) NOT NULL,
	"parentrecordpkid" varchar(50) NOT NULL,
	"raddocumentxaml" varchar NOT NULL,
	"unformattedtext" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "mcrichtextboxdefaultvalue"( 
	"pkid" bigint NOT NULL,
	"mcrichtextboxdefaultvalueid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicfieldid" varchar NOT NULL,
	"raddocumentxaml" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "moduleinfo"( 
	"moduleinfoid" int NOT NULL,
	"name" varchar(100),
	"majorversion" int NOT NULL,
	"minorversion" int NOT NULL,
	"sprintversion" int NOT NULL,
	"hotfixversion" int NOT NULL) DISTRIBUTED BY (moduleinfoid);

CREATE TABLE "option"( 
	"optionid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"isactive" boolean,
	"key" varchar(100) NOT NULL,
	"description" varchar(500),
	"value" varchar(4000),
	"validationexpression" varchar,
	"isoverwriteable" boolean NOT NULL,
	"appassemblyid" varchar NOT NULL,
	"type" int,
	"typeentries" varchar,
	"workstationid" varchar(50)) DISTRIBUTED BY (optionid);

CREATE TABLE "patidokhistory"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientid" varchar NOT NULL,
	"casedatauniqueid" bigint,
	"table" varchar(50) NOT NULL,
	"actiontype" varchar(20) NOT NULL,
	"date" timestamp with time zone NOT NULL,
	"externalreferenceid" varchar(50) NOT NULL,
	"useridcreated" bigint NOT NULL,
	"historytext" text NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "permissiongrid"( 
	"pkid" bigint NOT NULL,
	"permissiongridid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"name" varchar(50) NOT NULL,
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "phoneconnection"( 
	"phoneconnectionid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"channeluri" varchar(500) NOT NULL,
	"username" varchar(100) NOT NULL) DISTRIBUTED BY (phoneconnectionid);

CREATE TABLE "popupentry"( 
	"popupentryid" varchar NOT NULL,
	"popupheaderid" varchar NOT NULL,
	"popupkey" varchar(300) NOT NULL,
	"sortorder" int NOT NULL,
	"popupentrycode" int NOT NULL,
	"text" varchar(256) NOT NULL,
	"description" varchar(1000),
	"additionalparameters" varchar(1000),
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"icon" bytea,
	"iscustomerentry" boolean NOT NULL,
	"pkid" bigint NOT NULL,
	"color" varchar(25)) DISTRIBUTED BY (popupentryid);

CREATE TABLE "popupheader"( 
	"popupkey" varchar(64) NOT NULL,
	"name" varchar(70) NOT NULL,
	"popupheaderid" varchar NOT NULL,
	"description" varchar(1000),
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"isallowedtomodifyentries" boolean NOT NULL,
	"pkid" bigint NOT NULL,
	"category" varchar(50) NOT NULL,
	"installedbyassembly" varchar(200)) DISTRIBUTED BY (popupkey);

CREATE TABLE "popupmapping"( 
	"pkid" int NOT NULL,
	"popupkey" varchar(128),
	"schemaname" varchar(128) NOT NULL,
	"tablename" varchar(128) NOT NULL,
	"columnname" varchar(128) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "profile"( 
	"name" varchar(50) NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"profileid" varchar NOT NULL,
	"pkid" bigint NOT NULL,
	"validfrom" date NOT NULL,
	"validto" date) DISTRIBUTED BY (pkid);

CREATE TABLE "profileofuser"( 
	"profileofuserid" bigint NOT NULL,
	"userid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"isdefault" boolean NOT NULL,
	"profileid" varchar NOT NULL) DISTRIBUTED BY (profileofuserid);

CREATE TABLE "refreshstate"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"primarykey" varchar(50),
	"filtercriteria1" varchar(50),
	"filtercriteria2" varchar(50),
	"topic" varchar(50) NOT NULL,
	"updatetime" timestamp with time zone NOT NULL,
	"action" varchar(6) NOT NULL,
	"changedbyclientuserid" int,
	"changedbyapp" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "reportofapp"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"appobjectid" varchar NOT NULL,
	"reportpath" varchar(1000) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "reportpermission"( 
	"username" varchar(128) NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL) DISTRIBUTED BY (username);

CREATE TABLE "rssitem"( 
	"rssitemid" bigint NOT NULL,
	"title" varchar(200) NOT NULL,
	"description" varchar(200) NOT NULL,
	"content" varchar NOT NULL,
	"publishdate" timestamp NOT NULL,
	"link" varchar(500),
	"author" varchar(500),
	"authoremail" varchar(500),
	"authoruri" varchar(500),
	"issue" varchar(500)) DISTRIBUTED BY (rssitemid);

CREATE TABLE "scopepermissiongridrelationship"( 
	"pkid" bigint NOT NULL,
	"permissiongridid" varchar NOT NULL,
	"scopeid" varchar NOT NULL,
	"scopetype" smallint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"profileid" varchar NOT NULL,
	"groupkey" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "searchstructure"( 
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"nodeid" varchar NOT NULL,
	"parentnodeid" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"type" varchar(24) NOT NULL,
	"subtype" varchar(50),
	"label" varchar(250) NOT NULL,
	"pkid" bigint NOT NULL,
	"owner" bigint,
	"fontsettings" varchar(500)) DISTRIBUTED BY (pkid);

CREATE TABLE "searchstructureconfig"( 
	"pkid" bigint NOT NULL,
	"searchstructureconfigid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"modename" varchar(50) NOT NULL,
	"typename" varchar(50) NOT NULL,
	"assemblyname" varchar(50) NOT NULL,
	"dataloaderclass" varchar(50) NOT NULL,
	"subtypepopup" varchar(50),
	"enableusermode" boolean NOT NULL,
	"allowkeyusermode" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "searchstructuredata"( 
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"nodeid" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"dataid" varchar(50) NOT NULL,
	"searchstructuredataid" bigint NOT NULL,
	"type" varchar(24) NOT NULL,
	"subtype" varchar(50),
	"owner" bigint,
	"customstring" varchar(100)) DISTRIBUTED BY (rowversion);

CREATE TABLE "searchstructurefilter"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nodeid" varchar(50) NOT NULL,
	"key" varchar(500) NOT NULL,
	"value" varchar(500) NOT NULL,
	"valuebyid" varchar(500) NOT NULL,
	"requiredformatch" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "searchstructurehidden"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"userid" bigint NOT NULL,
	"nodeid" varchar(50) NOT NULL,
	"type" varchar(24),
	"subtype" varchar(50)) DISTRIBUTED BY (pkid);

CREATE TABLE "sequences"( 
	"pkid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"seed" bigint NOT NULL,
	"incremental" bigint NOT NULL,
	"currentvalue" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "serverconfig"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"key" varchar(200) NOT NULL,
	"bytevalue" bytea,
	"stringvalue" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "tempreportingobjects"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"authenticationtoken" varchar(4000) NOT NULL,
	"reportname" varchar(250) NOT NULL,
	"objectname" varchar(250) NOT NULL,
	"binaryobject" bytea,
	"textobject" varchar,
	"sourceid" bigint,
	"createddatetime" timestamp) DISTRIBUTED BY (pkid);

CREATE TABLE "tenant"( 
	"tenantid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
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
	"phoneno" varchar(150)) DISTRIBUTED BY (tenantid);

CREATE TABLE "tenantofuser"( 
	"tenantofuserid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"userid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"isdefaulttenant" boolean NOT NULL,
	"usercode" varchar(20)) DISTRIBUTED BY (tenantofuserid);

CREATE TABLE "textphrase"( 
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"tenantid" bigint NOT NULL,
	"textphraseid" varchar NOT NULL,
	"label" varchar(50) NOT NULL,
	"text" varchar NOT NULL,
	"shortcut" varchar(50) NOT NULL,
	"parenttype" bigint NOT NULL,
	"pkid" bigint NOT NULL,
	"owner" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "tilecontext"( 
	"pkid" bigint NOT NULL,
	"tilecontextid" varchar NOT NULL,
	"actiontileid" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"mediastorageid" varchar,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"condition" varchar NOT NULL,
	"title" varchar,
	"titlefontsettings" varchar,
	"text" varchar,
	"textfontsettings" varchar,
	"backgroundsettings" varchar,
	"action" varchar,
	"tooltip" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "tilestyle"( 
	"pkid" bigint NOT NULL,
	"tilestyleid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"xamldefinition" varchar NOT NULL,
	"type" varchar NOT NULL,
	"name" varchar NOT NULL,
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "timetracking"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"timestampdata" timestamp with time zone NOT NULL,
	"description" varchar(100) NOT NULL,
	"primaryidentifier" varchar(50) NOT NULL,
	"secondaryidentifier" varchar(50),
	"username" varchar(100) NOT NULL,
	"userserviceunit" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "timetrackingkeyword"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"keyword" varchar(150) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "traceables"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"tableshortname" varchar(50) NOT NULL,
	"tracingenabled" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "translationdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"language" varchar(20) NOT NULL,
	"translatedtext" varchar NOT NULL,
	"sourcepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "translationdataclientcache"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"classname" varchar NOT NULL,
	"hashvalue" varchar NOT NULL,
	"language" varchar(10)) DISTRIBUTED BY (pkid);

CREATE TABLE "translationsource"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"sourcestring" varchar NOT NULL,
	"classname" varchar(256) NOT NULL,
	"fieldname" varchar(256),
	"appassemblyid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "translationtable"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"schema" varchar(80) NOT NULL,
	"tablename" varchar(80) NOT NULL,
	"appassemblyid" varchar NOT NULL,
	"fieldname" varchar(80) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "uiapp"( 
	"uiappid" varchar NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"name" varchar(64) NOT NULL,
	"description" varchar(256),
	"appassemblyid" varchar NOT NULL,
	"classname" varchar(128) NOT NULL,
	"rowversion" bytea NOT NULL,
	"mediastorageid" varchar) DISTRIBUTED BY (uiappid);

CREATE TABLE "uibuttononpage"( 
	"buttonid" varchar NOT NULL,
	"parentbuttonid" varchar,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"position" int NOT NULL,
	"uipageid" varchar NOT NULL,
	"buttontype" int NOT NULL,
	"targetxap" varchar(128),
	"targetassembly" varchar(128),
	"targetuipageid" varchar,
	"targetcmdid" varchar(128),
	"targetprocessid" varchar(128),
	"parameter" varchar,
	"lockapplication" boolean NOT NULL,
	"buttonicon" bytea,
	"label" varchar(50),
	"tooltip" varchar(256),
	"rowversion" bytea NOT NULL,
	"pkid" bigint NOT NULL) DISTRIBUTED BY (buttonid);

CREATE TABLE "uidesktop"( 
	"uidesktopid" varchar NOT NULL,
	"title" varchar(50),
	"description" varchar(256),
	"layoutxaml" varchar,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"icon" bytea,
	"pkid" bigint NOT NULL) DISTRIBUTED BY (uidesktopid);

CREATE TABLE "uipage"( 
	"uipageid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"icon" bytea,
	"title" varchar(50),
	"description" varchar(256),
	"layoutxaml" varchar,
	"mainpagevisible" boolean NOT NULL,
	"rowversion" bytea NOT NULL,
	"pkid" bigint NOT NULL) DISTRIBUTED BY (uipageid);

CREATE TABLE "uipageondesktop"( 
	"uidesktopid" varchar NOT NULL,
	"uipageid" varchar NOT NULL,
	"position" int NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"uipageondesktopid" bigint NOT NULL,
	"rowversion" bytea NOT NULL) DISTRIBUTED BY (uidesktopid);

CREATE TABLE "user"( 
	"userid" bigint NOT NULL,
	"username" varchar(106) NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"isactive" boolean NOT NULL,
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
	"userstate" smallint NOT NULL,
	"validfrom" date NOT NULL,
	"validto" date,
	"userqualifications" varchar(50),
	"culture" int,
	"userkey" varchar(20),
	"additionaluserkey" varchar(20),
	"passwordchangeddate" date) DISTRIBUTED BY (userid);

CREATE TABLE "userconfig"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"userid" bigint NOT NULL,
	"topic" varchar(100) NOT NULL,
	"referenceid" varchar(100) NOT NULL,
	"configkey" varchar(100),
	"configvalue" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "userenvironment"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"username" varchar(150) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "wfactivity"( 
	"pkid" bigint NOT NULL,
	"activityid" varchar NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"name" varchar(200),
	"type" int,
	"assemblyfilename" varchar(100),
	"displayname" varchar(100),
	"description" varchar(1000),
	"appassemblyid" varchar,
	"issystemactivity" boolean NOT NULL,
	"area" varchar(100),
	"iscustomizable" boolean NOT NULL,
	"isschedulerenabled" boolean NOT NULL,
	"isvisibleintaskdesigner" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "wftask"( 
	"pkid" bigint NOT NULL,
	"taskid" varchar NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"definition" varchar,
	"description" varchar(500),
	"design" varchar,
	"active" boolean NOT NULL,
	"isscheduledtask" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "wfcustomizedactivitytask"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"activityid" varchar NOT NULL,
	"taskid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "compareareacode"( 
	"mrn" int,
	"areaode" varchar(50),
	"patientname" varchar(82)) DISTRIBUTED BY (mrn);

CREATE TABLE "comparedataafter"( 
	"mrn" int,
	"areacode" varchar(50),
	"popupentry" int,
	"recordstated" int) DISTRIBUTED BY (mrn);

CREATE TABLE "hl7component"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7fieldid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000),
	"position" smallint NOT NULL,
	"mandatory" boolean NOT NULL,
	"issubcomponent" boolean NOT NULL,
	"parentcomponentpkid" bigint,
	"hassubcomponents" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7component2property"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7componentid" bigint NOT NULL,
	"propertyname" varchar(150) NOT NULL,
	"hl7devicepkid" bigint NOT NULL,
	"append" boolean NOT NULL,
	"separator" varchar(10),
	"order" int NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7device"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000),
	"active" boolean NOT NULL,
	"address" varchar(1000),
	"contactdata" varchar(1000),
	"url" varchar(500),
	"fileurl" varchar(500),
	"encoding" varchar(10) NOT NULL,
	"linuxlinecharacter" varchar(10),
	"acknowledgecharacter" varchar(10),
	"hl7version" varchar(10),
	"socketport" int,
	"webserviceurl" varchar(500),
	"socketipaddress" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7devicemessagetype"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7devicepkid" bigint NOT NULL,
	"messagetype" varchar(15) NOT NULL,
	"active" smallint NOT NULL,
	"filter1" varchar NOT NULL,
	"filter2" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7event"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000),
	"active" boolean NOT NULL,
	"hl7version" varchar(10),
	"hl7messagetypepkid" bigint NOT NULL,
	"incoming" boolean NOT NULL,
	"outgoing" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7eventsegmentconfiguration"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7eventpkid" bigint NOT NULL,
	"hl7segmentpkid" bigint NOT NULL,
	"mandatory" boolean NOT NULL,
	"repeatable" boolean NOT NULL,
	"position" smallint NOT NULL,
	"cardinalitymin" varchar(3),
	"cardinalitymax" varchar(4)) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7field"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7segmentid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000),
	"position" smallint NOT NULL,
	"length" smallint NOT NULL,
	"cardinalitymin" varchar(3),
	"cardinalitymax" varchar(4),
	"datatype" int,
	"mandatory" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7idmapper"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"tablename" varchar(100) NOT NULL,
	"sourceidentifier" varchar(20) NOT NULL,
	"targetidentifier" varchar(20) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7mapper"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7deviceid" bigint NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000),
	"isformatprovider" boolean NOT NULL,
	"sourceformat" varchar(50) NOT NULL,
	"targetformat" varchar(50) NOT NULL,
	"popupheaderid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7mapper2component"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7componentpkid" bigint NOT NULL,
	"hl7devicepkid" bigint NOT NULL,
	"hl7mapperpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7mappingvalue"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"hl7mapperid" bigint NOT NULL,
	"sourcevalue" varchar(1000) NOT NULL,
	"targetvalue" varchar(1000) NOT NULL,
	"isdefault" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7messagelog"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"messagetext" varchar NOT NULL,
	"iserror" boolean NOT NULL,
	"sendtime" timestamp NOT NULL,
	"isincoming" boolean NOT NULL,
	"status" smallint NOT NULL,
	"deviceid" bigint NOT NULL,
	"errormessage" varchar,
	"fullfilename" varchar(250)) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7messagetype"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"description" varchar(1000),
	"hl7version" varchar(10),
	"hl7deviceid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "hl7segment"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(1000)) DISTRIBUTED BY (pkid);

CREATE TABLE "clientmission"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"modifieddatetimeoffset" timestamp with time zone NOT NULL,
	"modifieduserid" bigint NOT NULL,
	"executiveuserid" bigint NOT NULL,
	"missiontypeid" varchar NOT NULL,
	"patientid" varchar,
	"plannedstarttime" timestamp with time zone,
	"plannedendtime" timestamp with time zone,
	"plannedduration" numeric(8, 2),
	"durationunit" smallint,
	"fixedappointment" boolean,
	"administrativenote" varchar,
	"staffqualification" int,
	"actualstarttime" timestamp with time zone,
	"actualendtime" timestamp with time zone,
	"usernote" varchar,
	"confirmedflag" timestamp with time zone,
	"currentstate" int,
	"signaturemediaid" varchar,
	"nonsignaturereason" int,
	"nonsignatureremark" varchar(512),
	"description" varchar,
	"userprovidessignature" boolean,
	"roundedduration" time(7),
	"actualduration" time(7),
	"roundedstarttime" timestamp with time zone,
	"roundedendtime" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "missiontype"( 
	"pkid" bigint NOT NULL,
	"missiontypeid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"shortname" varchar(3) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" varchar,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"group" int,
	"manuallyplannable" boolean NOT NULL,
	"commentminletters" int NOT NULL,
	"requiressignature" boolean NOT NULL,
	"mustbeassignedtoclient" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "workflowmessage"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"messagestate" int,
	"datetimesent" timestamp with time zone NOT NULL,
	"sendinguserid" bigint NOT NULL,
	"sendingserviceunitid" bigint NOT NULL,
	"patientid" varchar,
	"casedatauniqueid" bigint,
	"text" varchar,
	"workflowtopicpkid" bigint NOT NULL,
	"modifieddatetime" timestamp with time zone NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "workflowtopic"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(150) NOT NULL,
	"description" varchar(300)) DISTRIBUTED BY (pkid);

CREATE TABLE "workflowtopicofuser"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"userid" bigint NOT NULL,
	"workflowtopicpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "assessment"( 
	"pkid" bigint NOT NULL,
	"assessmentid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"calculatedtriagescore" int NOT NULL,
	"triagescore" int,
	"userid" varchar(200) NOT NULL,
	"assessmenttimestarted" timestamp with time zone,
	"assessmenttimesent" timestamp with time zone,
	"assessmenttimeanswered" timestamp with time zone,
	"assessmenttimeclosed" timestamp with time zone,
	"assessmentstate" smallint,
	"assessmenttimeclosedbydoc" timestamp with time zone,
	"doctoruserid" bigint,
	"patientid" varchar NOT NULL,
	"unitid" varchar NOT NULL,
	"requestimmediatecallback" boolean,
	"requestimmediatecallbackdone" boolean,
	"latitude" varchar(12),
	"longitude" varchar(12),
	"timezone" varchar(100),
	"culture" varchar(7),
	"timeoffset" numeric(4, 2),
	"accuracy" int) DISTRIBUTED BY (pkid);

CREATE TABLE "measurement"( 
	"pkid" bigint NOT NULL,
	"measurementid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"datecreated" timestamp NOT NULL,
	"measurementtype" varchar,
	"assessmentid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medcaseconfig"( 
	"pkid" bigint NOT NULL,
	"medcaseconfigid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"isenabled" boolean NOT NULL,
	"departmentid" varchar(200) NOT NULL,
	"serviceunitid" varchar(200) NOT NULL,
	"reportnotetype" varchar,
	"reportnotecategory" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "parameter"( 
	"pkid" bigint NOT NULL,
	"parameterid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(150) NOT NULL,
	"description" varchar(400) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "unit"( 
	"pkid" bigint NOT NULL,
	"unitid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(200),
	"location" varchar(200),
	"sourceaddress" varchar(200),
	"latitude" double precision,
	"longitude" double precision,
	"mediastorageimageid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "value"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"timestamp" timestamp NOT NULL,
	"value" varchar,
	"mediaid" varchar,
	"measurementid" varchar NOT NULL,
	"parameterid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "anamnesis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"caremodel" int,
	"createuserid" bigint NOT NULL,
	"createdatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp with time zone,
	"nodename" varchar(50),
	"casedatapkid" bigint NOT NULL,
	"dynamicdatarecordpkidlistforsubtables" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "anamnesisdiagnosis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"anamnesispkid" bigint NOT NULL,
	"dynamicfieldid" varchar NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "anamnesisdynamicappdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"anamnesispkid" bigint NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"dynamicappmasterdataid" varchar NOT NULL,
	"dynamicdatacontentpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "anamnesispathway"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"anamnesispkid" bigint NOT NULL,
	"dynamicfieldid" varchar NOT NULL,
	"pathwayid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "lesionannotationstyle"( 
	"pkid" bigint NOT NULL,
	"lesionannotationstyleid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(150) NOT NULL,
	"description" varchar(500),
	"color" varchar(25),
	"protocoltype" int,
	"strokethickness" int) DISTRIBUTED BY (pkid);

CREATE TABLE "lesionassessment"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"protocoltype" int,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"casedatauniqueid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "lesiondata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"text" varchar(500),
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"lesionannotationstyleid" varchar NOT NULL,
	"lesionassessmentpkid" bigint NOT NULL,
	"mediastorageids" varchar,
	"shapeid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingbasedata"( 
	"pkid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"basedatacatalogue" int,
	"type" int,
	"name" varchar(500),
	"isactive" boolean NOT NULL,
	"nursingbasedataid" varchar NOT NULL,
	"basedatacode" varchar(50) NOT NULL,
	"literaturesource" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingbasedocumentrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingbasedataid" varchar NOT NULL,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingcaregiver"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"physicalcasepkid" bigint,
	"userpkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingcaregroup"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(250) NOT NULL,
	"serviceunitpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingcaregroupbedrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"caregrouppkid" bigint NOT NULL,
	"bedpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingcaregroupphysicalcasedatarelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"caregrouppkid" bigint,
	"physicalcasepkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdiagnosisbasedatarelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"nursingdiagnosisbasedatarelationshipid" varchar NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"nursingbasedataid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"basedatatype" int NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdiagnosisdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"diagnosiscatalogue" int,
	"diagnosiscode" varchar(50) NOT NULL,
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
	"literaturesource" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdiagnosisdatareferencerelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingdiagnosisdatareferencerelationshipid" varchar NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"nursingreferenceid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdiagnosisdocumentrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdiagnosisoutcomerelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"nursingdiagnosisoutcomerelationshipid" varchar NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"nursingoutcomedataid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingdynfieldtodiagorpathwayrelationship"( 
	"pkid" bigint NOT NULL,
	"nursingdynfieldtodiagorpathwayrelationshipid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dynamicfieldid" varchar NOT NULL,
	"referenceid" varchar NOT NULL,
	"referencetype" int NOT NULL,
	"value" varchar(50) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingoutcomedata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingoutcomedataid" varchar NOT NULL,
	"outcomecatalogue" int,
	"outcomecode" varchar(50) NOT NULL,
	"name" varchar(500),
	"isactive" boolean,
	"evaluationdays" int,
	"definition" varchar,
	"infolink" varchar,
	"priority" int,
	"literaturesource" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingoutcomedocumentrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingoutcomedataid" varchar NOT NULL,
	"documentid" bigint,
	"url" varchar(200),
	"additionalinformation" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingoutcomeservicerelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"nursingoutcomeservicerelationshipid" varchar NOT NULL,
	"nursingoutcomedataid" varchar NOT NULL,
	"serviceid" varchar NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingreference"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingreferenceid" varchar NOT NULL,
	"text" varchar,
	"referencetext" varchar,
	"referenceid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "nursingtododata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recipient" varchar(250) NOT NULL,
	"text" varchar(50) NOT NULL,
	"shorttext" varchar(3) NOT NULL,
	"additionalinfo" varchar,
	"timesyntax" varchar(20),
	"createdatetimeoffset" timestamp with time zone NOT NULL,
	"createuserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathway"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"pathwayid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathwaybasedata"( 
	"pkid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingbasedataid" varchar NOT NULL,
	"name" varchar(500),
	"sortorder" int NOT NULL,
	"ischecked" boolean NOT NULL,
	"pathwaybasedataid" varchar NOT NULL,
	"pathwaydiagnosisid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathwaydiagnosis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingdiagnosisdataid" varchar NOT NULL,
	"name" varchar(500),
	"evaluationdays" int,
	"sortorder" int NOT NULL,
	"ischecked" boolean NOT NULL,
	"pathwaydiagnosisid" varchar NOT NULL,
	"pathwayid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathwaymaterial"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"materialid" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"quantity" int NOT NULL,
	"ischecked" boolean NOT NULL,
	"pathwaymaterialid" varchar NOT NULL,
	"pathwayserviceid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathwayoutcome"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingoutcomedataid" varchar NOT NULL,
	"name" varchar(500),
	"evaluationdays" int,
	"sortorder" int NOT NULL,
	"ischecked" boolean NOT NULL,
	"pathwayoutcomeid" varchar NOT NULL,
	"pathwaydiagnosisid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pathwayservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceid" varchar NOT NULL,
	"servicetext" varchar,
	"sortorder" int NOT NULL,
	"ischecked" boolean NOT NULL,
	"evaluationdays" int,
	"staffqualification" int,
	"staffquantity" int,
	"schedulesyntax" varchar(100),
	"pathwayserviceid" varchar NOT NULL,
	"pathwayoutcomeid" varchar NOT NULL,
	"servicecode" varchar(200),
	"servicedefinition" varchar,
	"isexternal" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingbasedata"( 
	"pkid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingbasedataid" varchar,
	"nursingdiagnosispkid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"name" varchar(500),
	"comment" varchar,
	"sortorder" int NOT NULL,
	"pathwayname" varchar(50),
	"basedatatype" int NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingdiagnosis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingdiagnosisdataid" varchar,
	"casedatauniqueid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"name" varchar(500),
	"comment" varchar,
	"diagnosisstate" int NOT NULL,
	"evaluationdate" timestamp with time zone NOT NULL,
	"sortorder" int NOT NULL,
	"evaluationdays" int,
	"pathwayname" varchar(50)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingmaterial"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"materialid" varchar,
	"nursingservicepkid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"name" varchar(500),
	"comment" varchar,
	"sortorder" int NOT NULL,
	"quantity" int NOT NULL,
	"pathwayname" varchar(50),
	"materialtype" int) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingoutcome"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"nursingoutcomedataid" varchar,
	"nursingdiagnosispkid" bigint NOT NULL,
	"name" varchar(500),
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"evaluationdate" timestamp with time zone NOT NULL,
	"comment" varchar,
	"outcomestate" int NOT NULL,
	"sortorder" int NOT NULL,
	"evaluationdays" int,
	"pathwayname" varchar(50)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"serviceid" varchar,
	"outcomepkid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"servicetext" varchar,
	"comment" varchar,
	"servicestate" int NOT NULL,
	"evaluationdate" timestamp with time zone NOT NULL,
	"sortorder" int NOT NULL,
	"evaluationdays" int,
	"staffquantity" int,
	"staffqualification" int,
	"pathwayname" varchar(50),
	"schedulesyntax" varchar(100),
	"location" int,
	"servicecode" varchar(200),
	"servicedefinition" varchar,
	"casedatauniqueid" bigint NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"ondemand" boolean NOT NULL,
	"schedulesyntaxfullstring" varchar(150),
	"patientcontactpkid" bigint,
	"isexternal" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingserviceduration"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"durationtype" int,
	"durationvalue" int,
	"patientnursingservicepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingserviceinterval"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"weekdays" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"patientnursingservicepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingservicetimepoint"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"numminutes" int NOT NULL,
	"numminutesuntil" int,
	"patientnursingservicepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingtodo"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recipient" int,
	"additionalinfo" varchar,
	"todotext" varchar(50),
	"shorttext" varchar(3),
	"timesyntax" varchar(20),
	"createdatetimeoffset" timestamp with time zone NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"nursingtododatapkid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"creatinguserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientnursingtodopause"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieddatetime" timestamp with time zone,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"reason" varchar,
	"createuserid" bigint NOT NULL,
	"modifieduserid" bigint,
	"patientnursingtodopkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "serviceunitsofuser"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"userid" bigint NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"isdefault" boolean,
	"alternateuserid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "casedatatemp"( 
	"casedatauniqueid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"caseid" varchar(16) NOT NULL,
	"admissiontype" int,
	"admissiondatetime" timestamp with time zone,
	"dischargetype" int,
	"dischargedatetime" timestamp with time zone,
	"planneddischargedatetime" timestamp with time zone,
	"internaldoctor" bigint,
	"patientid" varchar NOT NULL,
	"medicalrecordid" bigint NOT NULL,
	"admissionstatus" int,
	"isvirtualpatient" boolean NOT NULL,
	"plannedstate" boolean NOT NULL,
	"referringdoctor" varchar,
	"admissionsourcetype" int,
	"casecodetype" int,
	"paytypetype" int,
	"payermode" int,
	"billtype" int,
	"payercode" varchar,
	"dischargedestinationtype" int,
	"admissiondiagnosisid" varchar,
	"comment" varchar) DISTRIBUTED BY (casedatauniqueid);

CREATE TABLE "drug"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"drugtype" int,
	"additionalinfo" varchar(500),
	"datetimefrom" timestamp with time zone,
	"drugstate" int,
	"patientid" varchar NOT NULL,
	"isinternal" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryacquisitiontemp"( 
	"pkid" bigint NOT NULL,
	"laboratoryacquisitionid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"value" numeric(19, 4),
	"range" int,
	"validated" int,
	"createddatetime" timestamp with time zone NOT NULL,
	"acquisitiondatetime" timestamp with time zone NOT NULL,
	"createduserid" bigint,
	"unit" varchar(15),
	"comment" varchar,
	"laboratoryorderserviceid" varchar NOT NULL,
	"rangefrom" varchar(200),
	"rangeto" varchar(200),
	"resulttext" varchar,
	"valuestring" varchar,
	"sortorder" int) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoyorderservicetemp"( 
	"pkid" bigint NOT NULL,
	"laboratoryorderserviceid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"servicecode" varchar(200),
	"quantity" int,
	"servicestate" int,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"servicetopic" varchar,
	"servicetext" varchar,
	"sortorder" int NOT NULL,
	"comment" varchar,
	"staff" varchar,
	"approximateduration" smallint,
	"laboratoryanalysisid" varchar NOT NULL,
	"analysisname" varchar,
	"profilename" varchar,
	"heading" varchar,
	"orderpkid" bigint NOT NULL,
	"laboratoryprofileid" varchar,
	"serviceid" varchar,
	"patientservicepkid" bigint,
	"externalreferenceid" varchar(200)) DISTRIBUTED BY (pkid);

CREATE TABLE "medicalcasedatatemp"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"departmentid" bigint NOT NULL,
	"serviceunitid" bigint,
	"validfrom" timestamp with time zone,
	"validuntil" timestamp with time zone,
	"medicalcaseid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "ordertemp"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"parentpkid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"medicalcasepkid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"sourceserviceunitid" bigint NOT NULL,
	"targetserviceunitid" bigint NOT NULL,
	"targetexamunitid" bigint,
	"targetuserid" bigint,
	"orderstate" int,
	"transporttype" int,
	"orderpriority" int,
	"duration" bigint NOT NULL,
	"appointmentdatetime" timestamp with time zone NOT NULL,
	"ordertopic" varchar,
	"comment" varchar,
	"analysismode" boolean NOT NULL,
	"senddirect" boolean NOT NULL,
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
	"sampledatetime" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "patienttemp"( 
	"pkid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"dobapprox" boolean NOT NULL,
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
	"appointmentreminder" int) DISTRIBUTED BY (pkid);

CREATE TABLE "physicalcasedatatemp"( 
	"physicalcaseid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"serviceunitid" bigint NOT NULL,
	"class" int,
	"roomid" bigint,
	"bedid" bigint,
	"phoneno" varchar(50),
	"validfrom" timestamp with time zone,
	"validuntil" timestamp with time zone,
	"bedtype" int) DISTRIBUTED BY (physicalcaseid);

CREATE TABLE "wound"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"majorwoundtype" int,
	"classificationmethod" int,
	"createddatetime" timestamp with time zone NOT NULL,
	"comment" varchar(500),
	"casedatauniqueid" bigint NOT NULL,
	"createdbyuserid" bigint NOT NULL,
	"existingsincerelapse" date,
	"existingsince" date,
	"relapsefreesince" date,
	"modifiedbyuserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"isrelapse" boolean NOT NULL,
	"relapsecount" int NOT NULL,
	"localizationscreenshotid" varchar,
	"occuringreason" varchar(250),
	"patientdiagnosispkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "woundassessment"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"assessmentdatetime" timestamp with time zone NOT NULL,
	"createdbyuserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifiedbyuserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"woundpkid" bigint NOT NULL,
	"referenceassessmentimagepkid" bigint,
	"assessmentclassification" bigint,
	"isdoctorinvolved" boolean NOT NULL,
	"isadditionalassessment" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundassessmentdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"dynamicappmasterdataid" varchar NOT NULL,
	"dynamicdatacontentpkid" bigint NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"woundassessmentpkid" bigint NOT NULL,
	"dynamicdatarecordpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundassessmentimage"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"mediastorageid" varchar NOT NULL,
	"comment" varchar(500),
	"woundassessmentpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "wounddynamicrecordrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"dynamicappmasterdataid" varchar NOT NULL,
	"dynamicdatacontentpkid" bigint NOT NULL,
	"dynamicappkey" varchar NOT NULL,
	"dynamicdatarecordpkid" bigint NOT NULL,
	"woundpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundlocalizationcontrol"( 
	"pkid" bigint NOT NULL,
	"woundlocalizationcontrolid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(150) NOT NULL,
	"layoutxaml" varchar NOT NULL,
	"gender" int,
	"createdbyuserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundlocalizationdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"woundlocalizationid" varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	"comment" varchar(500),
	"woundpkid" bigint NOT NULL,
	"woundlocalizationcontrolid" varchar NOT NULL,
	"parentlocalizationpkid" bigint,
	"isnotgraphical" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "woundmeasurement"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"adjustedscale" numeric(18, 2) NOT NULL,
	"measuredscale" numeric(18, 2) NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"isaftercare" boolean NOT NULL,
	"screenshortmediastorageid" varchar,
	"woundassessmentimagepkid" bigint NOT NULL,
	"isciruclar" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundmeasurementarea"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"areatype" int,
	"area" numeric(18, 2) NOT NULL,
	"isestimated" boolean NOT NULL,
	"length" numeric(18, 2),
	"woundmeasurementpkid" bigint NOT NULL,
	"iscircular" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundmeasurementpoint"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"xcoord" int NOT NULL,
	"ycoord" int NOT NULL,
	"order" int NOT NULL,
	"woundmeasurementareapkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundpatientnursingdiagnosisrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"woundpkid" bigint NOT NULL,
	"patientnursingdiagnosispkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "woundstate"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"datetimefrom" timestamp with time zone NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"createdbyuserid" bigint NOT NULL,
	"woundstatus" int NOT NULL,
	"comment" varchar(500),
	"woundpkid" bigint NOT NULL,
	"closetype" int,
	"hospital" varchar(200),
	"department" varchar(200),
	"iswoundbased" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "woundtype"( 
	"pkid" bigint NOT NULL,
	"woundtypeid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"additionalinfo" varchar(500),
	"validfrom" timestamp with time zone,
	"validto" timestamp with time zone,
	"exclusiveids" varchar(500)) DISTRIBUTED BY (pkid);

CREATE TABLE "woundtyperelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"woundpkid" bigint NOT NULL,
	"woundtypeid" varchar NOT NULL,
	"additionaltext" varchar(500)) DISTRIBUTED BY (pkid);

CREATE TABLE "woundwizardpage"( 
	"pkid" bigint NOT NULL,
	"woundwizardpageid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"wizardtype" int,
	"pagenumber" int NOT NULL,
	"pagetype" int,
	"info" varchar,
	"pageidentifier" varchar(100) NOT NULL,
	"name" varchar(500) NOT NULL,
	"isdeletable" boolean NOT NULL,
	"exclusivepageids" varchar(200),
	"showinfoarea" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "allergy"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(20) NOT NULL,
	"name" varchar(50) NOT NULL,
	"type" int,
	"additionaltext" varchar,
	"description" varchar,
	"creatingdatetimeoffset" timestamp with time zone,
	"userpkid" bigint NOT NULL,
	"drugdbmappingid" varchar,
	"drugdbmappingtype" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "diagnosis"( 
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"pkid" bigint NOT NULL,
	"diagnosispopupkey" int,
	"diagnosiscode" varchar(10) NOT NULL,
	"diagnosistext" varchar,
	"shortname" varchar,
	"validfrom" date,
	"validuntil" date,
	"thesaurus" varchar(250),
	"agefrom" int NOT NULL,
	"ageuntil" int NOT NULL,
	"eligibleasmaindiagnosis" boolean NOT NULL,
	"guideline" varchar,
	"compulsoryregistration" boolean NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"diagnosisid" varchar NOT NULL,
	"gender" int,
	"agefromdays" int,
	"ageuntildays" int) DISTRIBUTED BY (customerid);

CREATE TABLE "growthchartmaindata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"category" int NOT NULL,
	"sex" int NOT NULL,
	"agemos" int NOT NULL,
	"p3" numeric(8, 2) NOT NULL,
	"p5" numeric(8, 2) NOT NULL,
	"p10" numeric(8, 2) NOT NULL,
	"p25" numeric(8, 2) NOT NULL,
	"p50" numeric(8, 2) NOT NULL,
	"p75" numeric(8, 2) NOT NULL,
	"p90" numeric(8, 2) NOT NULL,
	"p95" numeric(8, 2) NOT NULL,
	"p97" numeric(8, 2) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientallergy"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(20),
	"name" varchar,
	"type" int,
	"additionaltext" varchar,
	"description" varchar,
	"infectiondate" date,
	"allergystate" int,
	"creatingdatetimeoffset" timestamp with time zone NOT NULL,
	"patientid" varchar NOT NULL,
	"createuserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientdiagnosis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"diagnosisid" varchar NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"caseid" varchar(16) NOT NULL,
	"patientid" varchar NOT NULL,
	"text" varchar,
	"orientation" int,
	"info" varchar,
	"ischronic" boolean NOT NULL,
	"diagnosisdatetime" timestamp with time zone NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"isfinal" boolean NOT NULL,
	"sortorder" int NOT NULL,
	"ismaindiagnosis" boolean NOT NULL,
	"departmentid" bigint NOT NULL,
	"reliabilitystate" int) DISTRIBUTED BY (pkid);

CREATE TABLE "patienttentativediagnosis"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientid" varchar NOT NULL,
	"text" varchar,
	"diagnosistype" int,
	"sortorder" int NOT NULL,
	"createuserpkid" bigint NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"diagnosisid" varchar,
	"createdatetime" timestamp with time zone NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "reportnote"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"rowversion" bytea NOT NULL,
	"recordstate" smallint NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"unformattedtext" varchar,
	"deletereason" varchar(500),
	"documentpkid" bigint NOT NULL,
	"reportnotecategoryid" varchar,
	"reportnotetypeid" varchar,
	"referenceid" varchar(200)) DISTRIBUTED BY (pkid);

CREATE TABLE "reportnotecategory"( 
	"pkid" bigint NOT NULL,
	"reportnotecategoryid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(256) NOT NULL,
	"description" varchar(1000),
	"icon" bytea,
	"color" varchar(25)) DISTRIBUTED BY (pkid);

CREATE TABLE "reportnotetype"( 
	"pkid" bigint NOT NULL,
	"reportnotetypeid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(256) NOT NULL,
	"description" varchar(1000),
	"icon" bytea,
	"color" varchar(25),
	"reportnotecategoryid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameter"( 
	"pkid" bigint NOT NULL,
	"vitalparameterid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"shortname" varchar(50) NOT NULL,
	"iscontinuous" boolean NOT NULL,
	"ismessageenabled" boolean NOT NULL,
	"datatype" int,
	"isfutureentryenabled" boolean NOT NULL,
	"isstoppable" boolean NOT NULL,
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
	"decimaldigits" int) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameterarrangement"( 
	"pkid" bigint NOT NULL,
	"vitalparameterarrangementid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"type" int NOT NULL,
	"seperatingstring" varchar(25),
	"category" int) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameterarrangementrelationship"( 
	"pkid" bigint NOT NULL,
	"vitalparameterarrangementrelationshipid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"sortorder" smallint NOT NULL,
	"vitalparameterarrangementid" varchar NOT NULL,
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
	"showtotalsum" boolean NOT NULL,
	"isexpanded" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparametercollection"( 
	"pkid" bigint NOT NULL,
	"vitalparametercollectionid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100) NOT NULL,
	"shortname" varchar(50) NOT NULL,
	"collectiontype" int,
	"displayvalue" varchar(50),
	"unit" varchar(25),
	"lowerwarnlimit" numeric(18, 2),
	"upperwarnlimit" numeric(18, 2),
	"fillmissingvaluesforcalculation" boolean,
	"calculationexpression" varchar,
	"calculationexpressionids" varchar,
	"numberofcalculationdecimals" smallint,
	"category" int) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparametercollectionrelationship"( 
	"pkid" bigint NOT NULL,
	"vitalparametercollectionrelationshipid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"sortorder" smallint NOT NULL,
	"vitalparameterparentcollectionid" varchar,
	"vitalparametercollectionid" varchar,
	"vitalparameterid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameterdata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"customvalue" varchar(500),
	"enddatetime" timestamp with time zone,
	"createduserid" bigint NOT NULL,
	"createddatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"status" int NOT NULL,
	"comment" varchar(500),
	"assessmentdatetime" timestamp with time zone NOT NULL,
	"isnotassessed" boolean NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"vitalparameterid" varchar NOT NULL,
	"value1" numeric(18, 2),
	"value2" numeric(18, 2),
	"secondaryidentifier" varchar(100)) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameterdynamicappdataorigin"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"vitalparameterid" varchar NOT NULL,
	"subtableuniqueid" varchar NOT NULL,
	"dynamicfielduniqueid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparametergrowthitem"( 
	"pkid" bigint NOT NULL,
	"vitalparametergrowthitemid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"sex" int,
	"agefrom" int,
	"ageto" int,
	"alertvalue1" numeric(18, 5) NOT NULL,
	"alertvalue2" numeric(18, 5) NOT NULL,
	"actionvalue1" numeric(18, 5) NOT NULL,
	"actionvalue2" numeric(18, 5) NOT NULL,
	"alerticon" bytea,
	"actionicon" bytea,
	"vitalparameterid" varchar NOT NULL,
	"alerthourfrom" numeric(9, 2) NOT NULL,
	"alerthourto" numeric(9, 2) NOT NULL,
	"actionhourfrom" numeric(9, 2) NOT NULL,
	"actionhourto" numeric(9, 2) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "vitalparameterlistitem"( 
	"pkid" bigint NOT NULL,
	"vitalparameterlistitemid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"text" varchar(500) NOT NULL,
	"value" numeric(18, 2),
	"icon" bytea,
	"sortorder" int NOT NULL,
	"vitalparameterid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryacquisition"( 
	"pkid" bigint NOT NULL,
	"laboratoryacquisitionid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"value" numeric(19, 4),
	"range" int,
	"validated" int,
	"createddatetime" timestamp with time zone NOT NULL,
	"acquisitiondatetime" timestamp with time zone NOT NULL,
	"createduserid" bigint,
	"unit" varchar(15),
	"comment" varchar,
	"laboratoryorderserviceid" varchar NOT NULL,
	"rangefrom" varchar(200),
	"rangeto" varchar(200),
	"resulttext" varchar,
	"valuestring" varchar,
	"sortorder" int) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryanalysis"( 
	"pkid" bigint NOT NULL,
	"laboratoryanalysisid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(50) NOT NULL,
	"code" varchar(50) NOT NULL,
	"analysistype" int,
	"servicetext" varchar,
	"comment" varchar,
	"manualinput" boolean,
	"active" boolean,
	"loinc" varchar(10),
	"serviceid" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryordermaterialrelationship"( 
	"pkid" bigint NOT NULL,
	"laboratoryordermaterialrelationshipid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"quantity" int NOT NULL,
	"sortorder" int NOT NULL,
	"laboratoryorderserviceid" varchar NOT NULL,
	"materialid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryorderservice"( 
	"pkid" bigint NOT NULL,
	"laboratoryorderserviceid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"servicecode" varchar(200),
	"quantity" int,
	"servicestate" int,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"servicetopic" varchar,
	"servicetext" varchar,
	"sortorder" int NOT NULL,
	"comment" varchar,
	"staff" varchar,
	"approximateduration" smallint,
	"laboratoryanalysisid" varchar NOT NULL,
	"analysisname" varchar,
	"profilename" varchar,
	"heading" varchar,
	"orderpkid" bigint NOT NULL,
	"laboratoryprofileid" varchar,
	"serviceid" varchar,
	"patientservicepkid" bigint,
	"externalreferenceid" varchar(200)) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryprofile"( 
	"pkid" bigint NOT NULL,
	"laboratoryprofileid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryprofiletoanalysisrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"laboratoryanalysisid" varchar NOT NULL,
	"laboratoryprofileid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryscreen"( 
	"pkid" bigint NOT NULL,
	"laboratoryscreenid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar NOT NULL,
	"urine" boolean,
	"pregnancy" boolean,
	"childdata" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "laboratoryscreenrelationship"( 
	"pkid" bigint NOT NULL,
	"laboratoryscreenrelationshipid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"heading" varchar(100) NOT NULL,
	"typeofrelation" int NOT NULL,
	"sortorder" int NOT NULL,
	"contentsort" int NOT NULL,
	"referenceid" varchar NOT NULL,
	"laboratoryscreenid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "order"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"parentpkid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"medicalcasepkid" bigint NOT NULL,
	"createuserid" bigint NOT NULL,
	"createdatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"sourceserviceunitid" bigint NOT NULL,
	"targetserviceunitid" bigint NOT NULL,
	"targetexamunitid" bigint,
	"targetuserid" bigint,
	"orderstate" int,
	"transporttype" int,
	"orderpriority" int,
	"duration" bigint NOT NULL,
	"appointmentdatetime" timestamp with time zone NOT NULL,
	"ordertopic" varchar,
	"comment" varchar,
	"analysismode" boolean NOT NULL,
	"senddirect" boolean NOT NULL,
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
	"sampledatetime" timestamp with time zone,
	"datetimesent" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "orderservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"orderpkid" bigint NOT NULL,
	"servicecode" varchar(200) NOT NULL,
	"quantity" int NOT NULL,
	"servicestate" int,
	"bookinguserid" bigint NOT NULL,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"servicetopic" varchar,
	"servicetext" varchar NOT NULL,
	"sortorder" int NOT NULL,
	"comment" varchar,
	"staff" varchar,
	"approximateduration" smallint NOT NULL,
	"location" int,
	"serviceid" varchar NOT NULL,
	"patientservicepkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "orderservicematerialrelationship"( 
	"pkid" bigint NOT NULL,
	"materialpkid" bigint NOT NULL,
	"orderservicepkid" bigint NOT NULL,
	"sortorder" int NOT NULL,
	"quantity" int NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "serviceunitstoscreenrelationship"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"laboratoryscreenid" varchar NOT NULL,
	"serviceunitid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "atcgroup"( 
	"pkid" bigint NOT NULL,
	"atcgroupid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(20) NOT NULL,
	"text" varchar,
	"description" varchar,
	"createuserid" bigint NOT NULL,
	"createdatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "drugdispenseconfirmation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"useridconfirmed" bigint NOT NULL,
	"datetimeconfirmed" timestamp with time zone NOT NULL,
	"additionalinfo" varchar,
	"patientmedexpensepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "indicationgroup"( 
	"pkid" bigint NOT NULL,
	"indicationgroupid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(20) NOT NULL,
	"text" varchar,
	"description" varchar,
	"createuserid" bigint NOT NULL,
	"createdatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "meddosage"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"referencetype" int,
	"syntax" varchar(200),
	"uom" int,
	"isinfusionbase" boolean NOT NULL,
	"basevolume" numeric(12, 6),
	"infusionratetype" int,
	"infusionrate" int,
	"infusionrateuom" int,
	"medicationdrugid" varchar,
	"medprescriptionpkid" bigint NOT NULL,
	"medintervalpkid" bigint NOT NULL,
	"information" varchar,
	"sortorder" int NOT NULL,
	"medicationarticledataid" varchar,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"indicationtext" varchar,
	"chargeqty" int,
	"sellinguom" int) DISTRIBUTED BY (pkid);

CREATE TABLE "medinterval"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"weekday" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"medprescriptionpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medondemand"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"maxapplications" int NOT NULL,
	"maxdosage" numeric(8, 2) NOT NULL,
	"mintimespanminutes" int NOT NULL,
	"medintervalpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medprescription"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100),
	"type" int,
	"applicationtype" int,
	"isondemand" boolean NOT NULL,
	"infusionmaxvolume" int,
	"sourcereferenceid" varchar(50),
	"sourcereferencetype" int,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"category" int,
	"uom" int,
	"chargeqtymanualedited" boolean) DISTRIBUTED BY (pkid);

CREATE TABLE "medtimepoint"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"numminutes" int NOT NULL,
	"dosageamount" numeric(8, 2) NOT NULL,
	"meddosagepkid" bigint NOT NULL,
	"isprntp" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationactivesubstancedata"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"activesubstancecode" varchar(7) NOT NULL,
	"activesubstancecategory" varchar(3) NOT NULL,
	"activesubstancetext" varchar NOT NULL,
	"activesubstancecodeconversion" varchar(7),
	"createdatetime" timestamp with time zone NOT NULL,
	"modifydatetime" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationarticledata"( 
	"pkid" bigint NOT NULL,
	"medicationarticledataid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"articlecode" varchar(50) NOT NULL,
	"articlename" varchar,
	"purchaseprice" numeric(8, 2),
	"sellingprice" numeric(8, 2),
	"packagesize" numeric(8, 2),
	"barcode" varchar(50),
	"searchable" boolean NOT NULL,
	"modifieddatatime" timestamp with time zone,
	"createdatatime" timestamp with time zone NOT NULL,
	"licenseno" varchar(50),
	"createuserid" bigint NOT NULL,
	"modifieduserid" bigint NOT NULL,
	"isdefault" boolean NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"serviceid" varchar NOT NULL,
	"sellingunituom" int,
	"sellingunitconversionfactor" numeric(12, 2),
	"labelunituom" int,
	"labelunitconversionfactor" numeric(8, 2),
	"boxtype" int,
	"additionalcashreference" int,
	"ismimsimported" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdrug"( 
	"pkid" bigint NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(50) NOT NULL,
	"name" varchar,
	"licenseno" varchar(50) NOT NULL,
	"prescdefaultsyntax" varchar(20),
	"prescdefaultapptype" int,
	"prescdefaultuom" int,
	"dangerous" boolean NOT NULL,
	"dangerouscolor" varchar(25) NOT NULL,
	"searchable" boolean NOT NULL,
	"usercreated" boolean NOT NULL,
	"information" varchar,
	"createuserid" bigint NOT NULL,
	"createdatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp with time zone,
	"drugdbmappingid" varchar,
	"concentrationdruguom" int,
	"concentrationactivesubstanceamount" numeric(14, 8),
	"concentrationactivesubstanceuom" int,
	"volume" numeric(8, 2),
	"iscustom" boolean NOT NULL,
	"concentrationdrugamount" numeric(14, 8),
	"syntaxfulltextdisplaydosageamount" int,
	"drugdbmappingtype" varchar,
	"warning1" varchar,
	"warning2" varchar,
	"link1" varchar,
	"link2" varchar,
	"classid" varchar,
	"isnarcotic" boolean NOT NULL,
	"genericdrug" varchar(200),
	"genericterm" varchar,
	"ismimsimported" boolean NOT NULL,
	"highalert" boolean NOT NULL,
	"highalertcolor" varchar(25) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdruginhousecatalogue"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"medicationdrugid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdrugtoactivesubstancerelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"currentnumber" varchar(25) NOT NULL,
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
	"createdatetime" timestamp with time zone NOT NULL,
	"modifydatetime" timestamp with time zone,
	"medicationdrugid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdrugtoatcgrouprelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"atcgroupid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdrugtoindicationgrouprelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"indicationgroupid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationdrugtowarningrelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"medicationwarningid" varchar NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "medicationwarning"( 
	"pkid" bigint NOT NULL,
	"medicationwarningid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(20) NOT NULL,
	"text" varchar,
	"createuserid" bigint NOT NULL,
	"createdatatime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatatime" timestamp with time zone,
	"severity" int) DISTRIBUTED BY (pkid);

CREATE TABLE "mimsrequest"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"datetimerequested" timestamp with time zone NOT NULL,
	"useridrequested" bigint NOT NULL,
	"mimsrequestxml" varchar,
	"mimsresponsexml" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmeddosage"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"referencetype" int,
	"syntax" varchar(200),
	"uom" int,
	"isinfusionbase" boolean NOT NULL,
	"basevolume" numeric(12, 6),
	"infusionratetype" int,
	"infusionrate" int,
	"infusionrateuom" int,
	"medicationdrugid" varchar,
	"patientmedprescriptionpkid" bigint NOT NULL,
	"patientmedintervalpkid" bigint NOT NULL,
	"information" varchar,
	"prescdoctorid" bigint NOT NULL,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"sortorder" int NOT NULL,
	"medicationarticledataid" varchar,
	"indicationtext" varchar,
	"syntaxfulltext" varchar(1000),
	"chargeqty" int,
	"sellinguom" int,
	"isstat" boolean NOT NULL,
	"discontinuedoctorid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmeddosagebalance"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientmeddosagepkid" bigint NOT NULL,
	"balance" numeric(19, 4) NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedexpense"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"expensetimeid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"dosageamount" numeric(19, 4) NOT NULL,
	"expensetype" int,
	"bookingdatetime" timestamp with time zone NOT NULL,
	"information" varchar,
	"expensestate" int,
	"chargenr" varchar(20),
	"useddosageamount" numeric(19, 4) NOT NULL,
	"patientmedprescriptionpkid" bigint NOT NULL,
	"createduserid" bigint NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"patientmeddosagepkid" bigint NOT NULL,
	"ispharmacyinvalidated" boolean NOT NULL,
	"iobookingvitalparamid" bigint,
	"infusionvolume" int,
	"administeredmanually" boolean NOT NULL,
	"lasteditdatetime" timestamp with time zone,
	"stocklocation" bigint,
	"pharmacyorderpkid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedexpenseservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientservicepkid" bigint NOT NULL,
	"patientmedexpensepkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedinterval"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"weekday" varchar(50),
	"intervaltype" int,
	"intervalvalue" int,
	"patientmedprescriptionpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedondemand"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"maxapplications" int NOT NULL,
	"maxdosage" numeric(8, 2) NOT NULL,
	"mintimespanminutes" int NOT NULL,
	"patientmedintervalpkid" bigint NOT NULL,
	"fulltext" varchar(1000)) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedpause"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"type" int NOT NULL,
	"patientmedprescriptionpkid" bigint NOT NULL,
	"medicationdrugid" varchar,
	"startcomment" varchar,
	"endcomment" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedprescription"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"name" varchar(100),
	"type" int,
	"category" int,
	"applicationtype" int,
	"isondemand" boolean NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"infusionmaxvolume" int,
	"prescdoctorvalidationstate" int,
	"sourcereferenceid" varchar(50),
	"sourcereferencetype" int,
	"patientid" varchar NOT NULL,
	"casedatauniqueid" bigint NOT NULL,
	"prescdoctorid" bigint NOT NULL,
	"createduserid" bigint NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"modifieduserid" bigint,
	"modifieddatetime" timestamp with time zone,
	"information" varchar,
	"ispharmacyinvalidated" boolean NOT NULL,
	"dailyconfirmation" boolean NOT NULL,
	"prescdoctorworkplaceids" varchar(20),
	"isconfirmedasactive" boolean NOT NULL,
	"additionalcashreference" int,
	"chargeqtymanualedited" boolean,
	"deletereason" varchar(500),
	"discontinuedoctorid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedprescriptionconfirmed"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"confirmeddatetime" timestamp with time zone NOT NULL,
	"createddatetime" timestamp with time zone NOT NULL,
	"createduserid" bigint NOT NULL,
	"patientmedprescriptionpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedtimepoint"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"numminutes" int NOT NULL,
	"dosageamount" numeric(8, 2) NOT NULL,
	"patientmeddosagepkid" bigint NOT NULL,
	"isprntp" boolean NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "patientmedwarning"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"drugname" varchar(50),
	"warningtext" varchar,
	"createdatetime" timestamp with time zone NOT NULL,
	"createuserid" bigint NOT NULL,
	"patientmedprescriptionpkid" bigint NOT NULL,
	"patientmeddosagepkid" bigint,
	"patientid" varchar,
	"warningtype" int NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacyorder"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"modifieddatetime" timestamp with time zone NOT NULL,
	"orderstate" int,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone NOT NULL,
	"doctoruserid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"patientid" varchar NOT NULL,
	"pharmacystockid" varchar,
	"isinvalidated" boolean NOT NULL,
	"invalidatedpharmacyorderpkid" bigint,
	"prescriptioncategory" int NOT NULL,
	"stocklocation" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacyorderitem"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"amount" numeric(19, 2) NOT NULL,
	"syntax" varchar(200),
	"pharmacyorderpkid" bigint NOT NULL,
	"medicationdrugid" varchar NOT NULL,
	"medicationarticledataid" varchar,
	"patientmedprescriptionpkid" bigint NOT NULL,
	"patientmeddosagepkid" bigint NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone NOT NULL,
	"issuccessororderrequired" boolean NOT NULL,
	"iscorrection" boolean NOT NULL,
	"ismanual" boolean NOT NULL,
	"chargeqty" int,
	"sellinguom" int,
	"uom" int,
	"lastmodifiedprescribedbyscheduler" timestamp with time zone) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacyorderstatetransition"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pharmacyorderpkid" bigint NOT NULL,
	"fromorderstate" int,
	"toorderstate" int,
	"datetime" timestamp with time zone NOT NULL,
	"comment" varchar,
	"userid" bigint NOT NULL,
	"additionaluserid" bigint) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacyservice"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"patientservicepkid" bigint NOT NULL,
	"pharmacyorderpkid" bigint NOT NULL,
	"pharmacyorderitempkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacystock"( 
	"pkid" bigint NOT NULL,
	"pharmacystockid" varchar NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"code" varchar(20) NOT NULL,
	"text" varchar(50),
	"description" varchar) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacystockarticle"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pharmacystockid" varchar NOT NULL,
	"medicationarticledataid" varchar NOT NULL,
	"amount" numeric(8, 2) NOT NULL,
	"licenseno" varchar(20) NOT NULL,
	"batchno" numeric(8, 0)) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacystocktodepartmentrelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pharmacystockid" varchar NOT NULL,
	"departmentid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacystocktoserviceunitrelation"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"pharmacystockid" varchar NOT NULL,
	"serviceunitid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "pharmacywarning"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"drugname" varchar(50) NOT NULL,
	"warningtext" varchar NOT NULL,
	"severity" int,
	"createdatetime" timestamp with time zone NOT NULL,
	"createuserid" bigint NOT NULL,
	"pharmacyorderstatetransitionpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "casedatacommunication"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"topic" int,
	"datetimesent" timestamp with time zone NOT NULL,
	"iscolored" boolean NOT NULL,
	"text" varchar NOT NULL,
	"parentpkid" bigint,
	"casedatauniqueid" bigint NOT NULL,
	"sendinguserid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "casedatacommunicationread"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"userid" bigint NOT NULL,
	"casedatacommunicationpkid" bigint NOT NULL) DISTRIBUTED BY (pkid);

CREATE TABLE "message"( 
	"pkid" bigint NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"rowversion" bytea NOT NULL,
	"subject" varchar(50) NOT NULL,
	"messagetext" varchar(2000) NOT NULL,
	"priority" int,
	"isread" boolean NOT NULL,
	"datesent" timestamp with time zone NOT NULL,
	"toemail" varchar(100),
	"tocontactid" varchar,
	"touserid" bigint,
	"topatientid" varchar,
	"fromuserid" bigint NOT NULL,
	"attacheddocumentid" bigint,
	"patientid" varchar,
	"referencedmessageid" bigint) DISTRIBUTED BY (pkid);

COMMIT;



----pahabol
CREATE TABLE "mediastorage"( 
	"rowversion" bytea NOT NULL,
	"customerid" bigint NOT NULL,
	"tenantid" bigint NOT NULL,
	"recordstate" smallint NOT NULL,
	"thumbnail" bytea,
	"version" int NOT NULL,
	"mediastorageid" varchar NOT NULL,
	"mediastoragepk" int NOT NULL,
	"validfrom" timestamp with time zone NOT NULL,
	"validto" timestamp with time zone,
	"rowguid" varchar NOT NULL,
	"mediafile" bytea,
	"mediafiletextanonymized" varchar) DISTRIBUTED BY (rowversion);

