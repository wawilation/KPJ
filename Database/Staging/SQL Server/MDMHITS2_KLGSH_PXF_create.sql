\SET ON_ERROR_STOP on

CREATE EXTERNAL TABLE "pxf_apactdetails"( 
	"id" varchar(36),
	"apactheaderid" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(4),
	"trantype" varchar(4),
	"auditno" int,
	"line" int,
	"entrydate" timestamp,
	"documentno" varchar(36),
	"categoryid" varchar(36),
	"reference" varchar(36),
	"departmentid" varchar(36),
	"amount" numeric(21, 8),
	"stat" varchar(2),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"billno" int,
	"paymodeid" varchar(36),
	"deliveryorderheaderid" varchar(36),
	"deliveryorderdetailid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"status" varchar(4),
	"taxamount" numeric(21, 8),
	"allocauditno" int,
	"alloctnauditno" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.apactdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');


CREATE EXTERNAL TABLE "pxf_apactheaders"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(4),
	"trantype" varchar(4),
	"auditno" int,
	"documentno" varchar(100),
	"supplierid" varchar(36),
	"bankid" varchar(36),
	"paymodeid" varchar(36),
	"chequetransactionid" varchar(36),
	"cheqdate" timestamp,
	"actdate" timestamp,
	"categoryid" varchar(36),
	"amount" numeric(21, 8),
	"outamount" numeric(21, 8),
	"remarks" varchar(255),
	"stat" varchar(2),
	"isposted" boolean,
	"entryuserid" varchar(36),
	"entrydate" timestamp,
	"payto" varchar(36),
	"isdoctor" boolean,
	"recdate" timestamp,
	"conversion" boolean,
	"srcfrom" varchar(40),
	"srcto" varchar(40),
	"departmentid" varchar(36),
	"reconflg" boolean,
	"currencyid" varchar(36),
	"currencyrate" numeric(18, 8),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"doctorid" varchar(36),
	"tilldetailid" varchar(36),
	"transtype" char(10),
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 8),
	"status" varchar(4),
	"suppliername" varchar(200),
	"invtype" char(10)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.apactheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');


CREATE EXTERNAL TABLE "pxf_apallocations"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(4),
	"trantype" varchar(4),
	"auditno" int,
	"line" int,
	"docsource" varchar(4),
	"doctrantype" varchar(4),
	"docauditno" int,
	"refsource" varchar(4),
	"reftrantype" varchar(4),
	"refauditno" int,
	"refamount" numeric(21, 8),
	"allocdate" timestamp,
	"allocamount" numeric(21, 8),
	"allocstat" varchar(3),
	"paymodeid" varchar(36),
	"bankid" varchar(36),
	"reference" varchar(100),
	"chequedate" timestamp,
	"supplierid" varchar(36),
	"remarks" varchar(100),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"docid" varchar(36),
	"refid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.apallocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_activereportparams"( 
	"id" varchar(36),
	"activereporttaskid" varchar(36),
	"paramname" varchar(100),
	"paramvalue" varchar(250),
	"longparam" varchar(4000),
	"status" varchar(5),
	"printeddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.activereportparams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_activereporttasks"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"serialno" bigint,
	"reportid" varchar(3),
	"sessionid" varchar(36),
	"printed" boolean,
	"status" varchar(5),
	"printeddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.activereporttasks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_addresstypes"( 
	"id" varchar(36),
	"typecode" varchar(30),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"contacttypeid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.addresstypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_admissionsources"( 
	"id" varchar(36),
	"admissionsourcecode" varchar(10),
	"description" varchar(40),
	"admissionflag" boolean,
	"registrationflag" boolean,
	"registrationfees" boolean,
	"addr1" varchar(40),
	"addr2" varchar(40),
	"addr3" varchar(40),
	"addr4" varchar(40),
	"telephone" varchar(20),
	"email" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"fax" varchar(20)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.admissionsources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_alerttypes"( 
	"id" varchar(36),
	"alerttype" varchar(20),
	"alertgroup" varchar(4),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.alerttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_alerts"( 
	"id" varchar(36),
	"alertcode" varchar(8),
	"description" varchar(200),
	"alerttypeid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.alerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_allocationdetails"( 
	"id" varchar(36),
	"allocationheaderid" varchar(36),
	"chargeclassid" varchar(36),
	"chargegroupid" varchar(36),
	"companyid" varchar(36),
	"amount" numeric(18, 2),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelleddate" timestamp,
	"docstat" boolean,
	"doctrantype" varchar(4),
	"docauditno" int,
	"invcode" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.allocationdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_allocationheaders"( 
	"id" varchar(36),
	"deposittheaderid" varchar(36),
	"billheaderid" varchar(36),
	"companyid" varchar(36),
	"allocationamount" numeric(18, 2),
	"allocationdate" timestamp,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelleddate" timestamp,
	"cancelledreason" varchar(250),
	"financeoperation" varchar(1),
	"appoperationid" varchar(36),
	"auditno" bigint,
	"isprocess" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.allocationheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_antibioticsetups"( 
	"id" varchar(36),
	"type" varchar(30),
	"name" varchar(100),
	"ddd" numeric(18, 2),
	"seqno" int,
	"unit" varchar(8),
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.antibioticsetups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_antibiotictypes"( 
	"id" int,
	"description" varchar(80),
	"ddd" numeric(18, 2),
	"effectivedate" timestamp,
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.antibiotictypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_antibiotics"( 
	"id" varchar(36),
	"productid" varchar(36),
	"antibiotictypeid" int,
	"strength" numeric(18, 2),
	"unit" varchar(36),
	"mohreport" boolean,
	"hospitalreport" boolean,
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.antibiotics?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_appfunctions"( 
	"id" varchar(36),
	"menusequence" varchar(36),
	"name" varchar(100),
	"description" varchar(255),
	"partid" int,
	"funclevel" int,
	"functype" varchar(1),
	"packagepage" varchar(250),
	"packagemodule" varchar(250),
	"iconpath" varchar(100),
	"qaiconpath" varchar(100),
	"ismenuitem" boolean,
	"defaulttabname" varchar(30),
	"parentfunctionid" varchar(36),
	"submodule" varchar(100),
	"optionname" varchar(100),
	"entitysetname" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"menuversion" varchar(10)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.appfunctions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_appoperations"( 
	"id" varchar(36),
	"sourceid" varchar(36),
	"transtypeid" varchar(36),
	"transactioncode" varchar(10),
	"description" varchar(255),
	"displayname" varchar(50),
	"maxtranno" int,
	"prefix" varchar(6),
	"isupdatepayername" boolean,
	"isupdateepisode" boolean,
	"isupdatedebtor" boolean,
	"isallowautoallocation" boolean,
	"isallowmanualal0location" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateddate" timestamp,
	"createddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.appoperations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_appointments"( 
	"id" varchar(36),
	"appointmentref" varchar(50),
	"patientid" varchar(36),
	"firstname" varchar(200),
	"lastname" varchar(100),
	"email" varchar(60),
	"gender" varchar(36),
	"address1" varchar(60),
	"address2" varchar(60),
	"countryid" varchar(36),
	"phoneno" varchar(50),
	"specialityid" varchar(36),
	"dateofappointment" timestamp,
	"fromtime" timestamp,
	"totime" timestamp,
	"preferredtime" timestamp,
	"doctorid" varchar(36),
	"appointmentreason" varchar(50),
	"status" varchar(10),
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"disciplineid" varchar(36),
	"noteexist" boolean,
	"keyindate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.appointments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_areagroups"( 
	"id" varchar(36),
	"areagroupcode" varchar(8),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.areagroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_areas"( 
	"id" varchar(36),
	"areacode" varchar(6),
	"description" varchar(60),
	"status" varchar(3),
	"areagroupid" varchar(36),
	"postcodeid" varchar(36),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.areas?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_assetcategories"( 
	"id" varchar(36),
	"assettypeid" varchar(36),
	"departmentid" varchar(36),
	"nexttagnumber" int,
	"basistypeid" varchar(36),
	"rateperannum" numeric(18, 2),
	"residualvalue" numeric(18, 2),
	"glassetaccountid" varchar(36),
	"glassetcostcodeid" varchar(36),
	"gldepaccountid" varchar(36),
	"gldepcostcodeid" varchar(36),
	"glprovisiondepaccountid" varchar(36),
	"glprovisiondepcostcodeid" varchar(36),
	"glgainlossaccountid" varchar(36),
	"glgainlostcostcodeid" varchar(36),
	"gldebtoraccountid" varchar(36),
	"gldebtorcostcodeid" varchar(36),
	"glrevaluationaccountid" varchar(36),
	"glrevaluationcostcodeid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"code" varchar(10),
	"description" varchar(100),
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assetcategories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_assetperiods"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assetperiods?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_assetsummary"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"assetid" varchar(36),
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"costopening" numeric(20, 8),
	"costaddition" numeric(20, 8),
	"costdisposal" numeric(20, 8),
	"costwriteoff" numeric(20, 8),
	"costclosing" numeric(20, 8),
	"depropening" numeric(20, 8),
	"deprcharge" numeric(20, 8),
	"deprdisposal" numeric(20, 8),
	"deprwriteoff" numeric(20, 8),
	"deprclosing" numeric(20, 8),
	"netbookvalue" numeric(20, 8),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assetsummary?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_assettransactions"( 
	"id" varchar(36),
	"assetid" varchar(36),
	"assettxntype" varchar(36),
	"depreciationrate" numeric(20, 8),
	"auditno" int,
	"amount" numeric(21, 8),
	"reference" varchar(100),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"trantypeid" varchar(36),
	"amount1" numeric(21, 8),
	"transactiondate" timestamp,
	"netbookvalue" numeric(21, 8),
	"status" varchar(3),
	"debtorid" varchar(50),
	"olddepartmentid" varchar(36),
	"newdepartmentid" varchar(36),
	"newlocationid" varchar(36),
	"oldlocationid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assettransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_assettypes"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"assettypecode" varchar(2),
	"description" varchar(40),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assettypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_assets"( 
	"id" varchar(36),
	"assetno" varchar(30),
	"assetmode" varchar(36),
	"assetcategoryid" varchar(36),
	"assettypeid" varchar(36),
	"departmentlocationid" varchar(36),
	"purchaseorderdetailid" varchar(36),
	"deliveryorderdetailid" varchar(36),
	"companyid" varchar(36),
	"ponumber" varchar(10),
	"purchasedate" timestamp,
	"purchaseprice" numeric(20, 8),
	"originalcost" numeric(20, 8),
	"depstartdate" timestamp,
	"currentcost" numeric(20, 8),
	"insurancevalue" numeric(20, 8),
	"quantity" char(10),
	"lastyeartodatedep" numeric(20, 8),
	"currentyeartodatedep" numeric(20, 8),
	"lastdeplstytddepdate" timestamp,
	"isindividualtag" boolean,
	"assettxntype" varchar(36),
	"serialno" varchar(20),
	"casisno" varchar(40),
	"lotno" varchar(40),
	"engineno" varchar(40),
	"status" char(10),
	"taggeduserid" varchar(36),
	"taggeddate" timestamp,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"deliveryorderhdrid" varchar(36),
	"supplierid" varchar(36),
	"apactheaderid" varchar(36),
	"productid" varchar(36),
	"statdate" timestamp,
	"nprefid" varchar(36),
	"recno" varchar(40),
	"tagno" varchar(40),
	"appoperationid" varchar(36),
	"trantypeid" varchar(36),
	"locationid" varchar(36),
	"departmentid" varchar(36),
	"invoicenum" varchar(100),
	"delordernum" varchar(30),
	"deliverydate" timestamp,
	"actdate" timestamp,
	"rateperannum" numeric(18, 8),
	"description" varchar(200),
	"assetbatchno" varchar(30)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.assets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_authoriserdepartments"( 
	"authoriserid" varchar(36),
	"departmentid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.authoriserdepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_authorisertranstypes"( 
	"authoriserid" varchar(36),
	"transtypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.authorisertranstypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_authorisers"( 
	"id" varchar(36),
	"userid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"transtypeid" varchar(36),
	"departmentid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.authorisers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_babyapgarscoretypes"( 
	"id" varchar(36),
	"apgarscorecode" varchar(30),
	"apgarscoredescription" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.babyapgarscoretypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_babyapgarscores"( 
	"id" varchar(36),
	"babyapgarscoretypeid" varchar(36),
	"maternitybabyrecordid" varchar(36),
	"apgar1min" int,
	"apgar5min" int,
	"apgar10min" int,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.babyapgarscores?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_backgroundtasks"( 
	"id" varchar(36),
	"taskname" varchar(20),
	"filepath" varchar(250),
	"status" varchar(5),
	"iscomplete" boolean,
	"userid" varchar(36),
	"taskdate" timestamp,
	"companyid" varchar(36),
	"sessionid" varchar(36),
	"machinename" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.backgroundtasks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_baddebtoralls"( 
	"id" varchar(36),
	"baddebtorid" varchar(36),
	"appoperationid" varchar(36),
	"companyid" varchar(36),
	"line" int,
	"payercode" varchar(100),
	"paymodeid" varchar(36),
	"tilldetailid" varchar(36),
	"debtorid" varchar(50),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"docauditno" bigint,
	"amount" numeric(21, 8),
	"outamount" numeric(21, 8),
	"allocdate" timestamp,
	"displaydocno" varchar(25),
	"remarks" varchar(100),
	"allocstatus" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"printedby" varchar(36),
	"refauditno" bigint,
	"reftranstype" varchar(36),
	"refamount" numeric(18, 0),
	"refsource" varchar(36),
	"reflineno" varchar(36),
	"auditno" bigint,
	"docsource" varchar(36),
	"doctranstype" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.baddebtoralls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_baddebtors"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"companyid" varchar(36),
	"line" int,
	"payercode" varchar(100),
	"paymodeid" varchar(36),
	"tilldetailid" varchar(36),
	"debtorid" varchar(50),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"docauditno" bigint,
	"amount" numeric(21, 8),
	"outamount" numeric(21, 8),
	"allocdate" timestamp,
	"displaydocno" varchar(25),
	"remarks" varchar(100),
	"allocstatus" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"printedby" varchar(36),
	"refauditno" bigint,
	"reftranstype" varchar(36),
	"refamount" numeric(18, 0),
	"refsource" varchar(36),
	"reflineno" varchar(36),
	"auditno" bigint,
	"docsource" varchar(36),
	"doctranstype" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.baddebtors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_banksummaries"( 
	"id" varchar(36),
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"bankid" varchar(36),
	"openbalance" numeric(21, 8),
	"actualamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.banksummaries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_banksuppliers"( 
	"id" varchar(36),
	"bankcode" varchar(30),
	"bankname" varchar(250),
	"pvalue1" varchar(250),
	"pvalue2" varchar(250),
	"pvalue3" varchar(250),
	"swiftcode" varchar(10),
	"achcode" varchar(10),
	"effectiveday" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.banksuppliers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_banktypes"( 
	"id" varchar(36),
	"banktypecode" varchar(36),
	"description" varchar(60),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.banktypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_banks"( 
	"id" varchar(36),
	"bankcode" varchar(30),
	"bankname" varchar(50),
	"address1" varchar(250),
	"address2" varchar(250),
	"address3" varchar(250),
	"postalcodeid" varchar(36),
	"stateid" varchar(36),
	"countryid" varchar(36),
	"telephoneno" varchar(15),
	"faxno" varchar(15),
	"contactid" varchar(100),
	"bankaccount" varchar(20),
	"clearday" int,
	"effectiveday" timestamp,
	"glaccountid" varchar(36),
	"costcenterid" varchar(36),
	"pctype" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"swiftcode" varchar(10),
	"achcode" varchar(10),
	"banktypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.banks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_barcodeprinters"( 
	"id" varchar(36),
	"line" int,
	"printerid" varchar(36),
	"printertype" varchar(36),
	"linetype" varchar(36),
	"command" varchar(255),
	"islineskip" boolean,
	"isreuse" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.barcodeprinters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bbraunconsignmentstemps"( 
	"productid" varchar(36),
	"itemcode" varchar(30),
	"description" varchar(80),
	"transqty" numeric(18, 8),
	"produomid" varchar(36),
	"produom" varchar(20),
	"convfactor" numeric(18, 8),
	"slocqtyonhand" numeric(18, 8),
	"slocuomid" varchar(36),
	"slocuom" varchar(20),
	"taxcodeid" varchar(36),
	"taxcode" varchar(8),
	"taxrate" numeric(18, 8),
	"companyid" varchar(36),
	"deptid" varchar(36),
	"currprice" numeric(23, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bbraunconsignmentstemps?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bedallocations"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"bedid" varchar(36),
	"allodatetime" timestamp,
	"isisolated" boolean,
	"islodgerbed" boolean,
	"isbabybed" boolean,
	"stdatetime" timestamp,
	"enddatetime" timestamp,
	"noteexist" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"isolatedreasonid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedallocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedbookings"( 
	"id" varchar(36),
	"bedid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"bookingstartdate" timestamp,
	"bookingenddate" timestamp,
	"bookingfor" timestamp,
	"companyid" varchar(36),
	"expirydatetime" timestamp,
	"remarks" varchar(100),
	"status" varchar(3),
	"noteexist" boolean,
	"admtdoctorid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"iscompleted" boolean,
	"iscancelled" boolean,
	"cancelledreason" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedbookings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bedstatus"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"code" varchar(10),
	"bedgroupid" varchar(36),
	"description" varchar(75),
	"remarks" varchar(250),
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bedstatusbedstatustypes"( 
	"id" varchar(36),
	"bedstatusid" varchar(36),
	"bedstatustypeid" varchar(36),
	"sequence" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedstatusbedstatustypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedstatusgroup"( 
	"id" varchar(36),
	"groupcode" varchar(5),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedstatusgroup?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bedstatuslogs"( 
	"id" varchar(36),
	"bedid" varchar(36),
	"bedstatusid" varchar(36),
	"patientid" varchar(36),
	"entrydate" timestamp,
	"logcode" varchar(50),
	"remark" varchar(500),
	"status" char(3),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedstatuslogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_bedstatustypes"( 
	"id" varchar(36),
	"code" char(10),
	"description" varchar(100),
	"status" varchar(3),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedstatustypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedsubstatus"( 
	"id" varchar(36),
	"code" varchar(10),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" smallint,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"ispharmacy" boolean,
	"isbilling" boolean,
	"ismco" boolean,
	"bedstatusid" varchar(36),
	"isward" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedsubstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedtransactions"( 
	"id" varchar(36),
	"bedid" varchar(36),
	"episodeid" varchar(36),
	"allodatetime" timestamp,
	"isisolated" boolean,
	"isolatedreason" varchar(100),
	"islodgerbed" boolean,
	"stdatetime" timestamp,
	"enddatetime" timestamp,
	"isactive" boolean,
	"isbabybed" boolean,
	"transrefid" varchar(36),
	"transreftype" varchar(10),
	"companyid" varchar(36),
	"status" varchar(4),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedtypewaitlists"( 
	"id" varchar(36),
	"bedtypeid" varchar(36),
	"episodeid" varchar(36),
	"listeddate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateduserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedtypewaitlists?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_bedtypes"( 
	"id" varchar(36),
	"bedtype" varchar(30),
	"description" varchar(50),
	"bedchargecodeid" varchar(36),
	"lodgerchargecodeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.bedtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_beds"( 
	"id" varchar(36),
	"roomseq" int,
	"bedno" varchar(8),
	"roomid" varchar(36),
	"bedtypeid" varchar(36),
	"telext" int,
	"statistic" boolean,
	"bedstatusid" varchar(36),
	"bedstatustypeid" varchar(36),
	"isbabybed" boolean,
	"isisolated" boolean,
	"chargecodeid" varchar(36),
	"lodgerchargecodeid" varchar(36),
	"height" numeric(18, 0),
	"width" numeric(18, 0),
	"leftposition" int,
	"topposition" int,
	"lastepisodeid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"comment" varchar(300),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.beds?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_billdetails"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"chargemasterid" varchar(36),
	"transtypeid" varchar(36),
	"billtypemasterid" varchar(36),
	"mmamasterid" varchar(36),
	"chargegroupid" varchar(36),
	"regdepartmentid" varchar(36),
	"issuedepartmentid" varchar(36),
	"chargetransid" varchar(36),
	"uomid" varchar(36),
	"debtoractheaderid" varchar(36),
	"docref" varchar(30),
	"transdate" timestamp,
	"counter" numeric(18, 0),
	"costcode" varchar(4),
	"billdate" timestamp,
	"unitprice" numeric(21, 2),
	"quantity" numeric(21, 2),
	"amount" numeric(21, 2),
	"dracccode" varchar(30),
	"cracccode" varchar(30),
	"taxamount" numeric(21, 2),
	"invgroup" varchar(4),
	"billed" boolean,
	"arprocess" boolean,
	"discountamount" numeric(21, 2),
	"discountcode" varchar(36),
	"packagecode" varchar(36),
	"remarks" varchar(255),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelleddate" timestamp,
	"financeoperation" varchar(1),
	"taxdetailid" varchar(36),
	"taxcalculated" boolean,
	"postprocessed" boolean,
	"postprocessid" varchar(36),
	"ispostprocessed" boolean,
	"line" int,
	"auditno" numeric(18, 0),
	"doctorid" varchar(36),
	"invcode" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.billdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_billsums"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"transtypeid" varchar(36),
	"chargeclasseid" varchar(36),
	"chargegroupid" varchar(36),
	"debtoractheaderid" varchar(36),
	"description" varchar(50),
	"quantity" numeric(18, 2),
	"amount" numeric(18, 2),
	"outamt" numeric(18, 2),
	"taxamt" numeric(18, 2),
	"classlevel" int,
	"line" int,
	"invcode" varchar(36),
	"discountamount" numeric(18, 2),
	"docref" varchar(30),
	"conversion" boolean,
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelleddate" timestamp,
	"drtaxinvid" varchar(36),
	"doctorid" varchar(36),
	"postprocessid" varchar(36),
	"ispostprocessed" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.billsums?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_billtrackings"( 
	"id" varchar(36),
	"debtoractheaderid" varchar(36),
	"code" varchar(10),
	"description" varchar(100),
	"trackdate" timestamp,
	"levelno" int,
	"trackno" int,
	"line" int,
	"comment" varchar(1000),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.billtrackings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_billtypemasters"( 
	"id" varchar(36),
	"pricetypeid" varchar(36),
	"type" varchar(2),
	"billtypecode" varchar(20),
	"description" varchar(150),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.billtypemasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_cbtransactiondetails"( 
	"id" varchar(36),
	"cbtransactionid" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(4),
	"trantype" varchar(4),
	"auditno" int,
	"line" int,
	"docdate" timestamp,
	"documentno" varchar(24),
	"amount" numeric(21, 8),
	"reference" varchar(255),
	"cbflag" boolean,
	"refsrc" varchar(36),
	"reftrantype" varchar(4),
	"refauditno" int,
	"bankid" varchar(36),
	"paymodeid" varchar(36),
	"commamt" numeric(19, 8),
	"categoryid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 8),
	"debtoractheaderid" varchar(36),
	"departmentid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cbtransactiondetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_cbtransactions"( 
	"id" varchar(36),
	"bankid" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(4),
	"transtype" varchar(4),
	"auditno" int,
	"postdate" timestamp,
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"chequetransactionid" varchar(36),
	"amount" numeric(21, 8),
	"remarks" varchar(255),
	"bitype" varchar(50),
	"referance" varchar(255),
	"stat" varchar(2),
	"refsource" varchar(4),
	"reftranstype" varchar(4),
	"refauditno" int,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cbtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_canceloperations"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"appfunctionid" varchar(36),
	"cancelrecordid" varchar(36),
	"activityname" varchar(150),
	"usercomment" varchar(200),
	"canceleduserid" varchar(36),
	"canceldate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.canceloperations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_cardcenters"( 
	"id" varchar(36),
	"cardcode" varchar(16),
	"name" varchar(60),
	"address1" varchar(255),
	"address2" varchar(255),
	"address3" varchar(255),
	"postcode" int,
	"stateid" varchar(36),
	"countryid" varchar(36),
	"telno" varchar(40),
	"telno2" varchar(40),
	"faxno" varchar(40),
	"currecyid" varchar(36),
	"contactid" varchar(100),
	"bankaccount" varchar(40),
	"clearday" int,
	"effectddate" timestamp,
	"glaccountid" varchar(36),
	"glcostcenterid" varchar(36),
	"openingbalance" numeric(17, 2),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cardcenters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_cardmembers"( 
	"id" varchar(36),
	"membershipcardid" varchar(36),
	"relationshipid" varchar(36),
	"companyid" varchar(36),
	"membername" varchar(50),
	"othericnumber" varchar(36),
	"newicnumber" varchar(36),
	"iscardholder" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"status" varchar(3),
	"dob" timestamp,
	"mrn" varchar(50),
	"familycodeid" varchar(36),
	"otheridtype" varchar(36),
	"patientid" varchar(36),
	"remarks" varchar(200)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cardmembers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_cardtypefamilycodes"( 
	"id" varchar(36),
	"cardtypeid" varchar(36),
	"familycodeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"limit" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cardtypefamilycodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_cardtypes"( 
	"id" varchar(36),
	"code" varchar(36),
	"description" varchar(100),
	"expirycode" boolean,
	"status" varchar(3),
	"activefamily" boolean,
	"vipstatus" boolean,
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.cardtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_casegroups"( 
	"id" varchar(36),
	"casegroupcode" varchar(8),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.casegroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_casetypes"( 
	"id" varchar(36),
	"casecode" varchar(4),
	"description" varchar(40),
	"casegroupid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.casetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_categories"( 
	"id" varchar(36),
	"catcode" varchar(50),
	"description" varchar(100),
	"stockaccountid" varchar(36),
	"costaccountid" varchar(36),
	"adjaccountid" varchar(36),
	"source" varchar(4),
	"woffaccountid" varchar(36),
	"expaccountid" varchar(36),
	"loanaccountid" varchar(36),
	"cattype" varchar(4),
	"ispovalidated" boolean,
	"accrualaccountid" varchar(36),
	"stocktakeaccountid" varchar(36),
	"stat" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxmasterid" varchar(36),
	"productgroupid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.categories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_categories_tmpdu"( 
	"id" varchar(36),
	"catcode" varchar(50),
	"description" varchar(100),
	"stockacct" varchar(36),
	"cosacct" varchar(36),
	"adjacct" varchar(36),
	"source" varchar(4),
	"woffacct" varchar(36),
	"expacct" varchar(36),
	"loanacct" varchar(36),
	"cattype" varchar(4),
	"povalidate" boolean,
	"accrualacc" varchar(36),
	"stktakeadjacct" varchar(36),
	"stat" varchar(3),
	"compcode" varchar(36),
	"adduser" varchar(36),
	"adddate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.categories_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargebilltypemarkups"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"billtypeid" varchar(36),
	"chargegroupid" varchar(36),
	"chargemasterid" varchar(36),
	"markuplevel" varchar(3),
	"markupprecentage" numeric(18, 2),
	"effectivedate" timestamp,
	"ischecknextlevel" boolean,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"amount" numeric(21, 8),
	"discountchargeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargebilltypemarkups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_chargeclasses"( 
	"id" varchar(36),
	"classcode" varchar(4),
	"description" varchar(40),
	"classlevel" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargeclasses?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargediscounts"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"billtypeid" varchar(36),
	"chargegroupid" varchar(36),
	"chargemasterid" varchar(36),
	"discountlevel" varchar(3),
	"discountprecentage" numeric(18, 2),
	"effectivedate" timestamp,
	"ischecknextlevel" boolean,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"amount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargediscounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargegroupdepartments"( 
	"id" varchar(36),
	"chargegroupid" varchar(36),
	"departmentid" varchar(36),
	"remarks" varchar(6),
	"servicetype" varchar(20)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargegroupdepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_chargegroups"( 
	"id" varchar(36),
	"groupcode" varchar(4),
	"description" varchar(40),
	"queueflag" boolean,
	"sequencenumber" int,
	"status" varchar(50),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"standardcodeflag" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargegroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargemasterbilltypeaccounts"( 
	"id" varchar(36),
	"chargemasterid" varchar(36),
	"billtypeid" varchar(36),
	"glacccode" varchar(10),
	"costcode" varchar(10),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargemasterbilltypeaccounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_chargemasters"( 
	"id" varchar(36),
	"chargecode" varchar(30),
	"description" varchar(150),
	"chargeclassid" varchar(36),
	"uomid" varchar(36),
	"packingqty" int,
	"inventoryitem" boolean,
	"priceoverwrite" boolean,
	"usercreated" varchar(200),
	"billuom" varchar(4),
	"datecreated" timestamp,
	"doctorstatid" boolean,
	"queueflag" boolean,
	"costcode" varchar(8),
	"chargeflag" boolean,
	"inpatientaccountcode" varchar(8),
	"outpatientaccountcode" varchar(8),
	"iscostdept" boolean,
	"costdepartmentid" varchar(36),
	"invgroup" varchar(4),
	"apprccode" varchar(6),
	"appracct" varchar(8),
	"priceactive" boolean,
	"constype" varchar(1),
	"dosage" boolean,
	"druggroupid" varchar(36),
	"subgroup" varchar(36),
	"itemgroup" varchar(8),
	"sequrnceno" int,
	"instruction" varchar(255),
	"groupchargecode" varchar(8),
	"chargecodeflag" varchar(8),
	"status" varchar(3),
	"companyid" varchar(36),
	"chargetypeid" varchar(36),
	"chargegroupid" varchar(36),
	"revenuedepartmentid" varchar(36),
	"isautopull" boolean,
	"ischargeifmore" boolean,
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"isoxytoxic" boolean,
	"isoxytoxicdefault" boolean,
	"isrevenuedept" boolean,
	"isdiscount" boolean,
	"brandname" varchar(60),
	"isdietitem" boolean,
	"isconsprocess" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargemasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargetaxes"( 
	"id" varchar(36),
	"compnayid" varchar(36),
	"chargemasterid" varchar(36),
	"taxmasterid" varchar(36),
	"effectivedate" timestamp,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargetaxes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargetransactions"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"docref" varchar(30),
	"chargemasterid" varchar(36),
	"transdate" timestamp,
	"transtype" varchar(36),
	"billcode" numeric(18, 0),
	"revcd" varchar(30),
	"mmamasterid" varchar(36),
	"billed" boolean,
	"billdate" timestamp,
	"doctorid" varchar(36),
	"unitprice" numeric(21, 2),
	"quantity" numeric(21, 2),
	"amount" numeric(21, 2),
	"taxamount" numeric(21, 2),
	"uomid" varchar(36),
	"billtypemasterid" varchar(36),
	"queuestatid" varchar(36),
	"dracccode" varchar(30),
	"cracccode" varchar(30),
	"arprocess" boolean,
	"billno" numeric(18, 0),
	"departmentid" varchar(36),
	"reqdepartmentid" varchar(36),
	"issuedepartmentid" varchar(36),
	"invcode" varchar(30),
	"resulttype" varchar(4),
	"resultstatus" numeric(18, 0),
	"inventory" boolean,
	"updinv" numeric(18, 0),
	"invbatch" numeric(18, 0),
	"doscode" varchar(5),
	"duration" numeric(18, 0),
	"instructionid" varchar(36),
	"discountamount" numeric(21, 2),
	"discountcode" varchar(36),
	"packagecode" varchar(36),
	"remarks" varchar(255),
	"frequencyid" varchar(36),
	"ftxtdosage" varchar(255),
	"dosageid" varchar(36),
	"svalueone" int,
	"svaluetwo" int,
	"addinstructions" varchar(255),
	"debtormasterid" varchar(50),
	"invgroup" varchar(2),
	"packageheaderid" varchar(36),
	"packagemasterid" varchar(36),
	"isprocessed" boolean,
	"status" varchar(50),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"hourtype" varchar(20),
	"queueentryid" varchar(36),
	"transtypeid" varchar(36),
	"taxdetailid" varchar(36),
	"isissued" boolean,
	"taxcalculated" boolean,
	"baseunitprice" numeric(19, 2),
	"markuppercentage" numeric(19, 2),
	"ispriceoverride" boolean,
	"discountchargeid" varchar(36),
	"financeoperation" varchar(1),
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelledreason" varchar(250),
	"cancelleddate" timestamp,
	"isupdated" boolean,
	"auditno" numeric(18, 0),
	"medcarechargeid" bigint,
	"hitstransfer" boolean,
	"hitstransferdate" timestamp,
	"transdateonly" varchar,
	"transdatetruncatedtominutes" varchar) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargetransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargetransactionsextents"( 
	"id" varchar(36),
	"chargetransactionid" varchar(36),
	"date" timestamp,
	"plantype" varchar(10),
	"orderdate" timestamp,
	"ordertime" timestamp,
	"panelhdrid" varchar(36),
	"priority" varchar(20),
	"side" varchar(20),
	"focus" varchar(20),
	"resulttype" varchar(30),
	"repeat" int,
	"locationid" varchar(36),
	"donebyid" varchar(36),
	"queueentryid" varchar(36),
	"orderrefid" varchar(36),
	"transref" varchar(10),
	"processtype" varchar(10),
	"presdtlid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargetransactionsextents?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chargetypes"( 
	"id" varchar(36),
	"chargetype" varchar(4),
	"description" varchar(60),
	"sequencenumber" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"chargegroupid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chargetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chequeregisters"( 
	"id" varchar(36),
	"bankid" varchar(36),
	"startchequeno" varchar(10),
	"endchequeno" varchar(10),
	"chequequantity" int,
	"stat" varchar(2),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chequeregisters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_chequetransactions"( 
	"id" varchar(36),
	"bankid" varchar(36),
	"chequeno" varchar(10),
	"amount" numeric(21, 8),
	"remarks" varchar(255),
	"trantype" varchar(4),
	"stat" varchar(2),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.chequetransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_citizenships"( 
	"id" varchar(36),
	"citizencode" varchar(4),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.citizenships?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_companies"( 
	"id" varchar(36),
	"code" varchar(10),
	"name" varchar(100),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"defaultcontactid" varchar(36),
	"gstno" varchar(20)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.companies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_companydetails"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"registrationno" varchar(36),
	"address1" varchar(50),
	"address2" varchar(50),
	"address3" varchar(50),
	"address4" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.companydetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_companyinfos"( 
	"id" int,
	"companyid" varchar(36),
	"phoneno" varchar(50),
	"faxno" varchar(50),
	"website" varchar(100),
	"email" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.companyinfos?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_companylists"( 
	"id" varchar(50),
	"code" varchar(50),
	"name" varchar(50),
	"status" varchar(50),
	"updateuserid" varchar(50),
	"updatedate" varchar(50),
	"noteexist" varchar(50),
	"defaultcontactid" varchar(50),
	"gstno" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.companylists?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_consignmentsku"( 
	"skuno" varchar(50),
	"itemcode" varchar(50),
	"itemdesc" varchar(100),
	"deptcode" char(10)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.consignmentsku?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_contactbank"( 
	"bankid" varchar(36),
	"contacts_id" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.contactbank?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_contactdepartment"( 
	"departments_id" varchar(36),
	"contacts_id" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.contactdepartment?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_contactemployee"( 
	"employees_id" varchar(36),
	"contacts_id" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.contactemployee?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_contacttypes"( 
	"id" varchar(36),
	"typecode" varchar(36),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexists" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.contacttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_contacts"( 
	"id" varchar(100),
	"contactname" varchar(255),
	"titleid" varchar(36),
	"companyid" varchar(36),
	"contacttypeid" varchar(36),
	"addresstypeid" varchar(36),
	"address1" varchar(255),
	"address2" varchar(255),
	"address3" varchar(255),
	"address4" varchar(255),
	"zip" varchar(10),
	"city" varchar(100),
	"phone" varchar(100),
	"fax" varchar(100),
	"mobile" varchar(100),
	"email" varchar(255),
	"countryid" varchar(36),
	"stateid" varchar(36),
	"postalcodeid" varchar(36),
	"areaid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.contacts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_costcenters"( 
	"id" varchar(36),
	"costcode" varchar(8),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.costcenters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_countries"( 
	"id" varchar(36),
	"countrycode" varchar(4),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.countries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_crcontrolgrps"( 
	"id" varchar(36),
	"creditcontrogroup" varchar(36),
	"description" varchar(50),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.crcontrolgrps?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_crossref"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"modules" varchar(36),
	"groupcode" varchar(36),
	"altcode" varchar(36),
	"hiscode" varchar(36),
	"queueno" int,
	"remark" varchar(100),
	"description" varchar(100),
	"quecode" varchar(36),
	"remark2" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.crossref?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_currencies"( 
	"id" varchar(36),
	"code" varchar(10),
	"name" varchar(60),
	"islocalcurrency" boolean,
	"currencysymbol" varchar(10),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.currencies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_currencyrates"( 
	"id" varchar(36),
	"currencyid" varchar(36),
	"effectivedate" timestamp,
	"rate" numeric(19, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.currencyrates?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_debtoractheaders"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"companyid" varchar(36),
	"line" int,
	"currencyid" varchar(36),
	"entryuserid" varchar(36),
	"payername" varchar(100),
	"receiptdetailid" varchar(36),
	"paymodeid" varchar(36),
	"tilldetailid" varchar(36),
	"debtorid" varchar(50),
	"billdebtorid" varchar(50),
	"dischargedestinationid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"deposittypeid" varchar(36),
	"tranauditno" bigint,
	"amount" numeric(21, 2),
	"outamount" numeric(21, 2),
	"entrydate" timestamp,
	"displaydocno" varchar(25),
	"remarks" varchar(500),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"iscancelled" boolean,
	"cancelledby" varchar(36),
	"cancelledreason" varchar(250),
	"cancelleddate" timestamp,
	"isprinted" boolean,
	"printedby" varchar(36),
	"referance" varchar(250),
	"authno" varchar(250),
	"expdate" timestamp,
	"refrecordid" varchar(36),
	"financeoperation" varchar(1),
	"billdepositamount" numeric(18, 0),
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 2),
	"refno" varchar(50),
	"postprocessid" varchar(36),
	"ispostprocessed" boolean,
	"iscbflag" boolean,
	"isupdated" boolean,
	"chequebank" varchar(100),
	"chequebranch" varchar(100),
	"chequenumber" varchar(200),
	"chequeexpdate" timestamp,
	"authuserid" varchar(36),
	"issupbill" boolean,
	"receiveridno" varchar(50),
	"receivername" varchar(150)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtoractheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_debtorgroupexceptions"( 
	"id" varchar(36),
	"chargegroupid" varchar(36),
	"debtormasterid" varchar(50),
	"companyid" varchar(36),
	"description" varchar(75),
	"grouplimit" numeric(18, 2),
	"itemlimit" numeric(18, 2),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtorgroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_debtorgroups"( 
	"id" varchar(36),
	"debtorgroupcode" varchar(36),
	"groupdescription" varchar(50),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"typegr" varchar(10),
	"debtortypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtorgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_debtoritemexceptions"( 
	"id" varchar(36),
	"chargemasterid" varchar(36),
	"debtormasterid" varchar(50),
	"companyid" varchar(36),
	"description" varchar(75),
	"itemlimit" numeric(18, 2),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtoritemexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_debtormasteronlines"( 
	"id" varchar(36),
	"debtorcode" varchar(50),
	"name" varchar(100),
	"address" varchar(100),
	"debtortypeid" varchar(36),
	"status" varchar(3),
	"hospital" varchar(36),
	"hospitalcode" varchar(50),
	"debtorgroupid" varchar(36),
	"olddebtorcode" varchar(50),
	"icnopassport" varchar(36),
	"adduserid" varchar(36),
	"adddate" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtormasteronlines?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_debtormasters"( 
	"id" varchar(50),
	"debtortypeid" varchar(36),
	"debtorcode" varchar(50),
	"olddebtorcode" varchar(50),
	"name" varchar(100),
	"address1" varchar(100),
	"address2" varchar(100),
	"address3" varchar(100),
	"address4" varchar(100),
	"postalcodeid" varchar(36),
	"stateid" varchar(36),
	"countryid" varchar(36),
	"contactid" varchar(100),
	"position" varchar(20),
	"teloffice" varchar(30),
	"fax" varchar(40),
	"billtypeid" varchar(36),
	"billtypeopid" varchar(36),
	"recstatus" varchar(2),
	"outamt" numeric(19, 4),
	"depamt" numeric(19, 4),
	"creditlimit" numeric(19, 4),
	"debtorgroupid" varchar(36),
	"crgroup" varchar(36),
	"otheraddr1" varchar(40),
	"otheraddr2" varchar(40),
	"otheraddr3" varchar(40),
	"otheraddr4" varchar(40),
	"othertel" varchar(30),
	"requestgl" boolean,
	"creditterm" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"actdebglaccid" varchar(36),
	"actdebccodeid" varchar(36),
	"depglaccid" varchar(36),
	"depccodeid" varchar(36),
	"otheracctid" varchar(36),
	"otherccodeid" varchar(36),
	"contactname" varchar(100),
	"comments" varchar(1000),
	"hospitalcode" varchar(10),
	"adddate" timestamp,
	"adduserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtormasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_debtortypepaymodes"( 
	"id" varchar(36),
	"debtortypeid" varchar(36),
	"paymodeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtortypepaymodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_debtortypes"( 
	"id" varchar(36),
	"debtortypecode" varchar(8),
	"ispatient" boolean,
	"description" varchar(40),
	"effectivedate" timestamp,
	"depccode" varchar(6),
	"depglacc" varchar(6),
	"actdebccode" varchar(6),
	"actdebglacc" varchar(8),
	"regfees" boolean,
	"typegrp" varchar(8),
	"updpayername" boolean,
	"updepisode" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"depcostcenterid" varchar(36),
	"depglaccountid" varchar(36),
	"actdebcostcenterid" varchar(36),
	"actdebglaccountid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.debtortypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_deliveryorderdetails"( 
	"id" varchar(36),
	"doheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"productdescription" varchar(80),
	"supplierid" varchar(36),
	"productpriceid" varchar(36),
	"uomid" varchar(36),
	"orderquantity" numeric(19, 8),
	"deliveredquantity" numeric(19, 8),
	"taggedquantity" numeric(19, 8),
	"remarks" varchar(255),
	"unitprice" numeric(20, 8),
	"amountdiscount" numeric(21, 8),
	"percentagediscount" numeric(5, 2),
	"percentagetax" numeric(5, 2),
	"amounttax" numeric(21, 8),
	"amount" numeric(21, 8),
	"supplierproductid" varchar(36),
	"quantitydelivered" numeric(19, 8),
	"purchaseorderdetailid" varchar(36),
	"itembatchid" varchar(36),
	"batchcode" varchar(20),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deliveryorderdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_deliveryorderdetailstemp30march"( 
	"id" varchar(36),
	"doheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"productdescription" varchar(80),
	"supplierid" varchar(36),
	"productpriceid" varchar(36),
	"uomid" varchar(36),
	"orderquantity" numeric(19, 8),
	"deliveredquantity" numeric(19, 8),
	"taggedquantity" numeric(19, 8),
	"remarks" varchar(255),
	"unitprice" numeric(20, 8),
	"amountdiscount" numeric(21, 8),
	"percentagediscount" numeric(5, 2),
	"percentagetax" numeric(5, 2),
	"amounttax" numeric(21, 8),
	"amount" numeric(21, 8),
	"supplierproductid" varchar(36),
	"quantitydelivered" numeric(19, 8),
	"purchaseorderdetailid" varchar(36),
	"itembatchid" varchar(36),
	"batchcode" varchar(20),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"taxamount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deliveryorderdetailstemp30march?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_deliveryorderheaders"( 
	"id" varchar(36),
	"grnnumber" varchar(10),
	"invoicenum" varchar(100),
	"delordernum" varchar(30),
	"purchaseorderheaderid" varchar(36),
	"purchasedeptid" varchar(36),
	"deliverydeptid" varchar(36),
	"receivedate" timestamp,
	"deliverydate" timestamp,
	"supplierid" varchar(36),
	"creditorid" varchar(36),
	"dostatus" varchar(36),
	"respersonid" varchar(36),
	"checkpersonid" varchar(36),
	"checkdate" timestamp,
	"dispatchperson" varchar(100),
	"entereddate" timestamp,
	"recordno" bigint,
	"remarks" varchar(255),
	"discountamount" numeric(21, 8),
	"discountpercentage" numeric(5, 2),
	"subamount" numeric(21, 8),
	"totalamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"appoperationid" varchar(36),
	"isimport" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deliveryorderheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_deliveryorderheaderstemp30march"( 
	"id" varchar(36),
	"grnnumber" varchar(10),
	"invoicenum" varchar(10),
	"delordernum" varchar(30),
	"purchaseorderheaderid" varchar(36),
	"purchasedeptid" varchar(36),
	"deliverydeptid" varchar(36),
	"receivedate" timestamp,
	"deliverydate" timestamp,
	"supplierid" varchar(36),
	"creditorid" varchar(36),
	"dostatus" varchar(36),
	"respersonid" varchar(36),
	"checkpersonid" varchar(36),
	"checkdate" timestamp,
	"dispatchperson" varchar(100),
	"entereddate" timestamp,
	"recordno" bigint,
	"remarks" varchar(255),
	"discountamount" numeric(21, 8),
	"discountpercentage" numeric(5, 2),
	"subamount" numeric(21, 8),
	"totalamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"appoperationid" varchar(36),
	"isimport" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deliveryorderheaderstemp30march?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_departmentlocations"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"locationid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.departmentlocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_departmentuser"( 
	"departments_id" varchar(36),
	"users_id" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.departmentuser?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_departments"( 
	"id" varchar(36),
	"code" varchar(20),
	"name" varchar(100),
	"costcenterid" varchar(36),
	"floorid" varchar(36),
	"ischargedept" boolean,
	"isadmissiondept" boolean,
	"isqueuedept" boolean,
	"isregistrationdept" boolean,
	"ispurchasedept" boolean,
	"isword" boolean,
	"isdispensedept" boolean,
	"defaultcontactid" varchar(36),
	"oeprocesstypes" varchar(6),
	"topposition" int,
	"height" numeric(18, 0),
	"width" numeric(18, 0),
	"leftposition" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"isdoctor" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.departments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_deposittransactiontypes"( 
	"id" varchar(36),
	"deposittransactiontype" varchar(2),
	"source" varchar(2),
	"description" varchar(30),
	"updpayername" boolean,
	"updepisode" boolean,
	"depccode" varchar(3),
	"depglacc" varchar(8),
	"manualalloc" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deposittransactiontypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_deposittypes"( 
	"id" varchar(36),
	"deposittypecode" varchar(5),
	"transgroup" varchar(4),
	"transtypeid" varchar(36),
	"description" varchar(50),
	"isupdatepayername" boolean,
	"isupdateepisode" boolean,
	"isupdatedebtor" boolean,
	"isallowautoallocation" boolean,
	"isallowmanualallocation" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"costcenterid" varchar(36),
	"glaccountid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.deposittypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_designations"( 
	"id" varchar(36),
	"code" varchar(50),
	"status" varchar(3),
	"description" varchar(250),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.designations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_diagnosis"( 
	"id" varchar(36),
	"icdcodeid" varchar(36),
	"crossref" varchar(6),
	"dateactivated" timestamp,
	"datedeactivated" timestamp,
	"description" varchar(2000),
	"lowage" int,
	"highage" int,
	"sex" varchar(1),
	"coderest" int,
	"area" int,
	"ageflag" int,
	"extra" varchar(10),
	"soundex" varchar(15),
	"descsdx" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.diagnosis?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_diagnosisgroups"( 
	"id" varchar(36),
	"groupcode" varchar(8),
	"description" varchar(50),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.diagnosisgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_diagnosis_diagnosisgroups"( 
	"id" varchar(36),
	"diagnosisid" varchar(36),
	"diagnosisgroupid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.diagnosis_diagnosisgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_dietfooditems"( 
	"id" varchar(36),
	"fooditemid" varchar(36),
	"dietid" varchar(36),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.dietfooditems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_diets"( 
	"id" varchar(36),
	"dietcode" varchar(8),
	"description" varchar(50),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.diets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_dischargedestinations"( 
	"id" varchar(36),
	"dischargedestinationcode" varchar(4),
	"description" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.dischargedestinations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_disciplines"( 
	"id" varchar(36),
	"disciplinecode" varchar(4),
	"description" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.disciplines?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_dispositionendcasedtls"( 
	"id" varchar(36),
	"dispositionendcasehdrid" varchar(36),
	"chragemasterid" varchar(36),
	"chargehourstype" varchar(50),
	"consultanthours" numeric(18, 2),
	"amount" numeric(18, 4),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.dispositionendcasedtls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_dispositionendcasehdrs"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"episodedoctorid" varchar(36),
	"isendcase" boolean,
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.dispositionendcasehdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorallocations"( 
	"id" varchar(36),
	"paramsourceid" varchar(36),
	"trantypeid" varchar(36),
	"auditno" int,
	"lineno" int,
	"drtnauditno" int,
	"doctorid" varchar(36),
	"chargemasterid" varchar(36),
	"allocdate" timestamp,
	"drallocamt" numeric(21, 8),
	"drappamt" numeric(21, 8),
	"cccomamt" numeric(21, 8),
	"approcess" boolean,
	"paymodesid" varchar(36),
	"drappstfamt" numeric(21, 8),
	"drtnlineno" int,
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"drtnbillno" int,
	"reccount" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"debtoractheaderid" varchar(36),
	"isprocess" boolean,
	"gstpayment" numeric(21, 8),
	"gstmgtfee" numeric(21, 8),
	"gstcommamt" numeric(21, 8),
	"allocdateonly" varchar) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorallocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorceiling"( 
	"id" varchar(36),
	"doctorid" varchar(36),
	"effectivedate" timestamp,
	"episodetypeid" varchar(36),
	"ceilingamount" numeric(21, 8),
	"ceilingpercentage" numeric(19, 8),
	"staffpercentage" numeric(19, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorceiling?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorcontributions"( 
	"id" varchar(36),
	"doctorid" varchar(36),
	"chargemasterid" varchar(36),
	"episodetypeid" varchar(36),
	"effectivedate" timestamp,
	"isconsultancy" boolean,
	"drpercentage" numeric(18, 8),
	"amount" numeric(21, 8),
	"staffpercentage" numeric(18, 8),
	"staffamount" numeric(21, 8),
	"corppercentage" numeric(18, 8),
	"corpamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorcontributions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorconvs"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"debtoractheaderid" varchar(36),
	"billdate" timestamp,
	"doctorsid" varchar(36),
	"chargemasterid" varchar(36),
	"trxdate" timestamp,
	"chargeamount" numeric(21, 8),
	"orgoutamount" numeric(21, 8),
	"debtorid" varchar(50),
	"billamount" numeric(21, 8),
	"newoutamount" numeric(21, 8),
	"rate" numeric(21, 8),
	"ceilingamt" numeric(21, 8),
	"drappamount" numeric(21, 8),
	"drappoutamount" numeric(21, 8),
	"drapppaid" numeric(21, 8),
	"auditno" int,
	"source" varchar(16),
	"transtype" varchar(16),
	"rate2" numeric(21, 8),
	"appoperationid" varchar(36),
	"line" int,
	"transactiondate" timestamp,
	"drrefno" varchar(50),
	"totalincome" numeric(21, 8),
	"dramount1" numeric(21, 8),
	"dramount2" numeric(21, 8),
	"invappoperationid" varchar(36),
	"invsource" varchar(16),
	"invtranstype" varchar(16),
	"invamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"convepisno" varchar(36),
	"convepistype" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorconvs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorgroups"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"groupcode" varchar(4),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"effectivedate" timestamp,
	"doctorid" varchar(36),
	"name" varchar(50),
	"rate" numeric(18, 0),
	"adduserid" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorincomes"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"doctorid" varchar(36),
	"doctorcode" varchar(15),
	"episodetypeid" varchar(36),
	"totalincome" numeric(21, 8),
	"year" timestamp,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorincomes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorpreferencesdtls"( 
	"id" varchar(36),
	"doctorpreferencehdrid" varchar(36),
	"chargemsterid" varchar(36),
	"dosageid" varchar(36),
	"instructionid" varchar(36),
	"quantity" numeric(18, 8),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorpreferencesdtls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorpreferenceshdrs"( 
	"id" varchar(36),
	"doctorid" varchar(36),
	"prefsetname" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorpreferenceshdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctorstatus"( 
	"id" varchar(36),
	"statuscode" varchar(4),
	"description" varchar(30),
	"grpdoctype" varchar(8),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctorstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctortaxinvoices"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"debtoractheaderid" varchar(36),
	"auditno" int,
	"line" int,
	"drinvseq" int,
	"doctorid" varchar(36),
	"totalamount" numeric(21, 8),
	"doctoramount" numeric(21, 8),
	"isdoctortaxinv" boolean,
	"totaltaxamount" numeric(21, 8),
	"doctortaxamount" numeric(21, 8),
	"headerstatus" varchar(8),
	"remarks" varchar(250),
	"field1" varchar(250),
	"field2" varchar(250),
	"field3" varchar(250),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"postprocessid" varchar(36),
	"ispostprocessed" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctortaxinvoices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_doctortransactions"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"source" varchar(20),
	"transtype" varchar(16),
	"auditno" int,
	"chargetransactionid" varchar(36),
	"doctorid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"transdate" timestamp,
	"refappoperationid" varchar(36),
	"refsource" varchar(4),
	"reftranstype" varchar(4),
	"debtoractheaderid" varchar(36),
	"billno" int,
	"billdate" timestamp,
	"drrefno" varchar(40),
	"chargemasterid" varchar(36),
	"chargetransdate" timestamp,
	"chargeamount" numeric(21, 8),
	"chargeoutamount" numeric(21, 8),
	"invoiceamount" numeric(21, 8),
	"drappamount" numeric(21, 8),
	"drappoutamount" numeric(21, 8),
	"drapppaid" numeric(21, 8),
	"drpercentage" int,
	"effectdate" timestamp,
	"episodetypeid" varchar(36),
	"drcontributionamt" numeric(21, 8),
	"drstaffamt" numeric(21, 8),
	"drstaffpercentage" numeric(21, 8),
	"debtormasterid" varchar(50),
	"line" int,
	"consultflag" boolean,
	"totalincome" numeric(21, 8),
	"drpercentage1" numeric(21, 8),
	"dramount1" numeric(21, 8),
	"drpercentage2" numeric(21, 8),
	"dramount2" numeric(21, 8),
	"invcode" varchar(16),
	"fullpaiddate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"previnvcode" varchar(16),
	"billdetailid" varchar(36),
	"gstpayment" numeric(21, 8),
	"gstmgtfee" numeric(21, 8),
	"mgtfee" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctortransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_doctors"( 
	"id" varchar(36),
	"doctorcode" varchar(15),
	"doctorname" varchar(250),
	"companyname" varchar(100),
	"address1" varchar(100),
	"address2" varchar(100),
	"address3" varchar(100),
	"postalcodeid" varchar(36),
	"stateid" varchar(36),
	"countryid" varchar(36),
	"restelno" varchar(15),
	"hphone" varchar(15),
	"offtelno" varchar(15),
	"disciplineid" varchar(36),
	"extenstion" varchar(4),
	"specialityid" varchar(36),
	"type" varchar(25),
	"doctorstatusid" varchar(36),
	"doctortype" varchar(25),
	"chargecodeid" varchar(36),
	"creditorid" varchar(36),
	"debtorid" varchar(36),
	"contraflag" boolean,
	"cbflag" boolean,
	"admissionright" boolean,
	"dateofresignation" timestamp,
	"departmentid" varchar(36),
	"costcodeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"gstpay_processdate" timestamp,
	"ccomgst_processdate" timestamp,
	"ccom_processdate" timestamp,
	"mgtfee_processdate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.doctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_donebynames"( 
	"id" varchar(36),
	"doneby" varchar(20),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.donebynames?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_dosages"( 
	"id" varchar(36),
	"dosagecode" varchar(40),
	"description" varchar(255),
	"description2" varchar(255),
	"dosefactor" numeric(12, 2),
	"dflag" boolean,
	"rcflag" boolean,
	"status" varchar(50),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.dosages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_drugdosages"( 
	"id" varchar(36),
	"dosageid" varchar(36),
	"druggroupid" varchar(36),
	"description" varchar(255),
	"convfactor" numeric(12, 2),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.drugdosages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_druggroups"( 
	"id" varchar(36),
	"druggroupcode" varchar(40),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.druggroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_ediexportimportdetails"( 
	"id" varchar(36),
	"ediexportimportheaderid" varchar(36),
	"edidocumentid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"editype" char(10),
	"line" int,
	"itemcode" varchar(36),
	"uom" char(10),
	"qty" numeric(18, 0),
	"unitprice" numeric(20, 8),
	"discount1" numeric(20, 8),
	"discount2" numeric(20, 8),
	"amount" numeric(20, 8),
	"taxamount" numeric(20, 8),
	"taxcode" char(10),
	"batchnumber" varchar(36),
	"expdate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.ediexportimportdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_ediexportimportheaders"( 
	"id" varchar(36),
	"exportimportid" varchar(36),
	"purchaseorderheaderid" varchar(36),
	"deliveryorderheaderid" varchar(36),
	"batchno" varchar(36),
	"docno" varchar(50),
	"exportimporttype" varchar(3),
	"doctype" varchar(20),
	"recstatus" varchar(3),
	"edidate" timestamp,
	"filename" varchar(200),
	"supplierid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"doclineno" int,
	"reference" varchar(36),
	"remarks" varchar(120),
	"discountamount" numeric(18, 4),
	"subamount" numeric(18, 4),
	"netamount" numeric(18, 4)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.ediexportimportheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_employees"( 
	"id" varchar(36),
	"firstname" varchar(100),
	"lastname" varchar(100),
	"othernames" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"departmentid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"defaultcontactid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.employees?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodeadjustment"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"adjustmenttype" varchar(2),
	"remarks" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodeadjustment?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodealerts"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"alertid" varchar(36),
	"altertext" varchar(200),
	"createdby" varchar(30),
	"activatedate" timestamp,
	"activatetime" timestamp,
	"inactivereasone" varchar(200),
	"inactivedatetime" timestamp,
	"createddatetime" timestamp,
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"doctorid" varchar(36),
	"departmentid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodealerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodediagnosis"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"diagnosisid" varchar(36),
	"episodedoctorid" varchar(36),
	"vaspatient" varchar(50),
	"vasdoctor" varchar(50),
	"remarks" varchar(75),
	"diagnosisdate" timestamp,
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"icdcodeno" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodediagnosis?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodedietorderdetails"( 
	"id" varchar(36),
	"episodedietorderheaderid" varchar(36),
	"ditefooditemid" varchar(36),
	"mealshift" varchar(3),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedietorderdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_episodedietorderheaders"( 
	"id" varchar(36),
	"episodediteid" varchar(36),
	"date" timestamp,
	"remarks" varchar(150),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedietorderheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodedietstatuschangedetails"( 
	"id" varchar(36),
	"episodedietid" varchar(36),
	"episodedietstatus" varchar(3),
	"statussetdate" timestamp,
	"statussettime" timestamp,
	"remarks" varchar(50),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedietstatuschangedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_episodediets"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"diteid" varchar(36),
	"episodeditestatus" varchar(3),
	"remarks" varchar(150),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodediets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodedischargecomments"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"companyid" varchar(36),
	"comment" varchar(500),
	"commentdate" timestamp,
	"userid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedischargecomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodedispositionappointments"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"episodedoctorid" varchar(36),
	"episodeid" varchar(36),
	"apttype" varchar(10),
	"date" timestamp,
	"time" timestamp,
	"remarks" varchar(60),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedispositionappointments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_episodedispositionmedcerts"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"patientid" varchar(36),
	"episodedoctorid" varchar(36),
	"ml_noofdays" int,
	"ml_fromdate" timestamp,
	"ml_todate" timestamp,
	"ld_noofdays" int,
	"ld_fromdate" timestamp,
	"ld_todate" timestamp,
	"ex_noofdays" int,
	"ex_fromdate" timestamp,
	"ex_todate" timestamp,
	"nonhospitalizationmc" boolean,
	"notexcusefromcourt" boolean,
	"remarks" varchar(60),
	"createduserid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedispositionmedcerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_episodedispositionreferrals"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"episodedoctorid" varchar(36),
	"toname" varchar(50),
	"titledepartment" varchar(20),
	"refid" varchar(36),
	"address" varchar(150),
	"reuseaddress" boolean,
	"dear" varchar(25),
	"content" varchar(250),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"referraldate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedispositionreferrals?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodedoctors"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"doctorid" varchar(36),
	"doctorstatusid" varchar(36),
	"date" timestamp,
	"time" timestamp,
	"isqueueentrycreated" boolean,
	"status" varchar(3),
	"updateuserid" varchar(36),
	"companyid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodedoctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodeinvspanels"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"panelid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodeinvspanels?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodematernities"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"medicalhistory" varchar(75),
	"surgicalhistory" varchar(75),
	"familymedicalhistory" varchar(100),
	"currentmedications" varchar(100),
	"allergies" varchar(100),
	"obstetricalhistory" varchar(100),
	"isih" boolean,
	"isgestationsldm" boolean,
	"isasthma" boolean,
	"isstillbirth" boolean,
	"isneonataldeath" boolean,
	"isaph" boolean,
	"isplacentapraevia" boolean,
	"placentapraeviatype" varchar(50),
	"ispreviouslscs" boolean,
	"isbigbaby" boolean,
	"ishistorypph" boolean,
	"ismultiplepregnancy" boolean,
	"isbloodtransfusion" boolean,
	"lastchildbirth" varchar(50),
	"otherbirths" varchar(50),
	"reason" varchar(100),
	"nextofkinoccupationid" varchar(36),
	"consultantid" varchar(36),
	"reasionforadmission" varchar(50),
	"gravida" int,
	"para" int,
	"lmp" timestamp,
	"pog" int,
	"edd" timestamp,
	"temperature" numeric(18, 2),
	"pulse" int,
	"respiration" numeric(18, 2),
	"bloodpressure" numeric(18, 2),
	"weight" numeric(18, 2),
	"height" numeric(18, 2),
	"isemotionalcalm" boolean,
	"isemotionalanxious" boolean,
	"isemotionaldistressed" boolean,
	"isemotionaldepressed" boolean,
	"isemotionalirritable" boolean,
	"emotionalother" varchar(50),
	"breastnipple" varchar(75),
	"isbreastfeeding" boolean,
	"isantepostnatalclasses" boolean,
	"isknwofcopingwtihpain" boolean,
	"modeofadmissionid" varchar(36),
	"foetuspresandposition" varchar(100),
	"foetalheartrate" numeric(18, 2),
	"contrfreqtype" char(100),
	"urineprotein" numeric(18, 2),
	"urinesugar" numeric(18, 2),
	"urineacetone" numeric(18, 2),
	"diagnosisonadmission" char(100),
	"isperinealshave" boolean,
	"fleetenema" boolean,
	"labourtypeid" varchar(36),
	"inducedmethod" varchar(50),
	"sedation" varchar(50),
	"doctorid" varchar(36),
	"anaesthetist" varchar(36),
	"conductedby" varchar(50),
	"witnessby" varchar(50),
	"deliverytypeid" varchar(36),
	"deliverycomplicatedtypeid" varchar(36),
	"deliverycomplicatedother" varchar(50),
	"stageoneindication" varchar(100),
	"stageonedetails" varchar(100),
	"placentadelbytypeid" varchar(36),
	"bloodlossamt" numeric(18, 2),
	"bloodlosscausetypeid" varchar(36),
	"bloodlossother" varchar(50),
	"temperaturestage3" numeric(18, 2),
	"temperatureonehr" numeric(18, 2),
	"pulsestage3" numeric(18, 2),
	"pulsestage3onehr" numeric(18, 2),
	"bpstage3" numeric(18, 2),
	"bpstage3onehr" numeric(18, 2),
	"placentatypeid" varchar(36),
	"placentaweight" numeric(18, 2),
	"placentaabnormalities" varchar(100),
	"membranetypeid" varchar(36),
	"membraneabnormalities" varchar(100),
	"cordlength" numeric(18, 2),
	"cordarndneck" numeric(18, 2),
	"cordab" varchar(100),
	"cervix" boolean,
	"cervixsite" varchar(100),
	"vagina" boolean,
	"vaginasite" varchar(100),
	"pph" boolean,
	"pphtreatment" varchar(50),
	"perineumtypeid" varchar(36),
	"episiotomytypeid" varchar(36),
	"tearvaluetypeid" varchar(36),
	"sutureused" varchar(50),
	"analtone" varchar(50),
	"rectum" varchar(50),
	"painrelieftypeid" varchar(36),
	"membranerupturetypeid" varchar(36),
	"membranerupturedatetime" timestamp,
	"onsetoflabour" varchar(100),
	"onsetoflabdatetime" timestamp,
	"cervix10cm" varchar(100),
	"cervix10cmdate" timestamp,
	"babydeliveredtypeid" varchar(36),
	"babyrecordid" varchar(36),
	"placentadeliveredtypeid" varchar(36),
	"placentadeliverydate" timestamp,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodematernities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_episodenutritions"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"chargemasterid" varchar(36),
	"dosage" varchar(50),
	"nutritionsuplystatus" varchar(3),
	"quntity" int,
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodenutritions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_episodepatientadvices"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"episodedoctorid" varchar(36),
	"advise" varchar(250),
	"date" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodepatientadvices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodepayerguaranteeletters"( 
	"id" varchar(36),
	"episodepayerid" varchar(36),
	"guaranteeid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodepayerguaranteeletters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodepayers"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"debtorid" varchar(50),
	"paymodeid" varchar(36),
	"relationshipid" varchar(36),
	"billtypemasterid" varchar(36),
	"remarks" varchar(150),
	"referance" varchar(100),
	"ourreferance" varchar(100),
	"lastdebtorid" varchar(36),
	"allgroups" boolean,
	"intiallimitamount" numeric(10, 2),
	"totallimitamount" numeric(10, 2),
	"companyid" varchar(36),
	"status" varchar(50),
	"isdefaultpayer" boolean,
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodepayers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodeprescriptiondtls"( 
	"id" varchar(36),
	"prescriptionhdrid" varchar(36),
	"chargemasterid" varchar(36),
	"episodeinvspanelid" varchar(36),
	"priority" varchar(20),
	"departmentid" varchar(36),
	"depttype" varchar(10),
	"plantype" timestamp,
	"date" timestamp,
	"price" numeric(18, 8),
	"quantity" numeric(18, 8),
	"orderdate" timestamp,
	"ordertime" timestamp,
	"amount" numeric(18, 8),
	"remarks" varchar(100),
	"startdatetime" timestamp,
	"enddatetime" timestamp,
	"frequencyid" varchar(36),
	"duration" numeric(18, 0),
	"locationid" varchar(36),
	"donebyid" varchar(36),
	"vas_patient" int,
	"vas_doctor" int,
	"diagstat" varchar(3),
	"performstatus" varchar(10),
	"chargegroupid" varchar(36),
	"dosageid" varchar(36),
	"instructionid" varchar(36),
	"uomid" varchar(36),
	"isprocessed" boolean,
	"isbilled" boolean,
	"isrepeat" boolean,
	"side" varchar(20),
	"focus" varchar(20),
	"resulttype" varchar(30),
	"shortclinicfind" varchar(400),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodeprescriptiondtls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodeprescriptionhdrs"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"recdate" timestamp,
	"episodedoctorid" varchar(36),
	"prestype" varchar(10),
	"pressubtype" varchar(10),
	"refqueueentryid" varchar(36),
	"remarks" varchar(200),
	"departmentid" varchar(36),
	"isbilled" boolean,
	"iscompleted" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodeprescriptionhdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodetriages"( 
	"id" varchar(36),
	"insertdate" date,
	"inserttime" timestamp,
	"episodeid" varchar(36),
	"bp_sitting_min" numeric(6, 2),
	"bp_sitting_max" numeric(6, 2),
	"bp_standing_min" numeric(6, 2),
	"bp_standing_max" numeric(6, 2),
	"height" numeric(6, 2),
	"weight" numeric(6, 2),
	"bmi" numeric(6, 2),
	"temperature" numeric(6, 2),
	"plusrate" int,
	"respiration" int,
	"remark" varchar(100),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"patientid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodetriages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodetypes"( 
	"id" varchar(36),
	"episodetypecode" varchar(4),
	"description" varchar(30),
	"firstchgcode" varchar(12),
	"subschgcode" varchar(12),
	"dateofactivation" timestamp,
	"isallowbed" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"pricetypeid" varchar(36),
	"isbilluponfinal" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_episodes"( 
	"id" varchar(36),
	"episodeno" int,
	"episodetypeid" varchar(36),
	"registrationdate" timestamp,
	"registrationtime" timestamp,
	"registrationdeptid" varchar(36),
	"adminsourceid" varchar(36),
	"bedtypeid" varchar(36),
	"wardid" varchar(36),
	"depositrequired" boolean,
	"casetypeid" varchar(36),
	"treatment" varchar(16),
	"diagnosisid" varchar(36),
	"admittingdoctorid" varchar(36),
	"attendingdoctorid" varchar(36),
	"referringdoctorid" varchar(36),
	"iskcisdischarge" boolean,
	"isdischarge" boolean,
	"dischargedate" timestamp,
	"dischargetime" timestamp,
	"medrecord" boolean,
	"destinationid" varchar(36),
	"diagnostic" varchar(50),
	"admissiondate" timestamp,
	"admissiontime" timestamp,
	"companyid" varchar(36),
	"previouslybilled" boolean,
	"deposit" numeric(21, 8),
	"billtypemasterid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"patientid" varchar(36),
	"payerid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"otcpatienttype" varchar(5),
	"medcareepisodeno" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.episodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_familycodes"( 
	"id" varchar(36),
	"code" varchar(4),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.familycodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_fiscalyears"( 
	"id" varchar(36),
	"fiscalyear" int,
	"iscurrent" boolean,
	"isclosed" boolean,
	"currentperiod" int,
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.fiscalyears?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_fixedassettemps"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"entrysource" varchar(3),
	"description" char(100),
	"departmentid" varchar(36),
	"locationid" varchar(36),
	"purchaceordid" varchar(36),
	"supplierid" varchar(36),
	"deliveryorderhdrid" varchar(36),
	"itemstocklocationid" varchar(36),
	"assetcategoryid" varchar(36),
	"assetkey" varchar(36),
	"apactheaderid" varchar(36),
	"quantity" int,
	"individualtag" boolean,
	"statdate" timestamp,
	"recstatus" varchar(36),
	"genstat" varchar(36),
	"trantype" varchar(36),
	"trandate" timestamp,
	"nprefid" varchar(36),
	"updateuserid" char(36),
	"updatedate" timestamp,
	"origcost" numeric(21, 8),
	"insval" numeric(21, 8),
	"startdep" timestamp,
	"currentcost" numeric(21, 8),
	"cuytddep" numeric(21, 8),
	"lstytddep" numeric(21, 8),
	"appoperationid" varchar(36),
	"assetid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.fixedassettemps?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_floors"( 
	"id" varchar(36),
	"code" varchar(10),
	"level" int,
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" smallint,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.floors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_fooditems"( 
	"id" varchar(36),
	"itemcode" varchar(5),
	"itemname" varchar(50),
	"itemcategory" varchar(3),
	"diteitemcategory" varchar(3),
	"issetmenuitem" boolean,
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.fooditems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_foodmenuitems"( 
	"id" varchar(36),
	"setmenuid" varchar(36),
	"fooditemid" varchar(36),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.foodmenuitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_frequencies"( 
	"id" varchar(36),
	"frequencycode" varchar(40),
	"description" varchar(255),
	"description2" varchar(255),
	"dfreq" numeric(18, 2),
	"dflag" boolean,
	"rcflag" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.frequencies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glfinancetables"( 
	"id" varchar(36),
	"tablename" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glfinancetables?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glgroupexceptions"( 
	"id" varchar(36),
	"chargegroupid" varchar(36),
	"glreferenceid" varchar(36),
	"companyid" varchar(36),
	"description" varchar(75),
	"grouplimit" numeric(18, 2),
	"individualitemlimit" numeric(18, 2),
	"isgroupunlimited" boolean,
	"isitemunlimited" boolean,
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glgroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glitemexceptions"( 
	"id" varchar(36),
	"chargemasterid" varchar(36),
	"companyid" varchar(36),
	"glgroupexceptionid" varchar(36),
	"description" varchar(75),
	"itemlimit" numeric(18, 2),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glitemexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gljournaldetails"( 
	"id" varchar(36),
	"gljournalheaderid" varchar(36),
	"auditno" int,
	"line" int,
	"drcrsign" varchar(4),
	"amount" numeric(21, 8),
	"costcenterid" varchar(36),
	"glaccountid" varchar(36),
	"docno" varchar(36),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gljournaldetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gljournalheaders"( 
	"id" varchar(36),
	"auditno" int,
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"paramsourceid" varchar(36),
	"appoperationid" varchar(36),
	"trantype" varchar(36),
	"docno" varchar(36),
	"docdate" timestamp,
	"description" varchar(100),
	"postdate" timestamp,
	"difamount" numeric(21, 8),
	"poststatus" varchar(3),
	"printstatus" varchar(3),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"postuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gljournalheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gleteritems"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"debtormasterid" varchar(50),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"chargemasterid" varchar(36),
	"departmentid" varchar(36),
	"chargegroupid" varchar(36),
	"totitemlimit" numeric(18, 8),
	"totitembal" numeric(18, 8),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gleteritems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gletterdepartments"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"departmentid" varchar(36),
	"chargegroupid" varchar(36),
	"departmentlimit" numeric(18, 8),
	"departmentbalance" numeric(18, 8),
	"grouplimit" numeric(18, 8),
	"groupbalance" numeric(18, 8),
	"inditemlimit" numeric(18, 8),
	"allitems" boolean,
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gletterdepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glaccountcostcodes"( 
	"id" varchar(36),
	"code" varchar(50),
	"status" varchar(3),
	"costcenterid" varchar(36),
	"companyid" varchar(36),
	"glaccountid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glaccountcostcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_glaccountdetails"( 
	"id" varchar(36),
	"glaccountcostcodeid" varchar(36),
	"periodid" varchar(36),
	"openingbalance" numeric(21, 8),
	"budgetedamount" numeric(21, 8),
	"companyid" varchar(36),
	"actualamount" numeric(21, 8),
	"foramount" numeric(21, 8),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"gljournaldetailid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glaccountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_glaccounttypes"( 
	"id" varchar(36),
	"code" varchar(10),
	"companyid" varchar(36),
	"description" varchar(50),
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glaccounttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glaccounts"( 
	"id" varchar(36),
	"code" varchar(16),
	"description" varchar(100),
	"glaccounttypeid" varchar(36),
	"nprefid" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"repgroup" varchar(50),
	"accgroup" varchar(50),
	"ispettycash" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glaccounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glaccounts_tmpdu"( 
	"id" varchar(36),
	"glaccount" varchar(16),
	"description" varchar(255),
	"acttype" varchar(255),
	"nprefid" int,
	"recstatus" varchar(255),
	"compcode" varchar(36),
	"repgroup" varchar(255),
	"accgroup" varchar(255),
	"adduser" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glaccounts_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_glconaccountdetails"( 
	"id" varchar(36),
	"glconaccountid" varchar(36),
	"glaccountfrom" varchar(36),
	"glaccountto" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glconaccountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glconaccountdetails_temp"( 
	"id" varchar(36),
	"glconaccountid" varchar(36),
	"glaccountfrom" varchar(36),
	"glaccountto" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glconaccountdetails_temp?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_glcondepartmentdetails"( 
	"id" varchar(36),
	"glcondepartmentid" varchar(36),
	"companyid" varchar(36),
	"costcenterfromid" varchar(36),
	"costcentertoid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glcondepartmentdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glcondepartments"( 
	"id" varchar(36),
	"code" varchar(30),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"type" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glcondepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_glconsolidatedaccounts"( 
	"id" varchar(36),
	"code" varchar(50),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"isipconrev" boolean,
	"isopconrev" boolean,
	"isconappropriation" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glconsolidatedaccounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glconsolidatedaccounts_temp"( 
	"id" varchar(36),
	"code" varchar(50),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"isipconrev" boolean,
	"isopconrev" boolean,
	"isconappropriation" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glconsolidatedaccounts_temp?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gliaccountmappings"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"entryname" varchar(50),
	"reftype" varchar(10),
	"billtypemasterid" varchar(36),
	"sequence" smallint,
	"inputquery" varchar(2000),
	"outputtable" varchar(50),
	"outputfield" varchar(50),
	"datatype" varchar(30),
	"idindex" smallint,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gliaccountmappings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glinterfaces"( 
	"id" varchar(36),
	"paramsourceid" varchar(36),
	"appoperationid" varchar(36),
	"trantypeid" varchar(36),
	"reference" varchar(250),
	"description" varchar(500),
	"oprtype" varchar(1),
	"auditno" numeric(18, 0),
	"amount" numeric(21, 8),
	"draccountid" varchar(36),
	"craccountid" varchar(36),
	"idno" varchar(36),
	"line" int,
	"drcostcenterid" varchar(36),
	"crcostcenterid" varchar(36),
	"postdate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glinterfaces?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glreportformats"( 
	"id" varchar(36),
	"glreportid" varchar(36),
	"linenum" int,
	"isprint" boolean,
	"rowdefinitionid" varchar(36),
	"code" varchar(30),
	"description" varchar(100),
	"formula" varchar(100),
	"keyno" int,
	"companyid" varchar(36),
	"status" varchar(3),
	"note" int,
	"reversesign" boolean,
	"costcodefrom" varchar(10),
	"costcodeto" varchar(10),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glreportformats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glreportformats_test"( 
	"id" varchar(36),
	"glreportid" varchar(36),
	"linenum" int,
	"isprint" char(10),
	"rowdefinitionid" varchar(36),
	"code" varchar(30),
	"description" varchar(100),
	"formula" varchar(100),
	"keyno" int,
	"companyid" varchar(36),
	"status" varchar(3),
	"note" int,
	"reversesign" char(10),
	"costcenteridfrom" varchar(36),
	"costcenteridto" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glreportformats_test?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_glreports"( 
	"id" varchar(36),
	"reportname" varchar(30),
	"description" varchar(100),
	"reporttypeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glreports?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_glsubacctypes"( 
	"id" varchar(36),
	"glacctypeid" varchar(36),
	"subacctypecode" varchar(36),
	"description" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.glsubacctypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_gltransactions"( 
	"id" varchar(36),
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"paramsourceid" varchar(36),
	"appoperationid" varchar(36),
	"trantype" varchar(36),
	"reference" varchar(250),
	"description" varchar(500),
	"auditno" numeric(18, 0),
	"amount" numeric(21, 8),
	"draccountid" varchar(36),
	"craccountid" varchar(36),
	"idno" varchar(36),
	"line" int,
	"drcostcenterid" varchar(36),
	"crcostcenterid" varchar(36),
	"postdate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"trantypeid" varchar(36),
	"postdateyear" varchar,
	"postdatemonth" varchar) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.gltransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_goodsreturndetails"( 
	"id" varchar(36),
	"line" int,
	"goodsreturnheaderid" varchar(36),
	"productid" varchar(36),
	"productdescription" varchar(80),
	"productpriceid" varchar(36),
	"uomid" varchar(36),
	"orderreturned" numeric(19, 8),
	"remarks" varchar(255),
	"netunitprice" numeric(20, 8),
	"unitprice" numeric(20, 8),
	"amountdiscount" numeric(21, 8),
	"percentagediscount" numeric(5, 2),
	"percentagetax" numeric(5, 2),
	"amounttax" numeric(21, 8),
	"amount" numeric(21, 8),
	"deliveryorderdetailid" varchar(36),
	"itembatchid" varchar(36),
	"batchcode" varchar(20),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.goodsreturndetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_goodsreturnheaders"( 
	"id" varchar(36),
	"grtnumber" varchar(10),
	"deliveryorderheaderid" varchar(36),
	"purchasedeptid" varchar(36),
	"returndate" timestamp,
	"supplierid" varchar(36),
	"grtstatus" varchar(36),
	"respersonid" varchar(36),
	"checkpersonid" varchar(36),
	"checkdate" timestamp,
	"entereddate" timestamp,
	"remarks" varchar(255),
	"discountamount" numeric(21, 8),
	"discountpercentage" numeric(21, 8),
	"subamount" numeric(21, 8),
	"totalamount" numeric(21, 8),
	"recordno" bigint,
	"reasonid" varchar(36),
	"returnflag" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.goodsreturnheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_groupfunction"( 
	"id" varchar(36),
	"groups_id" varchar(36),
	"functions_id" varchar(36),
	"canview" boolean,
	"canadd" boolean,
	"canupdate" boolean,
	"candelete" boolean,
	"canexecute" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.groupfunction?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_groupoperation"( 
	"groups_id" varchar(36),
	"operations_id" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.groupoperation?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_groupuser"( 
	"groups_id" varchar(36),
	"users_id" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.groupuser?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_groups"( 
	"id" varchar(36),
	"name" varchar(100),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.groups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_guaranteeletterentitledoctors"( 
	"id" varchar(36),
	"doctorid" varchar(36),
	"guaranteeletterrefid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.guaranteeletterentitledoctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




/*** get back to this****/
CREATE EXTERNAL TABLE "pxf_guaranteeletterreferences"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"debtorid" varchar(50),
	"gltypeid" varchar(36),
	"refno" varchar(50),
	"ourrefno" varchar(50),
	"remarks" varchar(200),
	"enteredby" varchar(100),
	"effectivedate" timestamp,
	"expirydate" timestamp,
	"visitno" int,
	"membershipno" varchar(50),
	"visitbalance" int,
	"medicalcase" varchar(100),
	"glcontactperson" varchar(100),
	"glissuedby" varchar(100),
	"glinitiallimit" numeric(9, 2),
	"gltotallimit" numeric(18, 4),
	"glbalancelimit" numeric(18, 4),
	"exceptiongrouplimit" numeric(18, 4),
	"exceptionitemlimit" numeric(18, 4),
	"enterdatetime" timestamp,
	"scandocpath" varchar(100),
	"companyid" varchar(36),
	"confirmationstatus" varchar(50),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"allocatedstatus" varchar(10),
	"relationshipid" varchar(36),
	"scandoccontent" bytea,
	"staffname" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.guaranteeletterreferences?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

/*** get back to this****/


CREATE EXTERNAL TABLE "pxf_guaranteelettertypes"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"gltypecode" varchar(5),
	"gltypename" varchar(50),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.guaranteelettertypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_icdcodes"( 
	"id" varchar(36),
	"code" varchar(8),
	"description" varchar(2000),
	"icdgroupid" varchar(36),
	"typeid" varchar(36),
	"icdtext" varchar(250),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.icdcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_icdgroups"( 
	"id" varchar(36),
	"groupcode" varchar(20),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.icdgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_icdtypes"( 
	"id" varchar(36),
	"icdtypecode" varchar(9),
	"description" varchar(50),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.icdtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_idtypes"( 
	"id" varchar(36),
	"idtype" varchar(4),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.idtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_impfiles"( 
	"id" varchar(36),
	"filename" varchar(200),
	"transtypeid" varchar(36),
	"docdate" timestamp,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.impfiles?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_instructions"( 
	"id" varchar(36),
	"instructioncode" varchar(40),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.instructions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_interfacelogs"( 
	"id" numeric(18, 0),
	"eventcode" varchar(36),
	"mrn" varchar(50),
	"updatedate" timestamp,
	"col1" varchar(300),
	"col2" varchar(300),
	"col3" varchar(300),
	"col4" varchar(300),
	"col5" varchar(300),
	"col6" varchar(300),
	"col7" varchar(300),
	"col8" varchar(300),
	"col9" varchar(300),
	"col10" varchar(300),
	"col11" varchar(300),
	"col12" varchar(300),
	"col13" varchar(300),
	"col14" varchar(300),
	"col15" varchar(300),
	"col16" varchar(300),
	"col17" varchar(300),
	"col18" varchar(300),
	"col19" varchar(300),
	"col20" varchar(300),
	"col21" varchar(300),
	"col22" varchar(300),
	"col23" varchar(300),
	"col24" varchar(300),
	"col25" varchar(300),
	"col26" varchar(300),
	"col27" varchar(300),
	"col28" varchar(300),
	"col29" varchar(300),
	"col30" varchar(300),
	"col31" varchar(300),
	"col32" varchar(300),
	"col33" varchar(300),
	"col34" varchar(300),
	"col35" varchar(300),
	"col36" varchar(300),
	"col37" varchar(300),
	"col38" varchar(300),
	"col39" varchar(300),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.interfacelogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_invdspdetails"( 
	"id" varchar(36),
	"recno" int,
	"line" int,
	"productid" varchar(36),
	"uomid" varchar(36),
	"itemstocklocationid" varchar(36),
	"transqty" numeric(20, 8),
	"netprice" numeric(20, 8),
	"draccountid" varchar(36),
	"drcostcenterid" varchar(36),
	"craccountid" varchar(36),
	"crcostcenterid" varchar(36),
	"issdepartmentid" varchar(36),
	"reqdepartmentid" varchar(36),
	"saleamount" numeric(21, 8),
	"transtypeid" varchar(36),
	"transdate" timestamp,
	"trxauditno" int,
	"chargetransactionid" varchar(36),
	"expdate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"recordstatus" boolean,
	"quantityonhand" numeric(18, 0)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invdspdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_invhistorydetails"( 
	"id" varchar(36),
	"invhistoryheaderid" varchar(36),
	"lineno" int,
	"productid" varchar(36),
	"uomid" varchar(36),
	"transferqty" numeric(18, 8),
	"netprice" numeric(18, 8),
	"recordnumber" int,
	"productcategoryid" varchar(36),
	"draccno" varchar(25),
	"drccode" varchar(25),
	"craccno" varchar(25),
	"crccode" varchar(25),
	"expdate" timestamp,
	"departmentid" varchar(36),
	"sndrcv" varchar(36),
	"recordstatus" varchar(20),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invhistorydetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_invhistoryheaders"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"transtypeid" varchar(36),
	"docno" int,
	"sndrcv" varchar(36),
	"transdate" timestamp,
	"datesupret" timestamp,
	"dateactret" timestamp,
	"ivrequestid" varchar(36),
	"respersonid" varchar(36),
	"remarks" varchar(200),
	"recordstatus" varchar(20),
	"srcdocno" int,
	"sndrcvtype" varchar(30),
	"amount" numeric(18, 8),
	"recordno" int,
	"expdate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invhistoryheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_invrequestdetails"( 
	"id" varchar(36),
	"reqdepartmentid" varchar(36),
	"invrequestheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"uomid" varchar(36),
	"quantityrequest" numeric(18, 8),
	"quantitytxn" numeric(18, 8),
	"netprice" numeric(21, 8),
	"invissuetype" varchar(10),
	"remarks" varchar(2600),
	"quantityonhand" numeric(18, 8),
	"authorid" varchar(36),
	"qohconfirm" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"receiverqoh" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invrequestdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_invrequestheader"( 
	"id" varchar(36),
	"fromdepartmentid" varchar(36),
	"invrequestno" int,
	"requestdate" timestamp,
	"reqpersonid" varchar(36),
	"remarks" varchar(100),
	"docstatus" varchar(36),
	"invissuetype" varchar(10),
	"amount" numeric(21, 8),
	"todepartmentid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invrequestheader?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_invtransdetails"( 
	"id" varchar(36),
	"invtransheaderid" varchar(36),
	"linenum" int,
	"productid" varchar(36),
	"uomid" varchar(36),
	"transactionqty" numeric(18, 8),
	"netprice" numeric(21, 8),
	"recordno" int,
	"itembatchid" varchar(36),
	"remarks" varchar(2600),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"drglaccountid" varchar(36),
	"crglaccountid" varchar(36),
	"drcostcenterid" varchar(36),
	"crcostcenterid" varchar(36),
	"quantityonhand" numeric(19, 4),
	"expirydate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invtransdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_invtransheader"( 
	"id" varchar(36),
	"fromdepartmentid" varchar(36),
	"todepartmentid" varchar(36),
	"invissuetype" varchar(10),
	"docno" int,
	"transdate" timestamp,
	"sndrcv" varchar(36),
	"invrequestheaderid" varchar(36),
	"resonsiblepersonid" varchar(36),
	"remarks" varchar(200),
	"docstatus" varchar(10),
	"srcdocno" int,
	"sndrcvtype" varchar(30),
	"source" varchar(16),
	"reference" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"recordstatus" varchar(20),
	"transtypeid" varchar(36),
	"referenceid" varchar(36),
	"supplierid" varchar(36),
	"patientid" varchar(36),
	"tocompanyid" varchar(36),
	"amount" numeric(18, 2),
	"recordno" varchar(10),
	"datesuppreturn" timestamp,
	"dateactreturn" timestamp,
	"transtatusid" varchar(36),
	"sndrcvtypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.invtransheader?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_isolationreasons"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"reasoncode" varchar(4),
	"reason" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.isolationreasons?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_itembatches"( 
	"id" varchar(36),
	"productid" varchar(36),
	"batchcode" varchar(20),
	"expirydate" timestamp,
	"quantityonhand" numeric(18, 8),
	"fiscalyearid" varchar(36),
	"uomid" varchar(36),
	"valueonhand" numeric(21, 8),
	"status" varchar(3),
	"departmentid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itembatches?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemcountsets"( 
	"id" varchar(36),
	"itemsetcode" varchar(10),
	"description" varchar(80),
	"departmentfromid" varchar(36),
	"departmenttoid" varchar(36),
	"prodsubcatfromid" varchar(36),
	"prodsubcattoid" varchar(36),
	"productfromid" varchar(36),
	"producttoid" varchar(36),
	"freeztypeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemcountsets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemcountsetsdetails"( 
	"id" varchar(36),
	"itemcountsetsheaderid" varchar(36),
	"line" int,
	"departmentfromid" varchar(36),
	"departmenttoid" varchar(36),
	"prodsubcatfromid" varchar(36),
	"prodsubcattoid" varchar(36),
	"productfromid" varchar(36),
	"producttoid" varchar(36),
	"freeztypeid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemcountsetsdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemcountsetsheaders"( 
	"id" varchar(36),
	"itemsetcode" varchar(10),
	"description" varchar(80),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemcountsetsheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemmonthlystocks"( 
	"id" varchar(36),
	"itemstocklocationid" varchar(36),
	"periodid" varchar(36),
	"monthlyquantity" numeric(18, 8),
	"monthlyvalue" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemmonthlystocks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemperiodicaveragecosts"( 
	"id" varchar(36),
	"productid" varchar(36),
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"averagecost" numeric(18, 8),
	"procflag" varchar(300),
	"uomid" varchar(36),
	"peropen" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemperiodicaveragecosts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_itemstocklocations"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"productid" varchar(36),
	"bincode" varchar(16),
	"fiscalyearid" varchar(36),
	"fixuom" boolean,
	"openingbalanceval" numeric(21, 8),
	"cntdocno" varchar(40),
	"minquantity" numeric(18, 8),
	"maxquantity" numeric(18, 8),
	"reordlevel" numeric(18, 8),
	"reordquantity" numeric(18, 8),
	"lastissuedate" timestamp,
	"uomid" varchar(36),
	"isfrozen" boolean,
	"invissuetype" varchar(10),
	"dispensetype" varchar(24),
	"rackno" varchar(16),
	"openbalqty" numeric(18, 8),
	"onhandvalue" numeric(21, 8),
	"onhandquantity" numeric(18, 8),
	"lastfrozendate" timestamp,
	"frozenquantity" numeric(18, 8),
	"itemtype" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"transtypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemstocklocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_itemstocklocations_backup14march"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"productid" varchar(36),
	"bincode" varchar(16),
	"fiscalyearid" varchar(36),
	"fixuom" boolean,
	"openingbalanceval" numeric(21, 8),
	"cntdocno" varchar(40),
	"minquantity" numeric(18, 8),
	"maxquantity" numeric(18, 8),
	"reordlevel" numeric(18, 8),
	"reordquantity" numeric(18, 8),
	"lastissuedate" timestamp,
	"uomid" varchar(36),
	"isfrozen" boolean,
	"invissuetype" varchar(10),
	"dispensetype" varchar(24),
	"rackno" varchar(16),
	"openbalqty" numeric(18, 8),
	"onhandvalue" numeric(21, 8),
	"onhandquantity" numeric(18, 8),
	"lastfrozendate" timestamp,
	"frozenquantity" numeric(18, 8),
	"itemtype" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"transtypeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemstocklocations_backup14march?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_itemtaxdetails"( 
	"id" varchar(36),
	"paramsourceid" varchar(36),
	"transtypeid" varchar(36),
	"sourceid" varchar(36),
	"taxmasterid" varchar(36),
	"effectivedate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemtaxdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_itemtracks"( 
	"id" varchar(36),
	"itemtransactionid" varchar(36),
	"itembatchid" varchar(36),
	"trackquantity" numeric(18, 8),
	"unitcost" numeric(21, 8),
	"trackvalue" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemtracks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_itemtransactions"( 
	"id" varchar(36),
	"productid" varchar(36),
	"transtypeid" varchar(36),
	"transrefid" varchar(36),
	"transdepartmentid" varchar(36),
	"transquantity" numeric(18, 8),
	"unitcost" numeric(21, 8),
	"transvalue" numeric(21, 8),
	"transdate" timestamp,
	"comment" varchar(255),
	"docrefid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.itemtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_languages"( 
	"id" varchar(36),
	"languagecode" varchar(4),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"standardlangcode" varchar(6),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.languages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_locations"( 
	"id" varchar(36),
	"locationcode" varchar(8),
	"description" varchar(40),
	"incharge" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.locations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mispatientstatmonth"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"company" varchar(10),
	"year" int,
	"month" int,
	"patientid" varchar(36),
	"mrn" int,
	"visit" int,
	"amount" numeric(18, 2),
	"newpatient" int,
	"repeatpatient" int,
	"rangerepeat" varchar(50),
	"rangeage" varchar(50),
	"visitip" int,
	"visitop" int,
	"visitdp" int,
	"visitotc" int,
	"newip" int,
	"newop" int,
	"newdp" int,
	"newotc" int,
	"repeatip" int,
	"repeatop" int,
	"repeatdp" int,
	"repeatotc" int,
	"amountip" numeric(18, 2),
	"amountop" numeric(18, 2),
	"amountdp" numeric(18, 2),
	"amountotc" numeric(18, 2)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mispatientstatmonth?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mispatientstatyear"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"company" varchar(20),
	"year" int,
	"patientid" varchar(36),
	"mrn" int,
	"visit" int,
	"amout" numeric(18, 2),
	"newpatient" int,
	"repeatpatient" int,
	"rangerepeat" varchar(50),
	"rangeage" varchar(50),
	"visitip" int,
	"visitop" int,
	"visitdp" int,
	"visitotc" int,
	"jan" int,
	"feb" int,
	"mac" int,
	"apr" int,
	"may" int,
	"june" int,
	"july" int,
	"aug" int,
	"sept" int,
	"oct" int,
	"nov" int,
	"dec" int,
	"newip" int,
	"newop" int,
	"newdp" int,
	"newotc" int,
	"repeatip" int,
	"repeatop" int,
	"repeatdp" int,
	"repeatotc" int,
	"amountip" numeric(18, 2),
	"amountop" numeric(18, 2),
	"amountdp" numeric(18, 2),
	"amountotc" numeric(18, 2)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mispatientstatyear?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmaclasses"( 
	"id" varchar(36),
	"mmaclasscode" varchar(8),
	"description" varchar(100),
	"classlevel" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmaclasses?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmagroups"( 
	"id" varchar(36),
	"mmagroupcode" varchar(8),
	"description" varchar(100),
	"qflag" boolean,
	"seqno" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmagroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmamasters"( 
	"id" varchar(36),
	"mmacode" varchar(20),
	"description" varchar,
	"category" varchar(7),
	"version" varchar(8),
	"effectivedate" timestamp,
	"mmaclassid" varchar(36),
	"mmagroupid" varchar(36),
	"mmasubgroupid" varchar(36),
	"mmatypeid" varchar(36),
	"alternatecode" varchar(8),
	"overwriteflag" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"islisted" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmamasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_mmamasters_tdm"( 
	"id" varchar(255),
	"mmacode" varchar(255),
	"description" varchar(255),
	"category" varchar(255),
	"version" varchar(255),
	"effdate" timestamp,
	"mmaclass" varchar(255),
	"mmagroup" varchar(255),
	"mmasubgrp" varchar(255),
	"mmatype" varchar(255),
	"altcode" varchar(255),
	"overwrite" boolean,
	"active" varchar(3),
	"compcode" varchar(36),
	"noteex" boolean,
	"adduser" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmamasters_tdm?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_mmaprices"( 
	"id" varchar(36),
	"mmaconsuloncharge" numeric(21, 8),
	"mmasurgeoncharge" numeric(21, 8),
	"mmaanaesthetistcharge" numeric(21, 8),
	"mmamasterid" varchar(36),
	"feesconsulton" numeric(21, 8),
	"feessurgeon" numeric(21, 8),
	"feesanaesthetist" numeric(21, 8),
	"feesconsultonmin" numeric(21, 8),
	"feessurgeonmin" numeric(21, 8),
	"feesanaesthetistmin" numeric(21, 8),
	"mmaconsulonchargemin" numeric(21, 8),
	"mmasurgeonchargemin" numeric(21, 8),
	"mmaanaesthetistchargemin" numeric(21, 8),
	"effectivedate" timestamp,
	"version" varchar(8),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmaprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmasubgroups"( 
	"id" varchar(36),
	"mmasubgroupcode" varchar(8),
	"description" varchar(120),
	"seqno" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmasubgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmatransactions"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"episodetypecode" varchar(4),
	"transtype" varchar(2),
	"docref" varchar(30),
	"transdate" timestamp,
	"chargemasterid" varchar(36),
	"chargecode" varchar(30),
	"billcode" numeric(18, 0),
	"costcode" varchar(4),
	"revcd" varchar(4),
	"mmamasterid" varchar(36),
	"billed" boolean,
	"billdate" timestamp,
	"billtypemasterid" varchar(36),
	"billtype" varchar(5),
	"doctorid" varchar(36),
	"doctorcode" varchar(15),
	"chargeclass" varchar(4),
	"unitprice" numeric(21, 8),
	"quantity" numeric(21, 8),
	"amount" numeric(21, 8),
	"chargegroupid" varchar(36),
	"queuestat" varchar(2),
	"dracccode" varchar(30),
	"cracccode" varchar(30),
	"arprocessed" boolean,
	"taxamount" numeric(21, 8),
	"billno" numeric(18, 0),
	"auditno" numeric(18, 0),
	"uomid" varchar(36),
	"invgroup" varchar(4),
	"regdepartmentid" varchar(36),
	"issuedepartmentid" varchar(36),
	"invcode" varchar(36),
	"resulttype" varchar(36),
	"resultstatus" boolean,
	"inventory" boolean,
	"updinv" boolean,
	"invbatch" int,
	"dosageid" varchar(36),
	"duration" int,
	"instructionid" varchar(36),
	"discountamount" numeric(21, 8),
	"discountcode" varchar(36),
	"pkgcode" varchar(36),
	"comment" varchar(50),
	"authid" varchar(50),
	"authdate" timestamp,
	"mmaflag" boolean,
	"procno" int,
	"overwriteamt" numeric(18, 8),
	"chargetransid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmatransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mmatypes"( 
	"id" varchar(36),
	"mmatypecode" varchar(8),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mmatypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_mrrequestnotifications"( 
	"id" varchar(36),
	"mrrequestid" varchar(36),
	"notificationtext" varchar(100),
	"touserid" varchar(36),
	"fromuserid" varchar(36),
	"notificationdate" timestamp,
	"status" varchar(3),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mrrequestnotifications?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_maritalstatus"( 
	"id" varchar(36),
	"maritalstatuscode" varchar(4),
	"description" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maritalstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_maternityadmissioin"( 
	"id" varchar(36),
	"maternityid" varchar(36),
	"episodeid" varchar(36),
	"companyid" varchar(36),
	"temperature" numeric(18, 2),
	"pulse" int,
	"respiration" numeric(18, 2),
	"bloodpressure" numeric(18, 2),
	"weight" numeric(18, 2),
	"height" numeric(18, 2),
	"isemotionalcalm" boolean,
	"isemotionalanxious" boolean,
	"isemotionaldistressed" boolean,
	"isemotionaldepressed" boolean,
	"isemotionalirritable" boolean,
	"emotionalother" varchar(50),
	"breastnipple" varchar(75),
	"isbreastfeeding" boolean,
	"isantepostnatalclasses" boolean,
	"isknwofcopingwtihpain" boolean,
	"modeofadmissionid" varchar(36),
	"foetuspresandposition" varchar(100),
	"foetalheartrate" numeric(18, 2),
	"contrfreqtype" char(100),
	"urineprotein" numeric(18, 2),
	"urinesugar" numeric(18, 2),
	"urineacetone" numeric(18, 2),
	"diagnosisonadmission" char(100),
	"isperinealshave" boolean,
	"fleetenema" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternityadmissioin?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_maternitybabyrecords"( 
	"id" varchar(36),
	"episodematernityid" varchar(36),
	"babyno" int,
	"babyname" varchar(50),
	"gender" varchar(4),
	"birthtypeid" varchar(36),
	"deliverydatetime" timestamp,
	"babystatus" varchar(50),
	"doctorid" varchar(36),
	"wardid" varchar(36),
	"admitbedid" varchar(36),
	"bcg" boolean,
	"bcgdate" timestamp,
	"hep" boolean,
	"hepdate" timestamp,
	"maturity" numeric(18, 2),
	"weight" numeric(18, 2),
	"length" numeric(18, 2),
	"headcircumference" numeric(18, 2),
	"firstgasp" numeric(18, 2),
	"rhythmicbreathing" numeric(18, 2),
	"apgar1min" int,
	"apgar5min" int,
	"apgar10min" int,
	"inoculationother" varchar(255),
	"inoculationvitamin" varchar(255),
	"abnormalities" varchar(150),
	"resuscitation" varchar(100),
	"others" varchar(300),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternitybabyrecords?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_maternitycontrolparams"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"controlname" varchar(30),
	"valuecode" varchar(3),
	"valuedescription" varchar(50),
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternitycontrolparams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_maternitylabourdetails"( 
	"id" varchar(36),
	"memruptype" varchar(15),
	"membranerupturedatetime" timestamp,
	"onsetoflabour" varchar(100),
	"onsetoflabdatetime" timestamp,
	"cervix10cm" varchar(100),
	"cervix10cmdate" timestamp,
	"babydeliverytype" varchar(15),
	"babyrecordid" varchar(36),
	"placentadeliverytype" varchar(15),
	"placentadeliverydate" timestamp,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternitylabourdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_maternityoxytoxicdrugs"( 
	"id" varchar(36),
	"episodematernityid" varchar(36),
	"chargemasterid" varchar(36),
	"dosageid" varchar(36),
	"iv1" boolean,
	"im1" boolean,
	"timing1" timestamp,
	"iv2" boolean,
	"im2" boolean,
	"timing2" timestamp,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"isselected" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternityoxytoxicdrugs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_maternitystageoneandtwodetails"( 
	"id" varchar(36),
	"labourtypeid" varchar(36),
	"inducedmethod" varchar(50),
	"sedation" varchar(50),
	"doctorid" varchar(36),
	"anaesthetist" varchar(36),
	"conductedby" varchar(50),
	"witnessby" varchar(50),
	"deliverytypeid" varchar(36),
	"deliverycomplicatedtypeid" varchar(36),
	"deliverycomplicatedother" varchar(50),
	"indication" varchar(100),
	"details" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternitystageoneandtwodetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_maternitystagethreedetails"( 
	"id" varchar(36),
	"maternityid" varchar(36),
	"placentadelby" varchar(15),
	"bloodlossamt" numeric(18, 2),
	"bloodlosscause" varchar(15),
	"bloodlossother" varchar(50),
	"temperaturestage3" numeric(18, 2),
	"temperatureonehr" numeric(18, 2),
	"pulsestage3" numeric(18, 2),
	"pulsestage3onehr" numeric(18, 2),
	"bpstage3" numeric(18, 2),
	"bpstage3onehr" numeric(18, 2),
	"placentatype" varchar(15),
	"placentaweight" numeric(18, 2),
	"placentaab" varchar(100),
	"membranetype" varchar(15),
	"membraneab" varchar(100),
	"cordlength" numeric(18, 2),
	"cordarndneck" numeric(18, 2),
	"cordab" varchar(100),
	"cervix" boolean,
	"cervixsite" varchar(100),
	"vagina" boolean,
	"vaginasite" varchar(100),
	"pph" boolean,
	"pphtreatment" varchar(50),
	"perineum" varchar(15),
	"episiotomy" varchar(15),
	"sutureused" varchar(50),
	"analtone" varchar(50),
	"rectum" varchar(50),
	"painrelief" varchar(20),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.maternitystagethreedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_medicalrecordmovements"( 
	"id" varchar(36),
	"medicalrecordid" varchar(36),
	"mrrequestid" varchar(36),
	"movementtype" varchar(36),
	"movementdate" timestamp,
	"sentdeptid" varchar(36),
	"userid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"comment" varchar(600),
	"requestdeptid" varchar(36),
	"senttime" timestamp,
	"requesttime" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.medicalrecordmovements?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_medicalrecordrequests"( 
	"id" varchar(36),
	"medicalrecordid" varchar(36),
	"requesteddeptid" varchar(36),
	"requireddate" timestamp,
	"requesteddate" timestamp,
	"requesteduserid" varchar(36),
	"requeststatus" varchar(36),
	"appointmentid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"episodeid" varchar(36),
	"isprinted" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.medicalrecordrequests?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_medicalrecords"( 
	"id" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"currentdeptid" varchar(36),
	"noteexist" boolean,
	"patientid" varchar(36),
	"confidential" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.medicalrecords?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_membershipcardtypes"( 
	"id" varchar(36),
	"cardtypecode" varchar(3),
	"cardtypedescription" varchar(50),
	"maxnoofmembers" int,
	"isexpiry" boolean,
	"isactiveforfamily" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.membershipcardtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_membershipcards"( 
	"id" varchar(36),
	"cardtypeid" varchar(36),
	"cardnumber" varchar(36),
	"expirydate" timestamp,
	"valiedfrom" timestamp,
	"isterminate" boolean,
	"terminatedate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"patientid" varchar(36),
	"newic" varchar(36),
	"idtypeid" varchar(36),
	"otherno" varchar(50),
	"terminateby" varchar(36),
	"name" varchar(50),
	"adddate" timestamp,
	"remarks" varchar(200),
	"entitlement" numeric(17, 2),
	"recstatus" varchar(3),
	"debtorid" varchar(50),
	"chargemasterid" varchar(36),
	"ipbilltype" varchar(36),
	"opbilltype" varchar(36),
	"nameoncard" varchar(50),
	"organisation" varchar(36),
	"designationid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.membershipcards?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_messages"( 
	"messagecode" varchar(36),
	"systemmessage" varchar(400),
	"hcmsmessage" varchar(400),
	"messagetype" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.messages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_modificationlogs"( 
	"id" varchar(36),
	"lineno" int,
	"module" varchar(250),
	"submodule" varchar(100),
	"optionname" varchar(100),
	"table" varchar(50),
	"tablekey" varchar(36),
	"fieldname" varchar(1500),
	"modifytype" varchar(15),
	"modifyfrom" varchar(1500),
	"modifyto" varchar(1500),
	"modifyuserid" varchar(36),
	"modifydate" timestamp,
	"modifytime" timestamp,
	"appfunctionid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.modificationlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_movementstats"( 
	"id" varchar(36),
	"name" varchar(50),
	"description" varchar(50),
	"status" varchar(3),
	"departmentid" varchar(36),
	"companyid" varchar(36),
	"audit1" varchar(50),
	"audit2" varchar(50),
	"audit3" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.movementstats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_mrncomments"( 
	"companyid" varchar(36),
	"description" varchar(50),
	"name" varchar(50),
	"noteexist" boolean,
	"patientreistrationid" varchar(36),
	"status" varchar(50),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"viptype" varchar(50),
	"id" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.mrncomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_nationalities"( 
	"id" varchar(36),
	"code" varchar(4),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.nationalities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_nextofkins"( 
	"id" varchar(36),
	"episodeid" varchar(36),
	"seqno" int,
	"telnohouse" varchar(30),
	"name" varchar(50),
	"relationship" varchar(20),
	"telnooffice" varchar(30),
	"addresstypeid" varchar(36),
	"oldic" varchar(15),
	"hpno" varchar(50),
	"street1" varchar(40),
	"street2" varchar(40),
	"street3" varchar(40),
	"newic" varchar(15),
	"areaid" varchar(36),
	"postcodeid" varchar(36),
	"occupationid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.nextofkins?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_notes"( 
	"id" varchar(36),
	"tablename" varchar(50),
	"tablekey" varchar(36),
	"notetitle" varchar(100),
	"notecontent" varchar,
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.notes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_nutritionstatuschangedetails"( 
	"id" varchar(36),
	"episodenutritionid" varchar(36),
	"nutritionsuplystatus" varchar(3),
	"statussetdate" timestamp,
	"statussettime" timestamp,
	"remarks" varchar(50),
	"noteexist" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.nutritionstatuschangedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_otdutyroomreservations"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"roomid" varchar(36),
	"startdate" timestamp,
	"enddate" timestamp,
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.otdutyroomreservations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_otoncallteams"( 
	"id" varchar(36),
	"otdutyroomresid" varchar(36),
	"ottmembertypeid" varchar(36),
	"companyid" varchar(36),
	"salutation" varchar(50),
	"firstname" varchar(200),
	"lastname" varchar(200),
	"contactnumber" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.otoncallteams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_otreservations"( 
	"id" varchar(36),
	"roomid" varchar(36),
	"companyid" varchar(36),
	"patientid" varchar(36),
	"operationprocedure" varchar(36),
	"starttime" timestamp,
	"endtime" timestamp,
	"varifiedby" varchar(36),
	"natureofsurgery" varchar(250),
	"remarks" varchar(250),
	"actstarttime" timestamp,
	"actendtime" timestamp,
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.otreservations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_otteammembertypes"( 
	"id" varchar(36),
	"code" varchar(36),
	"description" varchar(50),
	"sequence" smallint,
	"teamtype" varchar(10),
	"ismandatory" boolean,
	"status" varchar(3),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.otteammembertypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_otteams"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"otreservationid" varchar(36),
	"ottmembertypeid" varchar(36),
	"salutation" varchar(50),
	"firstname" varchar(200),
	"lastname" varchar(200),
	"contactnumber" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.otteams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_occupations"( 
	"id" varchar(36),
	"occupationcode" varchar(4),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.occupations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_operations"( 
	"id" varchar(36),
	"name" varchar(100),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"functionid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.operations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_ordersetdetails"( 
	"id" varchar(36),
	"code" varchar(10),
	"description" varchar(150),
	"chargemasterid" varchar(36),
	"chargegroupid" varchar(36),
	"quantity" numeric(18, 0),
	"companyid" varchar(36),
	"ordersetheaderid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"noteexist" boolean,
	"status" varchar(3),
	"revcode" varchar(10)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.ordersetdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_ordersetheaders"( 
	"id" varchar(36),
	"code" varchar(8),
	"description" varchar(150),
	"chargemasterid" varchar(36),
	"effictivedate" timestamp,
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36),
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.ordersetheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_pmtrackings"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"episodeid" varchar(36),
	"locationid" varchar(36),
	"mrnnumber" varchar(50),
	"name" varchar(50),
	"patientreistrationid" varchar(36),
	"process" varchar(50),
	"timein" timestamp,
	"timeout" timestamp,
	"timespent" numeric(10, 2),
	"trackingtype" varchar(50),
	"transqueueid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.pmtrackings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_posignature"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"departmentid" varchar(36),
	"effdate" timestamp,
	"signatureno" int,
	"lable1" varchar(100),
	"name1" varchar(100),
	"designation1" varchar(100),
	"lable2" varchar(100),
	"name2" varchar(100),
	"designation2" varchar(100),
	"lable3" varchar(100),
	"name3" varchar(100),
	"designation3" varchar(100),
	"lable4" varchar(100),
	"name4" varchar(100),
	"designation4" varchar(100),
	"lable5" varchar(100),
	"name5" varchar(100),
	"designation5" varchar(100),
	"limitflag" boolean,
	"limitamount" numeric(21, 2),
	"signaturenolimit" int,
	"lablelimit1" varchar(100),
	"namelimit1" varchar(100),
	"designationlimit1" varchar(100),
	"lablelimit2" varchar(100),
	"namelimit2" varchar(100),
	"designationlimit2" varchar(100),
	"lablelimit3" varchar(100),
	"namelimit3" varchar(100),
	"designationlimit3" varchar(100),
	"lablelimit4" varchar(100),
	"namelimit4" varchar(100),
	"designationlimit4" varchar(100),
	"lablelimit5" varchar(100),
	"namelimit5" varchar(100),
	"designationlimit5" varchar(100),
	"adddate" timestamp,
	"adduserid" varchar(36),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"active" varchar(36),
	"potype" varchar(36),
	"asset" boolean,
	"recno" int,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.posignature?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_potypes"( 
	"id" varchar(36),
	"code" varchar(10),
	"description" varchar(80),
	"status" varchar(3),
	"departmentid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.potypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_packagedetailprices"( 
	"id" varchar(36),
	"packagedetailid" varchar(36),
	"pricetypeid" varchar(36),
	"packageitemprice" numeric(21, 8),
	"packageitemactprice" numeric(21, 8),
	"totprice" numeric(21, 8),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.packagedetailprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_packagedetails"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"packagemasterid" varchar(36),
	"chargemasterid" varchar(36),
	"packagerevisiondetailid" varchar(36),
	"quantity" numeric(18, 8),
	"description" varchar(150),
	"price" numeric(21, 8),
	"pricetypeid" varchar(36),
	"actprice" numeric(21, 8),
	"totprice" numeric(21, 8),
	"revcode" varchar(4),
	"uomid" varchar(36),
	"chargetypeid" varchar(36),
	"chargegroupid" varchar(36),
	"qflag" boolean,
	"costcodeid" varchar(36),
	"chgflag" varchar(10),
	"ipacccodeid" varchar(36),
	"opacccodeid" varchar(36),
	"revdept" varchar(10),
	"chargeclassid" varchar(36),
	"costdept" varchar(10),
	"doctorid" varchar(36),
	"effectivedate" timestamp,
	"changedate" timestamp,
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.packagedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_packagemasters"( 
	"id" varchar(36),
	"packagecode" varchar(8),
	"pricetypeid" varchar(36),
	"chargemasterid" varchar(36),
	"description" varchar(150),
	"curamount" numeric(18, 8),
	"prevamount" numeric(18, 8),
	"newamount" numeric(18, 8),
	"cureffectivedate" timestamp,
	"neweffectivedate" timestamp,
	"addchg" boolean,
	"autopull" boolean,
	"active" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.packagemasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_packagerevisionprices"( 
	"id" varchar(36),
	"packagerevisionid" varchar(36),
	"pricetypeid" varchar(36),
	"price" numeric(21, 8),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.packagerevisionprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_packagerevisions"( 
	"id" varchar(36),
	"packagemasterid" varchar(36),
	"effectivedate" timestamp,
	"price" numeric(21, 8),
	"pricetypeid" varchar(36),
	"revisionnumber" int,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.packagerevisions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_panelhdrs"( 
	"id" varchar(36),
	"icdid" varchar(36),
	"doctorid" varchar(36),
	"panelcode" varchar(10),
	"description" varchar(50),
	"paneltype" varchar(10),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.panelhdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_panelitems"( 
	"id" varchar(36),
	"panelhdrid" varchar(36),
	"chargemasterid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.panelitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_paramgroups"( 
	"id" varchar(36),
	"paramgroupcode" varchar(40),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.paramgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_paramsources"( 
	"id" varchar(36),
	"paramsourcecode" varchar(40),
	"description" varchar(255),
	"isglsource" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.paramsources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_patientaddress"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"areaid" varchar(36),
	"addresstypeid" varchar(36),
	"city" varchar(50),
	"h_pphoneno" varchar(50),
	"homephoneno" varchar(50),
	"housingarea" varchar(50),
	"personalemail" varchar(50),
	"postalcodeid" varchar(36),
	"officetelno" varchar(50),
	"stateid" varchar(36),
	"street1" varchar(50),
	"street2" varchar(50),
	"street3" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.patientaddress?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_patientcomments"( 
	"id" varchar(36),
	"title" varchar(100),
	"comment" varchar,
	"commenttype" varchar(4),
	"patientid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.patientcomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_patientmovements"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"mrnnumber" varchar(50),
	"name" varchar(50),
	"episodeid" varchar(36),
	"trackingtype" varchar(50),
	"departmentid" varchar(36),
	"locationid" varchar(36),
	"process" varchar(50),
	"movementstatid" varchar(36),
	"transqueueid" varchar(36),
	"queuestatid" varchar(36),
	"timein" timestamp,
	"timeout" timestamp,
	"timespent" numeric(10, 2),
	"companyid" varchar(36),
	"queueno" int,
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.patientmovements?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_patients"( 
	"areaid" varchar(36),
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
	"ofcstateid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.patients?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_patients_bkup"( 
	"areaid" varchar(36),
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
	"ofcstateid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.patients_bkup?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_paygrouppaymodes"( 
	"paygroupid" varchar(36),
	"paymodeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.paygrouppaymodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_paygroups"( 
	"id" varchar(36),
	"paygroup" varchar(8),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.paygroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_paymodes"( 
	"id" varchar(36),
	"paymode" varchar(36),
	"source" varchar(2),
	"transtype" varchar(4),
	"description" varchar(100),
	"ccode" varchar(6),
	"glaccno" varchar(8),
	"isepisode" boolean,
	"isreceiptandbilling" boolean,
	"paytype" varchar(15),
	"cardflag" boolean,
	"valexpdate" boolean,
	"comrate" numeric(19, 4),
	"drcommrate" numeric(19, 4),
	"drpayment" boolean,
	"cardcent" varchar(8),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"costcenterid" varchar(36),
	"glaccountid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.paymodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_payergroupexceptions"( 
	"id" varchar(36),
	"chargegroupid" varchar(36),
	"debtormasterid" varchar(50),
	"companyid" varchar(36),
	"description" varchar(75),
	"grouplimit" numeric(18, 2),
	"individualitemlimit" numeric(18, 2),
	"isgroupunlimited" boolean,
	"isitemunlimited" boolean,
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.payergroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_payeritemexceptions"( 
	"id" varchar(36),
	"chargemasterid" varchar(36),
	"companyid" varchar(36),
	"payergroupexceptionid" varchar(36),
	"description" varchar(75),
	"itemlimit" numeric(18, 2),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.payeritemexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_pendingprocesses"( 
	"id" varchar(36),
	"refid" varchar(36),
	"tablename" varchar(100),
	"processname" varchar(50),
	"processed" boolean,
	"note" varchar(255),
	"sessionid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"sessioncode" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.pendingprocesses?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_periods"( 
	"id" varchar(36),
	"fiscalyearid" varchar(36),
	"periodnum" int,
	"datefrom" timestamp,
	"dateto" timestamp,
	"isclosed" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.periods?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_physicalcountdetails"( 
	"id" varchar(36),
	"line_no" int,
	"stockcountheaderid" varchar(20),
	"stockcountdetailsid" int,
	"productid" varchar(36),
	"freezdate" timestamp,
	"physicalqty" numeric(18, 2),
	"stocktakedate" timestamp,
	"itemsetstatusid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.physicalcountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_postalcodes"( 
	"id" varchar(36),
	"postcode" varchar(10),
	"description" varchar(40),
	"status" varchar(3),
	"stateid" varchar(36),
	"countryid" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.postalcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_pricedetails"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"pricetypeid" varchar(36),
	"chargemasterid" varchar(36),
	"glaccountcrid" varchar(36),
	"glaccountdrid" varchar(36),
	"amount" numeric(18, 2),
	"iscurrent" boolean,
	"effectivedate" timestamp,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"taxmasterid" varchar(36),
	"costprice" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.pricedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_pricesources"( 
	"id" varchar(36),
	"pricecode" varchar(4),
	"description" varchar(80),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.pricesources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_pricetypes"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"pricetypecode" varchar(5),
	"description" varchar(100),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.pricetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_printers"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"prtname" varchar(40),
	"pathname" varchar(40),
	"localid" varchar(8),
	"seqno" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.printers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_privileges"( 
	"id" varchar(36),
	"name" varchar(225),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.privileges?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_privilegesdetails"( 
	"id" varchar(36),
	"privilegeid" varchar(36),
	"name" varchar(100),
	"description" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.privilegesdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_prodsubcategories"( 
	"id" varchar(36),
	"productcategoryid" varchar(36),
	"code" varchar(30),
	"description" varchar(80),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.prodsubcategories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_productcategories"( 
	"id" varchar(36),
	"catcode" varchar(24),
	"description" varchar(80),
	"stockacctid" varchar(36),
	"costacctid" varchar(36),
	"adjacctid" varchar(36),
	"woffacctid" varchar(36),
	"expacctid" varchar(36),
	"loanacctid" varchar(36),
	"accrualaccid" varchar(36),
	"stktakeadjacctid" varchar(36),
	"source" varchar(4),
	"cattype" varchar(4),
	"povalidatetime" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.productcategories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_productgroups"( 
	"id" varchar(36),
	"code" varchar(30),
	"description" varchar(50),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.productgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_productlogs"( 
	"id" varchar(36),
	"productid" varchar(36),
	"uomid" varchar(36),
	"avgcost" numeric(21, 8),
	"actavgcost" numeric(21, 8),
	"qtyonhand" numeric(21, 8),
	"supplierid" varchar(36),
	"currprice" numeric(21, 8),
	"bonqty" numeric(21, 8),
	"minqty" numeric(21, 8),
	"maxqty" numeric(21, 8),
	"reordlevel" numeric(21, 8),
	"reordqty" numeric(21, 8),
	"active" boolean,
	"chgflag" boolean,
	"newavgcost" numeric(21, 8),
	"newuomid" varchar(36),
	"newactive" boolean,
	"prodlogcat" varchar(36),
	"remarks" varchar(255),
	"costmargin" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.productlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_products"( 
	"id" varchar(36),
	"itemcode" varchar(30),
	"description" varchar(120),
	"genericname" varchar(100),
	"isantibiotic" boolean,
	"brandname" varchar(30),
	"manufacture" varchar(30),
	"productgroupid" varchar(36),
	"productcategoryid" varchar(36),
	"prodsubcategoryid" varchar(36),
	"chargeuomid" varchar(36),
	"pouomid" varchar(36),
	"smalluonid" varchar(36),
	"repackitem" boolean,
	"chargeflag" boolean,
	"reqexpdateflg" boolean,
	"activeflag" boolean,
	"reuse" boolean,
	"mainsupplierid" varchar(36),
	"mainstoreid" varchar(36),
	"tagging" varchar(16),
	"itemtype" varchar(40),
	"averagecost" numeric(23, 8),
	"actavgcost" numeric(23, 8),
	"currprice" numeric(23, 8),
	"costmargin" numeric(19, 8),
	"quantityonhand" numeric(19, 4),
	"bonqty" numeric(19, 4),
	"minqty" int,
	"maxqty" int,
	"reordlevel" int,
	"reordqty" int,
	"trqty" int,
	"deactivedate" timestamp,
	"remarks" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"assetscategoryid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.products?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_products_tmpdu"( 
	"id" varchar(36),
	"itemcode" varchar(30),
	"description" varchar(80),
	"groupcode" varchar(36),
	"productcat" varchar(36),
	"subcatcode" varchar(36),
	"uomcode" varchar(36),
	"pouom" varchar(36),
	"smalluom" varchar(36),
	"rpkitem" boolean,
	"chgflag" boolean,
	"expdtflg" boolean,
	"active" boolean,
	"reuse" boolean,
	"suppcode" varchar(36),
	"mstore" varchar(36),
	"tagging" varchar(16),
	"itemtype" varchar(40),
	"avgcost" double precision,
	"actavgcost" double precision,
	"currprice" double precision,
	"costmargin" double precision,
	"qtyonhand" double precision,
	"bonqty" double precision,
	"minqty" int,
	"maxqty" int,
	"reordlevel" int,
	"reordqty" int,
	"trqty" int,
	"deactivedate" timestamp,
	"status" varchar(3),
	"compcode" varchar(36),
	"adduser" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.products_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_purchaseorderdetails"( 
	"id" varchar(36),
	"purchaseorderheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"productdescription" varchar(120),
	"supplierid" varchar(36),
	"productpriceid" varchar(36),
	"uomid" varchar(36),
	"orderquantity" numeric(19, 8),
	"remarks" varchar,
	"unitprice" numeric(20, 8),
	"amountdiscount" numeric(21, 8),
	"percentagediscount" numeric(5, 2),
	"percentagetax" numeric(5, 2),
	"amounttax" numeric(21, 8),
	"amount" numeric(21, 8),
	"supplierproductid" varchar(36),
	"quantitydelivered" numeric(19, 8),
	"purchaserequestdetailid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"linkid" varchar(10),
	"taxdetailid" varchar(36),
	"netamount" numeric(21, 8),
	"taxamount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.purchaseorderdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_purchaseorderheaders"( 
	"id" varchar(36),
	"ponumber" varchar(10),
	"potypeid" varchar(36),
	"purchasedeptid" varchar(36),
	"requestdeptid" varchar(36),
	"deliverydeptid" varchar(36),
	"orderdate" timestamp,
	"expecteddate" timestamp,
	"expirydate" timestamp,
	"termsid" varchar(36),
	"supplierid" varchar(36),
	"postatusid" varchar(36),
	"issuepersonid" varchar(36),
	"issuedate" timestamp,
	"firstauthpersonid" varchar(36),
	"firstauthdate" timestamp,
	"entereddate" timestamp,
	"currancyid" varchar(36),
	"currencyrateid" varchar(36),
	"remarks" varchar(255),
	"discounttypeid" varchar(36),
	"discountamount" numeric(21, 8),
	"discountpercentage" numeric(5, 2),
	"subamount" numeric(21, 8),
	"totalamount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"recordno" varchar(10),
	"isexport" boolean,
	"destinationdeptid" varchar(36),
	"prheaderid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.purchaseorderheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_purchaserequestdetails"( 
	"id" varchar(36),
	"purchaserequestheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"productdescription" varchar(120),
	"supplierid" varchar(36),
	"productpriceid" varchar(36),
	"uomid" varchar(36),
	"requestquantity" numeric(19, 8),
	"remarks" varchar(255),
	"unitprice" numeric(20, 8),
	"amount" numeric(21, 8),
	"amountdiscount" numeric(21, 8),
	"percentagediscount" numeric(5, 2),
	"percentagetax" numeric(5, 2),
	"amounttax" numeric(21, 8),
	"supplierproductid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"taxdetailid" varchar(36),
	"ponumber" varchar(10),
	"purchaseorderheaderid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.purchaserequestdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_purchaserequestheaders"( 
	"id" varchar(36),
	"prnumber" varchar(10),
	"prdate" timestamp,
	"prstatusid" varchar(36),
	"requestdeptid" varchar(36),
	"requestpersonid" varchar(36),
	"purchasedeptid" varchar(36),
	"authorizepersonid" varchar(36),
	"authorizedate" timestamp,
	"remarks" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"supplierid" varchar(36),
	"subamount" numeric(21, 8),
	"totalamount" numeric(21, 8)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.purchaserequestheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_queueentries"( 
	"id" varchar(36),
	"queueid" varchar(36),
	"queueseq" int,
	"queuestatid" varchar(36),
	"queuesourceid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"locationid" varchar(36),
	"episodeprescriptionhdrid" varchar(36),
	"highpriority" boolean,
	"refqueueid" varchar(36),
	"refqueueentryid" varchar(36),
	"datetimein" timestamp,
	"datetimeout" timestamp,
	"isclosed" boolean,
	"tokenno" int,
	"chgtranorderrefid" varchar(36),
	"remarks" varchar(250),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queueentries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_queuesources"( 
	"id" varchar(36),
	"code" varchar(10),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queuesources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_queuestartstats"( 
	"id" varchar(36),
	"queuesourceid" varchar(36),
	"queuetypeid" varchar(36),
	"startqueuestatid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queuestartstats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_queuestats"( 
	"id" varchar(36),
	"queuetypeid" varchar(36),
	"name" varchar(50),
	"description" varchar(255),
	"sequence" smallint,
	"formname" varchar(50),
	"isprocess" boolean,
	"ismanualprocess" boolean,
	"isinventoryissue" boolean,
	"istokenrequired" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queuestats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_queuetypes"( 
	"id" varchar(36),
	"name" varchar(50),
	"description" varchar(255),
	"isprosseing" boolean,
	"istokenrequired" boolean,
	"isdoctorqueue" boolean,
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queuetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_queues"( 
	"id" varchar(36),
	"queuetypeid" varchar(36),
	"departmentid" varchar(36),
	"name" varchar(25),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.queues?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_races"( 
	"id" varchar(36),
	"code" varchar(4),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"ismalaysian" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.races?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_reasoncodes"( 
	"id" varchar(36),
	"code" varchar(10),
	"description" varchar(100),
	"type" varchar(2),
	"companyid" varchar(36),
	"noteexist" boolean,
	"status" varchar(3),
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.reasoncodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_receiptdetails"( 
	"id" varchar(36),
	"bankid" varchar(36),
	"branchname" varchar(75),
	"paidamount" numeric(21, 8),
	"authno" varchar(250),
	"expiredate" timestamp,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.receiptdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_relationships"( 
	"id" varchar(36),
	"relationshipcode" varchar(4),
	"description" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.relationships?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_religions"( 
	"id" varchar(36),
	"code" varchar(4),
	"description" varchar(40),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.religions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_repackitemdetails"( 
	"id" varchar(36),
	"repackitemid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"quantity" numeric(18, 8),
	"uomid" varchar(36),
	"netprice" numeric(19, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"repackheaderid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.repackitemdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_repackitems"( 
	"id" varchar(36),
	"departmentid" varchar(36),
	"productid" varchar(36),
	"uomid" varchar(36),
	"description" varchar(80),
	"quantity" numeric(18, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"expdate" timestamp,
	"line" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.repackitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_repacktransdetails"( 
	"id" varchar(36),
	"repackheaderid" varchar(36),
	"line" int,
	"productid" varchar(36),
	"quantity" numeric(18, 8),
	"uomid" varchar(36),
	"netprice" numeric(21, 8),
	"amount" numeric(21, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.repacktransdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_repacktransheaders"( 
	"id" varchar(36),
	"repackitemid" varchar(36),
	"uomid" varchar(36),
	"documentnum" varchar(10),
	"departmentid" varchar(36),
	"transdate" timestamp,
	"productid" varchar(36),
	"userdefinedtypeid" varchar(36),
	"description" varchar(80),
	"quantity" numeric(18, 8),
	"repackpersonid" varchar(36),
	"expirydate" timestamp,
	"remarks" varchar(255),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"avgcost" numeric(18, 4),
	"amount" numeric(18, 4)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.repacktransheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_reporttypes"( 
	"id" varchar(36),
	"code" varchar(20),
	"name" varchar(50),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"companyid" varchar(36),
	"updatedate" varchar(36),
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.reporttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_roomtypes"( 
	"id" varchar(36),
	"roomtypecode" varchar(30),
	"description" varchar(100),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.roomtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_rooms"( 
	"id" varchar(36),
	"roomtypeid" varchar(36),
	"roomno" varchar(10),
	"roomname" varchar(30),
	"height" numeric(18, 0),
	"width" numeric(18, 0),
	"leftposition" int,
	"topposition" int,
	"bedorientation" varchar(1),
	"description" varchar(100),
	"iswarddefault" boolean,
	"wardid" varchar(36),
	"companyid" varchar(36),
	"status" varchar(50),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.rooms?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_slocvsprod"( 
	"sl_dept" varchar(50),
	"product_id" varchar(50),
	"conversion_factor" varchar(50),
	"stockloc_qtyonhand" varchar(50),
	"stockloc_loose_ qtyonhand" varchar(50),
	"product_avgcost" varchar(50),
	"stockloc_qtyonhand * product_avgcost * conversion_factor" varchar(50),
	"product_description" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.slocvsprod?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_slocvsprod1"( 
	"sl_dept" varchar(50),
	"product_id" varchar(50),
	"conversion_factor" varchar(50),
	"stockloc_qtyonhand" varchar(50),
	"stockloc_loose_ qtyonhand" varchar(50),
	"product_avgcost" varchar(50),
	"stockloc_qtyonhand * product_avgcost * conversion_factor" varchar(50),
	"product_description" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.slocvsprod1?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_slocvsprod3"( 
	"sl_dept" varchar(50),
	"product_id" varchar(50),
	"conversion_factor" varchar(50),
	"stockloc_qtyonhand" varchar(50),
	"stockloc_loose_ qtyonhand" varchar(50),
	"product_avgcost" varchar(50),
	"stockvalue" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.slocvsprod3?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');






CREATE EXTERNAL TABLE "pxf_slocvsprod4"( 
	"sl_dept" varchar(50),
	"product_id" varchar(50),
	"conversion_factor" varchar(50),
	"stockloc_qtyonhand" varchar(50),
	"stockloc_loose_ qtyonhand" varchar(50),
	"product_avgcost" varchar(50),
	"stockvalue" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.slocvsprod4?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_smsalerts"( 
	"id" varchar(36),
	"source" varchar(20),
	"transtype" varchar(36),
	"name" varchar(60),
	"designation" varchar(50),
	"email" varchar(50),
	"enddate" timestamp,
	"adddate" timestamp,
	"updatedate" timestamp,
	"adduserid" varchar(36),
	"updateuserid" varchar(36),
	"field1" varchar(50),
	"field2" varchar(50),
	"field3" varchar(50),
	"field4" varchar(50),
	"field5" varchar(50),
	"mobileno" varchar(15),
	"companyid" varchar(36),
	"status" varchar(3),
	"membershipcardid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.smsalerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_searchoptions"( 
	"id" varchar(36),
	"object" varchar(75),
	"name" varchar(30),
	"description" varchar(40),
	"query" varchar(500),
	"queryvalues" varchar(500),
	"defaultquery" boolean,
	"status" varchar(50),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.searchoptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_searchproperties"( 
	"id" varchar(36),
	"objname" varchar(75),
	"propname" varchar(75),
	"proptype" varchar(10),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.searchproperties?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_sequences"( 
	"id" varchar(36),
	"transtypeid" varchar(36),
	"prefix" varchar(10),
	"nextkey" bigint,
	"departmentid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"backdays" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.sequences?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_sessioncontexts"( 
	"id" varchar(36),
	"sessioncode" varchar(36),
	"starttime" timestamp,
	"endtime" timestamp,
	"lastaccesstime" timestamp,
	"status" varchar(36),
	"userid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.sessioncontexts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_specialities"( 
	"id" varchar(36),
	"specialitycode" varchar(15),
	"description" varchar(40),
	"specialitytype" varchar(8),
	"disciplineid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.specialities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_states"( 
	"id" varchar(36),
	"statecode" varchar(4),
	"description" varchar(40),
	"status" varchar(3),
	"companyid" varchar(36),
	"countryid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.states?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_stdcode"( 
	"tablename" varchar(50),
	"id-table" varchar(36),
	"old-code" varchar(50),
	"old-desc" varchar(100),
	"new-code" varchar(50),
	"new-desc" varchar(100),
	"remark" varchar(50),
	"type" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.stdcode?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_stockcountbatchs"( 
	"id" varchar(15),
	"batchno" int,
	"fiscalyearid" varchar(36),
	"periodid" varchar(36),
	"startdate" date,
	"enddate" date,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.stockcountbatchs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_stockcountdetails"( 
	"id" int,
	"headerid" varchar(20),
	"linenum" int,
	"companyid" varchar(36),
	"productid" varchar(36),
	"uomid" varchar(36),
	"unitcost" numeric(18, 4),
	"stkdate" timestamp,
	"phyqty" int,
	"thyqty" int,
	"dspqty" int,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.stockcountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_stockcountheaders"( 
	"id" varchar(20),
	"companyid" varchar(36),
	"docno" int,
	"departmentid" varchar(36),
	"respersonid" varchar(36),
	"remarks" varchar(250),
	"recstatus" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"racknofr" varchar(8),
	"racknoto" varchar(8),
	"itemfr" varchar(8),
	"itemto" varchar(8),
	"batchid" varchar(15),
	"freezeuserid" varchar(36),
	"freezedate" timestamp,
	"confirmeddate" timestamp,
	"confirmeduserid" varchar(36),
	"posteddate" timestamp,
	"posteduserid" varchar(36),
	"physicalvalue" numeric(18, 0),
	"systemvalue" numeric(18, 0)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.stockcountheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_stockcounts"( 
	"id" varchar(36),
	"stockcountdetailid" int,
	"departmentid" varchar(36),
	"productid" varchar(36),
	"physicalquantity" numeric(18, 8),
	"systemquantity" numeric(18, 8),
	"counttime" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.stockcounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_supplierbonusitems"( 
	"id" varchar(36),
	"pricesourceid" varchar(36),
	"supplierproductid" varchar(36),
	"productid" varchar(36),
	"uomid" varchar(36),
	"lineno" int,
	"bonusqty" numeric(18, 8),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"bonussuppitemcode" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.supplierbonusitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_supplierdetails"( 
	"id" varchar(36),
	"appoperationid" varchar(36),
	"supplierid" varchar(36),
	"pvalue1" varchar(100),
	"pvalue2" varchar(100),
	"pvalue3" varchar(100),
	"pvalue4" varchar(100),
	"pvalue5" varchar(100),
	"effectivedate" timestamp,
	"licno" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.supplierdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_suppliergroups"( 
	"id" varchar(36),
	"groupcode" varchar(4),
	"description" varchar(80),
	"costcenterid" varchar(36),
	"glaccountid" varchar(36),
	"advcostcenterid" varchar(36),
	"advglaccountid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.suppliergroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_supplierproducts"( 
	"id" varchar(36),
	"supplierid" varchar(36),
	"productid" varchar(36),
	"code" varchar(50),
	"rank" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean,
	"lineno" int,
	"pricecodeid" varchar(36),
	"uomcodeid" varchar(36),
	"orderquantity" numeric(19, 8),
	"unitprice" numeric(20, 8),
	"percentagediscount" numeric(5, 2),
	"amountdiscount" numeric(21, 8),
	"amounttax" numeric(21, 8),
	"percentagetax" numeric(5, 2),
	"expiredate" timestamp,
	"suppitemcode" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.supplierproducts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_suppliers"( 
	"id" varchar(36),
	"suppliercode" varchar(20),
	"suppliergroupid" varchar(36),
	"name" varchar(100),
	"contactperson" varchar(100),
	"address1" varchar(255),
	"address2" varchar(255),
	"address3" varchar(255),
	"address4" varchar(255),
	"telephonenumber" varchar(40),
	"faxnumber" varchar(40),
	"termothers" int,
	"termnondisp" int,
	"termdisp" int,
	"costcenterid" varchar(36),
	"glaccountid" varchar(36),
	"bankid" varchar(36),
	"supplierbankaccount" char(20),
	"outstandingamount" numeric(19, 8),
	"companyaccountno" varchar(20),
	"depamt" numeric(19, 8),
	"miscamt" numeric(19, 8),
	"supplygoods" boolean,
	"advancecostcenterid" varchar(36),
	"advanceglaccountid" varchar(36),
	"misc" numeric(19, 8),
	"remarks" varchar(250),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"telephonenumber2" varchar(40),
	"mobilenumber" varchar(40),
	"email" varchar(300),
	"gstno" varchar(20),
	"prevosamt" numeric(19, 8),
	"compregno" varchar(36),
	"suppbranch" varchar(100)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.suppliers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_suppliers_tmpdu"( 
	"id" varchar(36),
	"suppcode" varchar(255),
	"suppgroup" varchar(255),
	"name" varchar(255),
	"contpers" varchar(255),
	"addr1" varchar(255),
	"addr2" varchar(255),
	"addr3" varchar(255),
	"addr4" varchar(255),
	"telno" varchar(255),
	"faxno" varchar(255),
	"termothers" double precision,
	"termnondisp" double precision,
	"termdisp" double precision,
	"costcode" varchar(36),
	"glaccno" varchar(36),
	"outamt" double precision,
	"accno" varchar(255),
	"depamt" double precision,
	"miscamt" double precision,
	"suppflg" boolean,
	"advccode" varchar(36),
	"advglaccno" varchar(36),
	"misc" double precision,
	"stat" varchar(3),
	"compcode" varchar(36),
	"noteex" boolean,
	"adduser" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.suppliers_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_surgeryprocedures"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"procedurecode" varchar(30),
	"description" varchar(50),
	"pasantage" numeric(5, 2),
	"showinlist" boolean,
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"mmatypeid" varchar(36),
	"sequence" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.surgeryprocedures?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_swabcounts"( 
	"id" varchar(36),
	"swaptypeid" varchar(36),
	"episodematernityid" varchar(36),
	"initialcount" numeric(18, 2),
	"addon" numeric(18, 2),
	"finalcount" numeric(18, 2),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.swabcounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_swabtypes"( 
	"id" varchar(36),
	"swabcode" varchar(20),
	"description" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.swabtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_systemparameters"( 
	"id" varchar(36),
	"source" varchar(8),
	"paramtype" varchar(8),
	"description" varchar(40),
	"pvalue1" varchar(10),
	"pvalue2" varchar(20),
	"pvalue3" varchar(10),
	"pvalue4" varchar(20),
	"pvalue5" varchar(20),
	"comment" varchar(40),
	"effectivedate" timestamp,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.systemparameters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_systemparams"( 
	"id" varchar(36),
	"systemparamcode" varchar(40),
	"paramsourceid" varchar(36),
	"paramgroupid" varchar(36),
	"transtypeid" varchar(36),
	"description" varchar(255),
	"value1" varchar(255),
	"value1type" varchar(40),
	"value2" varchar(255),
	"value2type" varchar(40),
	"valueisrange" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"longtext" varchar(4000)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.systemparams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_temp_klang_patient"( 
	"patientid" varchar(36),
	"mrnnumber" int) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_klang_patient?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_tmp_chargetransactions"( 
	"id" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"episodetypeid" varchar(36),
	"docref" varchar(30),
	"chargepriceid" varchar(36),
	"chargemasterid" varchar(36),
	"chargegroupid" varchar(36),
	"transdate" timestamp,
	"transtype" varchar(2),
	"billcode" numeric(18, 0),
	"revcd" varchar(4),
	"mmamasterid" varchar(36),
	"billed" boolean,
	"billdate" timestamp,
	"doctorid" varchar(36),
	"unitprice" numeric(21, 8),
	"quantity" numeric(21, 8),
	"amount" numeric(21, 8),
	"taxamount" numeric(21, 8),
	"uomid" varchar(36),
	"billtypemasterid" varchar(36),
	"qstat" varchar(1),
	"dracccode" varchar(30),
	"cracccode" varchar(30),
	"arprocess" boolean,
	"billno" numeric(18, 0),
	"auditno" numeric(18, 0),
	"departmentid" varchar(36),
	"reqdepartmentid" varchar(36),
	"issuedepartmentid" varchar(36),
	"invcode" varchar(30),
	"resulttype" varchar(4),
	"resultstatus" numeric(18, 0),
	"inventory" boolean,
	"updinv" numeric(18, 0),
	"invbatch" numeric(18, 0),
	"doscode" varchar(5),
	"duration" numeric(18, 0),
	"instructionid" varchar(36),
	"discountamount" numeric(21, 8),
	"discountcode" varchar(36),
	"packagecode" varchar(36),
	"remarks" varchar(255),
	"frequencyid" varchar(36),
	"ftxtdosage" varchar(255),
	"dosageid" varchar(36),
	"addinstructions" varchar(255),
	"debtormasterid" varchar(36),
	"payername" varchar(40),
	"invgroup" varchar(2),
	"chargeclassid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_chargetransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmp_dietsummaries"( 
	"id" bigint,
	"usersessionid" varchar(36),
	"episodeid" varchar(36),
	"episodedietid" varchar(36),
	"bedallocationid" varchar(36),
	"bedno" varchar(10),
	"wardid" varchar(36),
	"wardcode" varchar(50),
	"dietid" varchar(36),
	"episodedietstatus" varchar(10),
	"dietcode" varchar(10),
	"dietdescription" varchar(36),
	"remarks" varchar(225),
	"isbreakfirst" boolean,
	"islunch" boolean,
	"isdinner" boolean,
	"isnutrition" boolean,
	"companyid" varchar(36),
	"orderheaderid" varchar(36),
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_dietsummaries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_tmp_dietsummarieswithmealshifts"( 
	"id" bigint,
	"usersessionid" varchar(36),
	"episodeid" varchar(36),
	"episodedietid" varchar(36),
	"bedallocationid" varchar(36),
	"bedno" varchar(10),
	"wardid" varchar(36),
	"wardcode" varchar(50),
	"dietid" varchar(36),
	"episodedietstatus" varchar(10),
	"dietcode" varchar(10),
	"dietdescription" varchar(36),
	"mealshift" varchar(3),
	"remarks" varchar(225),
	"main" varchar(750),
	"drink" varchar(750),
	"desert" varchar(750),
	"companyid" varchar(36),
	"orderheaderid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_dietsummarieswithmealshifts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmp_episodenutritions"( 
	"id" bigint,
	"usersessionid" varchar(36),
	"episodeid" varchar(36),
	"bedallocationid" varchar(36),
	"bedno" varchar(10),
	"wardid" varchar(36),
	"wardcode" varchar(50),
	"status" varchar(10),
	"nutritionname" varchar(100),
	"charagecode" varchar(25),
	"remarks" varchar(225),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_episodenutritions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmp_glinterfaces"( 
	"id" varchar(36),
	"paramsourceid" varchar(36),
	"appoperationid" varchar(36),
	"trantype" varchar(36),
	"reference" varchar(250),
	"description" varchar(100),
	"auditno" numeric(18, 0),
	"amount" numeric(21, 8),
	"draccountid" varchar(36),
	"craccountid" varchar(36),
	"idno" varchar(36),
	"line" int,
	"drcostcenterid" varchar(36),
	"crcostcenterid" varchar(36),
	"postdate" timestamp,
	"status" varchar(3),
	"sessionid" varchar(36),
	"updated" boolean,
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"oprtype" varchar(1)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_glinterfaces?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_taxdetails"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"taxmasterid" varchar(36),
	"rate" numeric(18, 8),
	"effectivedate" timestamp,
	"formula" varchar(300),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.taxdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_taxmasters"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"taxcode" varchar(15),
	"description" varchar,
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"taxtype" varchar(16)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.taxmasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_taxtransactions"( 
	"id" varchar(36),
	"taxmasterid" varchar(36),
	"transtypeid" varchar(36),
	"paramsourceid" varchar(36),
	"line" int,
	"transdate" timestamp,
	"amount" numeric(21, 8),
	"taxamount" numeric(21, 8),
	"customerid" varchar(36),
	"itemid" varchar(36),
	"description" varchar(100),
	"nvc1" varchar(255),
	"nvc2" varchar(255),
	"nvc3" varchar(255),
	"nvc4" varchar(255),
	"nvc5" varchar(255),
	"nvc6" varchar(255),
	"auditno" bigint,
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"taxdetailid" varchar(36),
	"refid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.taxtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tempbeds"( 
	"ward" varchar(255),
	"room" varchar(255),
	"bed no" varchar(255),
	"bed type" varchar(255),
	"charge code" varchar(255)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempbeds?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tempicd1"( 
	"icdcode" varchar(255),
	"lastupdate" timestamp,
	"description" varchar,
	"lowage" double precision,
	"highage" double precision,
	"coderest" double precision,
	"sex" double precision,
	"area" double precision,
	"ageflag" double precision,
	"extra" varchar(255),
	"deactivedate" varchar(255),
	"type" varchar(255),
	"soundex" varchar(255),
	"icdgrp" varchar(255),
	"descsdx" varchar(255)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempicd1?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tempicd2"( 
	"f1" varchar(255)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempicd2?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_tempicd3"( 
	"f1" varchar(255)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempicd3?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tempsloc"( 
	"deptcode" varchar(255),
	"itemcode" double precision,
	"uomcode" varchar(255),
	"factor" double precision,
	"qtyonhand" double precision,
	"average cost" double precision,
	"value" double precision) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempsloc?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tempuploadhris"( 
	"id" varchar(36),
	"source" varchar(36),
	"trantype" varchar(36),
	"reference" varchar(250),
	"description" varchar(500),
	"oprtype" varchar(1),
	"auditno" varchar(36),
	"amount" numeric(21, 8),
	"draccount" varchar(36),
	"craccount" varchar(36),
	"line" int,
	"drcostcenter" varchar(36),
	"crcostcenter" varchar(36),
	"postdate" timestamp,
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tempuploadhris?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_temp_bankinregisters"( 
	"id" varchar(36),
	"paymodeid" varchar(36),
	"reference" varchar(255),
	"documentno" varchar(24),
	"documentdate" timestamp,
	"amount" numeric(18, 2),
	"commamount" numeric(18, 2),
	"taxamount" numeric(18, 2),
	"status" varchar(4),
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"companyid" varchar(36),
	"reportid" varchar(3),
	"reftype" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_bankinregisters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_temp_budget"( 
	"id" varchar(36),
	"glaccountcostcodeid" varchar(36),
	"costcenter" varchar(36),
	"costcenterdesc" varchar(100),
	"glaccount" varchar(36),
	"glaccountdesc" varchar(100),
	"glaccounttype" varchar(36),
	"period" int,
	"fiscalyear" int,
	"actamount" numeric(21, 8),
	"budgetamount" numeric(21, 8),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_budget?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_temp_budgetload"( 
	"id" varchar(36),
	"costcenter" varchar(36),
	"costcenterdesc" varchar(100),
	"glaccount" varchar(36),
	"glaccounttype" varchar(36),
	"glaccountdesc" varchar(100),
	"actamount" numeric(21, 8),
	"budgetamount" numeric(21, 8),
	"budgetjan" numeric(21, 8),
	"budgetfeb" numeric(21, 8),
	"budgetmac" numeric(21, 8),
	"budgetapril" numeric(21, 8),
	"budgetmei" numeric(21, 8),
	"budgetjun" numeric(21, 8),
	"budgetjuly" numeric(21, 8),
	"budgetaug" numeric(21, 8),
	"budgetsep" numeric(21, 8),
	"budgetoct" numeric(21, 8),
	"budgetnov" numeric(21, 8),
	"budgetdec" numeric(21, 8),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_budgetload?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_temp_paymentsubmission"( 
	"id" varchar(36),
	"payto" varchar(36),
	"source" varchar(36),
	"trantype" varchar(36),
	"auditno" int,
	"bankcode" varchar(36),
	"entrydate" timestamp,
	"recdate" timestamp,
	"amount" numeric(21, 8),
	"stat" varchar(2),
	"batchno" varchar(36),
	"chequeno" varchar(36),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_paymentsubmission?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_temp_summaryin"( 
	"audino" int,
	"ageinga" numeric(18, 2),
	"ageingd" numeric(18, 2),
	"gltransa" numeric(18, 2),
	"gltransd" numeric(18, 2),
	"variance" varchar(50),
	"statuses" varchar(50)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_summaryin?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tilldetails"( 
	"id" varchar(36),
	"tillid" varchar(36),
	"opencashamt" numeric(20, 8),
	"opencardamt" numeric(20, 8),
	"openchqamt" numeric(20, 8),
	"opendate" timestamp,
	"closedate" timestamp,
	"cashierid" varchar(36),
	"cashamt" numeric(20, 8),
	"cardamt" numeric(20, 8),
	"chqamt" numeric(20, 8),
	"companyid" varchar(36),
	"tillno" int,
	"refdcashamt" numeric(20, 8),
	"refdcardamt" numeric(20, 8),
	"refdchqamt" numeric(20, 8),
	"actclosecashbal" numeric(20, 8),
	"actclosecardbal" numeric(20, 8),
	"actclosechqbal" numeric(20, 8),
	"reason" varchar(100),
	"cnamt" numeric(20, 8),
	"otheramt" numeric(20, 8),
	"isclosed" boolean,
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tilldetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tillregistrations"( 
	"id" varchar(36),
	"tillcode" varchar(8),
	"description" varchar(40),
	"defopenamt" numeric(20, 8),
	"departmentid" varchar(36),
	"effectivedate" timestamp,
	"tillstatus" varchar(10),
	"lastrcptnumber" int,
	"lastrefundno" int,
	"lastcrnoteno" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"lastuserid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tillregistrations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_titlecodes"( 
	"id" varchar(36),
	"titlecode" varchar(6),
	"description" varchar(30),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.titlecodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmpchargeprices"( 
	"id" varchar(36),
	"isselect" boolean,
	"chargemasterid" varchar(36),
	"chargecode" varchar(30),
	"chargedescription" varchar(150),
	"chargegroupid" varchar(36),
	"chargegroupcode" varchar(4),
	"chargegroupdescription" varchar(40),
	"ispricedefined" boolean,
	"pricedetailid" varchar(36),
	"biltypeid" varchar(36),
	"billtypecode" varchar(5),
	"pricetypeid" varchar(36),
	"pricetypecode" varchar(5),
	"uomid" varchar(36),
	"uomcode" varchar(4),
	"effectivedate" timestamp,
	"price" numeric(21, 8),
	"markupprecentage" numeric(18, 8),
	"discountprecentage" numeric(18, 8),
	"finalprice" numeric(21, 8),
	"panelheaderid" varchar(36),
	"panelcode" varchar(10),
	"paneldetailid" varchar(36),
	"companyid" varchar(36),
	"sessionid" varchar(36),
	"ispriceoverwrite" boolean,
	"discountamount" numeric(21, 8),
	"markupamount" numeric(21, 8),
	"hasdiscountcharge" boolean,
	"isdiscountcharge" boolean,
	"discountchargeid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmpchargeprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmp_userfunctions"( 
	"id" varchar(36),
	"users_id" varchar(36),
	"functions_id" varchar(36),
	"exclude" boolean,
	"canview" boolean,
	"canadd" boolean,
	"canupdate" boolean,
	"candelete" boolean,
	"canexecute" boolean,
	"isquickaccess" boolean,
	"sessionid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmp_userfunctions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_trankeys"( 
	"id" varchar(36),
	"transtypeid" varchar(36),
	"departmentid" varchar(36),
	"keysequence" int,
	"backdateduration" int,
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.trankeys?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_transgroups"( 
	"id" varchar(36),
	"transgroupcode" varchar(10),
	"transgroupdesc" varchar(30),
	"companyid" varchar(36),
	"status" varchar(3),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.transgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_transqueues"( 
	"id" varchar(36),
	"companyid" varchar(36),
	"patientid" varchar(36),
	"episodeid" varchar(36),
	"episodeprescriptionhdrid" varchar(36),
	"queueno" int,
	"queuestatid" varchar(36),
	"status" varchar(50),
	"queuetypeid" varchar(36),
	"departmentid" varchar(36),
	"locationid" varchar(36),
	"highpriority" boolean,
	"refqueueid" varchar(36),
	"queuesourceid" varchar(36),
	"refsourceid" varchar(36),
	"refsourcetype" varchar(10),
	"isclosed" boolean,
	"noteexist" boolean,
	"updatedate" timestamp,
	"updateuserid" varchar(36),
	"datetimein" timestamp,
	"datetimeout" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.transqueues?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_transtitles"( 
	"id" varchar(36),
	"titleid" varchar(36),
	"description" varchar(30),
	"companyid" varchar(36),
	"languageid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"status" varchar(3)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.transtitles?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_transtypes"( 
	"id" varchar(36),
	"transtype" varchar(10),
	"description" varchar(50),
	"transgroupid" varchar(36),
	"glsubacctypeid" varchar(36),
	"isdeposittype" boolean,
	"isinventorytype" boolean,
	"crdrsign" varchar(10),
	"isupdatequantity" boolean,
	"isupdateamount" boolean,
	"invissuetype" varchar(10),
	"tranbyinv" boolean,
	"isupdateproductqty" boolean,
	"status" varchar(3),
	"companyid" varchar(36),
	"noteexist" boolean,
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.transtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_transactionlogs"( 
	"id" varchar(36),
	"module" varchar(100),
	"submodule" varchar(100),
	"tablename" varchar(100),
	"tablekey" varchar(36),
	"activitytype" varchar(10),
	"fields" varchar,
	"fromvalues" varchar,
	"tovalues" varchar,
	"logdatetime" timestamp,
	"userid" varchar(36),
	"companyid" varchar(36),
	"sessioncontextid" varchar(36),
	"functionid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.transactionlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_uoms"( 
	"id" varchar(36),
	"uomcode" varchar(20),
	"description" varchar(30),
	"convfactor" numeric(18, 8),
	"remarks" varchar(255),
	"companyid" varchar(36),
	"status" varchar(3),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.uoms?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_usercompanies"( 
	"id" varchar(36),
	"userid" varchar(36),
	"permissioncompanyid" varchar(36),
	"isdefaultcompany" boolean,
	"status" varchar(5),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.usercompanies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_userdefinedtypes"( 
	"id" varchar(36),
	"typecode" varchar(30),
	"desctiption" varchar(100),
	"typekey" varchar(10),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.userdefinedtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_userfunction"( 
	"id" varchar(100),
	"users_id" varchar(36),
	"functions_id" varchar(36),
	"exclude" boolean,
	"canview" boolean,
	"canadd" boolean,
	"canupdate" boolean,
	"candelete" boolean,
	"canexecute" boolean,
	"isquickaccess" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.userfunction?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_userlogs"( 
	"id" varchar(36),
	"userid" varchar(36),
	"name" varchar(80),
	"module" varchar(80),
	"program" varchar(80),
	"tab" varchar(80),
	"timein" timestamp,
	"date" timestamp,
	"appfunctionid" varchar(36),
	"companyid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.userlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_useroperation"( 
	"users_id" varchar(36),
	"operations_id" varchar(36),
	"exclude" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.useroperation?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_userprivilegedetails"( 
	"id" varchar(36),
	"userprivilegeid" varchar(36),
	"privilegedetailid" varchar(36),
	"upperlimit" numeric(18, 4),
	"lowerlimit" numeric(18, 4),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.userprivilegedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_userprivileges"( 
	"id" varchar(36),
	"privilegeid" varchar(36),
	"userid" varchar(36),
	"status" varchar(3),
	"companyid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"noteexist" boolean) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.userprivileges?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');





CREATE EXTERNAL TABLE "pxf_users"( 
	"id" varchar(36),
	"loginname" varchar(30),
	"password" varchar(30),
	"username" varchar(50),
	"status" varchar(3),
	"companyid" varchar(36),
	"loggedin" smallint,
	"loginattempt" smallint,
	"employeeid" varchar(36),
	"updateuserid" varchar(36),
	"updatedate" timestamp,
	"currentsessioncontextid" varchar(32),
	"defaultdepartmentid" varchar(36),
	"languageid" varchar(36),
	"designationid" varchar(36),
	"domainuser" varchar(50),
	"expirydate" timestamp,
	"adduserid" varchar(36),
	"adddate" timestamp) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.users?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');




CREATE EXTERNAL TABLE "pxf_sloc"( 
	"sl_dept" varchar(255),
	"product_id" double precision,
	"conversion_factor" double precision,
	"stockloc_qtyonhand" double precision,
	"stockloc_loose_ qtyonhand" double precision,
	"product_avgcost" double precision) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.sloc?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_temp_klang_prog_pat"( 
	"patientid" varchar(36),
	"conv_patientid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.temp_klang_prog_pat?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmpglinterface"( 
	"compcode" varchar(4),
	"source" varchar(20),
	"trantype" varchar(16),
	"reference" varchar(80),
	"description" varchar(80),
	"auditno" int,
	"amount" numeric(18, 0),
	"dracc" varchar(16),
	"cracc" varchar(16),
	"idno" varchar(20),
	"lineno" int,
	"flag" varchar(2),
	"oprtype" varchar(2),
	"lastuser" varchar(26),
	"lastupdate" timestamp,
	"drccode" varchar(6),
	"crccode" varchar(6),
	"postdate" timestamp,
	"id" varchar(36),
	"companyid" varchar(36),
	"sessionid" varchar(36)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmpglinterface?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');



CREATE EXTERNAL TABLE "pxf_tmpglinterface_error"( 
	"compcode" varchar(4),
	"source" varchar(20),
	"trantype" varchar(16),
	"reference" varchar(80),
	"description" varchar(80),
	"auditno" int,
	"amount" numeric(18, 0),
	"dracc" varchar(16),
	"cracc" varchar(16),
	"idno" varchar(20),
	"lineno" int,
	"flag" varchar(2),
	"oprtype" varchar(2),
	"lastuser" varchar(26),
	"lastupdate" timestamp,
	"drccode" varchar(6),
	"crccode" varchar(6),
	"postdate" timestamp,
	"id" varchar(36),
	"companyid" varchar(36),
	"sessionid" varchar(36),
	"errormsg" varchar(255)) LOCATION ('pxf://MDMHITS2_KLGSH.dbo.tmpglinterface_error?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');


