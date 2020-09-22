--
-- Greenplum Database database dump
--

-- Dumped from database version 9.4.24
-- Dumped by pg_dump version 9.4.24
-- Started on 2020-09-07 23:25:29 PHT

SET gp_default_storage_options = '';
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

SET default_with_oids = false;

--
-- TOC entry 9 (class 2615 OID 16397)
-- Dependencies: 0
-- Name: staging_mdmhits2_klgsh; Type: SCHEMA; Schema: -; Owner: gpadmin
--

CREATE SCHEMA staging_mdmhits2_klgsh;


ALTER SCHEMA staging_mdmhits2_klgsh OWNER TO gpadmin;

SET default_tablespace = '';

--
-- TOC entry 271 (class 1259 OID 16420)
-- Name: activereportparams; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.activereportparams (
    id character varying(36) NOT NULL,
    activereporttaskid character varying(36),
    paramname character varying(100),
    paramvalue character varying(250) NOT NULL,
    longparam character varying(4000),
    status character varying(5),
    printeddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.activereportparams OWNER TO gpadmin;

--
-- TOC entry 272 (class 1259 OID 16426)
-- Name: activereporttasks; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.activereporttasks (
    id character varying(36) NOT NULL,
    companyid character varying(36),
    serialno bigint NOT NULL,
    reportid character varying(3) NOT NULL,
    sessionid character varying(36) NOT NULL,
    printed boolean,
    status character varying(5),
    printeddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.activereporttasks OWNER TO gpadmin;

--
-- TOC entry 273 (class 1259 OID 16429)
-- Name: addresstypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.addresstypes (
    id character varying(36) NOT NULL,
    typecode character varying(30) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    contacttypeid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.addresstypes OWNER TO gpadmin;

--
-- TOC entry 274 (class 1259 OID 16432)
-- Name: admissionsources; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.admissionsources (
    id character varying(36) NOT NULL,
    admissionsourcecode character varying(10) NOT NULL,
    description character varying(40),
    admissionflag boolean,
    registrationflag boolean,
    registrationfees boolean,
    addr1 character varying(40),
    addr2 character varying(40),
    addr3 character varying(40),
    addr4 character varying(40),
    telephone character varying(20),
    email character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL,
    fax character varying(20)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.admissionsources OWNER TO gpadmin;

--
-- TOC entry 276 (class 1259 OID 16438)
-- Name: alerts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.alerts (
    id character varying(36) NOT NULL,
    alertcode character varying(8) NOT NULL,
    description character varying(200),
    alerttypeid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.alerts OWNER TO gpadmin;

--
-- TOC entry 275 (class 1259 OID 16435)
-- Name: alerttypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.alerttypes (
    id character varying(36) NOT NULL,
    alerttype character varying(20) NOT NULL,
    alertgroup character varying(4) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.alerttypes OWNER TO gpadmin;

--
-- TOC entry 284 (class 1259 OID 16462)
-- Name: appointments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.appointments (
    id character varying(36) NOT NULL,
    appointmentref character varying(50) NOT NULL,
    patientid character varying(36),
    firstname character varying(200) NOT NULL,
    lastname character varying(100),
    email character varying(60),
    gender character varying(36),
    address1 character varying(60),
    address2 character varying(60),
    countryid character varying(36),
    phoneno character varying(50),
    specialityid character varying(36),
    dateofappointment timestamp without time zone NOT NULL,
    fromtime timestamp without time zone NOT NULL,
    totime timestamp without time zone NOT NULL,
    preferredtime timestamp without time zone,
    doctorid character varying(36) NOT NULL,
    appointmentreason character varying(50),
    status character varying(10) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    disciplineid character varying(36),
    noteexist boolean NOT NULL,
    keyindate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.appointments OWNER TO gpadmin;

--
-- TOC entry 937 (class 1259 OID 21663)
-- Name: all; Type: VIEW; Schema: staging_mdmhits2_klgsh; Owner: gpadmin
--

CREATE VIEW staging_mdmhits2_klgsh."all" AS
 SELECT appointments.id,
    appointments.appointmentref,
    appointments.patientid,
    appointments.firstname,
    appointments.lastname,
    appointments.email,
    appointments.gender,
    appointments.address1,
    appointments.address2,
    appointments.countryid,
    appointments.phoneno,
    appointments.specialityid,
    appointments.dateofappointment,
    appointments.fromtime,
    appointments.totime,
    appointments.preferredtime,
    appointments.doctorid,
    appointments.appointmentreason,
    appointments.status,
    appointments.companyid,
    appointments.updatedate,
    appointments.updateuserid,
    appointments.disciplineid,
    appointments.noteexist,
    appointments.keyindate
   FROM staging_mdmhits2_klgsh.appointments
  ORDER BY appointments.patientid;


ALTER TABLE staging_mdmhits2_klgsh."all" OWNER TO gpadmin;

--
-- TOC entry 277 (class 1259 OID 16441)
-- Name: allocationdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.allocationdetails (
    id character varying(36) NOT NULL,
    allocationheaderid character varying(36) NOT NULL,
    chargeclassid character varying(36),
    chargegroupid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    amount numeric(18,2) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    iscancelled boolean NOT NULL,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    docstat boolean,
    doctrantype character varying(4),
    docauditno integer,
    invcode character varying(50)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.allocationdetails OWNER TO gpadmin;

--
-- TOC entry 278 (class 1259 OID 16444)
-- Name: allocationheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.allocationheaders (
    id character varying(36) NOT NULL,
    deposittheaderid character varying(36),
    billheaderid character varying(36),
    companyid character varying(36) NOT NULL,
    allocationamount numeric(18,2) NOT NULL,
    allocationdate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    iscancelled boolean NOT NULL,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    cancelledreason character varying(250),
    financeoperation character varying(1),
    appoperationid character varying(36),
    auditno bigint NOT NULL,
    isprocess boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.allocationheaders OWNER TO gpadmin;

--
-- TOC entry 281 (class 1259 OID 16453)
-- Name: antibiotics; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.antibiotics (
    id character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    antibiotictypeid integer,
    strength numeric(18,2),
    unit character varying(36),
    mohreport boolean,
    hospitalreport boolean,
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.antibiotics OWNER TO gpadmin;

--
-- TOC entry 279 (class 1259 OID 16447)
-- Name: antibioticsetups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.antibioticsetups (
    id character varying(36) NOT NULL,
    type character varying(30) NOT NULL,
    name character varying(100) NOT NULL,
    ddd numeric(18,2),
    seqno integer,
    unit character varying(8),
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.antibioticsetups OWNER TO gpadmin;

--
-- TOC entry 280 (class 1259 OID 16450)
-- Name: antibiotictypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.antibiotictypes (
    id integer NOT NULL,
    description character varying(80),
    ddd numeric(18,2),
    effectivedate timestamp without time zone,
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.antibiotictypes OWNER TO gpadmin;

--
-- TOC entry 268 (class 1259 OID 16404)
-- Name: apactdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.apactdetails (
    id character varying(36) NOT NULL,
    apactheaderid character varying(36) NOT NULL,
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    entrydate timestamp without time zone,
    documentno character varying(36),
    categoryid character varying(36),
    reference character varying(36),
    departmentid character varying(36),
    amount numeric(21,8),
    stat character varying(2),
    patientid character varying(36),
    episodeid character varying(36),
    billno integer,
    paymodeid character varying(36),
    deliveryorderheaderid character varying(36),
    deliveryorderdetailid character varying(36),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    status character varying(4),
    taxamount numeric(21,8),
    allocauditno integer,
    alloctnauditno integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.apactdetails OWNER TO gpadmin;

--
-- TOC entry 269 (class 1259 OID 16411)
-- Name: apactheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.apactheaders (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    documentno character varying(100),
    supplierid character varying(36),
    bankid character varying(36),
    paymodeid character varying(36),
    chequetransactionid character varying(36),
    cheqdate timestamp without time zone,
    actdate timestamp without time zone,
    categoryid character varying(36),
    amount numeric(21,8),
    outamount numeric(21,8),
    remarks character varying(255),
    stat character varying(2),
    isposted boolean,
    entryuserid character varying(36),
    entrydate timestamp without time zone,
    payto character varying(36),
    isdoctor boolean,
    recdate timestamp without time zone,
    conversion boolean,
    srcfrom character varying(40),
    srcto character varying(40),
    departmentid character varying(36),
    reconflg boolean,
    currencyid character varying(36),
    currencyrate numeric(18,8),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    doctorid character varying(36),
    tilldetailid character varying(36),
    transtype character(10),
    taxdetailid character varying(36),
    taxamount numeric(21,8),
    status character varying(4),
    suppliername character varying(200),
    invtype character(10)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.apactheaders OWNER TO gpadmin;

--
-- TOC entry 270 (class 1259 OID 16417)
-- Name: apallocations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.apallocations (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    docsource character varying(4),
    doctrantype character varying(4),
    docauditno integer,
    refsource character varying(4),
    reftrantype character varying(4),
    refauditno integer,
    refamount numeric(21,8),
    allocdate timestamp without time zone,
    allocamount numeric(21,8),
    allocstat character varying(3),
    paymodeid character varying(36),
    bankid character varying(36),
    reference character varying(100),
    chequedate timestamp without time zone,
    supplierid character varying(36),
    remarks character varying(100),
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    docid character varying(36),
    refid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.apallocations OWNER TO gpadmin;

--
-- TOC entry 282 (class 1259 OID 16456)
-- Name: appfunctions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.appfunctions (
    id character varying(36) NOT NULL,
    menusequence character varying(36),
    name character varying(100) NOT NULL,
    description character varying(255),
    partid integer NOT NULL,
    funclevel integer,
    functype character varying(1),
    packagepage character varying(250),
    packagemodule character varying(250),
    iconpath character varying(100),
    qaiconpath character varying(100),
    ismenuitem boolean NOT NULL,
    defaulttabname character varying(30),
    parentfunctionid character varying(36),
    submodule character varying(100),
    optionname character varying(100),
    entitysetname character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    menuversion character varying(10)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.appfunctions OWNER TO gpadmin;

--
-- TOC entry 283 (class 1259 OID 16459)
-- Name: appoperations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.appoperations (
    id character varying(36) NOT NULL,
    sourceid character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL,
    transactioncode character varying(10) NOT NULL,
    description character varying(255),
    displayname character varying(50),
    maxtranno integer NOT NULL,
    prefix character varying(6),
    isupdatepayername boolean,
    isupdateepisode boolean,
    isupdatedebtor boolean,
    isallowautoallocation boolean,
    isallowmanualal0location boolean,
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateddate timestamp without time zone NOT NULL,
    createddate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.appoperations OWNER TO gpadmin;

--
-- TOC entry 285 (class 1259 OID 16465)
-- Name: areagroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.areagroups (
    id character varying(36) NOT NULL,
    areagroupcode character varying(8),
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.areagroups OWNER TO gpadmin;

--
-- TOC entry 286 (class 1259 OID 16468)
-- Name: areas; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.areas (
    id character varying(36) NOT NULL,
    areacode character varying(6) NOT NULL,
    description character varying(60),
    status character varying(3) NOT NULL,
    areagroupid character varying(36) NOT NULL,
    postcodeid character varying(36),
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.areas OWNER TO gpadmin;

--
-- TOC entry 287 (class 1259 OID 16471)
-- Name: assetcategories; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assetcategories (
    id character varying(36) NOT NULL,
    assettypeid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    nexttagnumber integer NOT NULL,
    basistypeid character varying(36) NOT NULL,
    rateperannum numeric(18,2) NOT NULL,
    residualvalue numeric(18,2) NOT NULL,
    glassetaccountid character varying(36),
    glassetcostcodeid character varying(36),
    gldepaccountid character varying(36),
    gldepcostcodeid character varying(36),
    glprovisiondepaccountid character varying(36),
    glprovisiondepcostcodeid character varying(36),
    glgainlossaccountid character varying(36),
    glgainlostcostcodeid character varying(36),
    gldebtoraccountid character varying(36),
    gldebtorcostcodeid character varying(36),
    glrevaluationaccountid character varying(36),
    glrevaluationcostcodeid character varying(36),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    code character varying(10),
    description character varying(100),
    status character varying(3)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assetcategories OWNER TO gpadmin;

--
-- TOC entry 288 (class 1259 OID 16474)
-- Name: assetperiods; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assetperiods (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assetperiods OWNER TO gpadmin;

--
-- TOC entry 292 (class 1259 OID 16486)
-- Name: assets; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assets (
    id character varying(36) NOT NULL,
    assetno character varying(30) NOT NULL,
    assetmode character varying(36) NOT NULL,
    assetcategoryid character varying(36) NOT NULL,
    assettypeid character varying(36) NOT NULL,
    departmentlocationid character varying(36),
    purchaseorderdetailid character varying(36),
    deliveryorderdetailid character varying(36),
    companyid character varying(36) NOT NULL,
    ponumber character varying(10),
    purchasedate timestamp without time zone,
    purchaseprice numeric(20,8),
    originalcost numeric(20,8),
    depstartdate timestamp without time zone,
    currentcost numeric(20,8),
    insurancevalue numeric(20,8),
    quantity character(10),
    lastyeartodatedep numeric(20,8),
    currentyeartodatedep numeric(20,8),
    lastdeplstytddepdate timestamp without time zone,
    isindividualtag boolean NOT NULL,
    assettxntype character varying(36),
    serialno character varying(20),
    casisno character varying(40),
    lotno character varying(40),
    engineno character varying(40),
    status character(10),
    taggeduserid character varying(36),
    taggeddate timestamp without time zone,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    deliveryorderhdrid character varying(36),
    supplierid character varying(36),
    apactheaderid character varying(36),
    productid character varying(36),
    statdate timestamp without time zone,
    nprefid character varying(36),
    recno character varying(40),
    tagno character varying(40),
    appoperationid character varying(36),
    trantypeid character varying(36),
    locationid character varying(36),
    departmentid character varying(36),
    invoicenum character varying(100),
    delordernum character varying(30),
    deliverydate timestamp without time zone,
    actdate timestamp without time zone,
    rateperannum numeric(18,8),
    description character varying(200),
    assetbatchno character varying(30)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assets OWNER TO gpadmin;

--
-- TOC entry 289 (class 1259 OID 16477)
-- Name: assetsummary; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assetsummary (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    assetid character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    costopening numeric(20,8),
    costaddition numeric(20,8),
    costdisposal numeric(20,8),
    costwriteoff numeric(20,8),
    costclosing numeric(20,8),
    depropening numeric(20,8),
    deprcharge numeric(20,8),
    deprdisposal numeric(20,8),
    deprwriteoff numeric(20,8),
    deprclosing numeric(20,8),
    netbookvalue numeric(20,8),
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assetsummary OWNER TO gpadmin;

--
-- TOC entry 290 (class 1259 OID 16480)
-- Name: assettransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assettransactions (
    id character varying(36) NOT NULL,
    assetid character varying(36) NOT NULL,
    assettxntype character varying(36),
    depreciationrate numeric(20,8),
    auditno integer,
    amount numeric(21,8),
    reference character varying(100),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    trantypeid character varying(36),
    amount1 numeric(21,8),
    transactiondate timestamp without time zone,
    netbookvalue numeric(21,8),
    status character varying(3),
    debtorid character varying(50),
    olddepartmentid character varying(36),
    newdepartmentid character varying(36),
    newlocationid character varying(36),
    oldlocationid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assettransactions OWNER TO gpadmin;

--
-- TOC entry 291 (class 1259 OID 16483)
-- Name: assettypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.assettypes (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    assettypecode character varying(2) NOT NULL,
    description character varying(40),
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.assettypes OWNER TO gpadmin;

--
-- TOC entry 293 (class 1259 OID 16489)
-- Name: authoriserdepartments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.authoriserdepartments (
    authoriserid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL
)
 DISTRIBUTED BY (authoriserid);


ALTER TABLE staging_mdmhits2_klgsh.authoriserdepartments OWNER TO gpadmin;

--
-- TOC entry 295 (class 1259 OID 16495)
-- Name: authorisers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.authorisers (
    id character varying(36) NOT NULL,
    userid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    transtypeid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.authorisers OWNER TO gpadmin;

--
-- TOC entry 294 (class 1259 OID 16492)
-- Name: authorisertranstypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.authorisertranstypes (
    authoriserid character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL
)
 DISTRIBUTED BY (authoriserid);


ALTER TABLE staging_mdmhits2_klgsh.authorisertranstypes OWNER TO gpadmin;

--
-- TOC entry 297 (class 1259 OID 16501)
-- Name: babyapgarscores; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.babyapgarscores (
    id character varying(36) NOT NULL,
    babyapgarscoretypeid character varying(36) NOT NULL,
    maternitybabyrecordid character varying(36) NOT NULL,
    apgar1min integer,
    apgar5min integer,
    apgar10min integer,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.babyapgarscores OWNER TO gpadmin;

--
-- TOC entry 296 (class 1259 OID 16498)
-- Name: babyapgarscoretypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.babyapgarscoretypes (
    id character varying(36) NOT NULL,
    apgarscorecode character varying(30) NOT NULL,
    apgarscoredescription character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.babyapgarscoretypes OWNER TO gpadmin;

--
-- TOC entry 298 (class 1259 OID 16504)
-- Name: backgroundtasks; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.backgroundtasks (
    id character varying(36) NOT NULL,
    taskname character varying(20) NOT NULL,
    filepath character varying(250) NOT NULL,
    status character varying(5) NOT NULL,
    iscomplete boolean NOT NULL,
    userid character varying(36) NOT NULL,
    taskdate timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL,
    sessionid character varying(36),
    machinename character varying(50)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.backgroundtasks OWNER TO gpadmin;

--
-- TOC entry 299 (class 1259 OID 16507)
-- Name: baddebtoralls; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.baddebtoralls (
    id character varying(36) NOT NULL,
    baddebtorid character varying(36) NOT NULL,
    appoperationid character varying(36),
    companyid character varying(36) NOT NULL,
    line integer,
    payercode character varying(100),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    patientid character varying(36),
    episodeid character varying(36),
    docauditno bigint,
    amount numeric(21,8),
    outamount numeric(21,8),
    allocdate timestamp without time zone,
    displaydocno character varying(25),
    remarks character varying(100),
    allocstatus character varying(3),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    printedby character varying(36),
    refauditno bigint,
    reftranstype character varying(36),
    refamount numeric(18,0),
    refsource character varying(36),
    reflineno character varying(36),
    auditno bigint,
    docsource character varying(36),
    doctranstype character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.baddebtoralls OWNER TO gpadmin;

--
-- TOC entry 300 (class 1259 OID 16510)
-- Name: baddebtors; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.baddebtors (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    companyid character varying(36) NOT NULL,
    line integer,
    payercode character varying(100),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    patientid character varying(36),
    episodeid character varying(36),
    docauditno bigint,
    amount numeric(21,8),
    outamount numeric(21,8),
    allocdate timestamp without time zone,
    displaydocno character varying(25),
    remarks character varying(100),
    allocstatus character varying(3),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    printedby character varying(36),
    refauditno bigint,
    reftranstype character varying(36),
    refamount numeric(18,0),
    refsource character varying(36),
    reflineno character varying(36),
    auditno bigint,
    docsource character varying(36),
    doctranstype character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.baddebtors OWNER TO gpadmin;

--
-- TOC entry 304 (class 1259 OID 16522)
-- Name: banks; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.banks (
    id character varying(36) NOT NULL,
    bankcode character varying(30) NOT NULL,
    bankname character varying(50),
    address1 character varying(250),
    address2 character varying(250),
    address3 character varying(250),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36) NOT NULL,
    telephoneno character varying(15),
    faxno character varying(15),
    contactid character varying(100),
    bankaccount character varying(20),
    clearday integer,
    effectiveday timestamp without time zone,
    glaccountid character varying(36),
    costcenterid character varying(36),
    pctype boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    swiftcode character varying(10),
    achcode character varying(10),
    banktypeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.banks OWNER TO gpadmin;

--
-- TOC entry 301 (class 1259 OID 16513)
-- Name: banksummaries; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.banksummaries (
    id character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    bankid character varying(36),
    openbalance numeric(21,8),
    actualamount numeric(21,8),
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.banksummaries OWNER TO gpadmin;

--
-- TOC entry 302 (class 1259 OID 16516)
-- Name: banksuppliers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.banksuppliers (
    id character varying(36) NOT NULL,
    bankcode character varying(30) NOT NULL,
    bankname character varying(250),
    pvalue1 character varying(250),
    pvalue2 character varying(250),
    pvalue3 character varying(250),
    swiftcode character varying(10),
    achcode character varying(10),
    effectiveday timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.banksuppliers OWNER TO gpadmin;

--
-- TOC entry 303 (class 1259 OID 16519)
-- Name: banktypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.banktypes (
    id character varying(36) NOT NULL,
    banktypecode character varying(36) NOT NULL,
    description character varying(60),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.banktypes OWNER TO gpadmin;

--
-- TOC entry 305 (class 1259 OID 16525)
-- Name: barcodeprinters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.barcodeprinters (
    id character varying(36) NOT NULL,
    line integer,
    printerid character varying(36),
    printertype character varying(36),
    linetype character varying(36),
    command character varying(255),
    islineskip boolean,
    isreuse boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.barcodeprinters OWNER TO gpadmin;

--
-- TOC entry 306 (class 1259 OID 16528)
-- Name: bbraunconsignmentstemps; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bbraunconsignmentstemps (
    productid character varying(36) NOT NULL,
    itemcode character varying(30),
    description character varying(80),
    transqty numeric(18,8),
    produomid character varying(36),
    produom character varying(20),
    convfactor numeric(18,8),
    slocqtyonhand numeric(18,8),
    slocuomid character varying(36),
    slocuom character varying(20),
    taxcodeid character varying(36),
    taxcode character varying(8),
    taxrate numeric(18,8),
    companyid character varying(36),
    deptid character varying(36),
    currprice numeric(23,8)
)
 DISTRIBUTED BY (productid);


ALTER TABLE staging_mdmhits2_klgsh.bbraunconsignmentstemps OWNER TO gpadmin;

--
-- TOC entry 307 (class 1259 OID 16531)
-- Name: bedallocations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedallocations (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    bedid character varying(36) NOT NULL,
    allodatetime timestamp without time zone,
    isisolated boolean NOT NULL,
    islodgerbed boolean NOT NULL,
    isbabybed boolean,
    stdatetime timestamp without time zone,
    enddatetime timestamp without time zone,
    noteexist boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    isolatedreasonid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedallocations OWNER TO gpadmin;

--
-- TOC entry 308 (class 1259 OID 16534)
-- Name: bedbookings; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedbookings (
    id character varying(36) NOT NULL,
    bedid character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    episodeid character varying(36),
    bookingstartdate timestamp without time zone NOT NULL,
    bookingenddate timestamp without time zone NOT NULL,
    bookingfor timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL,
    expirydatetime timestamp without time zone NOT NULL,
    remarks character varying(100),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    admtdoctorid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    iscompleted boolean,
    iscancelled boolean,
    cancelledreason character varying(100)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedbookings OWNER TO gpadmin;

--
-- TOC entry 318 (class 1259 OID 16564)
-- Name: beds; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.beds (
    id character varying(36) NOT NULL,
    roomseq integer,
    bedno character varying(8) NOT NULL,
    roomid character varying(36),
    bedtypeid character varying(36) NOT NULL,
    telext integer,
    statistic boolean,
    bedstatusid character varying(36),
    bedstatustypeid character varying(36),
    isbabybed boolean,
    isisolated boolean,
    chargecodeid character varying(36),
    lodgerchargecodeid character varying(36),
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    topposition integer,
    lastepisodeid character varying(36),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    comment character varying(300),
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.beds OWNER TO gpadmin;

--
-- TOC entry 309 (class 1259 OID 16537)
-- Name: bedstatus; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedstatus (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    bedgroupid character varying(36),
    description character varying(75),
    remarks character varying(250),
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedstatus OWNER TO gpadmin;

--
-- TOC entry 310 (class 1259 OID 16540)
-- Name: bedstatusbedstatustypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedstatusbedstatustypes (
    id character varying(36) NOT NULL,
    bedstatusid character varying(36),
    bedstatustypeid character varying(36),
    sequence integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedstatusbedstatustypes OWNER TO gpadmin;

--
-- TOC entry 311 (class 1259 OID 16543)
-- Name: bedstatusgroup; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedstatusgroup (
    id character varying(36) NOT NULL,
    groupcode character varying(5) NOT NULL,
    description character varying(50) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedstatusgroup OWNER TO gpadmin;

--
-- TOC entry 312 (class 1259 OID 16546)
-- Name: bedstatuslogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedstatuslogs (
    id character varying(36) NOT NULL,
    bedid character varying(36),
    bedstatusid character varying(36),
    patientid character varying(36),
    entrydate timestamp without time zone,
    logcode character varying(50),
    remark character varying(500),
    status character(3),
    noteexist boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedstatuslogs OWNER TO gpadmin;

--
-- TOC entry 313 (class 1259 OID 16549)
-- Name: bedstatustypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedstatustypes (
    id character varying(36) NOT NULL,
    code character(10) NOT NULL,
    description character varying(100) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedstatustypes OWNER TO gpadmin;

--
-- TOC entry 314 (class 1259 OID 16552)
-- Name: bedsubstatus; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedsubstatus (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    description character varying(40) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist smallint NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    ispharmacy boolean,
    isbilling boolean,
    ismco boolean,
    bedstatusid character varying(36),
    isward boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedsubstatus OWNER TO gpadmin;

--
-- TOC entry 315 (class 1259 OID 16555)
-- Name: bedtransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedtransactions (
    id character varying(36) NOT NULL,
    bedid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    allodatetime timestamp without time zone NOT NULL,
    isisolated boolean NOT NULL,
    isolatedreason character varying(100),
    islodgerbed boolean NOT NULL,
    stdatetime timestamp without time zone NOT NULL,
    enddatetime timestamp without time zone,
    isactive boolean NOT NULL,
    isbabybed boolean,
    transrefid character varying(36),
    transreftype character varying(10),
    companyid character varying(36) NOT NULL,
    status character varying(4) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedtransactions OWNER TO gpadmin;

--
-- TOC entry 317 (class 1259 OID 16561)
-- Name: bedtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedtypes (
    id character varying(36) NOT NULL,
    bedtype character varying(30) NOT NULL,
    description character varying(50),
    bedchargecodeid character varying(36),
    lodgerchargecodeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedtypes OWNER TO gpadmin;

--
-- TOC entry 316 (class 1259 OID 16558)
-- Name: bedtypewaitlists; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.bedtypewaitlists (
    id character varying(36) NOT NULL,
    bedtypeid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    listeddate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateduserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.bedtypewaitlists OWNER TO gpadmin;

--
-- TOC entry 319 (class 1259 OID 16567)
-- Name: billdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.billdetails (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL,
    billtypemasterid character varying(36) NOT NULL,
    mmamasterid character varying(36),
    chargegroupid character varying(36) NOT NULL,
    regdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    chargetransid character varying(36) NOT NULL,
    uomid character varying(36),
    debtoractheaderid character varying(36) NOT NULL,
    docref character varying(30),
    transdate timestamp without time zone NOT NULL,
    counter numeric(18,0),
    costcode character varying(4),
    billdate timestamp without time zone NOT NULL,
    unitprice numeric(21,2) NOT NULL,
    quantity numeric(21,2) NOT NULL,
    amount numeric(21,2) NOT NULL,
    dracccode character varying(30),
    cracccode character varying(30),
    taxamount numeric(21,2) NOT NULL,
    invgroup character varying(4),
    billed boolean,
    arprocess boolean,
    discountamount numeric(21,2) NOT NULL,
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    iscancelled boolean NOT NULL,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    financeoperation character varying(1),
    taxdetailid character varying(36),
    taxcalculated boolean,
    postprocessed boolean,
    postprocessid character varying(36),
    ispostprocessed boolean,
    line integer,
    auditno numeric(18,0) NOT NULL,
    doctorid character varying(36),
    invcode character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.billdetails OWNER TO gpadmin;

--
-- TOC entry 320 (class 1259 OID 16570)
-- Name: billsums; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.billsums (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL,
    chargeclasseid character varying(36),
    chargegroupid character varying(36) NOT NULL,
    debtoractheaderid character varying(36) NOT NULL,
    description character varying(50),
    quantity numeric(18,2) NOT NULL,
    amount numeric(18,2) NOT NULL,
    outamt numeric(18,2) NOT NULL,
    taxamt numeric(18,2) NOT NULL,
    classlevel integer,
    line integer,
    invcode character varying(36),
    discountamount numeric(18,2) NOT NULL,
    docref character varying(30),
    conversion boolean,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    iscancelled boolean NOT NULL,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    drtaxinvid character varying(36),
    doctorid character varying(36),
    postprocessid character varying(36),
    ispostprocessed boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.billsums OWNER TO gpadmin;

--
-- TOC entry 321 (class 1259 OID 16573)
-- Name: billtrackings; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.billtrackings (
    id character varying(36) NOT NULL,
    debtoractheaderid character varying(36),
    code character varying(10),
    description character varying(100),
    trackdate timestamp without time zone,
    levelno integer,
    trackno integer,
    line integer,
    comment character varying(1000),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.billtrackings OWNER TO gpadmin;

--
-- TOC entry 322 (class 1259 OID 16576)
-- Name: billtypemasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.billtypemasters (
    id character varying(36) NOT NULL,
    pricetypeid character varying(36) NOT NULL,
    type character varying(2),
    billtypecode character varying(20) NOT NULL,
    description character varying(150),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.billtypemasters OWNER TO gpadmin;

--
-- TOC entry 325 (class 1259 OID 16585)
-- Name: canceloperations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.canceloperations (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    appfunctionid character varying(36),
    cancelrecordid character varying(36) NOT NULL,
    activityname character varying(150) NOT NULL,
    usercomment character varying(200) NOT NULL,
    canceleduserid character varying(36) NOT NULL,
    canceldate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.canceloperations OWNER TO gpadmin;

--
-- TOC entry 326 (class 1259 OID 16588)
-- Name: cardcenters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cardcenters (
    id character varying(36) NOT NULL,
    cardcode character varying(16),
    name character varying(60) NOT NULL,
    address1 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    postcode integer,
    stateid character varying(36),
    countryid character varying(36),
    telno character varying(40),
    telno2 character varying(40),
    faxno character varying(40),
    currecyid character varying(36),
    contactid character varying(100),
    bankaccount character varying(40),
    clearday integer,
    effectddate timestamp without time zone,
    glaccountid character varying(36),
    glcostcenterid character varying(36),
    openingbalance numeric(17,2),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cardcenters OWNER TO gpadmin;

--
-- TOC entry 327 (class 1259 OID 16591)
-- Name: cardmembers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cardmembers (
    id character varying(36) NOT NULL,
    membershipcardid character varying(36) NOT NULL,
    relationshipid character varying(36),
    companyid character varying(36) NOT NULL,
    membername character varying(50) NOT NULL,
    othericnumber character varying(36),
    newicnumber character varying(36),
    iscardholder boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL,
    status character varying(3) NOT NULL,
    dob timestamp without time zone NOT NULL,
    mrn character varying(50),
    familycodeid character varying(36) NOT NULL,
    otheridtype character varying(36),
    patientid character varying(36),
    remarks character varying(200)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cardmembers OWNER TO gpadmin;

--
-- TOC entry 328 (class 1259 OID 16594)
-- Name: cardtypefamilycodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cardtypefamilycodes (
    id character varying(36) NOT NULL,
    cardtypeid character varying(36) NOT NULL,
    familycodeid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    "limit" integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cardtypefamilycodes OWNER TO gpadmin;

--
-- TOC entry 329 (class 1259 OID 16597)
-- Name: cardtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cardtypes (
    id character varying(36) NOT NULL,
    code character varying(36) NOT NULL,
    description character varying(100),
    expirycode boolean,
    status character varying(3) NOT NULL,
    activefamily boolean,
    vipstatus boolean,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cardtypes OWNER TO gpadmin;

--
-- TOC entry 330 (class 1259 OID 16600)
-- Name: casegroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.casegroups (
    id character varying(36) NOT NULL,
    casegroupcode character varying(8),
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.casegroups OWNER TO gpadmin;

--
-- TOC entry 331 (class 1259 OID 16603)
-- Name: casetypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.casetypes (
    id character varying(36) NOT NULL,
    casecode character varying(4) NOT NULL,
    description character varying(40),
    casegroupid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.casetypes OWNER TO gpadmin;

--
-- TOC entry 332 (class 1259 OID 16606)
-- Name: categories; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.categories (
    id character varying(36) NOT NULL,
    catcode character varying(50),
    description character varying(100),
    stockaccountid character varying(36),
    costaccountid character varying(36),
    adjaccountid character varying(36),
    source character varying(4),
    woffaccountid character varying(36),
    expaccountid character varying(36),
    loanaccountid character varying(36),
    cattype character varying(4),
    ispovalidated boolean,
    accrualaccountid character varying(36),
    stocktakeaccountid character varying(36),
    stat character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxmasterid character varying(36),
    productgroupid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.categories OWNER TO gpadmin;

--
-- TOC entry 333 (class 1259 OID 16609)
-- Name: categories_tmpdu; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.categories_tmpdu (
    id character varying(36),
    catcode character varying(50),
    description character varying(100),
    stockacct character varying(36),
    cosacct character varying(36),
    adjacct character varying(36),
    source character varying(4),
    woffacct character varying(36),
    expacct character varying(36),
    loanacct character varying(36),
    cattype character varying(4),
    povalidate boolean NOT NULL,
    accrualacc character varying(36),
    stktakeadjacct character varying(36),
    stat character varying(3),
    compcode character varying(36),
    adduser character varying(36),
    adddate timestamp without time zone,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.categories_tmpdu OWNER TO gpadmin;

--
-- TOC entry 323 (class 1259 OID 16579)
-- Name: cbtransactiondetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cbtransactiondetails (
    id character varying(36) NOT NULL,
    cbtransactionid character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    docdate timestamp without time zone,
    documentno character varying(24),
    amount numeric(21,8),
    reference character varying(255),
    cbflag boolean,
    refsrc character varying(36),
    reftrantype character varying(4),
    refauditno integer,
    bankid character varying(36),
    paymodeid character varying(36),
    commamt numeric(19,8),
    categoryid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8),
    debtoractheaderid character varying(36),
    departmentid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cbtransactiondetails OWNER TO gpadmin;

--
-- TOC entry 324 (class 1259 OID 16582)
-- Name: cbtransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.cbtransactions (
    id character varying(36) NOT NULL,
    bankid character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    transtype character varying(4),
    auditno integer,
    postdate timestamp without time zone,
    fiscalyearid character varying(36),
    periodid character varying(36),
    chequetransactionid character varying(36),
    amount numeric(21,8),
    remarks character varying(255),
    bitype character varying(50),
    referance character varying(255),
    stat character varying(2),
    refsource character varying(4),
    reftranstype character varying(4),
    refauditno integer,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.cbtransactions OWNER TO gpadmin;

--
-- TOC entry 334 (class 1259 OID 16612)
-- Name: chargebilltypemarkups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargebilltypemarkups (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    billtypeid character varying(36),
    chargegroupid character varying(36),
    chargemasterid character varying(36),
    markuplevel character varying(3) NOT NULL,
    markupprecentage numeric(18,2) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    ischecknextlevel boolean NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    amount numeric(21,8),
    discountchargeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargebilltypemarkups OWNER TO gpadmin;

--
-- TOC entry 335 (class 1259 OID 17723)
-- Name: chargeclasses; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargeclasses (
    id character varying(36) NOT NULL,
    classcode character varying(4) NOT NULL,
    description character varying(40),
    classlevel integer,
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargeclasses OWNER TO gpadmin;

--
-- TOC entry 336 (class 1259 OID 17726)
-- Name: chargediscounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargediscounts (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    billtypeid character varying(36),
    chargegroupid character varying(36),
    chargemasterid character varying(36),
    discountlevel character varying(3) NOT NULL,
    discountprecentage numeric(18,2) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    ischecknextlevel boolean NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    amount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargediscounts OWNER TO gpadmin;

--
-- TOC entry 337 (class 1259 OID 17729)
-- Name: chargegroupdepartments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargegroupdepartments (
    id character varying(36) NOT NULL,
    chargegroupid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    remarks character varying(6) NOT NULL,
    servicetype character varying(20)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargegroupdepartments OWNER TO gpadmin;

--
-- TOC entry 338 (class 1259 OID 17732)
-- Name: chargegroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargegroups (
    id character varying(36) NOT NULL,
    groupcode character varying(4) NOT NULL,
    description character varying(40),
    queueflag boolean,
    sequencenumber integer,
    status character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    standardcodeflag boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargegroups OWNER TO gpadmin;

--
-- TOC entry 339 (class 1259 OID 17735)
-- Name: chargemasterbilltypeaccounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargemasterbilltypeaccounts (
    id character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    billtypeid character varying(36) NOT NULL,
    glacccode character varying(10) NOT NULL,
    costcode character varying(10) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargemasterbilltypeaccounts OWNER TO gpadmin;

--
-- TOC entry 340 (class 1259 OID 17738)
-- Name: chargemasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargemasters (
    id character varying(36) NOT NULL,
    chargecode character varying(30) NOT NULL,
    description character varying(150),
    chargeclassid character varying(36),
    uomid character varying(36) NOT NULL,
    packingqty integer,
    inventoryitem boolean,
    priceoverwrite boolean,
    usercreated character varying(200),
    billuom character varying(4),
    datecreated timestamp without time zone,
    doctorstatid boolean,
    queueflag boolean,
    costcode character varying(8),
    chargeflag boolean,
    inpatientaccountcode character varying(8),
    outpatientaccountcode character varying(8),
    iscostdept boolean,
    costdepartmentid character varying(36),
    invgroup character varying(4),
    apprccode character varying(6),
    appracct character varying(8),
    priceactive boolean,
    constype character varying(1),
    dosage boolean,
    druggroupid character varying(36),
    subgroup character varying(36),
    itemgroup character varying(8),
    sequrnceno integer,
    instruction character varying(255),
    groupchargecode character varying(8),
    chargecodeflag character varying(8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    chargetypeid character varying(36) NOT NULL,
    chargegroupid character varying(36) NOT NULL,
    revenuedepartmentid character varying(36),
    isautopull boolean,
    ischargeifmore boolean,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone,
    isoxytoxic boolean,
    isoxytoxicdefault boolean,
    isrevenuedept boolean,
    isdiscount boolean,
    brandname character varying(60),
    isdietitem boolean,
    isconsprocess boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargemasters OWNER TO gpadmin;

--
-- TOC entry 341 (class 1259 OID 17741)
-- Name: chargetaxes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargetaxes (
    id character varying(36) NOT NULL,
    compnayid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    taxmasterid character varying(36) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargetaxes OWNER TO gpadmin;

--
-- TOC entry 342 (class 1259 OID 17744)
-- Name: chargetransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargetransactions (
    id character varying(36) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    docref character varying(30),
    chargemasterid character varying(36),
    transdate timestamp without time zone,
    transtype character varying(36),
    billcode numeric(18,0),
    revcd character varying(30),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    doctorid character varying(36),
    unitprice numeric(21,2),
    quantity numeric(21,2),
    amount numeric(21,2),
    taxamount numeric(21,2),
    uomid character varying(36),
    billtypemasterid character varying(36),
    queuestatid character varying(36),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocess boolean,
    billno numeric(18,0),
    departmentid character varying(36),
    reqdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(30),
    resulttype character varying(4),
    resultstatus numeric(18,0),
    inventory boolean,
    updinv numeric(18,0),
    invbatch numeric(18,0),
    doscode character varying(5),
    duration numeric(18,0),
    instructionid character varying(36),
    discountamount numeric(21,2),
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    frequencyid character varying(36),
    ftxtdosage character varying(255),
    dosageid character varying(36),
    svalueone integer,
    svaluetwo integer,
    addinstructions character varying(255),
    debtormasterid character varying(50),
    invgroup character varying(2),
    packageheaderid character varying(36),
    packagemasterid character varying(36),
    isprocessed boolean,
    status character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    hourtype character varying(20),
    queueentryid character varying(36),
    transtypeid character varying(36),
    taxdetailid character varying(36),
    isissued boolean,
    taxcalculated boolean,
    baseunitprice numeric(19,2),
    markuppercentage numeric(19,2),
    ispriceoverride boolean,
    discountchargeid character varying(36),
    financeoperation character varying(1),
    iscancelled boolean,
    cancelledby character varying(36),
    cancelledreason character varying(250),
    cancelleddate timestamp without time zone,
    isupdated boolean,
    auditno numeric(18,0) NOT NULL,
    medcarechargeid bigint,
    hitstransfer boolean,
    hitstransferdate timestamp without time zone,
    transdateonly character varying,
    transdatetruncatedtominutes character varying
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargetransactions OWNER TO gpadmin;

--
-- TOC entry 343 (class 1259 OID 17750)
-- Name: chargetransactionsextents; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargetransactionsextents (
    id character varying(36) NOT NULL,
    chargetransactionid character varying(36) NOT NULL,
    date timestamp without time zone,
    plantype character varying(10),
    orderdate timestamp without time zone,
    ordertime timestamp without time zone,
    panelhdrid character varying(36),
    priority character varying(20),
    side character varying(20),
    focus character varying(20),
    resulttype character varying(30),
    repeat integer,
    locationid character varying(36),
    donebyid character varying(36),
    queueentryid character varying(36),
    orderrefid character varying(36),
    transref character varying(10),
    processtype character varying(10),
    presdtlid character varying(36),
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargetransactionsextents OWNER TO gpadmin;

--
-- TOC entry 344 (class 1259 OID 17753)
-- Name: chargetypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chargetypes (
    id character varying(36) NOT NULL,
    chargetype character varying(4) NOT NULL,
    description character varying(60),
    sequencenumber integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    chargegroupid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chargetypes OWNER TO gpadmin;

--
-- TOC entry 345 (class 1259 OID 17756)
-- Name: chequeregisters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chequeregisters (
    id character varying(36) NOT NULL,
    bankid character varying(36),
    startchequeno character varying(10),
    endchequeno character varying(10),
    chequequantity integer,
    stat character varying(2),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chequeregisters OWNER TO gpadmin;

--
-- TOC entry 346 (class 1259 OID 17759)
-- Name: chequetransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.chequetransactions (
    id character varying(36) NOT NULL,
    bankid character varying(36),
    chequeno character varying(10),
    amount numeric(21,8),
    remarks character varying(255),
    trantype character varying(4),
    stat character varying(2),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.chequetransactions OWNER TO gpadmin;

--
-- TOC entry 347 (class 1259 OID 17762)
-- Name: citizenships; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.citizenships (
    id character varying(36) NOT NULL,
    citizencode character varying(4) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.citizenships OWNER TO gpadmin;

--
-- TOC entry 348 (class 1259 OID 17765)
-- Name: companies; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.companies (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    defaultcontactid character varying(36),
    gstno character varying(20)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.companies OWNER TO gpadmin;

--
-- TOC entry 349 (class 1259 OID 17768)
-- Name: companydetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.companydetails (
    id character varying(36) NOT NULL,
    companyid character varying(36),
    registrationno character varying(36),
    address1 character varying(50),
    address2 character varying(50),
    address3 character varying(50),
    address4 character varying(50),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.companydetails OWNER TO gpadmin;

--
-- TOC entry 350 (class 1259 OID 17771)
-- Name: companyinfos; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.companyinfos (
    id integer NOT NULL,
    companyid character varying(36),
    phoneno character varying(50),
    faxno character varying(50),
    website character varying(100),
    email character varying(100)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.companyinfos OWNER TO gpadmin;

--
-- TOC entry 351 (class 1259 OID 17774)
-- Name: companylists; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.companylists (
    id character varying(50) NOT NULL,
    code character varying(50),
    name character varying(50),
    status character varying(50),
    updateuserid character varying(50),
    updatedate character varying(50),
    noteexist character varying(50),
    defaultcontactid character varying(50),
    gstno character varying(50)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.companylists OWNER TO gpadmin;

--
-- TOC entry 352 (class 1259 OID 17777)
-- Name: consignmentsku; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.consignmentsku (
    skuno character varying(50),
    itemcode character varying(50) NOT NULL,
    itemdesc character varying(100),
    deptcode character(10)
)
 DISTRIBUTED BY (skuno);


ALTER TABLE staging_mdmhits2_klgsh.consignmentsku OWNER TO gpadmin;

--
-- TOC entry 353 (class 1259 OID 17780)
-- Name: contactbank; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.contactbank (
    bankid character varying(36) NOT NULL,
    contacts_id character varying(100) NOT NULL
)
 DISTRIBUTED BY (bankid);


ALTER TABLE staging_mdmhits2_klgsh.contactbank OWNER TO gpadmin;

--
-- TOC entry 354 (class 1259 OID 17783)
-- Name: contactdepartment; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.contactdepartment (
    departments_id character varying(36) NOT NULL,
    contacts_id character varying(100) NOT NULL
)
 DISTRIBUTED BY (departments_id);


ALTER TABLE staging_mdmhits2_klgsh.contactdepartment OWNER TO gpadmin;

--
-- TOC entry 355 (class 1259 OID 17786)
-- Name: contactemployee; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.contactemployee (
    employees_id character varying(36) NOT NULL,
    contacts_id character varying(100) NOT NULL
)
 DISTRIBUTED BY (employees_id);


ALTER TABLE staging_mdmhits2_klgsh.contactemployee OWNER TO gpadmin;

--
-- TOC entry 357 (class 1259 OID 17792)
-- Name: contacts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.contacts (
    id character varying(100) NOT NULL,
    contactname character varying(255) NOT NULL,
    titleid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    contacttypeid character varying(36) NOT NULL,
    addresstypeid character varying(36),
    address1 character varying(255) NOT NULL,
    address2 character varying(255) NOT NULL,
    address3 character varying(255) NOT NULL,
    address4 character varying(255) NOT NULL,
    zip character varying(10) NOT NULL,
    city character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    fax character varying(100) NOT NULL,
    mobile character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    countryid character varying(36) NOT NULL,
    stateid character varying(36) NOT NULL,
    postalcodeid character varying(36) NOT NULL,
    areaid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.contacts OWNER TO gpadmin;

--
-- TOC entry 356 (class 1259 OID 17789)
-- Name: contacttypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.contacttypes (
    id character varying(36) NOT NULL,
    typecode character varying(36) NOT NULL,
    description character varying(40),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexists boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.contacttypes OWNER TO gpadmin;

--
-- TOC entry 358 (class 1259 OID 17798)
-- Name: costcenters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.costcenters (
    id character varying(36) NOT NULL,
    costcode character varying(8) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.costcenters OWNER TO gpadmin;

--
-- TOC entry 359 (class 1259 OID 17801)
-- Name: countries; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.countries (
    id character varying(36) NOT NULL,
    countrycode character varying(4) NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.countries OWNER TO gpadmin;

--
-- TOC entry 360 (class 1259 OID 17804)
-- Name: crcontrolgrps; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.crcontrolgrps (
    id character varying(36) NOT NULL,
    creditcontrogroup character varying(36) NOT NULL,
    description character varying(50),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.crcontrolgrps OWNER TO gpadmin;

--
-- TOC entry 361 (class 1259 OID 17807)
-- Name: crossref; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.crossref (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    modules character varying(36) NOT NULL,
    groupcode character varying(36) NOT NULL,
    altcode character varying(36) NOT NULL,
    hiscode character varying(36) NOT NULL,
    queueno integer,
    remark character varying(100),
    description character varying(100),
    quecode character varying(36),
    remark2 character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.crossref OWNER TO gpadmin;

--
-- TOC entry 362 (class 1259 OID 17810)
-- Name: currencies; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.currencies (
    id character varying(36) NOT NULL,
    code character varying(10),
    name character varying(60),
    islocalcurrency boolean,
    currencysymbol character varying(10),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.currencies OWNER TO gpadmin;

--
-- TOC entry 363 (class 1259 OID 17813)
-- Name: currencyrates; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.currencyrates (
    id character varying(36) NOT NULL,
    currencyid character varying(36),
    effectivedate timestamp without time zone,
    rate numeric(19,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.currencyrates OWNER TO gpadmin;

--
-- TOC entry 364 (class 1259 OID 17816)
-- Name: debtoractheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtoractheaders (
    id character varying(36) NOT NULL,
    appoperationid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    line integer,
    currencyid character varying(36) NOT NULL,
    entryuserid character varying(36) NOT NULL,
    payername character varying(100),
    receiptdetailid character varying(36),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    billdebtorid character varying(50),
    dischargedestinationid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    deposittypeid character varying(36),
    tranauditno bigint NOT NULL,
    amount numeric(21,2) NOT NULL,
    outamount numeric(21,2) NOT NULL,
    entrydate timestamp without time zone NOT NULL,
    displaydocno character varying(25),
    remarks character varying(500),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    iscancelled boolean NOT NULL,
    cancelledby character varying(36),
    cancelledreason character varying(250),
    cancelleddate timestamp without time zone,
    isprinted boolean,
    printedby character varying(36),
    referance character varying(250),
    authno character varying(250),
    expdate timestamp without time zone,
    refrecordid character varying(36),
    financeoperation character varying(1),
    billdepositamount numeric(18,0),
    taxdetailid character varying(36),
    taxamount numeric(21,2),
    refno character varying(50),
    postprocessid character varying(36),
    ispostprocessed boolean,
    iscbflag boolean,
    isupdated boolean,
    chequebank character varying(100),
    chequebranch character varying(100),
    chequenumber character varying(200),
    chequeexpdate timestamp without time zone,
    authuserid character varying(36),
    issupbill boolean,
    receiveridno character varying(50),
    receivername character varying(150)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtoractheaders OWNER TO gpadmin;

--
-- TOC entry 365 (class 1259 OID 17822)
-- Name: debtorgroupexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtorgroupexceptions (
    id character varying(36) NOT NULL,
    chargegroupid character varying(36) NOT NULL,
    debtormasterid character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    description character varying(75),
    grouplimit numeric(18,2) NOT NULL,
    itemlimit numeric(18,2) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtorgroupexceptions OWNER TO gpadmin;

--
-- TOC entry 366 (class 1259 OID 17825)
-- Name: debtorgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtorgroups (
    id character varying(36) NOT NULL,
    debtorgroupcode character varying(36) NOT NULL,
    groupdescription character varying(50),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    typegr character varying(10),
    debtortypeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtorgroups OWNER TO gpadmin;

--
-- TOC entry 367 (class 1259 OID 17828)
-- Name: debtoritemexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtoritemexceptions (
    id character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    debtormasterid character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    description character varying(75),
    itemlimit numeric(18,2) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtoritemexceptions OWNER TO gpadmin;

--
-- TOC entry 368 (class 1259 OID 17831)
-- Name: debtormasteronlines; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtormasteronlines (
    id character varying(36) NOT NULL,
    debtorcode character varying(50) NOT NULL,
    name character varying(100),
    address character varying(100),
    debtortypeid character varying(36),
    status character varying(3) NOT NULL,
    hospital character varying(36),
    hospitalcode character varying(50),
    debtorgroupid character varying(36),
    olddebtorcode character varying(50),
    icnopassport character varying(36),
    adduserid character varying(36) NOT NULL,
    adddate character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtormasteronlines OWNER TO gpadmin;

--
-- TOC entry 369 (class 1259 OID 17834)
-- Name: debtormasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtormasters (
    id character varying(50) NOT NULL,
    debtortypeid character varying(36) NOT NULL,
    debtorcode character varying(50) NOT NULL,
    olddebtorcode character varying(50),
    name character varying(100) NOT NULL,
    address1 character varying(100),
    address2 character varying(100),
    address3 character varying(100),
    address4 character varying(100),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36),
    contactid character varying(100),
    "position" character varying(20),
    teloffice character varying(30),
    fax character varying(40),
    billtypeid character varying(36),
    billtypeopid character varying(36),
    recstatus character varying(2),
    outamt numeric(19,4),
    depamt numeric(19,4),
    creditlimit numeric(19,4),
    debtorgroupid character varying(36),
    crgroup character varying(36),
    otheraddr1 character varying(40),
    otheraddr2 character varying(40),
    otheraddr3 character varying(40),
    otheraddr4 character varying(40),
    othertel character varying(30),
    requestgl boolean,
    creditterm integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    actdebglaccid character varying(36),
    actdebccodeid character varying(36),
    depglaccid character varying(36),
    depccodeid character varying(36),
    otheracctid character varying(36),
    otherccodeid character varying(36),
    contactname character varying(100),
    comments character varying(1000),
    hospitalcode character varying(10),
    adddate timestamp without time zone,
    adduserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtormasters OWNER TO gpadmin;

--
-- TOC entry 370 (class 1259 OID 17840)
-- Name: debtortypepaymodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtortypepaymodes (
    id character varying(36) NOT NULL,
    debtortypeid character varying(36) NOT NULL,
    paymodeid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtortypepaymodes OWNER TO gpadmin;

--
-- TOC entry 371 (class 1259 OID 17843)
-- Name: debtortypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.debtortypes (
    id character varying(36) NOT NULL,
    debtortypecode character varying(8) NOT NULL,
    ispatient boolean,
    description character varying(40),
    effectivedate timestamp without time zone,
    depccode character varying(6),
    depglacc character varying(6),
    actdebccode character varying(6),
    actdebglacc character varying(8),
    regfees boolean,
    typegrp character varying(8),
    updpayername boolean,
    updepisode boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    depcostcenterid character varying(36),
    depglaccountid character varying(36),
    actdebcostcenterid character varying(36),
    actdebglaccountid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.debtortypes OWNER TO gpadmin;

--
-- TOC entry 372 (class 1259 OID 17846)
-- Name: deliveryorderdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deliveryorderdetails (
    id character varying(36) NOT NULL,
    doheaderid character varying(36) NOT NULL,
    line integer NOT NULL,
    productid character varying(36) NOT NULL,
    productdescription character varying(80),
    supplierid character varying(36),
    productpriceid character varying(36) NOT NULL,
    uomid character varying(36) NOT NULL,
    orderquantity numeric(19,8) NOT NULL,
    deliveredquantity numeric(19,8) NOT NULL,
    taggedquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8) NOT NULL,
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8) NOT NULL,
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaseorderdetailid character varying(36) NOT NULL,
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deliveryorderdetails OWNER TO gpadmin;

--
-- TOC entry 373 (class 1259 OID 17849)
-- Name: deliveryorderdetailstemp30march; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deliveryorderdetailstemp30march (
    id character varying(36) NOT NULL,
    doheaderid character varying(36) NOT NULL,
    line integer NOT NULL,
    productid character varying(36) NOT NULL,
    productdescription character varying(80),
    supplierid character varying(36),
    productpriceid character varying(36) NOT NULL,
    uomid character varying(36) NOT NULL,
    orderquantity numeric(19,8) NOT NULL,
    deliveredquantity numeric(19,8) NOT NULL,
    taggedquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8) NOT NULL,
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8) NOT NULL,
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaseorderdetailid character varying(36) NOT NULL,
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deliveryorderdetailstemp30march OWNER TO gpadmin;

--
-- TOC entry 374 (class 1259 OID 17852)
-- Name: deliveryorderheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deliveryorderheaders (
    id character varying(36) NOT NULL,
    grnnumber character varying(10) NOT NULL,
    invoicenum character varying(100) NOT NULL,
    delordernum character varying(30) NOT NULL,
    purchaseorderheaderid character varying(36) NOT NULL,
    purchasedeptid character varying(36),
    deliverydeptid character varying(36),
    receivedate timestamp without time zone,
    deliverydate timestamp without time zone,
    supplierid character varying(36),
    creditorid character varying(36),
    dostatus character varying(36) NOT NULL,
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    dispatchperson character varying(100),
    entereddate timestamp without time zone,
    recordno bigint,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    appoperationid character varying(36),
    isimport boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deliveryorderheaders OWNER TO gpadmin;

--
-- TOC entry 375 (class 1259 OID 17855)
-- Name: deliveryorderheaderstemp30march; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deliveryorderheaderstemp30march (
    id character varying(36) NOT NULL,
    grnnumber character varying(10) NOT NULL,
    invoicenum character varying(10) NOT NULL,
    delordernum character varying(30) NOT NULL,
    purchaseorderheaderid character varying(36) NOT NULL,
    purchasedeptid character varying(36),
    deliverydeptid character varying(36),
    receivedate timestamp without time zone,
    deliverydate timestamp without time zone,
    supplierid character varying(36),
    creditorid character varying(36),
    dostatus character varying(36) NOT NULL,
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    dispatchperson character varying(100),
    entereddate timestamp without time zone,
    recordno bigint,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    appoperationid character varying(36),
    isimport boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deliveryorderheaderstemp30march OWNER TO gpadmin;

--
-- TOC entry 376 (class 1259 OID 17858)
-- Name: departmentlocations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.departmentlocations (
    id character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    locationid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.departmentlocations OWNER TO gpadmin;

--
-- TOC entry 378 (class 1259 OID 17864)
-- Name: departments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.departments (
    id character varying(36) NOT NULL,
    code character varying(20),
    name character varying(100),
    costcenterid character varying(36) NOT NULL,
    floorid character varying(36),
    ischargedept boolean NOT NULL,
    isadmissiondept boolean NOT NULL,
    isqueuedept boolean NOT NULL,
    isregistrationdept boolean NOT NULL,
    ispurchasedept boolean NOT NULL,
    isword boolean NOT NULL,
    isdispensedept boolean NOT NULL,
    defaultcontactid character varying(36) NOT NULL,
    oeprocesstypes character varying(6),
    topposition integer,
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    isdoctor boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.departments OWNER TO gpadmin;

--
-- TOC entry 377 (class 1259 OID 17861)
-- Name: departmentuser; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.departmentuser (
    departments_id character varying(36) NOT NULL,
    users_id character varying(36) NOT NULL
)
 DISTRIBUTED BY (departments_id);


ALTER TABLE staging_mdmhits2_klgsh.departmentuser OWNER TO gpadmin;

--
-- TOC entry 379 (class 1259 OID 17867)
-- Name: deposittransactiontypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deposittransactiontypes (
    id character varying(36) NOT NULL,
    deposittransactiontype character varying(2) NOT NULL,
    source character varying(2),
    description character varying(30),
    updpayername boolean,
    updepisode boolean,
    depccode character varying(3),
    depglacc character varying(8),
    manualalloc boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deposittransactiontypes OWNER TO gpadmin;

--
-- TOC entry 380 (class 1259 OID 17870)
-- Name: deposittypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.deposittypes (
    id character varying(36) NOT NULL,
    deposittypecode character varying(5) NOT NULL,
    transgroup character varying(4),
    transtypeid character varying(36),
    description character varying(50) NOT NULL,
    isupdatepayername boolean NOT NULL,
    isupdateepisode boolean NOT NULL,
    isupdatedebtor boolean NOT NULL,
    isallowautoallocation boolean NOT NULL,
    isallowmanualallocation boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    costcenterid character varying(36),
    glaccountid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.deposittypes OWNER TO gpadmin;

--
-- TOC entry 381 (class 1259 OID 17873)
-- Name: designations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.designations (
    id character varying(36) NOT NULL,
    code character varying(50) NOT NULL,
    status character varying(3) NOT NULL,
    description character varying(250),
    companyid character varying(36),
    noteexist boolean,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.designations OWNER TO gpadmin;

--
-- TOC entry 382 (class 1259 OID 17876)
-- Name: diagnosis; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.diagnosis (
    id character varying(36) NOT NULL,
    icdcodeid character varying(36) NOT NULL,
    crossref character varying(6),
    dateactivated timestamp without time zone,
    datedeactivated timestamp without time zone,
    description character varying(2000),
    lowage integer,
    highage integer,
    sex character varying(1),
    coderest integer,
    area integer,
    ageflag integer,
    extra character varying(10),
    soundex character varying(15),
    descsdx character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.diagnosis OWNER TO gpadmin;

--
-- TOC entry 384 (class 1259 OID 17885)
-- Name: diagnosis_diagnosisgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.diagnosis_diagnosisgroups (
    id character varying(36) NOT NULL,
    diagnosisid character varying(36) NOT NULL,
    diagnosisgroupid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.diagnosis_diagnosisgroups OWNER TO gpadmin;

--
-- TOC entry 383 (class 1259 OID 17882)
-- Name: diagnosisgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.diagnosisgroups (
    id character varying(36) NOT NULL,
    groupcode character varying(8) NOT NULL,
    description character varying(50),
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.diagnosisgroups OWNER TO gpadmin;

--
-- TOC entry 385 (class 1259 OID 17888)
-- Name: dietfooditems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.dietfooditems (
    id character varying(36) NOT NULL,
    fooditemid character varying(36) NOT NULL,
    dietid character varying(36) NOT NULL,
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.dietfooditems OWNER TO gpadmin;

--
-- TOC entry 386 (class 1259 OID 17891)
-- Name: diets; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.diets (
    id character varying(36) NOT NULL,
    dietcode character varying(8) NOT NULL,
    description character varying(50),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.diets OWNER TO gpadmin;

--
-- TOC entry 387 (class 1259 OID 17894)
-- Name: dischargedestinations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.dischargedestinations (
    id character varying(36) NOT NULL,
    dischargedestinationcode character varying(4) NOT NULL,
    description character varying(30),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.dischargedestinations OWNER TO gpadmin;

--
-- TOC entry 388 (class 1259 OID 17897)
-- Name: disciplines; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.disciplines (
    id character varying(36) NOT NULL,
    disciplinecode character varying(4) NOT NULL,
    description character varying(30),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.disciplines OWNER TO gpadmin;

--
-- TOC entry 389 (class 1259 OID 17900)
-- Name: dispositionendcasedtls; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.dispositionendcasedtls (
    id character varying(36) NOT NULL,
    dispositionendcasehdrid character varying(36) NOT NULL,
    chragemasterid character varying(36) NOT NULL,
    chargehourstype character varying(50),
    consultanthours numeric(18,2),
    amount numeric(18,4) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.dispositionendcasedtls OWNER TO gpadmin;

--
-- TOC entry 390 (class 1259 OID 17903)
-- Name: dispositionendcasehdrs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.dispositionendcasehdrs (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    isendcase boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.dispositionendcasehdrs OWNER TO gpadmin;

--
-- TOC entry 391 (class 1259 OID 17906)
-- Name: doctorallocations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorallocations (
    id character varying(36) NOT NULL,
    paramsourceid character varying(36),
    trantypeid character varying(36),
    auditno integer,
    lineno integer,
    drtnauditno integer,
    doctorid character varying(36),
    chargemasterid character varying(36),
    allocdate timestamp without time zone,
    drallocamt numeric(21,8),
    drappamt numeric(21,8),
    cccomamt numeric(21,8),
    approcess boolean,
    paymodesid character varying(36),
    drappstfamt numeric(21,8),
    drtnlineno integer,
    patientid character varying(36),
    episodeid character varying(36),
    drtnbillno integer,
    reccount integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    debtoractheaderid character varying(36),
    isprocess boolean,
    gstpayment numeric(21,8),
    gstmgtfee numeric(21,8),
    gstcommamt numeric(21,8),
    allocdateonly character varying
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorallocations OWNER TO gpadmin;

--
-- TOC entry 392 (class 1259 OID 17912)
-- Name: doctorceiling; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorceiling (
    id character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    episodetypeid character varying(36) NOT NULL,
    ceilingamount numeric(21,8) NOT NULL,
    ceilingpercentage numeric(19,8) NOT NULL,
    staffpercentage numeric(19,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorceiling OWNER TO gpadmin;

--
-- TOC entry 393 (class 1259 OID 17915)
-- Name: doctorcontributions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorcontributions (
    id character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    episodetypeid character varying(36) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    isconsultancy boolean,
    drpercentage numeric(18,8),
    amount numeric(21,8),
    staffpercentage numeric(18,8),
    staffamount numeric(21,8),
    corppercentage numeric(18,8),
    corpamount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorcontributions OWNER TO gpadmin;

--
-- TOC entry 394 (class 1259 OID 17918)
-- Name: doctorconvs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorconvs (
    id character varying(36) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    debtoractheaderid character varying(36),
    billdate timestamp without time zone,
    doctorsid character varying(36),
    chargemasterid character varying(36),
    trxdate timestamp without time zone,
    chargeamount numeric(21,8),
    orgoutamount numeric(21,8),
    debtorid character varying(50),
    billamount numeric(21,8),
    newoutamount numeric(21,8),
    rate numeric(21,8),
    ceilingamt numeric(21,8),
    drappamount numeric(21,8),
    drappoutamount numeric(21,8),
    drapppaid numeric(21,8),
    auditno integer,
    source character varying(16),
    transtype character varying(16),
    rate2 numeric(21,8),
    appoperationid character varying(36),
    line integer,
    transactiondate timestamp without time zone,
    drrefno character varying(50),
    totalincome numeric(21,8),
    dramount1 numeric(21,8),
    dramount2 numeric(21,8),
    invappoperationid character varying(36),
    invsource character varying(16),
    invtranstype character varying(16),
    invamount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone,
    convepisno character varying(36),
    convepistype character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorconvs OWNER TO gpadmin;

--
-- TOC entry 395 (class 1259 OID 17921)
-- Name: doctorgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorgroups (
    id character varying(36) NOT NULL,
    companyid character varying(36),
    groupcode character varying(4),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    effectivedate timestamp without time zone,
    doctorid character varying(36),
    name character varying(50),
    rate numeric(18,0),
    adduserid character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorgroups OWNER TO gpadmin;

--
-- TOC entry 396 (class 1259 OID 17924)
-- Name: doctorincomes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorincomes (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    doctorcode character varying(15),
    episodetypeid character varying(36) NOT NULL,
    totalincome numeric(21,8),
    year timestamp without time zone,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorincomes OWNER TO gpadmin;

--
-- TOC entry 397 (class 1259 OID 17927)
-- Name: doctorpreferencesdtls; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorpreferencesdtls (
    id character varying(36) NOT NULL,
    doctorpreferencehdrid character varying(36) NOT NULL,
    chargemsterid character varying(36) NOT NULL,
    dosageid character varying(36) NOT NULL,
    instructionid character varying(36) NOT NULL,
    quantity numeric(18,8) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorpreferencesdtls OWNER TO gpadmin;

--
-- TOC entry 398 (class 1259 OID 17930)
-- Name: doctorpreferenceshdrs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorpreferenceshdrs (
    id character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    prefsetname character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorpreferenceshdrs OWNER TO gpadmin;

--
-- TOC entry 402 (class 1259 OID 17942)
-- Name: doctors; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctors (
    id character varying(36) NOT NULL,
    doctorcode character varying(15) NOT NULL,
    doctorname character varying(250),
    companyname character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    address3 character varying(100),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36),
    restelno character varying(15),
    hphone character varying(15),
    offtelno character varying(15),
    disciplineid character varying(36),
    extenstion character varying(4),
    specialityid character varying(36),
    type character varying(25),
    doctorstatusid character varying(36),
    doctortype character varying(25),
    chargecodeid character varying(36),
    creditorid character varying(36),
    debtorid character varying(36),
    contraflag boolean,
    cbflag boolean,
    admissionright boolean,
    dateofresignation timestamp without time zone,
    departmentid character varying(36),
    costcodeid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    gstpay_processdate timestamp without time zone,
    ccomgst_processdate timestamp without time zone,
    ccom_processdate timestamp without time zone,
    mgtfee_processdate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctors OWNER TO gpadmin;

--
-- TOC entry 399 (class 1259 OID 17933)
-- Name: doctorstatus; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctorstatus (
    id character varying(36) NOT NULL,
    statuscode character varying(4) NOT NULL,
    description character varying(30),
    grpdoctype character varying(8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctorstatus OWNER TO gpadmin;

--
-- TOC entry 400 (class 1259 OID 17936)
-- Name: doctortaxinvoices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctortaxinvoices (
    id character varying(36) NOT NULL,
    appoperationid character varying(36) NOT NULL,
    debtoractheaderid character varying(36),
    auditno integer,
    line integer,
    drinvseq integer,
    doctorid character varying(36),
    totalamount numeric(21,8),
    doctoramount numeric(21,8),
    isdoctortaxinv boolean,
    totaltaxamount numeric(21,8),
    doctortaxamount numeric(21,8),
    headerstatus character varying(8),
    remarks character varying(250),
    field1 character varying(250),
    field2 character varying(250),
    field3 character varying(250),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    postprocessid character varying(36),
    ispostprocessed boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctortaxinvoices OWNER TO gpadmin;

--
-- TOC entry 401 (class 1259 OID 17939)
-- Name: doctortransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.doctortransactions (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    source character varying(20),
    transtype character varying(16),
    auditno integer,
    chargetransactionid character varying(36),
    doctorid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    transdate timestamp without time zone,
    refappoperationid character varying(36),
    refsource character varying(4),
    reftranstype character varying(4),
    debtoractheaderid character varying(36),
    billno integer,
    billdate timestamp without time zone,
    drrefno character varying(40),
    chargemasterid character varying(36),
    chargetransdate timestamp without time zone,
    chargeamount numeric(21,8),
    chargeoutamount numeric(21,8),
    invoiceamount numeric(21,8),
    drappamount numeric(21,8),
    drappoutamount numeric(21,8),
    drapppaid numeric(21,8),
    drpercentage integer,
    effectdate timestamp without time zone,
    episodetypeid character varying(36),
    drcontributionamt numeric(21,8),
    drstaffamt numeric(21,8),
    drstaffpercentage numeric(21,8),
    debtormasterid character varying(50),
    line integer,
    consultflag boolean,
    totalincome numeric(21,8),
    drpercentage1 numeric(21,8),
    dramount1 numeric(21,8),
    drpercentage2 numeric(21,8),
    dramount2 numeric(21,8),
    invcode character varying(16),
    fullpaiddate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone,
    previnvcode character varying(16),
    billdetailid character varying(36),
    gstpayment numeric(21,8),
    gstmgtfee numeric(21,8),
    mgtfee numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.doctortransactions OWNER TO gpadmin;

--
-- TOC entry 403 (class 1259 OID 17945)
-- Name: donebynames; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.donebynames (
    id character varying(36) NOT NULL,
    doneby character varying(20),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.donebynames OWNER TO gpadmin;

--
-- TOC entry 404 (class 1259 OID 17948)
-- Name: dosages; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.dosages (
    id character varying(36) NOT NULL,
    dosagecode character varying(40) NOT NULL,
    description character varying(255),
    description2 character varying(255),
    dosefactor numeric(12,2),
    dflag boolean,
    rcflag boolean,
    status character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.dosages OWNER TO gpadmin;

--
-- TOC entry 405 (class 1259 OID 17951)
-- Name: drugdosages; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.drugdosages (
    id character varying(36) NOT NULL,
    dosageid character varying(36) NOT NULL,
    druggroupid character varying(36) NOT NULL,
    description character varying(255),
    convfactor numeric(12,2),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.drugdosages OWNER TO gpadmin;

--
-- TOC entry 406 (class 1259 OID 17954)
-- Name: druggroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.druggroups (
    id character varying(36) NOT NULL,
    druggroupcode character varying(40) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.druggroups OWNER TO gpadmin;

--
-- TOC entry 407 (class 1259 OID 17957)
-- Name: ediexportimportdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.ediexportimportdetails (
    id character varying(36) NOT NULL,
    ediexportimportheaderid character varying(36) NOT NULL,
    edidocumentid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    editype character(10),
    line integer,
    itemcode character varying(36),
    uom character(10),
    qty numeric(18,0),
    unitprice numeric(20,8),
    discount1 numeric(20,8),
    discount2 numeric(20,8),
    amount numeric(20,8),
    taxamount numeric(20,8),
    taxcode character(10),
    batchnumber character varying(36),
    expdate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.ediexportimportdetails OWNER TO gpadmin;

--
-- TOC entry 408 (class 1259 OID 17960)
-- Name: ediexportimportheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.ediexportimportheaders (
    id character varying(36) NOT NULL,
    exportimportid character varying(36),
    purchaseorderheaderid character varying(36),
    deliveryorderheaderid character varying(36),
    batchno character varying(36),
    docno character varying(50),
    exportimporttype character varying(3),
    doctype character varying(20),
    recstatus character varying(3),
    edidate timestamp without time zone,
    filename character varying(200),
    supplierid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    doclineno integer,
    reference character varying(36),
    remarks character varying(120),
    discountamount numeric(18,4),
    subamount numeric(18,4),
    netamount numeric(18,4)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.ediexportimportheaders OWNER TO gpadmin;

--
-- TOC entry 409 (class 1259 OID 17963)
-- Name: employees; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.employees (
    id character varying(36) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    othernames character varying(255),
    status character varying(3),
    companyid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    defaultcontactid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.employees OWNER TO gpadmin;

--
-- TOC entry 410 (class 1259 OID 17966)
-- Name: episodeadjustment; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodeadjustment (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    adjustmenttype character varying(2) NOT NULL,
    remarks character varying(100) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodeadjustment OWNER TO gpadmin;

--
-- TOC entry 411 (class 1259 OID 17969)
-- Name: episodealerts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodealerts (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    alertid character varying(36) NOT NULL,
    altertext character varying(200),
    createdby character varying(30),
    activatedate timestamp without time zone,
    activatetime timestamp without time zone,
    inactivereasone character varying(200),
    inactivedatetime timestamp without time zone,
    createddatetime timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    doctorid character varying(36),
    departmentid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodealerts OWNER TO gpadmin;

--
-- TOC entry 412 (class 1259 OID 17972)
-- Name: episodediagnosis; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodediagnosis (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    diagnosisid character varying(36) NOT NULL,
    episodedoctorid character varying(36),
    vaspatient character varying(50),
    vasdoctor character varying(50),
    remarks character varying(75),
    diagnosisdate timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    icdcodeno integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodediagnosis OWNER TO gpadmin;

--
-- TOC entry 413 (class 1259 OID 17975)
-- Name: episodedietorderdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedietorderdetails (
    id character varying(36) NOT NULL,
    episodedietorderheaderid character varying(36) NOT NULL,
    ditefooditemid character varying(36) NOT NULL,
    mealshift character varying(3) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedietorderdetails OWNER TO gpadmin;

--
-- TOC entry 414 (class 1259 OID 17978)
-- Name: episodedietorderheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedietorderheaders (
    id character varying(36) NOT NULL,
    episodediteid character varying(36) NOT NULL,
    date timestamp without time zone NOT NULL,
    remarks character varying(150),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedietorderheaders OWNER TO gpadmin;

--
-- TOC entry 416 (class 1259 OID 17984)
-- Name: episodediets; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodediets (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    diteid character varying(36) NOT NULL,
    episodeditestatus character varying(3) NOT NULL,
    remarks character varying(150),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodediets OWNER TO gpadmin;

--
-- TOC entry 415 (class 1259 OID 17981)
-- Name: episodedietstatuschangedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedietstatuschangedetails (
    id character varying(36) NOT NULL,
    episodedietid character varying(36) NOT NULL,
    episodedietstatus character varying(3) NOT NULL,
    statussetdate timestamp without time zone NOT NULL,
    statussettime timestamp without time zone NOT NULL,
    remarks character varying(50),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedietstatuschangedetails OWNER TO gpadmin;

--
-- TOC entry 417 (class 1259 OID 17987)
-- Name: episodedischargecomments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedischargecomments (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    comment character varying(500) NOT NULL,
    commentdate timestamp without time zone NOT NULL,
    userid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedischargecomments OWNER TO gpadmin;

--
-- TOC entry 418 (class 1259 OID 17990)
-- Name: episodedispositionappointments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedispositionappointments (
    id character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    apttype character varying(10) NOT NULL,
    date timestamp without time zone NOT NULL,
    "time" timestamp without time zone NOT NULL,
    remarks character varying(60) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedispositionappointments OWNER TO gpadmin;

--
-- TOC entry 419 (class 1259 OID 17993)
-- Name: episodedispositionmedcerts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedispositionmedcerts (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    ml_noofdays integer,
    ml_fromdate timestamp without time zone,
    ml_todate timestamp without time zone,
    ld_noofdays integer,
    ld_fromdate timestamp without time zone,
    ld_todate timestamp without time zone,
    ex_noofdays integer,
    ex_fromdate timestamp without time zone,
    ex_todate timestamp without time zone,
    nonhospitalizationmc boolean NOT NULL,
    notexcusefromcourt boolean NOT NULL,
    remarks character varying(60),
    createduserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedispositionmedcerts OWNER TO gpadmin;

--
-- TOC entry 420 (class 1259 OID 17996)
-- Name: episodedispositionreferrals; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedispositionreferrals (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    toname character varying(50),
    titledepartment character varying(20),
    refid character varying(36),
    address character varying(150),
    reuseaddress boolean NOT NULL,
    dear character varying(25),
    content character varying(250),
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    referraldate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedispositionreferrals OWNER TO gpadmin;

--
-- TOC entry 421 (class 1259 OID 17999)
-- Name: episodedoctors; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodedoctors (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    doctorstatusid character varying(36),
    date timestamp without time zone,
    "time" timestamp without time zone,
    isqueueentrycreated boolean NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodedoctors OWNER TO gpadmin;

--
-- TOC entry 422 (class 1259 OID 18002)
-- Name: episodeinvspanels; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodeinvspanels (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    panelid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodeinvspanels OWNER TO gpadmin;

--
-- TOC entry 423 (class 1259 OID 18005)
-- Name: episodematernities; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodematernities (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    medicalhistory character varying(75),
    surgicalhistory character varying(75),
    familymedicalhistory character varying(100),
    currentmedications character varying(100),
    allergies character varying(100),
    obstetricalhistory character varying(100),
    isih boolean,
    isgestationsldm boolean,
    isasthma boolean,
    isstillbirth boolean,
    isneonataldeath boolean,
    isaph boolean,
    isplacentapraevia boolean,
    placentapraeviatype character varying(50),
    ispreviouslscs boolean,
    isbigbaby boolean,
    ishistorypph boolean,
    ismultiplepregnancy boolean,
    isbloodtransfusion boolean,
    lastchildbirth character varying(50),
    otherbirths character varying(50),
    reason character varying(100),
    nextofkinoccupationid character varying(36),
    consultantid character varying(36),
    reasionforadmission character varying(50),
    gravida integer,
    para integer,
    lmp timestamp without time zone,
    pog integer,
    edd timestamp without time zone,
    temperature numeric(18,2),
    pulse integer,
    respiration numeric(18,2),
    bloodpressure numeric(18,2),
    weight numeric(18,2),
    height numeric(18,2),
    isemotionalcalm boolean,
    isemotionalanxious boolean,
    isemotionaldistressed boolean,
    isemotionaldepressed boolean,
    isemotionalirritable boolean,
    emotionalother character varying(50),
    breastnipple character varying(75),
    isbreastfeeding boolean,
    isantepostnatalclasses boolean,
    isknwofcopingwtihpain boolean,
    modeofadmissionid character varying(36),
    foetuspresandposition character varying(100),
    foetalheartrate numeric(18,2),
    contrfreqtype character(100),
    urineprotein numeric(18,2),
    urinesugar numeric(18,2),
    urineacetone numeric(18,2),
    diagnosisonadmission character(100),
    isperinealshave boolean,
    fleetenema boolean,
    labourtypeid character varying(36),
    inducedmethod character varying(50),
    sedation character varying(50),
    doctorid character varying(36),
    anaesthetist character varying(36),
    conductedby character varying(50),
    witnessby character varying(50),
    deliverytypeid character varying(36),
    deliverycomplicatedtypeid character varying(36),
    deliverycomplicatedother character varying(50),
    stageoneindication character varying(100),
    stageonedetails character varying(100),
    placentadelbytypeid character varying(36),
    bloodlossamt numeric(18,2),
    bloodlosscausetypeid character varying(36),
    bloodlossother character varying(50),
    temperaturestage3 numeric(18,2),
    temperatureonehr numeric(18,2),
    pulsestage3 numeric(18,2),
    pulsestage3onehr numeric(18,2),
    bpstage3 numeric(18,2),
    bpstage3onehr numeric(18,2),
    placentatypeid character varying(36),
    placentaweight numeric(18,2),
    placentaabnormalities character varying(100),
    membranetypeid character varying(36),
    membraneabnormalities character varying(100),
    cordlength numeric(18,2),
    cordarndneck numeric(18,2),
    cordab character varying(100),
    cervix boolean,
    cervixsite character varying(100),
    vagina boolean,
    vaginasite character varying(100),
    pph boolean,
    pphtreatment character varying(50),
    perineumtypeid character varying(36),
    episiotomytypeid character varying(36),
    tearvaluetypeid character varying(36),
    sutureused character varying(50),
    analtone character varying(50),
    rectum character varying(50),
    painrelieftypeid character varying(36),
    membranerupturetypeid character varying(36),
    membranerupturedatetime timestamp without time zone,
    onsetoflabour character varying(100),
    onsetoflabdatetime timestamp without time zone,
    cervix10cm character varying(100),
    cervix10cmdate timestamp without time zone,
    babydeliveredtypeid character varying(36),
    babyrecordid character varying(36),
    placentadeliveredtypeid character varying(36),
    placentadeliverydate timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodematernities OWNER TO gpadmin;

--
-- TOC entry 424 (class 1259 OID 18011)
-- Name: episodenutritions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodenutritions (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    dosage character varying(50) NOT NULL,
    nutritionsuplystatus character varying(3) NOT NULL,
    quntity integer NOT NULL,
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodenutritions OWNER TO gpadmin;

--
-- TOC entry 425 (class 1259 OID 18014)
-- Name: episodepatientadvices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodepatientadvices (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    advise character varying(250),
    date timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodepatientadvices OWNER TO gpadmin;

--
-- TOC entry 426 (class 1259 OID 18017)
-- Name: episodepayerguaranteeletters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodepayerguaranteeletters (
    id character varying(36) NOT NULL,
    episodepayerid character varying(36) NOT NULL,
    guaranteeid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodepayerguaranteeletters OWNER TO gpadmin;

--
-- TOC entry 427 (class 1259 OID 18020)
-- Name: episodepayers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodepayers (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    debtorid character varying(50) NOT NULL,
    paymodeid character varying(36),
    relationshipid character varying(36),
    billtypemasterid character varying(36),
    remarks character varying(150),
    referance character varying(100),
    ourreferance character varying(100),
    lastdebtorid character varying(36),
    allgroups boolean,
    intiallimitamount numeric(10,2),
    totallimitamount numeric(10,2),
    companyid character varying(36),
    status character varying(50),
    isdefaultpayer boolean,
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodepayers OWNER TO gpadmin;

--
-- TOC entry 428 (class 1259 OID 18023)
-- Name: episodeprescriptiondtls; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodeprescriptiondtls (
    id character varying(36) NOT NULL,
    prescriptionhdrid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    episodeinvspanelid character varying(36),
    priority character varying(20),
    departmentid character varying(36),
    depttype character varying(10),
    plantype timestamp without time zone,
    date timestamp without time zone,
    price numeric(18,8),
    quantity numeric(18,8),
    orderdate timestamp without time zone,
    ordertime timestamp without time zone,
    amount numeric(18,8),
    remarks character varying(100),
    startdatetime timestamp without time zone,
    enddatetime timestamp without time zone,
    frequencyid character varying(36),
    duration numeric(18,0),
    locationid character varying(36),
    donebyid character varying(36),
    vas_patient integer,
    vas_doctor integer,
    diagstat character varying(3),
    performstatus character varying(10),
    chargegroupid character varying(36),
    dosageid character varying(36),
    instructionid character varying(36),
    uomid character varying(36),
    isprocessed boolean NOT NULL,
    isbilled boolean NOT NULL,
    isrepeat boolean,
    side character varying(20),
    focus character varying(20),
    resulttype character varying(30),
    shortclinicfind character varying(400),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodeprescriptiondtls OWNER TO gpadmin;

--
-- TOC entry 429 (class 1259 OID 18026)
-- Name: episodeprescriptionhdrs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodeprescriptionhdrs (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    recdate timestamp without time zone NOT NULL,
    episodedoctorid character varying(36) NOT NULL,
    prestype character varying(10) NOT NULL,
    pressubtype character varying(10),
    refqueueentryid character varying(36),
    remarks character varying(200),
    departmentid character varying(36) NOT NULL,
    isbilled boolean NOT NULL,
    iscompleted boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodeprescriptionhdrs OWNER TO gpadmin;

--
-- TOC entry 432 (class 1259 OID 18035)
-- Name: episodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodes (
    id character varying(36) NOT NULL,
    episodeno integer NOT NULL,
    episodetypeid character varying(36),
    registrationdate timestamp without time zone,
    registrationtime timestamp without time zone,
    registrationdeptid character varying(36),
    adminsourceid character varying(36),
    bedtypeid character varying(36),
    wardid character varying(36),
    depositrequired boolean,
    casetypeid character varying(36),
    treatment character varying(16),
    diagnosisid character varying(36),
    admittingdoctorid character varying(36),
    attendingdoctorid character varying(36),
    referringdoctorid character varying(36),
    iskcisdischarge boolean,
    isdischarge boolean,
    dischargedate timestamp without time zone,
    dischargetime timestamp without time zone,
    medrecord boolean,
    destinationid character varying(36),
    diagnostic character varying(50),
    admissiondate timestamp without time zone,
    admissiontime timestamp without time zone,
    companyid character varying(36),
    previouslybilled boolean,
    deposit numeric(21,8),
    billtypemasterid character varying(36),
    status character varying(50),
    noteexist boolean,
    patientid character varying(36) NOT NULL,
    payerid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    otcpatienttype character varying(5),
    medcareepisodeno character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodes OWNER TO gpadmin;

--
-- TOC entry 430 (class 1259 OID 18029)
-- Name: episodetriages; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodetriages (
    id character varying(36) NOT NULL,
    insertdate date,
    inserttime timestamp without time zone,
    episodeid character varying(36) NOT NULL,
    bp_sitting_min numeric(6,2),
    bp_sitting_max numeric(6,2),
    bp_standing_min numeric(6,2),
    bp_standing_max numeric(6,2),
    height numeric(6,2),
    weight numeric(6,2),
    bmi numeric(6,2),
    temperature numeric(6,2) NOT NULL,
    plusrate integer,
    respiration integer,
    remark character varying(100),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    patientid character varying(36),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodetriages OWNER TO gpadmin;

--
-- TOC entry 431 (class 1259 OID 18032)
-- Name: episodetypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.episodetypes (
    id character varying(36) NOT NULL,
    episodetypecode character varying(4) NOT NULL,
    description character varying(30),
    firstchgcode character varying(12),
    subschgcode character varying(12),
    dateofactivation timestamp without time zone,
    isallowbed boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    pricetypeid character varying(36) NOT NULL,
    isbilluponfinal boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.episodetypes OWNER TO gpadmin;

--
-- TOC entry 433 (class 1259 OID 18038)
-- Name: familycodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.familycodes (
    id character varying(36) NOT NULL,
    code character varying(4) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.familycodes OWNER TO gpadmin;

--
-- TOC entry 434 (class 1259 OID 18041)
-- Name: fiscalyears; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.fiscalyears (
    id character varying(36) NOT NULL,
    fiscalyear integer NOT NULL,
    iscurrent boolean,
    isclosed boolean NOT NULL,
    currentperiod integer,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.fiscalyears OWNER TO gpadmin;

--
-- TOC entry 435 (class 1259 OID 18044)
-- Name: fixedassettemps; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.fixedassettemps (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    entrysource character varying(3),
    description character(100),
    departmentid character varying(36),
    locationid character varying(36),
    purchaceordid character varying(36),
    supplierid character varying(36),
    deliveryorderhdrid character varying(36),
    itemstocklocationid character varying(36),
    assetcategoryid character varying(36),
    assetkey character varying(36),
    apactheaderid character varying(36),
    quantity integer,
    individualtag boolean NOT NULL,
    statdate timestamp without time zone,
    recstatus character varying(36),
    genstat character varying(36),
    trantype character varying(36),
    trandate timestamp without time zone,
    nprefid character varying(36),
    updateuserid character(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    origcost numeric(21,8),
    insval numeric(21,8),
    startdep timestamp without time zone,
    currentcost numeric(21,8),
    cuytddep numeric(21,8),
    lstytddep numeric(21,8),
    appoperationid character varying(36),
    assetid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.fixedassettemps OWNER TO gpadmin;

--
-- TOC entry 436 (class 1259 OID 18047)
-- Name: floors; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.floors (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    level integer NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist smallint NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.floors OWNER TO gpadmin;

--
-- TOC entry 437 (class 1259 OID 18050)
-- Name: fooditems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.fooditems (
    id character varying(36) NOT NULL,
    itemcode character varying(5) NOT NULL,
    itemname character varying(50),
    itemcategory character varying(3) NOT NULL,
    diteitemcategory character varying(3) NOT NULL,
    issetmenuitem boolean NOT NULL,
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.fooditems OWNER TO gpadmin;

--
-- TOC entry 438 (class 1259 OID 18053)
-- Name: foodmenuitems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.foodmenuitems (
    id character varying(36) NOT NULL,
    setmenuid character varying(36),
    fooditemid character varying(36),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.foodmenuitems OWNER TO gpadmin;

--
-- TOC entry 439 (class 1259 OID 18056)
-- Name: frequencies; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.frequencies (
    id character varying(36) NOT NULL,
    frequencycode character varying(40) NOT NULL,
    description character varying(255),
    description2 character varying(255),
    dfreq numeric(18,2),
    dflag boolean,
    rcflag boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.frequencies OWNER TO gpadmin;

--
-- TOC entry 447 (class 1259 OID 18080)
-- Name: glaccountcostcodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glaccountcostcodes (
    id character varying(36) NOT NULL,
    code character varying(50) NOT NULL,
    status character varying(3),
    costcenterid character varying(36) NOT NULL,
    companyid character varying(36),
    glaccountid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glaccountcostcodes OWNER TO gpadmin;

--
-- TOC entry 448 (class 1259 OID 18083)
-- Name: glaccountdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glaccountdetails (
    id character varying(36) NOT NULL,
    glaccountcostcodeid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    openingbalance numeric(21,8),
    budgetedamount numeric(21,8),
    companyid character varying(36),
    actualamount numeric(21,8),
    foramount numeric(21,8),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    gljournaldetailid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glaccountdetails OWNER TO gpadmin;

--
-- TOC entry 450 (class 1259 OID 18089)
-- Name: glaccounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glaccounts (
    id character varying(36) NOT NULL,
    code character varying(16) NOT NULL,
    description character varying(100),
    glaccounttypeid character varying(36) NOT NULL,
    nprefid integer NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    repgroup character varying(50),
    accgroup character varying(50),
    ispettycash boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glaccounts OWNER TO gpadmin;

--
-- TOC entry 451 (class 1259 OID 18092)
-- Name: glaccounts_tmpdu; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glaccounts_tmpdu (
    id character varying(36),
    glaccount character varying(16),
    description character varying(255),
    acttype character varying(255),
    nprefid integer,
    recstatus character varying(255),
    compcode character varying(36),
    repgroup character varying(255),
    accgroup character varying(255),
    adduser character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glaccounts_tmpdu OWNER TO gpadmin;

--
-- TOC entry 449 (class 1259 OID 18086)
-- Name: glaccounttypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glaccounttypes (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    companyid character varying(36),
    description character varying(50) NOT NULL,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glaccounttypes OWNER TO gpadmin;

--
-- TOC entry 452 (class 1259 OID 18095)
-- Name: glconaccountdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glconaccountdetails (
    id character varying(36) NOT NULL,
    glconaccountid character varying(36) NOT NULL,
    glaccountfrom character varying(36) NOT NULL,
    glaccountto character varying(36) NOT NULL,
    companyid character varying(36),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glconaccountdetails OWNER TO gpadmin;

--
-- TOC entry 453 (class 1259 OID 18098)
-- Name: glconaccountdetails_temp; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glconaccountdetails_temp (
    id character varying(36) NOT NULL,
    glconaccountid character varying(36),
    glaccountfrom character varying(36),
    glaccountto character varying(36),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glconaccountdetails_temp OWNER TO gpadmin;

--
-- TOC entry 454 (class 1259 OID 18101)
-- Name: glcondepartmentdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glcondepartmentdetails (
    id character varying(36) NOT NULL,
    glcondepartmentid character varying(36) NOT NULL,
    companyid character varying(36),
    costcenterfromid character varying(36) NOT NULL,
    costcentertoid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glcondepartmentdetails OWNER TO gpadmin;

--
-- TOC entry 455 (class 1259 OID 18104)
-- Name: glcondepartments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glcondepartments (
    id character varying(36) NOT NULL,
    code character varying(30) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    type character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glcondepartments OWNER TO gpadmin;

--
-- TOC entry 456 (class 1259 OID 18107)
-- Name: glconsolidatedaccounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glconsolidatedaccounts (
    id character varying(36) NOT NULL,
    code character varying(50) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    isipconrev boolean,
    isopconrev boolean,
    isconappropriation boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glconsolidatedaccounts OWNER TO gpadmin;

--
-- TOC entry 457 (class 1259 OID 18110)
-- Name: glconsolidatedaccounts_temp; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glconsolidatedaccounts_temp (
    id character varying(36),
    code character varying(50) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    isipconrev boolean,
    isopconrev boolean,
    isconappropriation boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glconsolidatedaccounts_temp OWNER TO gpadmin;

--
-- TOC entry 445 (class 1259 OID 18074)
-- Name: gleteritems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gleteritems (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    debtormasterid character varying(50) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    chargemasterid character varying(36),
    departmentid character varying(36),
    chargegroupid character varying(36),
    totitemlimit numeric(18,8),
    totitembal numeric(18,8),
    status character varying(3) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gleteritems OWNER TO gpadmin;

--
-- TOC entry 446 (class 1259 OID 18077)
-- Name: gletterdepartments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gletterdepartments (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    departmentid character varying(36),
    chargegroupid character varying(36),
    departmentlimit numeric(18,8),
    departmentbalance numeric(18,8),
    grouplimit numeric(18,8),
    groupbalance numeric(18,8),
    inditemlimit numeric(18,8),
    allitems boolean,
    status character varying(3) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gletterdepartments OWNER TO gpadmin;

--
-- TOC entry 440 (class 1259 OID 18059)
-- Name: glfinancetables; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glfinancetables (
    id character varying(36) NOT NULL,
    tablename character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glfinancetables OWNER TO gpadmin;

--
-- TOC entry 441 (class 1259 OID 18062)
-- Name: glgroupexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glgroupexceptions (
    id character varying(36) NOT NULL,
    chargegroupid character varying(36) NOT NULL,
    glreferenceid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    description character varying(75),
    grouplimit numeric(18,2),
    individualitemlimit numeric(18,2),
    isgroupunlimited boolean NOT NULL,
    isitemunlimited boolean NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glgroupexceptions OWNER TO gpadmin;

--
-- TOC entry 458 (class 1259 OID 18113)
-- Name: gliaccountmappings; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gliaccountmappings (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    entryname character varying(50) NOT NULL,
    reftype character varying(10),
    billtypemasterid character varying(36),
    sequence smallint,
    inputquery character varying(2000) NOT NULL,
    outputtable character varying(50) NOT NULL,
    outputfield character varying(50) NOT NULL,
    datatype character varying(30),
    idindex smallint NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gliaccountmappings OWNER TO gpadmin;

--
-- TOC entry 459 (class 1259 OID 18119)
-- Name: glinterfaces; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glinterfaces (
    id character varying(36) NOT NULL,
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantypeid character varying(36),
    reference character varying(250),
    description character varying(500),
    oprtype character varying(1),
    auditno numeric(18,0),
    amount numeric(21,8) NOT NULL,
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glinterfaces OWNER TO gpadmin;

--
-- TOC entry 442 (class 1259 OID 18065)
-- Name: glitemexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glitemexceptions (
    id character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    glgroupexceptionid character varying(36) NOT NULL,
    description character varying(75),
    itemlimit numeric(18,2),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glitemexceptions OWNER TO gpadmin;

--
-- TOC entry 443 (class 1259 OID 18068)
-- Name: gljournaldetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gljournaldetails (
    id character varying(36) NOT NULL,
    gljournalheaderid character varying(36),
    auditno integer,
    line integer,
    drcrsign character varying(4),
    amount numeric(21,8),
    costcenterid character varying(36),
    glaccountid character varying(36),
    docno character varying(36),
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gljournaldetails OWNER TO gpadmin;

--
-- TOC entry 444 (class 1259 OID 18071)
-- Name: gljournalheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gljournalheaders (
    id character varying(36) NOT NULL,
    auditno integer,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    docno character varying(36),
    docdate timestamp without time zone,
    description character varying(100),
    postdate timestamp without time zone,
    difamount numeric(21,8) NOT NULL,
    poststatus character varying(3) NOT NULL,
    printstatus character varying(3) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    postuserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gljournalheaders OWNER TO gpadmin;

--
-- TOC entry 460 (class 1259 OID 18122)
-- Name: glreportformats; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glreportformats (
    id character varying(36) NOT NULL,
    glreportid character varying(36) NOT NULL,
    linenum integer NOT NULL,
    isprint boolean NOT NULL,
    rowdefinitionid character varying(36),
    code character varying(30),
    description character varying(100),
    formula character varying(100),
    keyno integer,
    companyid character varying(36),
    status character varying(3),
    note integer,
    reversesign boolean,
    costcodefrom character varying(10),
    costcodeto character varying(10),
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glreportformats OWNER TO gpadmin;

--
-- TOC entry 461 (class 1259 OID 18125)
-- Name: glreportformats_test; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glreportformats_test (
    id character varying(36),
    glreportid character varying(36),
    linenum integer,
    isprint character(10),
    rowdefinitionid character varying(36),
    code character varying(30),
    description character varying(100),
    formula character varying(100),
    keyno integer,
    companyid character varying(36),
    status character varying(3),
    note integer,
    reversesign character(10),
    costcenteridfrom character varying(36),
    costcenteridto character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glreportformats_test OWNER TO gpadmin;

--
-- TOC entry 462 (class 1259 OID 18128)
-- Name: glreports; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glreports (
    id character varying(36) NOT NULL,
    reportname character varying(30) NOT NULL,
    description character varying(100),
    reporttypeid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glreports OWNER TO gpadmin;

--
-- TOC entry 463 (class 1259 OID 18131)
-- Name: glsubacctypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.glsubacctypes (
    id character varying(36) NOT NULL,
    glacctypeid character varying(36) NOT NULL,
    subacctypecode character varying(36) NOT NULL,
    description character varying(36),
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.glsubacctypes OWNER TO gpadmin;

--
-- TOC entry 464 (class 1259 OID 18134)
-- Name: gltransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.gltransactions (
    id character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    reference character varying(250),
    description character varying(500),
    auditno numeric(18,0),
    amount numeric(21,8) NOT NULL,
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    trantypeid character varying(36),
    postdateyear character varying,
    postdatemonth character varying
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.gltransactions OWNER TO gpadmin;

--
-- TOC entry 465 (class 1259 OID 18140)
-- Name: goodsreturndetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.goodsreturndetails (
    id character varying(36) NOT NULL,
    line integer NOT NULL,
    goodsreturnheaderid character varying(36),
    productid character varying(36),
    productdescription character varying(80),
    productpriceid character varying(36),
    uomid character varying(36),
    orderreturned numeric(19,8),
    remarks character varying(255),
    netunitprice numeric(20,8),
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    deliveryorderdetailid character varying(36),
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.goodsreturndetails OWNER TO gpadmin;

--
-- TOC entry 466 (class 1259 OID 18143)
-- Name: goodsreturnheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.goodsreturnheaders (
    id character varying(36) NOT NULL,
    grtnumber character varying(10) NOT NULL,
    deliveryorderheaderid character varying(36) NOT NULL,
    purchasedeptid character varying(36),
    returndate timestamp without time zone,
    supplierid character varying(36),
    grtstatus character varying(36),
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    entereddate timestamp without time zone,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(21,8),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    recordno bigint,
    reasonid character varying(36),
    returnflag boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.goodsreturnheaders OWNER TO gpadmin;

--
-- TOC entry 467 (class 1259 OID 18146)
-- Name: groupfunction; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.groupfunction (
    id character varying(36) NOT NULL,
    groups_id character varying(36) NOT NULL,
    functions_id character varying(36) NOT NULL,
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.groupfunction OWNER TO gpadmin;

--
-- TOC entry 468 (class 1259 OID 18149)
-- Name: groupoperation; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.groupoperation (
    groups_id character varying(36) NOT NULL,
    operations_id character varying(36) NOT NULL
)
 DISTRIBUTED BY (groups_id);


ALTER TABLE staging_mdmhits2_klgsh.groupoperation OWNER TO gpadmin;

--
-- TOC entry 470 (class 1259 OID 18155)
-- Name: groups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.groups (
    id character varying(36) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.groups OWNER TO gpadmin;

--
-- TOC entry 469 (class 1259 OID 18152)
-- Name: groupuser; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.groupuser (
    groups_id character varying(36) NOT NULL,
    users_id character varying(36) NOT NULL
)
 DISTRIBUTED BY (groups_id);


ALTER TABLE staging_mdmhits2_klgsh.groupuser OWNER TO gpadmin;

--
-- TOC entry 471 (class 1259 OID 18158)
-- Name: guaranteeletterentitledoctors; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.guaranteeletterentitledoctors (
    id character varying(36) NOT NULL,
    doctorid character varying(36) NOT NULL,
    guaranteeletterrefid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.guaranteeletterentitledoctors OWNER TO gpadmin;

--
-- TOC entry 877 (class 1259 OID 19487)
-- Name: guaranteeletterreferences; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.guaranteeletterreferences (
    id character varying(36) NOT NULL,
    patientid character varying(36),
    debtorid character varying(50) NOT NULL,
    gltypeid character varying(36) NOT NULL,
    refno character varying(50) NOT NULL,
    ourrefno character varying(50) NOT NULL,
    remarks character varying(200),
    enteredby character varying(100) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    expirydate timestamp without time zone NOT NULL,
    visitno integer,
    membershipno character varying(50),
    visitbalance integer,
    medicalcase character varying(100) NOT NULL,
    glcontactperson character varying(100) NOT NULL,
    glissuedby character varying(100) NOT NULL,
    glinitiallimit numeric(9,2) NOT NULL,
    gltotallimit numeric(18,4) NOT NULL,
    glbalancelimit numeric(18,4),
    exceptiongrouplimit numeric(18,4),
    exceptionitemlimit numeric(18,4),
    enterdatetime timestamp without time zone,
    scandocpath character varying(100),
    companyid character varying(36) NOT NULL,
    confirmationstatus character varying(50),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    allocatedstatus character varying(10),
    relationshipid character varying(36),
    scandoccontent bytea,
    staffname character varying(100)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.guaranteeletterreferences OWNER TO gpadmin;

--
-- TOC entry 472 (class 1259 OID 18167)
-- Name: guaranteelettertypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.guaranteelettertypes (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    gltypecode character varying(5) NOT NULL,
    gltypename character varying(50) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.guaranteelettertypes OWNER TO gpadmin;

--
-- TOC entry 473 (class 1259 OID 18170)
-- Name: icdcodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.icdcodes (
    id character varying(36) NOT NULL,
    code character varying(8) NOT NULL,
    description character varying(2000),
    icdgroupid character varying(36),
    typeid character varying(36),
    icdtext character varying(250),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.icdcodes OWNER TO gpadmin;

--
-- TOC entry 474 (class 1259 OID 18176)
-- Name: icdgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.icdgroups (
    id character varying(36) NOT NULL,
    groupcode character varying(20) NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.icdgroups OWNER TO gpadmin;

--
-- TOC entry 475 (class 1259 OID 18179)
-- Name: icdtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.icdtypes (
    id character varying(36) NOT NULL,
    icdtypecode character varying(9) NOT NULL,
    description character varying(50),
    noteexist boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.icdtypes OWNER TO gpadmin;

--
-- TOC entry 476 (class 1259 OID 18182)
-- Name: idtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.idtypes (
    id character varying(36) NOT NULL,
    idtype character varying(4) NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.idtypes OWNER TO gpadmin;

--
-- TOC entry 477 (class 1259 OID 18185)
-- Name: impfiles; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.impfiles (
    id character varying(36) NOT NULL,
    filename character varying(200),
    transtypeid character varying(36),
    docdate timestamp without time zone,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.impfiles OWNER TO gpadmin;

--
-- TOC entry 478 (class 1259 OID 18188)
-- Name: instructions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.instructions (
    id character varying(36) NOT NULL,
    instructioncode character varying(40) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.instructions OWNER TO gpadmin;

--
-- TOC entry 479 (class 1259 OID 18191)
-- Name: interfacelogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.interfacelogs (
    id numeric(18,0) NOT NULL,
    eventcode character varying(36),
    mrn character varying(50),
    updatedate timestamp without time zone,
    col1 character varying(300),
    col2 character varying(300),
    col3 character varying(300),
    col4 character varying(300),
    col5 character varying(300),
    col6 character varying(300),
    col7 character varying(300),
    col8 character varying(300),
    col9 character varying(300),
    col10 character varying(300),
    col11 character varying(300),
    col12 character varying(300),
    col13 character varying(300),
    col14 character varying(300),
    col15 character varying(300),
    col16 character varying(300),
    col17 character varying(300),
    col18 character varying(300),
    col19 character varying(300),
    col20 character varying(300),
    col21 character varying(300),
    col22 character varying(300),
    col23 character varying(300),
    col24 character varying(300),
    col25 character varying(300),
    col26 character varying(300),
    col27 character varying(300),
    col28 character varying(300),
    col29 character varying(300),
    col30 character varying(300),
    col31 character varying(300),
    col32 character varying(300),
    col33 character varying(300),
    col34 character varying(300),
    col35 character varying(300),
    col36 character varying(300),
    col37 character varying(300),
    col38 character varying(300),
    col39 character varying(300),
    companyid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.interfacelogs OWNER TO gpadmin;

--
-- TOC entry 480 (class 1259 OID 18197)
-- Name: invdspdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invdspdetails (
    id character varying(36) NOT NULL,
    recno integer,
    line integer,
    productid character varying(36),
    uomid character varying(36),
    itemstocklocationid character varying(36),
    transqty numeric(20,8),
    netprice numeric(20,8),
    draccountid character varying(36),
    drcostcenterid character varying(36),
    craccountid character varying(36),
    crcostcenterid character varying(36),
    issdepartmentid character varying(36),
    reqdepartmentid character varying(36),
    saleamount numeric(21,8),
    transtypeid character varying(36),
    transdate timestamp without time zone,
    trxauditno integer,
    chargetransactionid character varying(36),
    expdate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    recordstatus boolean,
    quantityonhand numeric(18,0)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invdspdetails OWNER TO gpadmin;

--
-- TOC entry 481 (class 1259 OID 18200)
-- Name: invhistorydetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invhistorydetails (
    id character varying(36) NOT NULL,
    invhistoryheaderid character varying(36) NOT NULL,
    lineno integer,
    productid character varying(36),
    uomid character varying(36),
    transferqty numeric(18,8),
    netprice numeric(18,8),
    recordnumber integer,
    productcategoryid character varying(36),
    draccno character varying(25),
    drccode character varying(25),
    craccno character varying(25),
    crccode character varying(25),
    expdate timestamp without time zone,
    departmentid character varying(36),
    sndrcv character varying(36),
    recordstatus character varying(20),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invhistorydetails OWNER TO gpadmin;

--
-- TOC entry 482 (class 1259 OID 18203)
-- Name: invhistoryheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invhistoryheaders (
    id character varying(36) NOT NULL,
    departmentid character varying(36),
    transtypeid character varying(36),
    docno integer,
    sndrcv character varying(36),
    transdate timestamp without time zone,
    datesupret timestamp without time zone,
    dateactret timestamp without time zone,
    ivrequestid character varying(36),
    respersonid character varying(36),
    remarks character varying(200),
    recordstatus character varying(20),
    srcdocno integer,
    sndrcvtype character varying(30),
    amount numeric(18,8),
    recordno integer,
    expdate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invhistoryheaders OWNER TO gpadmin;

--
-- TOC entry 483 (class 1259 OID 18206)
-- Name: invrequestdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invrequestdetails (
    id character varying(36) NOT NULL,
    reqdepartmentid character varying(36),
    invrequestheaderid character varying(36) NOT NULL,
    line integer,
    productid character varying(36),
    uomid character varying(36),
    quantityrequest numeric(18,8),
    quantitytxn numeric(18,8),
    netprice numeric(21,8),
    invissuetype character varying(10),
    remarks character varying(2600),
    quantityonhand numeric(18,8),
    authorid character varying(36),
    qohconfirm integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    receiverqoh integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invrequestdetails OWNER TO gpadmin;

--
-- TOC entry 484 (class 1259 OID 18212)
-- Name: invrequestheader; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invrequestheader (
    id character varying(36) NOT NULL,
    fromdepartmentid character varying(36),
    invrequestno integer,
    requestdate timestamp without time zone,
    reqpersonid character varying(36),
    remarks character varying(100),
    docstatus character varying(36),
    invissuetype character varying(10),
    amount numeric(21,8),
    todepartmentid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invrequestheader OWNER TO gpadmin;

--
-- TOC entry 485 (class 1259 OID 18215)
-- Name: invtransdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invtransdetails (
    id character varying(36) NOT NULL,
    invtransheaderid character varying(36),
    linenum integer,
    productid character varying(36),
    uomid character varying(36),
    transactionqty numeric(18,8),
    netprice numeric(21,8),
    recordno integer,
    itembatchid character varying(36),
    remarks character varying(2600),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    drglaccountid character varying(36),
    crglaccountid character varying(36),
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    quantityonhand numeric(19,4),
    expirydate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invtransdetails OWNER TO gpadmin;

--
-- TOC entry 486 (class 1259 OID 18221)
-- Name: invtransheader; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.invtransheader (
    id character varying(36) NOT NULL,
    fromdepartmentid character varying(36),
    todepartmentid character varying(36),
    invissuetype character varying(10),
    docno integer,
    transdate timestamp without time zone,
    sndrcv character varying(36),
    invrequestheaderid character varying(36),
    resonsiblepersonid character varying(36),
    remarks character varying(200),
    docstatus character varying(10),
    srcdocno integer,
    sndrcvtype character varying(30),
    source character varying(16),
    reference character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    recordstatus character varying(20),
    transtypeid character varying(36),
    referenceid character varying(36),
    supplierid character varying(36),
    patientid character varying(36),
    tocompanyid character varying(36),
    amount numeric(18,2),
    recordno character varying(10),
    datesuppreturn timestamp without time zone,
    dateactreturn timestamp without time zone,
    transtatusid character varying(36),
    sndrcvtypeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.invtransheader OWNER TO gpadmin;

--
-- TOC entry 487 (class 1259 OID 18224)
-- Name: isolationreasons; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.isolationreasons (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    reasoncode character varying(4) NOT NULL,
    reason character varying(50),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.isolationreasons OWNER TO gpadmin;

--
-- TOC entry 488 (class 1259 OID 18227)
-- Name: itembatches; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itembatches (
    id character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    batchcode character varying(20) NOT NULL,
    expirydate timestamp without time zone,
    quantityonhand numeric(18,8),
    fiscalyearid character varying(36),
    uomid character varying(36),
    valueonhand numeric(21,8),
    status character varying(3) NOT NULL,
    departmentid character varying(36),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itembatches OWNER TO gpadmin;

--
-- TOC entry 489 (class 1259 OID 18230)
-- Name: itemcountsets; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemcountsets (
    id character varying(36) NOT NULL,
    itemsetcode character varying(10),
    description character varying(80),
    departmentfromid character varying(36),
    departmenttoid character varying(36),
    prodsubcatfromid character varying(36),
    prodsubcattoid character varying(36),
    productfromid character varying(36),
    producttoid character varying(36),
    freeztypeid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemcountsets OWNER TO gpadmin;

--
-- TOC entry 490 (class 1259 OID 18233)
-- Name: itemcountsetsdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemcountsetsdetails (
    id character varying(36) NOT NULL,
    itemcountsetsheaderid character varying(36) NOT NULL,
    line integer NOT NULL,
    departmentfromid character varying(36),
    departmenttoid character varying(36),
    prodsubcatfromid character varying(36),
    prodsubcattoid character varying(36),
    productfromid character varying(36),
    producttoid character varying(36),
    freeztypeid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemcountsetsdetails OWNER TO gpadmin;

--
-- TOC entry 491 (class 1259 OID 18236)
-- Name: itemcountsetsheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemcountsetsheaders (
    id character varying(36) NOT NULL,
    itemsetcode character varying(10) NOT NULL,
    description character varying(80),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemcountsetsheaders OWNER TO gpadmin;

--
-- TOC entry 492 (class 1259 OID 18239)
-- Name: itemmonthlystocks; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemmonthlystocks (
    id character varying(36) NOT NULL,
    itemstocklocationid character varying(36),
    periodid character varying(36),
    monthlyquantity numeric(18,8),
    monthlyvalue numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemmonthlystocks OWNER TO gpadmin;

--
-- TOC entry 493 (class 1259 OID 18242)
-- Name: itemperiodicaveragecosts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemperiodicaveragecosts (
    id character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    averagecost numeric(18,8),
    procflag character varying(300),
    uomid character varying(36),
    peropen boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemperiodicaveragecosts OWNER TO gpadmin;

--
-- TOC entry 494 (class 1259 OID 18245)
-- Name: itemstocklocations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemstocklocations (
    id character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    productid character varying(36),
    bincode character varying(16),
    fiscalyearid character varying(36),
    fixuom boolean,
    openingbalanceval numeric(21,8),
    cntdocno character varying(40),
    minquantity numeric(18,8),
    maxquantity numeric(18,8),
    reordlevel numeric(18,8),
    reordquantity numeric(18,8),
    lastissuedate timestamp without time zone,
    uomid character varying(36),
    isfrozen boolean,
    invissuetype character varying(10),
    dispensetype character varying(24),
    rackno character varying(16),
    openbalqty numeric(18,8),
    onhandvalue numeric(21,8),
    onhandquantity numeric(18,8),
    lastfrozendate timestamp without time zone,
    frozenquantity numeric(18,8),
    itemtype character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    transtypeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemstocklocations OWNER TO gpadmin;

--
-- TOC entry 495 (class 1259 OID 18248)
-- Name: itemstocklocations_backup14march; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemstocklocations_backup14march (
    id character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    productid character varying(36),
    bincode character varying(16),
    fiscalyearid character varying(36),
    fixuom boolean,
    openingbalanceval numeric(21,8),
    cntdocno character varying(40),
    minquantity numeric(18,8),
    maxquantity numeric(18,8),
    reordlevel numeric(18,8),
    reordquantity numeric(18,8),
    lastissuedate timestamp without time zone,
    uomid character varying(36),
    isfrozen boolean,
    invissuetype character varying(10),
    dispensetype character varying(24),
    rackno character varying(16),
    openbalqty numeric(18,8),
    onhandvalue numeric(21,8),
    onhandquantity numeric(18,8),
    lastfrozendate timestamp without time zone,
    frozenquantity numeric(18,8),
    itemtype character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    transtypeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemstocklocations_backup14march OWNER TO gpadmin;

--
-- TOC entry 496 (class 1259 OID 18251)
-- Name: itemtaxdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemtaxdetails (
    id character varying(36) NOT NULL,
    paramsourceid character varying(36),
    transtypeid character varying(36),
    sourceid character varying(36),
    taxmasterid character varying(36),
    effectivedate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemtaxdetails OWNER TO gpadmin;

--
-- TOC entry 497 (class 1259 OID 18254)
-- Name: itemtracks; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemtracks (
    id character varying(36) NOT NULL,
    itemtransactionid character varying(36),
    itembatchid character varying(36),
    trackquantity numeric(18,8),
    unitcost numeric(21,8),
    trackvalue numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemtracks OWNER TO gpadmin;

--
-- TOC entry 498 (class 1259 OID 18257)
-- Name: itemtransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.itemtransactions (
    id character varying(36) NOT NULL,
    productid character varying(36),
    transtypeid character varying(36),
    transrefid character varying(36),
    transdepartmentid character varying(36),
    transquantity numeric(18,8),
    unitcost numeric(21,8),
    transvalue numeric(21,8),
    transdate timestamp without time zone,
    comment character varying(255),
    docrefid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.itemtransactions OWNER TO gpadmin;

--
-- TOC entry 499 (class 1259 OID 18260)
-- Name: languages; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.languages (
    id character varying(36) NOT NULL,
    languagecode character varying(4) NOT NULL,
    description character varying(40),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    standardlangcode character varying(6) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.languages OWNER TO gpadmin;

--
-- TOC entry 500 (class 1259 OID 18263)
-- Name: locations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.locations (
    id character varying(36) NOT NULL,
    locationcode character varying(8) NOT NULL,
    description character varying(40),
    incharge character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.locations OWNER TO gpadmin;

--
-- TOC entry 512 (class 1259 OID 18305)
-- Name: maritalstatus; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maritalstatus (
    id character varying(36) NOT NULL,
    maritalstatuscode character varying(4) NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maritalstatus OWNER TO gpadmin;

--
-- TOC entry 513 (class 1259 OID 18308)
-- Name: maternityadmissioin; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternityadmissioin (
    id character varying(36) NOT NULL,
    maternityid character varying(36),
    episodeid character varying(36),
    companyid character varying(36),
    temperature numeric(18,2),
    pulse integer,
    respiration numeric(18,2),
    bloodpressure numeric(18,2),
    weight numeric(18,2),
    height numeric(18,2),
    isemotionalcalm boolean NOT NULL,
    isemotionalanxious boolean NOT NULL,
    isemotionaldistressed boolean NOT NULL,
    isemotionaldepressed boolean NOT NULL,
    isemotionalirritable boolean NOT NULL,
    emotionalother character varying(50),
    breastnipple character varying(75),
    isbreastfeeding boolean NOT NULL,
    isantepostnatalclasses boolean NOT NULL,
    isknwofcopingwtihpain boolean NOT NULL,
    modeofadmissionid character varying(36),
    foetuspresandposition character varying(100),
    foetalheartrate numeric(18,2),
    contrfreqtype character(100),
    urineprotein numeric(18,2),
    urinesugar numeric(18,2),
    urineacetone numeric(18,2),
    diagnosisonadmission character(100),
    isperinealshave boolean,
    fleetenema boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternityadmissioin OWNER TO gpadmin;

--
-- TOC entry 514 (class 1259 OID 18311)
-- Name: maternitybabyrecords; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternitybabyrecords (
    id character varying(36) NOT NULL,
    episodematernityid character varying(36) NOT NULL,
    babyno integer,
    babyname character varying(50),
    gender character varying(4),
    birthtypeid character varying(36),
    deliverydatetime timestamp without time zone,
    babystatus character varying(50),
    doctorid character varying(36),
    wardid character varying(36),
    admitbedid character varying(36),
    bcg boolean,
    bcgdate timestamp without time zone,
    hep boolean,
    hepdate timestamp without time zone,
    maturity numeric(18,2),
    weight numeric(18,2),
    length numeric(18,2),
    headcircumference numeric(18,2),
    firstgasp numeric(18,2),
    rhythmicbreathing numeric(18,2),
    apgar1min integer,
    apgar5min integer,
    apgar10min integer,
    inoculationother character varying(255),
    inoculationvitamin character varying(255),
    abnormalities character varying(150),
    resuscitation character varying(100),
    others character varying(300),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternitybabyrecords OWNER TO gpadmin;

--
-- TOC entry 515 (class 1259 OID 18314)
-- Name: maternitycontrolparams; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternitycontrolparams (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    controlname character varying(30) NOT NULL,
    valuecode character varying(3) NOT NULL,
    valuedescription character varying(50),
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternitycontrolparams OWNER TO gpadmin;

--
-- TOC entry 516 (class 1259 OID 18317)
-- Name: maternitylabourdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternitylabourdetails (
    id character varying(36) NOT NULL,
    memruptype character varying(15) NOT NULL,
    membranerupturedatetime timestamp without time zone NOT NULL,
    onsetoflabour character varying(100) NOT NULL,
    onsetoflabdatetime timestamp without time zone NOT NULL,
    cervix10cm character varying(100) NOT NULL,
    cervix10cmdate timestamp without time zone NOT NULL,
    babydeliverytype character varying(15) NOT NULL,
    babyrecordid character varying(36) NOT NULL,
    placentadeliverytype character varying(15) NOT NULL,
    placentadeliverydate timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternitylabourdetails OWNER TO gpadmin;

--
-- TOC entry 517 (class 1259 OID 18320)
-- Name: maternityoxytoxicdrugs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternityoxytoxicdrugs (
    id character varying(36) NOT NULL,
    episodematernityid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    dosageid character varying(36) NOT NULL,
    iv1 boolean,
    im1 boolean,
    timing1 timestamp without time zone,
    iv2 boolean,
    im2 boolean,
    timing2 timestamp without time zone,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    isselected boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternityoxytoxicdrugs OWNER TO gpadmin;

--
-- TOC entry 518 (class 1259 OID 18323)
-- Name: maternitystageoneandtwodetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternitystageoneandtwodetails (
    id character varying(36) NOT NULL,
    labourtypeid character varying(36) NOT NULL,
    inducedmethod character varying(50) NOT NULL,
    sedation character varying(50) NOT NULL,
    doctorid character varying(36) NOT NULL,
    anaesthetist character varying(36) NOT NULL,
    conductedby character varying(50) NOT NULL,
    witnessby character varying(50) NOT NULL,
    deliverytypeid character varying(36) NOT NULL,
    deliverycomplicatedtypeid character varying(36) NOT NULL,
    deliverycomplicatedother character varying(50),
    indication character varying(100),
    details character varying(100)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternitystageoneandtwodetails OWNER TO gpadmin;

--
-- TOC entry 519 (class 1259 OID 18326)
-- Name: maternitystagethreedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.maternitystagethreedetails (
    id character varying(36) NOT NULL,
    maternityid character varying(36) NOT NULL,
    placentadelby character varying(15),
    bloodlossamt numeric(18,2),
    bloodlosscause character varying(15),
    bloodlossother character varying(50),
    temperaturestage3 numeric(18,2),
    temperatureonehr numeric(18,2),
    pulsestage3 numeric(18,2),
    pulsestage3onehr numeric(18,2),
    bpstage3 numeric(18,2),
    bpstage3onehr numeric(18,2),
    placentatype character varying(15) NOT NULL,
    placentaweight numeric(18,2),
    placentaab character varying(100),
    membranetype character varying(15) NOT NULL,
    membraneab character varying(100),
    cordlength numeric(18,2),
    cordarndneck numeric(18,2),
    cordab character varying(100),
    cervix boolean,
    cervixsite character varying(100),
    vagina boolean,
    vaginasite character varying(100),
    pph boolean,
    pphtreatment character varying(50),
    perineum character varying(15),
    episiotomy character varying(15),
    sutureused character varying(50),
    analtone character varying(50),
    rectum character varying(50),
    painrelief character varying(20),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.maternitystagethreedetails OWNER TO gpadmin;

--
-- TOC entry 520 (class 1259 OID 18329)
-- Name: medicalrecordmovements; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.medicalrecordmovements (
    id character varying(36) NOT NULL,
    medicalrecordid character varying(36) NOT NULL,
    mrrequestid character varying(36) NOT NULL,
    movementtype character varying(36),
    movementdate timestamp without time zone NOT NULL,
    sentdeptid character varying(36),
    userid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    comment character varying(600),
    requestdeptid character varying(36),
    senttime timestamp without time zone,
    requesttime timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.medicalrecordmovements OWNER TO gpadmin;

--
-- TOC entry 521 (class 1259 OID 18332)
-- Name: medicalrecordrequests; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.medicalrecordrequests (
    id character varying(36) NOT NULL,
    medicalrecordid character varying(36) NOT NULL,
    requesteddeptid character varying(36) NOT NULL,
    requireddate timestamp without time zone NOT NULL,
    requesteddate timestamp without time zone NOT NULL,
    requesteduserid character varying(36) NOT NULL,
    requeststatus character varying(36) NOT NULL,
    appointmentid character varying(36),
    status character varying(3) NOT NULL,
    noteexist boolean,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    episodeid character varying(36),
    isprinted boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.medicalrecordrequests OWNER TO gpadmin;

--
-- TOC entry 522 (class 1259 OID 18335)
-- Name: medicalrecords; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.medicalrecords (
    id character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    currentdeptid character varying(36) NOT NULL,
    noteexist boolean,
    patientid character varying(36),
    confidential boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.medicalrecords OWNER TO gpadmin;

--
-- TOC entry 524 (class 1259 OID 18341)
-- Name: membershipcards; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.membershipcards (
    id character varying(36) NOT NULL,
    cardtypeid character varying(36) NOT NULL,
    cardnumber character varying(36) NOT NULL,
    expirydate timestamp without time zone,
    valiedfrom timestamp without time zone NOT NULL,
    isterminate boolean,
    terminatedate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL,
    patientid character varying(36),
    newic character varying(36),
    idtypeid character varying(36),
    otherno character varying(50),
    terminateby character varying(36),
    name character varying(50) NOT NULL,
    adddate timestamp without time zone,
    remarks character varying(200),
    entitlement numeric(17,2),
    recstatus character varying(3),
    debtorid character varying(50),
    chargemasterid character varying(36),
    ipbilltype character varying(36),
    opbilltype character varying(36),
    nameoncard character varying(50),
    organisation character varying(36),
    designationid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.membershipcards OWNER TO gpadmin;

--
-- TOC entry 523 (class 1259 OID 18338)
-- Name: membershipcardtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.membershipcardtypes (
    id character varying(36) NOT NULL,
    cardtypecode character varying(3) NOT NULL,
    cardtypedescription character varying(50),
    maxnoofmembers integer NOT NULL,
    isexpiry boolean NOT NULL,
    isactiveforfamily boolean NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.membershipcardtypes OWNER TO gpadmin;

--
-- TOC entry 525 (class 1259 OID 18344)
-- Name: messages; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.messages (
    messagecode character varying(36) NOT NULL,
    systemmessage character varying(400) NOT NULL,
    hcmsmessage character varying(400) NOT NULL,
    messagetype character varying(30),
    status character varying(3),
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (messagecode);


ALTER TABLE staging_mdmhits2_klgsh.messages OWNER TO gpadmin;

--
-- TOC entry 501 (class 1259 OID 18266)
-- Name: mispatientstatmonth; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mispatientstatmonth (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    company character varying(10) NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    patientid character varying(36) NOT NULL,
    mrn integer NOT NULL,
    visit integer NOT NULL,
    amount numeric(18,2) NOT NULL,
    newpatient integer NOT NULL,
    repeatpatient integer NOT NULL,
    rangerepeat character varying(50) NOT NULL,
    rangeage character varying(50) NOT NULL,
    visitip integer NOT NULL,
    visitop integer NOT NULL,
    visitdp integer NOT NULL,
    visitotc integer NOT NULL,
    newip integer NOT NULL,
    newop integer NOT NULL,
    newdp integer NOT NULL,
    newotc integer NOT NULL,
    repeatip integer NOT NULL,
    repeatop integer NOT NULL,
    repeatdp integer NOT NULL,
    repeatotc integer NOT NULL,
    amountip numeric(18,2) NOT NULL,
    amountop numeric(18,2) NOT NULL,
    amountdp numeric(18,2) NOT NULL,
    amountotc numeric(18,2) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mispatientstatmonth OWNER TO gpadmin;

--
-- TOC entry 502 (class 1259 OID 18269)
-- Name: mispatientstatyear; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mispatientstatyear (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    company character varying(20) NOT NULL,
    year integer NOT NULL,
    patientid character varying(36) NOT NULL,
    mrn integer NOT NULL,
    visit integer NOT NULL,
    amout numeric(18,2) NOT NULL,
    newpatient integer NOT NULL,
    repeatpatient integer NOT NULL,
    rangerepeat character varying(50) NOT NULL,
    rangeage character varying(50) NOT NULL,
    visitip integer NOT NULL,
    visitop integer NOT NULL,
    visitdp integer NOT NULL,
    visitotc integer NOT NULL,
    jan integer NOT NULL,
    feb integer NOT NULL,
    mac integer NOT NULL,
    apr integer NOT NULL,
    may integer NOT NULL,
    june integer NOT NULL,
    july integer NOT NULL,
    aug integer NOT NULL,
    sept integer NOT NULL,
    oct integer NOT NULL,
    nov integer NOT NULL,
    "dec" integer NOT NULL,
    newip integer NOT NULL,
    newop integer NOT NULL,
    newdp integer NOT NULL,
    newotc integer NOT NULL,
    repeatip integer NOT NULL,
    repeatop integer NOT NULL,
    repeatdp integer NOT NULL,
    repeatotc integer NOT NULL,
    amountip numeric(18,2) NOT NULL,
    amountop numeric(18,2) NOT NULL,
    amountdp numeric(18,2) NOT NULL,
    amountotc numeric(18,2) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mispatientstatyear OWNER TO gpadmin;

--
-- TOC entry 503 (class 1259 OID 18272)
-- Name: mmaclasses; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmaclasses (
    id character varying(36) NOT NULL,
    mmaclasscode character varying(8) NOT NULL,
    description character varying(100),
    classlevel integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmaclasses OWNER TO gpadmin;

--
-- TOC entry 504 (class 1259 OID 18275)
-- Name: mmagroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmagroups (
    id character varying(36) NOT NULL,
    mmagroupcode character varying(8),
    description character varying(100),
    qflag boolean,
    seqno integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmagroups OWNER TO gpadmin;

--
-- TOC entry 505 (class 1259 OID 18278)
-- Name: mmamasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmamasters (
    id character varying(36) NOT NULL,
    mmacode character varying(20) NOT NULL,
    description character varying,
    category character varying(7),
    version character varying(8),
    effectivedate timestamp without time zone,
    mmaclassid character varying(36),
    mmagroupid character varying(36),
    mmasubgroupid character varying(36),
    mmatypeid character varying(36),
    alternatecode character varying(8),
    overwriteflag boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    islisted boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmamasters OWNER TO gpadmin;

--
-- TOC entry 506 (class 1259 OID 18284)
-- Name: mmamasters_tdm; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmamasters_tdm (
    id character varying(255),
    mmacode character varying(255),
    description character varying(255),
    category character varying(255),
    version character varying(255),
    effdate timestamp without time zone,
    mmaclass character varying(255),
    mmagroup character varying(255),
    mmasubgrp character varying(255),
    mmatype character varying(255),
    altcode character varying(255),
    overwrite boolean NOT NULL,
    active character varying(3),
    compcode character varying(36),
    noteex boolean,
    adduser character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmamasters_tdm OWNER TO gpadmin;

--
-- TOC entry 507 (class 1259 OID 18290)
-- Name: mmaprices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmaprices (
    id character varying(36) NOT NULL,
    mmaconsuloncharge numeric(21,8),
    mmasurgeoncharge numeric(21,8),
    mmaanaesthetistcharge numeric(21,8),
    mmamasterid character varying(36) NOT NULL,
    feesconsulton numeric(21,8),
    feessurgeon numeric(21,8),
    feesanaesthetist numeric(21,8),
    feesconsultonmin numeric(21,8),
    feessurgeonmin numeric(21,8),
    feesanaesthetistmin numeric(21,8),
    mmaconsulonchargemin numeric(21,8),
    mmasurgeonchargemin numeric(21,8),
    mmaanaesthetistchargemin numeric(21,8),
    effectivedate timestamp without time zone,
    version character varying(8),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmaprices OWNER TO gpadmin;

--
-- TOC entry 508 (class 1259 OID 18293)
-- Name: mmasubgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmasubgroups (
    id character varying(36) NOT NULL,
    mmasubgroupcode character varying(8) NOT NULL,
    description character varying(120),
    seqno integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmasubgroups OWNER TO gpadmin;

--
-- TOC entry 509 (class 1259 OID 18296)
-- Name: mmatransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmatransactions (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodetypecode character varying(4),
    transtype character varying(2),
    docref character varying(30),
    transdate timestamp without time zone,
    chargemasterid character varying(36),
    chargecode character varying(30),
    billcode numeric(18,0),
    costcode character varying(4),
    revcd character varying(4),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    billtypemasterid character varying(36),
    billtype character varying(5),
    doctorid character varying(36),
    doctorcode character varying(15),
    chargeclass character varying(4),
    unitprice numeric(21,8),
    quantity numeric(21,8),
    amount numeric(21,8),
    chargegroupid character varying(36),
    queuestat character varying(2),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocessed boolean,
    taxamount numeric(21,8),
    billno numeric(18,0),
    auditno numeric(18,0),
    uomid character varying(36),
    invgroup character varying(4),
    regdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(36),
    resulttype character varying(36),
    resultstatus boolean,
    inventory boolean,
    updinv boolean,
    invbatch integer,
    dosageid character varying(36),
    duration integer,
    instructionid character varying(36),
    discountamount numeric(21,8),
    discountcode character varying(36),
    pkgcode character varying(36),
    comment character varying(50),
    authid character varying(50),
    authdate timestamp without time zone,
    mmaflag boolean,
    procno integer,
    overwriteamt numeric(18,8),
    chargetransid character varying(36),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmatransactions OWNER TO gpadmin;

--
-- TOC entry 510 (class 1259 OID 18299)
-- Name: mmatypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mmatypes (
    id character varying(36) NOT NULL,
    mmatypecode character varying(8) NOT NULL,
    description character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mmatypes OWNER TO gpadmin;

--
-- TOC entry 526 (class 1259 OID 18347)
-- Name: modificationlogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.modificationlogs (
    id character varying(36) NOT NULL,
    lineno integer NOT NULL,
    module character varying(250),
    submodule character varying(100),
    optionname character varying(100),
    "table" character varying(50),
    tablekey character varying(36),
    fieldname character varying(1500),
    modifytype character varying(15),
    modifyfrom character varying(1500),
    modifyto character varying(1500),
    modifyuserid character varying(36) NOT NULL,
    modifydate timestamp without time zone,
    modifytime timestamp without time zone,
    appfunctionid character varying(36),
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.modificationlogs OWNER TO gpadmin;

--
-- TOC entry 527 (class 1259 OID 18353)
-- Name: movementstats; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.movementstats (
    id character varying(36) NOT NULL,
    name character varying(50),
    description character varying(50),
    status character varying(3),
    departmentid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    audit1 character varying(50),
    audit2 character varying(50),
    audit3 character varying(50)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.movementstats OWNER TO gpadmin;

--
-- TOC entry 528 (class 1259 OID 18356)
-- Name: mrncomments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mrncomments (
    companyid character varying(36),
    description character varying(50),
    name character varying(50),
    noteexist boolean,
    patientreistrationid character varying(36),
    status character varying(50),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    viptype character varying(50),
    id character varying(36) NOT NULL
)
 DISTRIBUTED BY (companyid);


ALTER TABLE staging_mdmhits2_klgsh.mrncomments OWNER TO gpadmin;

--
-- TOC entry 511 (class 1259 OID 18302)
-- Name: mrrequestnotifications; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.mrrequestnotifications (
    id character varying(36) NOT NULL,
    mrrequestid character varying(36) NOT NULL,
    notificationtext character varying(100) NOT NULL,
    touserid character varying(36) NOT NULL,
    fromuserid character varying(36) NOT NULL,
    notificationdate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean,
    companyid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.mrrequestnotifications OWNER TO gpadmin;

--
-- TOC entry 529 (class 1259 OID 18359)
-- Name: nationalities; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.nationalities (
    id character varying(36) NOT NULL,
    code character varying(4) NOT NULL,
    description character varying(40),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.nationalities OWNER TO gpadmin;

--
-- TOC entry 530 (class 1259 OID 18362)
-- Name: nextofkins; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.nextofkins (
    id character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    seqno integer NOT NULL,
    telnohouse character varying(30),
    name character varying(50),
    relationship character varying(20),
    telnooffice character varying(30),
    addresstypeid character varying(36),
    oldic character varying(15),
    hpno character varying(50),
    street1 character varying(40),
    street2 character varying(40),
    street3 character varying(40),
    newic character varying(15),
    areaid character varying(36),
    postcodeid character varying(36),
    occupationid character varying(36),
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.nextofkins OWNER TO gpadmin;

--
-- TOC entry 531 (class 1259 OID 18365)
-- Name: notes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.notes (
    id character varying(36) NOT NULL,
    tablename character varying(50) NOT NULL,
    tablekey character varying(36) NOT NULL,
    notetitle character varying(100) NOT NULL,
    notecontent character varying NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.notes OWNER TO gpadmin;

--
-- TOC entry 532 (class 1259 OID 18371)
-- Name: nutritionstatuschangedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.nutritionstatuschangedetails (
    id character varying(36) NOT NULL,
    episodenutritionid character varying(36) NOT NULL,
    nutritionsuplystatus character varying(3) NOT NULL,
    statussetdate timestamp without time zone NOT NULL,
    statussettime timestamp without time zone NOT NULL,
    remarks character varying(50),
    noteexist boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.nutritionstatuschangedetails OWNER TO gpadmin;

--
-- TOC entry 538 (class 1259 OID 18389)
-- Name: occupations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.occupations (
    id character varying(36) NOT NULL,
    occupationcode character varying(4) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.occupations OWNER TO gpadmin;

--
-- TOC entry 539 (class 1259 OID 18392)
-- Name: operations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.operations (
    id character varying(36) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    functionid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.operations OWNER TO gpadmin;

--
-- TOC entry 540 (class 1259 OID 18395)
-- Name: ordersetdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.ordersetdetails (
    id character varying(36) NOT NULL,
    code character varying(10),
    description character varying(150),
    chargemasterid character varying(36),
    chargegroupid character varying(36),
    quantity numeric(18,0),
    companyid character varying(36) NOT NULL,
    ordersetheaderid character varying(36),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    status character varying(3) NOT NULL,
    revcode character varying(10)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.ordersetdetails OWNER TO gpadmin;

--
-- TOC entry 541 (class 1259 OID 18398)
-- Name: ordersetheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.ordersetheaders (
    id character varying(36) NOT NULL,
    code character varying(8) NOT NULL,
    description character varying(150),
    chargemasterid character varying(36),
    effictivedate timestamp without time zone,
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.ordersetheaders OWNER TO gpadmin;

--
-- TOC entry 533 (class 1259 OID 18374)
-- Name: otdutyroomreservations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.otdutyroomreservations (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    roomid character varying(36) NOT NULL,
    startdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.otdutyroomreservations OWNER TO gpadmin;

--
-- TOC entry 534 (class 1259 OID 18377)
-- Name: otoncallteams; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.otoncallteams (
    id character varying(36) NOT NULL,
    otdutyroomresid character varying(36) NOT NULL,
    ottmembertypeid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    salutation character varying(50) NOT NULL,
    firstname character varying(200) NOT NULL,
    lastname character varying(200) NOT NULL,
    contactnumber character varying(50),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.otoncallteams OWNER TO gpadmin;

--
-- TOC entry 535 (class 1259 OID 18380)
-- Name: otreservations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.otreservations (
    id character varying(36) NOT NULL,
    roomid character varying(36),
    companyid character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    operationprocedure character varying(36),
    starttime timestamp without time zone NOT NULL,
    endtime timestamp without time zone NOT NULL,
    varifiedby character varying(36),
    natureofsurgery character varying(250),
    remarks character varying(250),
    actstarttime timestamp without time zone,
    actendtime timestamp without time zone,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.otreservations OWNER TO gpadmin;

--
-- TOC entry 536 (class 1259 OID 18383)
-- Name: otteammembertypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.otteammembertypes (
    id character varying(36) NOT NULL,
    code character varying(36) NOT NULL,
    description character varying(50),
    sequence smallint,
    teamtype character varying(10),
    ismandatory boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.otteammembertypes OWNER TO gpadmin;

--
-- TOC entry 537 (class 1259 OID 18386)
-- Name: otteams; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.otteams (
    id character varying(36) NOT NULL,
    companyid character varying(36),
    otreservationid character varying(36) NOT NULL,
    ottmembertypeid character varying(36) NOT NULL,
    salutation character varying(50) NOT NULL,
    firstname character varying(200) NOT NULL,
    lastname character varying(200) NOT NULL,
    contactnumber character varying(50),
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.otteams OWNER TO gpadmin;

--
-- TOC entry 545 (class 1259 OID 18413)
-- Name: packagedetailprices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.packagedetailprices (
    id character varying(36) NOT NULL,
    packagedetailid character varying(36) NOT NULL,
    pricetypeid character varying(36) NOT NULL,
    packageitemprice numeric(21,8),
    packageitemactprice numeric(21,8),
    totprice numeric(21,8),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.packagedetailprices OWNER TO gpadmin;

--
-- TOC entry 546 (class 1259 OID 18416)
-- Name: packagedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.packagedetails (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    packagemasterid character varying(36),
    chargemasterid character varying(36),
    packagerevisiondetailid character varying(36),
    quantity numeric(18,8),
    description character varying(150),
    price numeric(21,8),
    pricetypeid character varying(36),
    actprice numeric(21,8),
    totprice numeric(21,8),
    revcode character varying(4),
    uomid character varying(36),
    chargetypeid character varying(36),
    chargegroupid character varying(36),
    qflag boolean,
    costcodeid character varying(36),
    chgflag character varying(10),
    ipacccodeid character varying(36),
    opacccodeid character varying(36),
    revdept character varying(10),
    chargeclassid character varying(36),
    costdept character varying(10),
    doctorid character varying(36),
    effectivedate timestamp without time zone,
    changedate timestamp without time zone,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.packagedetails OWNER TO gpadmin;

--
-- TOC entry 547 (class 1259 OID 18419)
-- Name: packagemasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.packagemasters (
    id character varying(36) NOT NULL,
    packagecode character varying(8) NOT NULL,
    pricetypeid character varying(36),
    chargemasterid character varying(36),
    description character varying(150),
    curamount numeric(18,8),
    prevamount numeric(18,8),
    newamount numeric(18,8),
    cureffectivedate timestamp without time zone,
    neweffectivedate timestamp without time zone,
    addchg boolean,
    autopull boolean,
    active boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.packagemasters OWNER TO gpadmin;

--
-- TOC entry 548 (class 1259 OID 18422)
-- Name: packagerevisionprices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.packagerevisionprices (
    id character varying(36) NOT NULL,
    packagerevisionid character varying(36) NOT NULL,
    pricetypeid character varying(36) NOT NULL,
    price numeric(21,8) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.packagerevisionprices OWNER TO gpadmin;

--
-- TOC entry 549 (class 1259 OID 18425)
-- Name: packagerevisions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.packagerevisions (
    id character varying(36) NOT NULL,
    packagemasterid character varying(36),
    effectivedate timestamp without time zone,
    price numeric(21,8),
    pricetypeid character varying(36),
    revisionnumber integer,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.packagerevisions OWNER TO gpadmin;

--
-- TOC entry 550 (class 1259 OID 18428)
-- Name: panelhdrs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.panelhdrs (
    id character varying(36) NOT NULL,
    icdid character varying(36),
    doctorid character varying(36),
    panelcode character varying(10) NOT NULL,
    description character varying(50),
    paneltype character varying(10),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.panelhdrs OWNER TO gpadmin;

--
-- TOC entry 551 (class 1259 OID 18431)
-- Name: panelitems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.panelitems (
    id character varying(36) NOT NULL,
    panelhdrid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.panelitems OWNER TO gpadmin;

--
-- TOC entry 552 (class 1259 OID 18434)
-- Name: paramgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.paramgroups (
    id character varying(36) NOT NULL,
    paramgroupcode character varying(40) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.paramgroups OWNER TO gpadmin;

--
-- TOC entry 553 (class 1259 OID 18437)
-- Name: paramsources; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.paramsources (
    id character varying(36) NOT NULL,
    paramsourcecode character varying(40) NOT NULL,
    description character varying(255),
    isglsource boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.paramsources OWNER TO gpadmin;

--
-- TOC entry 554 (class 1259 OID 18440)
-- Name: patientaddress; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.patientaddress (
    id character varying(36) NOT NULL,
    patientid character varying(36) NOT NULL,
    areaid character varying(36),
    addresstypeid character varying(36),
    city character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    officetelno character varying(50),
    stateid character varying(36),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    status character varying(3) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.patientaddress OWNER TO gpadmin;

--
-- TOC entry 555 (class 1259 OID 18443)
-- Name: patientcomments; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.patientcomments (
    id character varying(36) NOT NULL,
    title character varying(100) NOT NULL,
    comment character varying NOT NULL,
    commenttype character varying(4) NOT NULL,
    patientid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.patientcomments OWNER TO gpadmin;

--
-- TOC entry 556 (class 1259 OID 18449)
-- Name: patientmovements; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.patientmovements (
    id character varying(36) NOT NULL,
    patientid character varying(36),
    mrnnumber character varying(50),
    name character varying(50),
    episodeid character varying(36),
    trackingtype character varying(50),
    departmentid character varying(36),
    locationid character varying(36),
    process character varying(50),
    movementstatid character varying(36),
    transqueueid character varying(36),
    queuestatid character varying(36),
    timein timestamp without time zone,
    timeout timestamp without time zone,
    timespent numeric(10,2),
    companyid character varying(36),
    queueno integer,
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.patientmovements OWNER TO gpadmin;

--
-- TOC entry 557 (class 1259 OID 18452)
-- Name: patients; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.patients (
    areaid character varying(36),
    active boolean,
    addresstypeid character varying(36),
    admitic character varying(50),
    admitperson character varying(50),
    aeapproveuserid character varying(36),
    age integer,
    bloodgroup character varying(36),
    childno integer,
    citizenshipid character varying(36),
    city character varying(50),
    companyid character varying(36) NOT NULL,
    companyname character varying(50),
    confidential boolean,
    corpinfo character varying(50),
    dateofbirth timestamp without time zone,
    email character varying(60),
    financialstatus character varying(50),
    firstname character varying(200),
    firstvisit timestamp without time zone,
    gender character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    idtypeid character varying(36),
    languageid character varying(36),
    lastname character varying(200),
    lastvisit timestamp without time zone,
    maritalstatusid character varying(36),
    medrecord boolean,
    mrnnumber integer NOT NULL,
    mrntext character varying(50) NOT NULL,
    mrntype character varying(50) NOT NULL,
    name character varying(200),
    newic character varying(50),
    newmrn integer,
    noteexist boolean,
    occupationid character varying(36),
    officetelno character varying(50),
    oldic character varying(50),
    oldmrn integer,
    otherno integer,
    othernumber character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    raceid character varying(36),
    registrationdate timestamp without time zone,
    relationshipid character varying(36),
    religionid character varying(36),
    staffid character varying(36),
    stateid character varying(36),
    status character varying(15),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    titleid character varying(36),
    patienttype character varying(4),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    id character varying(36) NOT NULL,
    picturepath character varying(250),
    recordstatus character varying(5),
    description character varying(250),
    convertedpatientid character varying(36),
    ismedcare boolean,
    ofcaddresstypeid character varying(36),
    ofcstreet1 character varying(50),
    ofcstreet2 character varying(50),
    ofcstreet3 character varying(50),
    ofch_pphoneno character varying(50),
    ofccity character varying(50),
    blockno character varying(50),
    ofcemail character varying(50),
    ofcpostalcodeid character varying(36),
    ofcareaid character varying(36),
    ofcstateid character varying(36)
)
 DISTRIBUTED BY (areaid);


ALTER TABLE staging_mdmhits2_klgsh.patients OWNER TO gpadmin;

--
-- TOC entry 558 (class 1259 OID 18458)
-- Name: patients_bkup; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.patients_bkup (
    areaid character varying(36),
    active boolean,
    addresstypeid character varying(36),
    admitic character varying(50),
    admitperson character varying(50),
    aeapproveuserid character varying(36),
    age integer,
    bloodgroup character varying(36),
    childno integer,
    citizenshipid character varying(36),
    city character varying(50),
    companyid character varying(36) NOT NULL,
    companyname character varying(50),
    confidential boolean,
    corpinfo character varying(50),
    dateofbirth timestamp without time zone,
    email character varying(60),
    financialstatus character varying(50),
    firstname character varying(200),
    firstvisit timestamp without time zone,
    gender character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    idtypeid character varying(36),
    languageid character varying(36),
    lastname character varying(200),
    lastvisit timestamp without time zone,
    maritalstatusid character varying(36),
    medrecord boolean,
    mrnnumber integer NOT NULL,
    mrntext character varying(50) NOT NULL,
    mrntype character varying(50) NOT NULL,
    name character varying(200),
    newic character varying(50),
    newmrn integer,
    noteexist boolean,
    occupationid character varying(36),
    officetelno character varying(50),
    oldic character varying(50),
    oldmrn integer,
    otherno integer,
    othernumber character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    raceid character varying(36),
    registrationdate timestamp without time zone,
    relationshipid character varying(36),
    religionid character varying(36),
    staffid character varying(36),
    stateid character varying(36),
    status character varying(15),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    titleid character varying(36),
    patienttype character varying(4),
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    id character varying(36) NOT NULL,
    picturepath character varying(250),
    recordstatus character varying(5),
    description character varying(250),
    convertedpatientid character varying(36),
    ismedcare boolean,
    ofcaddresstypeid character varying(36),
    ofcstreet1 character varying(50),
    ofcstreet2 character varying(50),
    ofcstreet3 character varying(50),
    ofch_pphoneno character varying(50),
    ofccity character varying(50),
    blockno character varying(50),
    ofcemail character varying(50),
    ofcpostalcodeid character varying(36),
    ofcareaid character varying(36),
    ofcstateid character varying(36)
)
 DISTRIBUTED BY (areaid);


ALTER TABLE staging_mdmhits2_klgsh.patients_bkup OWNER TO gpadmin;

--
-- TOC entry 562 (class 1259 OID 18473)
-- Name: payergroupexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.payergroupexceptions (
    id character varying(36) NOT NULL,
    chargegroupid character varying(36) NOT NULL,
    debtormasterid character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    description character varying(75),
    grouplimit numeric(18,2),
    individualitemlimit numeric(18,2),
    isgroupunlimited boolean NOT NULL,
    isitemunlimited boolean NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.payergroupexceptions OWNER TO gpadmin;

--
-- TOC entry 563 (class 1259 OID 18476)
-- Name: payeritemexceptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.payeritemexceptions (
    id character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    payergroupexceptionid character varying(36) NOT NULL,
    description character varying(75),
    itemlimit numeric(18,2),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.payeritemexceptions OWNER TO gpadmin;

--
-- TOC entry 559 (class 1259 OID 18464)
-- Name: paygrouppaymodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.paygrouppaymodes (
    paygroupid character varying(36) NOT NULL,
    paymodeid character varying(36) NOT NULL
)
 DISTRIBUTED BY (paygroupid);


ALTER TABLE staging_mdmhits2_klgsh.paygrouppaymodes OWNER TO gpadmin;

--
-- TOC entry 560 (class 1259 OID 18467)
-- Name: paygroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.paygroups (
    id character varying(36) NOT NULL,
    paygroup character varying(8) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.paygroups OWNER TO gpadmin;

--
-- TOC entry 561 (class 1259 OID 18470)
-- Name: paymodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.paymodes (
    id character varying(36) NOT NULL,
    paymode character varying(36) NOT NULL,
    source character varying(2),
    transtype character varying(4),
    description character varying(100),
    ccode character varying(6),
    glaccno character varying(8),
    isepisode boolean,
    isreceiptandbilling boolean,
    paytype character varying(15) NOT NULL,
    cardflag boolean,
    valexpdate boolean,
    comrate numeric(19,4),
    drcommrate numeric(19,4),
    drpayment boolean,
    cardcent character varying(8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    costcenterid character varying(36),
    glaccountid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.paymodes OWNER TO gpadmin;

--
-- TOC entry 564 (class 1259 OID 18479)
-- Name: pendingprocesses; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.pendingprocesses (
    id character varying(36) NOT NULL,
    refid character varying(36) NOT NULL,
    tablename character varying(100) NOT NULL,
    processname character varying(50) NOT NULL,
    processed boolean,
    note character varying(255),
    sessionid character varying(36),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    sessioncode character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.pendingprocesses OWNER TO gpadmin;

--
-- TOC entry 565 (class 1259 OID 18482)
-- Name: periods; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.periods (
    id character varying(36) NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodnum integer NOT NULL,
    datefrom timestamp without time zone,
    dateto timestamp without time zone,
    isclosed boolean NOT NULL,
    companyid character varying(36),
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.periods OWNER TO gpadmin;

--
-- TOC entry 566 (class 1259 OID 18485)
-- Name: physicalcountdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.physicalcountdetails (
    id character varying(36) NOT NULL,
    line_no integer NOT NULL,
    stockcountheaderid character varying(20) NOT NULL,
    stockcountdetailsid integer NOT NULL,
    productid character varying(36) NOT NULL,
    freezdate timestamp without time zone,
    physicalqty numeric(18,2),
    stocktakedate timestamp without time zone,
    itemsetstatusid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.physicalcountdetails OWNER TO gpadmin;

--
-- TOC entry 542 (class 1259 OID 18401)
-- Name: pmtrackings; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.pmtrackings (
    id character varying(36) NOT NULL,
    departmentid character varying(36),
    episodeid character varying(36),
    locationid character varying(36),
    mrnnumber character varying(50),
    name character varying(50),
    patientreistrationid character varying(36),
    process character varying(50),
    timein timestamp without time zone,
    timeout timestamp without time zone,
    timespent numeric(10,2),
    trackingtype character varying(50),
    transqueueid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.pmtrackings OWNER TO gpadmin;

--
-- TOC entry 543 (class 1259 OID 18404)
-- Name: posignature; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.posignature (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    effdate timestamp without time zone,
    signatureno integer,
    lable1 character varying(100),
    name1 character varying(100),
    designation1 character varying(100),
    lable2 character varying(100),
    name2 character varying(100),
    designation2 character varying(100),
    lable3 character varying(100),
    name3 character varying(100),
    designation3 character varying(100),
    lable4 character varying(100),
    name4 character varying(100),
    designation4 character varying(100),
    lable5 character varying(100),
    name5 character varying(100),
    designation5 character varying(100),
    limitflag boolean,
    limitamount numeric(21,2),
    signaturenolimit integer,
    lablelimit1 character varying(100),
    namelimit1 character varying(100),
    designationlimit1 character varying(100),
    lablelimit2 character varying(100),
    namelimit2 character varying(100),
    designationlimit2 character varying(100),
    lablelimit3 character varying(100),
    namelimit3 character varying(100),
    designationlimit3 character varying(100),
    lablelimit4 character varying(100),
    namelimit4 character varying(100),
    designationlimit4 character varying(100),
    lablelimit5 character varying(100),
    namelimit5 character varying(100),
    designationlimit5 character varying(100),
    adddate timestamp without time zone,
    adduserid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    active character varying(36),
    potype character varying(36),
    asset boolean,
    recno integer,
    status character varying(3)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.posignature OWNER TO gpadmin;

--
-- TOC entry 567 (class 1259 OID 18488)
-- Name: postalcodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.postalcodes (
    id character varying(36) NOT NULL,
    postcode character varying(10) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    stateid character varying(36) NOT NULL,
    countryid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.postalcodes OWNER TO gpadmin;

--
-- TOC entry 544 (class 1259 OID 18410)
-- Name: potypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.potypes (
    id character varying(36) NOT NULL,
    code character varying(10),
    description character varying(80),
    status character varying(3) NOT NULL,
    departmentid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.potypes OWNER TO gpadmin;

--
-- TOC entry 568 (class 1259 OID 18491)
-- Name: pricedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.pricedetails (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    pricetypeid character varying(36) NOT NULL,
    chargemasterid character varying(36) NOT NULL,
    glaccountcrid character varying(36),
    glaccountdrid character varying(36),
    amount numeric(18,2) NOT NULL,
    iscurrent boolean NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    taxmasterid character varying(36),
    costprice numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.pricedetails OWNER TO gpadmin;

--
-- TOC entry 569 (class 1259 OID 18494)
-- Name: pricesources; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.pricesources (
    id character varying(36) NOT NULL,
    pricecode character varying(4) NOT NULL,
    description character varying(80),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.pricesources OWNER TO gpadmin;

--
-- TOC entry 570 (class 1259 OID 18497)
-- Name: pricetypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.pricetypes (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    pricetypecode character varying(5) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.pricetypes OWNER TO gpadmin;

--
-- TOC entry 571 (class 1259 OID 18500)
-- Name: printers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.printers (
    id character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    prtname character varying(40),
    pathname character varying(40),
    localid character varying(8),
    seqno integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.printers OWNER TO gpadmin;

--
-- TOC entry 572 (class 1259 OID 18503)
-- Name: privileges; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.privileges (
    id character varying(36) NOT NULL,
    name character varying(225) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.privileges OWNER TO gpadmin;

--
-- TOC entry 573 (class 1259 OID 18506)
-- Name: privilegesdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.privilegesdetails (
    id character varying(36) NOT NULL,
    privilegeid character varying(36) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.privilegesdetails OWNER TO gpadmin;

--
-- TOC entry 574 (class 1259 OID 18509)
-- Name: prodsubcategories; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.prodsubcategories (
    id character varying(36) NOT NULL,
    productcategoryid character varying(36),
    code character varying(30),
    description character varying(80),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.prodsubcategories OWNER TO gpadmin;

--
-- TOC entry 575 (class 1259 OID 18512)
-- Name: productcategories; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.productcategories (
    id character varying(36) NOT NULL,
    catcode character varying(24),
    description character varying(80),
    stockacctid character varying(36),
    costacctid character varying(36),
    adjacctid character varying(36),
    woffacctid character varying(36),
    expacctid character varying(36),
    loanacctid character varying(36),
    accrualaccid character varying(36),
    stktakeadjacctid character varying(36),
    source character varying(4),
    cattype character varying(4),
    povalidatetime boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.productcategories OWNER TO gpadmin;

--
-- TOC entry 576 (class 1259 OID 18515)
-- Name: productgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.productgroups (
    id character varying(36) NOT NULL,
    code character varying(30) NOT NULL,
    description character varying(50),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.productgroups OWNER TO gpadmin;

--
-- TOC entry 577 (class 1259 OID 18518)
-- Name: productlogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.productlogs (
    id character varying(36) NOT NULL,
    productid character varying(36),
    uomid character varying(36),
    avgcost numeric(21,8),
    actavgcost numeric(21,8),
    qtyonhand numeric(21,8),
    supplierid character varying(36),
    currprice numeric(21,8),
    bonqty numeric(21,8),
    minqty numeric(21,8),
    maxqty numeric(21,8),
    reordlevel numeric(21,8),
    reordqty numeric(21,8),
    active boolean,
    chgflag boolean,
    newavgcost numeric(21,8),
    newuomid character varying(36),
    newactive boolean,
    prodlogcat character varying(36),
    remarks character varying(255),
    costmargin numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.productlogs OWNER TO gpadmin;

--
-- TOC entry 578 (class 1259 OID 18521)
-- Name: products; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.products (
    id character varying(36) NOT NULL,
    itemcode character varying(30) NOT NULL,
    description character varying(120),
    genericname character varying(100),
    isantibiotic boolean,
    brandname character varying(30),
    manufacture character varying(30),
    productgroupid character varying(36),
    productcategoryid character varying(36),
    prodsubcategoryid character varying(36),
    chargeuomid character varying(36),
    pouomid character varying(36),
    smalluonid character varying(36),
    repackitem boolean,
    chargeflag boolean,
    reqexpdateflg boolean,
    activeflag boolean,
    reuse boolean,
    mainsupplierid character varying(36),
    mainstoreid character varying(36),
    tagging character varying(16),
    itemtype character varying(40),
    averagecost numeric(23,8),
    actavgcost numeric(23,8),
    currprice numeric(23,8),
    costmargin numeric(19,8),
    quantityonhand numeric(19,4),
    bonqty numeric(19,4),
    minqty integer,
    maxqty integer,
    reordlevel integer,
    reordqty integer,
    trqty integer,
    deactivedate timestamp without time zone,
    remarks character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    assetscategoryid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.products OWNER TO gpadmin;

--
-- TOC entry 579 (class 1259 OID 18524)
-- Name: products_tmpdu; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.products_tmpdu (
    id character varying(36),
    itemcode character varying(30),
    description character varying(80),
    groupcode character varying(36),
    productcat character varying(36),
    subcatcode character varying(36),
    uomcode character varying(36),
    pouom character varying(36),
    smalluom character varying(36),
    rpkitem boolean NOT NULL,
    chgflag boolean NOT NULL,
    expdtflg boolean NOT NULL,
    active boolean NOT NULL,
    reuse boolean NOT NULL,
    suppcode character varying(36),
    mstore character varying(36),
    tagging character varying(16),
    itemtype character varying(40),
    avgcost double precision,
    actavgcost double precision,
    currprice double precision,
    costmargin double precision,
    qtyonhand double precision,
    bonqty double precision,
    minqty integer,
    maxqty integer,
    reordlevel integer,
    reordqty integer,
    trqty integer,
    deactivedate timestamp without time zone,
    status character varying(3),
    compcode character varying(36),
    adduser character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.products_tmpdu OWNER TO gpadmin;

--
-- TOC entry 580 (class 1259 OID 18527)
-- Name: purchaseorderdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.purchaseorderdetails (
    id character varying(36) NOT NULL,
    purchaseorderheaderid character varying(36) NOT NULL,
    line integer,
    productid character varying(36),
    productdescription character varying(120),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    orderquantity numeric(19,8),
    remarks character varying,
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaserequestdetailid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    linkid character varying(10),
    taxdetailid character varying(36),
    netamount numeric(21,8),
    taxamount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.purchaseorderdetails OWNER TO gpadmin;

--
-- TOC entry 581 (class 1259 OID 18533)
-- Name: purchaseorderheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.purchaseorderheaders (
    id character varying(36) NOT NULL,
    ponumber character varying(10) NOT NULL,
    potypeid character varying(36) NOT NULL,
    purchasedeptid character varying(36),
    requestdeptid character varying(36),
    deliverydeptid character varying(36),
    orderdate timestamp without time zone,
    expecteddate timestamp without time zone,
    expirydate timestamp without time zone,
    termsid character varying(36),
    supplierid character varying(36),
    postatusid character varying(36),
    issuepersonid character varying(36),
    issuedate timestamp without time zone,
    firstauthpersonid character varying(36),
    firstauthdate timestamp without time zone,
    entereddate timestamp without time zone,
    currancyid character varying(36),
    currencyrateid character varying(36),
    remarks character varying(255),
    discounttypeid character varying(36),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    recordno character varying(10),
    isexport boolean,
    destinationdeptid character varying(36),
    prheaderid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.purchaseorderheaders OWNER TO gpadmin;

--
-- TOC entry 582 (class 1259 OID 18536)
-- Name: purchaserequestdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.purchaserequestdetails (
    id character varying(36) NOT NULL,
    purchaserequestheaderid character varying(36) NOT NULL,
    line integer NOT NULL,
    productid character varying(36),
    productdescription character varying(120),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    requestquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8),
    amount numeric(21,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    supplierproductid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    taxdetailid character varying(36),
    ponumber character varying(10),
    purchaseorderheaderid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.purchaserequestdetails OWNER TO gpadmin;

--
-- TOC entry 583 (class 1259 OID 18539)
-- Name: purchaserequestheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.purchaserequestheaders (
    id character varying(36) NOT NULL,
    prnumber character varying(10) NOT NULL,
    prdate timestamp without time zone NOT NULL,
    prstatusid character varying(36) NOT NULL,
    requestdeptid character varying(36) NOT NULL,
    requestpersonid character varying(36) NOT NULL,
    purchasedeptid character varying(36),
    authorizepersonid character varying(36),
    authorizedate timestamp without time zone,
    remarks character varying(255),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    supplierid character varying(36),
    subamount numeric(21,8),
    totalamount numeric(21,8)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.purchaserequestheaders OWNER TO gpadmin;

--
-- TOC entry 676 (class 1259 OID 18847)
-- Name: pxf_activereportparams; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_activereportparams (
    id character varying(36),
    activereporttaskid character varying(36),
    paramname character varying(100),
    paramvalue character varying(250),
    longparam character varying(4000),
    status character varying(5),
    printeddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.activereportparams?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_activereportparams OWNER TO gpadmin;

--
-- TOC entry 677 (class 1259 OID 18850)
-- Name: pxf_activereporttasks; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_activereporttasks (
    id character varying(36),
    companyid character varying(36),
    serialno bigint,
    reportid character varying(3),
    sessionid character varying(36),
    printed boolean,
    status character varying(5),
    printeddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.activereporttasks?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_activereporttasks OWNER TO gpadmin;

--
-- TOC entry 678 (class 1259 OID 18853)
-- Name: pxf_addresstypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_addresstypes (
    id character varying(36),
    typecode character varying(30),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    contacttypeid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.addresstypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_addresstypes OWNER TO gpadmin;

--
-- TOC entry 679 (class 1259 OID 18856)
-- Name: pxf_admissionsources; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_admissionsources (
    id character varying(36),
    admissionsourcecode character varying(10),
    description character varying(40),
    admissionflag boolean,
    registrationflag boolean,
    registrationfees boolean,
    addr1 character varying(40),
    addr2 character varying(40),
    addr3 character varying(40),
    addr4 character varying(40),
    telephone character varying(20),
    email character varying(50),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    fax character varying(20)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.admissionsources?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_admissionsources OWNER TO gpadmin;

--
-- TOC entry 681 (class 1259 OID 18862)
-- Name: pxf_alerts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_alerts (
    id character varying(36),
    alertcode character varying(8),
    description character varying(200),
    alerttypeid character varying(36),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.alerts?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_alerts OWNER TO gpadmin;

--
-- TOC entry 680 (class 1259 OID 18859)
-- Name: pxf_alerttypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_alerttypes (
    id character varying(36),
    alerttype character varying(20),
    alertgroup character varying(4),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.alerttypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_alerttypes OWNER TO gpadmin;

--
-- TOC entry 682 (class 1259 OID 18865)
-- Name: pxf_allocationdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_allocationdetails (
    id character varying(36),
    allocationheaderid character varying(36),
    chargeclassid character varying(36),
    chargegroupid character varying(36),
    companyid character varying(36),
    amount numeric(18,2),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    iscancelled boolean,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    docstat boolean,
    doctrantype character varying(4),
    docauditno integer,
    invcode character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.allocationdetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_allocationdetails OWNER TO gpadmin;

--
-- TOC entry 683 (class 1259 OID 18869)
-- Name: pxf_allocationheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_allocationheaders (
    id character varying(36),
    deposittheaderid character varying(36),
    billheaderid character varying(36),
    companyid character varying(36),
    allocationamount numeric(18,2),
    allocationdate timestamp without time zone,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    iscancelled boolean,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    cancelledreason character varying(250),
    financeoperation character varying(1),
    appoperationid character varying(36),
    auditno bigint,
    isprocess boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.allocationheaders?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_allocationheaders OWNER TO gpadmin;

--
-- TOC entry 686 (class 1259 OID 18879)
-- Name: pxf_antibiotics; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibiotics (
    id character varying(36),
    productid character varying(36),
    antibiotictypeid integer,
    strength numeric(18,2),
    unit character varying(36),
    mohreport boolean,
    hospitalreport boolean,
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.antibiotics?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibiotics OWNER TO gpadmin;

--
-- TOC entry 684 (class 1259 OID 18873)
-- Name: pxf_antibioticsetups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibioticsetups (
    id character varying(36),
    type character varying(30),
    name character varying(100),
    ddd numeric(18,2),
    seqno integer,
    unit character varying(8),
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.antibioticsetups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibioticsetups OWNER TO gpadmin;

--
-- TOC entry 685 (class 1259 OID 18876)
-- Name: pxf_antibiotictypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibiotictypes (
    id integer,
    description character varying(80),
    ddd numeric(18,2),
    effectivedate timestamp without time zone,
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.antibiotictypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_antibiotictypes OWNER TO gpadmin;

--
-- TOC entry 673 (class 1259 OID 18837)
-- Name: pxf_apactdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apactdetails (
    id character varying(36),
    apactheaderid character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    entrydate timestamp without time zone,
    documentno character varying(36),
    categoryid character varying(36),
    reference character varying(36),
    departmentid character varying(36),
    amount numeric(21,8),
    stat character varying(2),
    patientid character varying(36),
    episodeid character varying(36),
    billno integer,
    paymodeid character varying(36),
    deliveryorderheaderid character varying(36),
    deliveryorderdetailid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    status character varying(4),
    taxamount numeric(21,8),
    allocauditno integer,
    alloctnauditno integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.apactdetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apactdetails OWNER TO gpadmin;

--
-- TOC entry 674 (class 1259 OID 18840)
-- Name: pxf_apactheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apactheaders (
    id character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    documentno character varying(100),
    supplierid character varying(36),
    bankid character varying(36),
    paymodeid character varying(36),
    chequetransactionid character varying(36),
    cheqdate timestamp without time zone,
    actdate timestamp without time zone,
    categoryid character varying(36),
    amount numeric(21,8),
    outamount numeric(21,8),
    remarks character varying(255),
    stat character varying(2),
    isposted boolean,
    entryuserid character varying(36),
    entrydate timestamp without time zone,
    payto character varying(36),
    isdoctor boolean,
    recdate timestamp without time zone,
    conversion boolean,
    srcfrom character varying(40),
    srcto character varying(40),
    departmentid character varying(36),
    reconflg boolean,
    currencyid character varying(36),
    currencyrate numeric(18,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    doctorid character varying(36),
    tilldetailid character varying(36),
    transtype character(10),
    taxdetailid character varying(36),
    taxamount numeric(21,8),
    status character varying(4),
    suppliername character varying(200),
    invtype character(10)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.apactheaders?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apactheaders OWNER TO gpadmin;

--
-- TOC entry 675 (class 1259 OID 18843)
-- Name: pxf_apallocations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apallocations (
    id character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    docsource character varying(4),
    doctrantype character varying(4),
    docauditno integer,
    refsource character varying(4),
    reftrantype character varying(4),
    refauditno integer,
    refamount numeric(21,8),
    allocdate timestamp without time zone,
    allocamount numeric(21,8),
    allocstat character varying(3),
    paymodeid character varying(36),
    bankid character varying(36),
    reference character varying(100),
    chequedate timestamp without time zone,
    supplierid character varying(36),
    remarks character varying(100),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    docid character varying(36),
    refid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.apallocations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_apallocations OWNER TO gpadmin;

--
-- TOC entry 687 (class 1259 OID 18882)
-- Name: pxf_appfunctions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appfunctions (
    id character varying(36),
    menusequence character varying(36),
    name character varying(100),
    description character varying(255),
    partid integer,
    funclevel integer,
    functype character varying(1),
    packagepage character varying(250),
    packagemodule character varying(250),
    iconpath character varying(100),
    qaiconpath character varying(100),
    ismenuitem boolean,
    defaulttabname character varying(30),
    parentfunctionid character varying(36),
    submodule character varying(100),
    optionname character varying(100),
    entitysetname character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    menuversion character varying(10)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.appfunctions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appfunctions OWNER TO gpadmin;

--
-- TOC entry 689 (class 1259 OID 18888)
-- Name: pxf_appointments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appointments (
    id character varying(36),
    appointmentref character varying(50),
    patientid character varying(36),
    firstname character varying(200),
    lastname character varying(100),
    email character varying(60),
    gender character varying(36),
    address1 character varying(60),
    address2 character varying(60),
    countryid character varying(36),
    phoneno character varying(50),
    specialityid character varying(36),
    dateofappointment timestamp without time zone,
    fromtime timestamp without time zone,
    totime timestamp without time zone,
    preferredtime timestamp without time zone,
    doctorid character varying(36),
    appointmentreason character varying(50),
    status character varying(10),
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    disciplineid character varying(36),
    noteexist boolean,
    keyindate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.appointments?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appointments OWNER TO gpadmin;

--
-- TOC entry 688 (class 1259 OID 18885)
-- Name: pxf_appoperations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appoperations (
    id character varying(36),
    sourceid character varying(36),
    transtypeid character varying(36),
    transactioncode character varying(10),
    description character varying(255),
    displayname character varying(50),
    maxtranno integer,
    prefix character varying(6),
    isupdatepayername boolean,
    isupdateepisode boolean,
    isupdatedebtor boolean,
    isallowautoallocation boolean,
    isallowmanualal0location boolean,
    status character varying(3),
    companyid character varying(36),
    updateddate timestamp without time zone,
    createddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.appoperations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_appoperations OWNER TO gpadmin;

--
-- TOC entry 690 (class 1259 OID 18891)
-- Name: pxf_areagroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_areagroups (
    id character varying(36),
    areagroupcode character varying(8),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.areagroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_areagroups OWNER TO gpadmin;

--
-- TOC entry 691 (class 1259 OID 18894)
-- Name: pxf_areas; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_areas (
    id character varying(36),
    areacode character varying(6),
    description character varying(60),
    status character varying(3),
    areagroupid character varying(36),
    postcodeid character varying(36),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.areas?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_areas OWNER TO gpadmin;

--
-- TOC entry 692 (class 1259 OID 18897)
-- Name: pxf_assetcategories; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetcategories (
    id character varying(36),
    assettypeid character varying(36),
    departmentid character varying(36),
    nexttagnumber integer,
    basistypeid character varying(36),
    rateperannum numeric(18,2),
    residualvalue numeric(18,2),
    glassetaccountid character varying(36),
    glassetcostcodeid character varying(36),
    gldepaccountid character varying(36),
    gldepcostcodeid character varying(36),
    glprovisiondepaccountid character varying(36),
    glprovisiondepcostcodeid character varying(36),
    glgainlossaccountid character varying(36),
    glgainlostcostcodeid character varying(36),
    gldebtoraccountid character varying(36),
    gldebtorcostcodeid character varying(36),
    glrevaluationaccountid character varying(36),
    glrevaluationcostcodeid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    code character varying(10),
    description character varying(100),
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assetcategories?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetcategories OWNER TO gpadmin;

--
-- TOC entry 693 (class 1259 OID 18900)
-- Name: pxf_assetperiods; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetperiods (
    id character varying(36),
    companyid character varying(36),
    fiscalyearid character varying(36),
    periodid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assetperiods?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetperiods OWNER TO gpadmin;

--
-- TOC entry 697 (class 1259 OID 18912)
-- Name: pxf_assets; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assets (
    id character varying(36),
    assetno character varying(30),
    assetmode character varying(36),
    assetcategoryid character varying(36),
    assettypeid character varying(36),
    departmentlocationid character varying(36),
    purchaseorderdetailid character varying(36),
    deliveryorderdetailid character varying(36),
    companyid character varying(36),
    ponumber character varying(10),
    purchasedate timestamp without time zone,
    purchaseprice numeric(20,8),
    originalcost numeric(20,8),
    depstartdate timestamp without time zone,
    currentcost numeric(20,8),
    insurancevalue numeric(20,8),
    quantity character(10),
    lastyeartodatedep numeric(20,8),
    currentyeartodatedep numeric(20,8),
    lastdeplstytddepdate timestamp without time zone,
    isindividualtag boolean,
    assettxntype character varying(36),
    serialno character varying(20),
    casisno character varying(40),
    lotno character varying(40),
    engineno character varying(40),
    status character(10),
    taggeduserid character varying(36),
    taggeddate timestamp without time zone,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    deliveryorderhdrid character varying(36),
    supplierid character varying(36),
    apactheaderid character varying(36),
    productid character varying(36),
    statdate timestamp without time zone,
    nprefid character varying(36),
    recno character varying(40),
    tagno character varying(40),
    appoperationid character varying(36),
    trantypeid character varying(36),
    locationid character varying(36),
    departmentid character varying(36),
    invoicenum character varying(100),
    delordernum character varying(30),
    deliverydate timestamp without time zone,
    actdate timestamp without time zone,
    rateperannum numeric(18,8),
    description character varying(200),
    assetbatchno character varying(30)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assets?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assets OWNER TO gpadmin;

--
-- TOC entry 694 (class 1259 OID 18903)
-- Name: pxf_assetsummary; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetsummary (
    id character varying(36),
    companyid character varying(36),
    assetid character varying(36),
    fiscalyearid character varying(36),
    periodid character varying(36),
    costopening numeric(20,8),
    costaddition numeric(20,8),
    costdisposal numeric(20,8),
    costwriteoff numeric(20,8),
    costclosing numeric(20,8),
    depropening numeric(20,8),
    deprcharge numeric(20,8),
    deprdisposal numeric(20,8),
    deprwriteoff numeric(20,8),
    deprclosing numeric(20,8),
    netbookvalue numeric(20,8),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assetsummary?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assetsummary OWNER TO gpadmin;

--
-- TOC entry 695 (class 1259 OID 18906)
-- Name: pxf_assettransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assettransactions (
    id character varying(36),
    assetid character varying(36),
    assettxntype character varying(36),
    depreciationrate numeric(20,8),
    auditno integer,
    amount numeric(21,8),
    reference character varying(100),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    trantypeid character varying(36),
    amount1 numeric(21,8),
    transactiondate timestamp without time zone,
    netbookvalue numeric(21,8),
    status character varying(3),
    debtorid character varying(50),
    olddepartmentid character varying(36),
    newdepartmentid character varying(36),
    newlocationid character varying(36),
    oldlocationid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assettransactions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assettransactions OWNER TO gpadmin;

--
-- TOC entry 696 (class 1259 OID 18909)
-- Name: pxf_assettypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assettypes (
    id character varying(36),
    companyid character varying(36),
    assettypecode character varying(2),
    description character varying(40),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.assettypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_assettypes OWNER TO gpadmin;

--
-- TOC entry 698 (class 1259 OID 18915)
-- Name: pxf_authoriserdepartments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authoriserdepartments (
    authoriserid character varying(36),
    departmentid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.authoriserdepartments?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authoriserdepartments OWNER TO gpadmin;

--
-- TOC entry 700 (class 1259 OID 18921)
-- Name: pxf_authorisers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authorisers (
    id character varying(36),
    userid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    transtypeid character varying(36),
    departmentid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.authorisers?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authorisers OWNER TO gpadmin;

--
-- TOC entry 699 (class 1259 OID 18918)
-- Name: pxf_authorisertranstypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authorisertranstypes (
    authoriserid character varying(36),
    transtypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.authorisertranstypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_authorisertranstypes OWNER TO gpadmin;

--
-- TOC entry 702 (class 1259 OID 18927)
-- Name: pxf_babyapgarscores; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_babyapgarscores (
    id character varying(36),
    babyapgarscoretypeid character varying(36),
    maternitybabyrecordid character varying(36),
    apgar1min integer,
    apgar5min integer,
    apgar10min integer,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.babyapgarscores?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_babyapgarscores OWNER TO gpadmin;

--
-- TOC entry 701 (class 1259 OID 18924)
-- Name: pxf_babyapgarscoretypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_babyapgarscoretypes (
    id character varying(36),
    apgarscorecode character varying(30),
    apgarscoredescription character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.babyapgarscoretypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_babyapgarscoretypes OWNER TO gpadmin;

--
-- TOC entry 703 (class 1259 OID 18930)
-- Name: pxf_backgroundtasks; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_backgroundtasks (
    id character varying(36),
    taskname character varying(20),
    filepath character varying(250),
    status character varying(5),
    iscomplete boolean,
    userid character varying(36),
    taskdate timestamp without time zone,
    companyid character varying(36),
    sessionid character varying(36),
    machinename character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.backgroundtasks?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_backgroundtasks OWNER TO gpadmin;

--
-- TOC entry 704 (class 1259 OID 18933)
-- Name: pxf_baddebtoralls; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_baddebtoralls (
    id character varying(36),
    baddebtorid character varying(36),
    appoperationid character varying(36),
    companyid character varying(36),
    line integer,
    payercode character varying(100),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    patientid character varying(36),
    episodeid character varying(36),
    docauditno bigint,
    amount numeric(21,8),
    outamount numeric(21,8),
    allocdate timestamp without time zone,
    displaydocno character varying(25),
    remarks character varying(100),
    allocstatus character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    printedby character varying(36),
    refauditno bigint,
    reftranstype character varying(36),
    refamount numeric(18,0),
    refsource character varying(36),
    reflineno character varying(36),
    auditno bigint,
    docsource character varying(36),
    doctranstype character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.baddebtoralls?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_baddebtoralls OWNER TO gpadmin;

--
-- TOC entry 705 (class 1259 OID 18936)
-- Name: pxf_baddebtors; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_baddebtors (
    id character varying(36),
    appoperationid character varying(36),
    companyid character varying(36),
    line integer,
    payercode character varying(100),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    patientid character varying(36),
    episodeid character varying(36),
    docauditno bigint,
    amount numeric(21,8),
    outamount numeric(21,8),
    allocdate timestamp without time zone,
    displaydocno character varying(25),
    remarks character varying(100),
    allocstatus character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    printedby character varying(36),
    refauditno bigint,
    reftranstype character varying(36),
    refamount numeric(18,0),
    refsource character varying(36),
    reflineno character varying(36),
    auditno bigint,
    docsource character varying(36),
    doctranstype character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.baddebtors?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_baddebtors OWNER TO gpadmin;

--
-- TOC entry 709 (class 1259 OID 18948)
-- Name: pxf_banks; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banks (
    id character varying(36),
    bankcode character varying(30),
    bankname character varying(50),
    address1 character varying(250),
    address2 character varying(250),
    address3 character varying(250),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36),
    telephoneno character varying(15),
    faxno character varying(15),
    contactid character varying(100),
    bankaccount character varying(20),
    clearday integer,
    effectiveday timestamp without time zone,
    glaccountid character varying(36),
    costcenterid character varying(36),
    pctype boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    swiftcode character varying(10),
    achcode character varying(10),
    banktypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.banks?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banks OWNER TO gpadmin;

--
-- TOC entry 706 (class 1259 OID 18939)
-- Name: pxf_banksummaries; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banksummaries (
    id character varying(36),
    fiscalyearid character varying(36),
    periodid character varying(36),
    bankid character varying(36),
    openbalance numeric(21,8),
    actualamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.banksummaries?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banksummaries OWNER TO gpadmin;

--
-- TOC entry 707 (class 1259 OID 18942)
-- Name: pxf_banksuppliers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banksuppliers (
    id character varying(36),
    bankcode character varying(30),
    bankname character varying(250),
    pvalue1 character varying(250),
    pvalue2 character varying(250),
    pvalue3 character varying(250),
    swiftcode character varying(10),
    achcode character varying(10),
    effectiveday timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.banksuppliers?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banksuppliers OWNER TO gpadmin;

--
-- TOC entry 708 (class 1259 OID 18945)
-- Name: pxf_banktypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banktypes (
    id character varying(36),
    banktypecode character varying(36),
    description character varying(60),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.banktypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_banktypes OWNER TO gpadmin;

--
-- TOC entry 710 (class 1259 OID 18951)
-- Name: pxf_barcodeprinters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_barcodeprinters (
    id character varying(36),
    line integer,
    printerid character varying(36),
    printertype character varying(36),
    linetype character varying(36),
    command character varying(255),
    islineskip boolean,
    isreuse boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.barcodeprinters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_barcodeprinters OWNER TO gpadmin;

--
-- TOC entry 711 (class 1259 OID 18954)
-- Name: pxf_bbraunconsignmentstemps; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bbraunconsignmentstemps (
    productid character varying(36),
    itemcode character varying(30),
    description character varying(80),
    transqty numeric(18,8),
    produomid character varying(36),
    produom character varying(20),
    convfactor numeric(18,8),
    slocqtyonhand numeric(18,8),
    slocuomid character varying(36),
    slocuom character varying(20),
    taxcodeid character varying(36),
    taxcode character varying(8),
    taxrate numeric(18,8),
    companyid character varying(36),
    deptid character varying(36),
    currprice numeric(23,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bbraunconsignmentstemps?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bbraunconsignmentstemps OWNER TO gpadmin;

--
-- TOC entry 712 (class 1259 OID 18957)
-- Name: pxf_bedallocations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedallocations (
    id character varying(36),
    episodeid character varying(36),
    bedid character varying(36),
    allodatetime timestamp without time zone,
    isisolated boolean,
    islodgerbed boolean,
    isbabybed boolean,
    stdatetime timestamp without time zone,
    enddatetime timestamp without time zone,
    noteexist boolean,
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    isolatedreasonid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedallocations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedallocations OWNER TO gpadmin;

--
-- TOC entry 713 (class 1259 OID 18960)
-- Name: pxf_bedbookings; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedbookings (
    id character varying(36),
    bedid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    bookingstartdate timestamp without time zone,
    bookingenddate timestamp without time zone,
    bookingfor timestamp without time zone,
    companyid character varying(36),
    expirydatetime timestamp without time zone,
    remarks character varying(100),
    status character varying(3),
    noteexist boolean,
    admtdoctorid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    iscompleted boolean,
    iscancelled boolean,
    cancelledreason character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedbookings?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedbookings OWNER TO gpadmin;

--
-- TOC entry 723 (class 1259 OID 18992)
-- Name: pxf_beds; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_beds (
    id character varying(36),
    roomseq integer,
    bedno character varying(8),
    roomid character varying(36),
    bedtypeid character varying(36),
    telext integer,
    statistic boolean,
    bedstatusid character varying(36),
    bedstatustypeid character varying(36),
    isbabybed boolean,
    isisolated boolean,
    chargecodeid character varying(36),
    lodgerchargecodeid character varying(36),
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    topposition integer,
    lastepisodeid character varying(36),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    comment character varying(300),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.beds?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_beds OWNER TO gpadmin;

--
-- TOC entry 714 (class 1259 OID 18963)
-- Name: pxf_bedstatus; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatus (
    id character varying(36),
    companyid character varying(36),
    code character varying(10),
    bedgroupid character varying(36),
    description character varying(75),
    remarks character varying(250),
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedstatus?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatus OWNER TO gpadmin;

--
-- TOC entry 715 (class 1259 OID 18966)
-- Name: pxf_bedstatusbedstatustypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatusbedstatustypes (
    id character varying(36),
    bedstatusid character varying(36),
    bedstatustypeid character varying(36),
    sequence integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedstatusbedstatustypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatusbedstatustypes OWNER TO gpadmin;

--
-- TOC entry 716 (class 1259 OID 18969)
-- Name: pxf_bedstatusgroup; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatusgroup (
    id character varying(36),
    groupcode character varying(5),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedstatusgroup?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatusgroup OWNER TO gpadmin;

--
-- TOC entry 717 (class 1259 OID 18972)
-- Name: pxf_bedstatuslogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatuslogs (
    id character varying(36),
    bedid character varying(36),
    bedstatusid character varying(36),
    patientid character varying(36),
    entrydate timestamp without time zone,
    logcode character varying(50),
    remark character varying(500),
    status character(3),
    noteexist boolean,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedstatuslogs?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatuslogs OWNER TO gpadmin;

--
-- TOC entry 718 (class 1259 OID 18975)
-- Name: pxf_bedstatustypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatustypes (
    id character varying(36),
    code character(10),
    description character varying(100),
    status character varying(3),
    noteexist boolean,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedstatustypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedstatustypes OWNER TO gpadmin;

--
-- TOC entry 719 (class 1259 OID 18978)
-- Name: pxf_bedsubstatus; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedsubstatus (
    id character varying(36),
    code character varying(10),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    noteexist smallint,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    ispharmacy boolean,
    isbilling boolean,
    ismco boolean,
    bedstatusid character varying(36),
    isward boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedsubstatus?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedsubstatus OWNER TO gpadmin;

--
-- TOC entry 720 (class 1259 OID 18981)
-- Name: pxf_bedtransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtransactions (
    id character varying(36),
    bedid character varying(36),
    episodeid character varying(36),
    allodatetime timestamp without time zone,
    isisolated boolean,
    isolatedreason character varying(100),
    islodgerbed boolean,
    stdatetime timestamp without time zone,
    enddatetime timestamp without time zone,
    isactive boolean,
    isbabybed boolean,
    transrefid character varying(36),
    transreftype character varying(10),
    companyid character varying(36),
    status character varying(4),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedtransactions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtransactions OWNER TO gpadmin;

--
-- TOC entry 722 (class 1259 OID 18989)
-- Name: pxf_bedtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtypes (
    id character varying(36),
    bedtype character varying(30),
    description character varying(50),
    bedchargecodeid character varying(36),
    lodgerchargecodeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedtypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtypes OWNER TO gpadmin;

--
-- TOC entry 721 (class 1259 OID 18986)
-- Name: pxf_bedtypewaitlists; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtypewaitlists (
    id character varying(36),
    bedtypeid character varying(36),
    episodeid character varying(36),
    listeddate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateduserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.bedtypewaitlists?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_bedtypewaitlists OWNER TO gpadmin;

--
-- TOC entry 724 (class 1259 OID 18995)
-- Name: pxf_billdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billdetails (
    id character varying(36),
    companyid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    chargemasterid character varying(36),
    transtypeid character varying(36),
    billtypemasterid character varying(36),
    mmamasterid character varying(36),
    chargegroupid character varying(36),
    regdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    chargetransid character varying(36),
    uomid character varying(36),
    debtoractheaderid character varying(36),
    docref character varying(30),
    transdate timestamp without time zone,
    counter numeric(18,0),
    costcode character varying(4),
    billdate timestamp without time zone,
    unitprice numeric(21,2),
    quantity numeric(21,2),
    amount numeric(21,2),
    dracccode character varying(30),
    cracccode character varying(30),
    taxamount numeric(21,2),
    invgroup character varying(4),
    billed boolean,
    arprocess boolean,
    discountamount numeric(21,2),
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    iscancelled boolean,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    financeoperation character varying(1),
    taxdetailid character varying(36),
    taxcalculated boolean,
    postprocessed boolean,
    postprocessid character varying(36),
    ispostprocessed boolean,
    line integer,
    auditno numeric(18,0),
    doctorid character varying(36),
    invcode character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.billdetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billdetails OWNER TO gpadmin;

--
-- TOC entry 725 (class 1259 OID 18999)
-- Name: pxf_billsums; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billsums (
    id character varying(36),
    companyid character varying(36),
    transtypeid character varying(36),
    chargeclasseid character varying(36),
    chargegroupid character varying(36),
    debtoractheaderid character varying(36),
    description character varying(50),
    quantity numeric(18,2),
    amount numeric(18,2),
    outamt numeric(18,2),
    taxamt numeric(18,2),
    classlevel integer,
    line integer,
    invcode character varying(36),
    discountamount numeric(18,2),
    docref character varying(30),
    conversion boolean,
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    iscancelled boolean,
    cancelledby character varying(36),
    cancelleddate timestamp without time zone,
    drtaxinvid character varying(36),
    doctorid character varying(36),
    postprocessid character varying(36),
    ispostprocessed boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.billsums?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billsums OWNER TO gpadmin;

--
-- TOC entry 726 (class 1259 OID 19002)
-- Name: pxf_billtrackings; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billtrackings (
    id character varying(36),
    debtoractheaderid character varying(36),
    code character varying(10),
    description character varying(100),
    trackdate timestamp without time zone,
    levelno integer,
    trackno integer,
    line integer,
    comment character varying(1000),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.billtrackings?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billtrackings OWNER TO gpadmin;

--
-- TOC entry 727 (class 1259 OID 19005)
-- Name: pxf_billtypemasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billtypemasters (
    id character varying(36),
    pricetypeid character varying(36),
    type character varying(2),
    billtypecode character varying(20),
    description character varying(150),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.billtypemasters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_billtypemasters OWNER TO gpadmin;

--
-- TOC entry 730 (class 1259 OID 19016)
-- Name: pxf_canceloperations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_canceloperations (
    id character varying(36),
    companyid character varying(36),
    appfunctionid character varying(36),
    cancelrecordid character varying(36),
    activityname character varying(150),
    usercomment character varying(200),
    canceleduserid character varying(36),
    canceldate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.canceloperations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_canceloperations OWNER TO gpadmin;

--
-- TOC entry 731 (class 1259 OID 19019)
-- Name: pxf_cardcenters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardcenters (
    id character varying(36),
    cardcode character varying(16),
    name character varying(60),
    address1 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    postcode integer,
    stateid character varying(36),
    countryid character varying(36),
    telno character varying(40),
    telno2 character varying(40),
    faxno character varying(40),
    currecyid character varying(36),
    contactid character varying(100),
    bankaccount character varying(40),
    clearday integer,
    effectddate timestamp without time zone,
    glaccountid character varying(36),
    glcostcenterid character varying(36),
    openingbalance numeric(17,2),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cardcenters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardcenters OWNER TO gpadmin;

--
-- TOC entry 732 (class 1259 OID 19022)
-- Name: pxf_cardmembers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardmembers (
    id character varying(36),
    membershipcardid character varying(36),
    relationshipid character varying(36),
    companyid character varying(36),
    membername character varying(50),
    othericnumber character varying(36),
    newicnumber character varying(36),
    iscardholder boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    status character varying(3),
    dob timestamp without time zone,
    mrn character varying(50),
    familycodeid character varying(36),
    otheridtype character varying(36),
    patientid character varying(36),
    remarks character varying(200)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cardmembers?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardmembers OWNER TO gpadmin;

--
-- TOC entry 733 (class 1259 OID 19025)
-- Name: pxf_cardtypefamilycodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardtypefamilycodes (
    id character varying(36),
    cardtypeid character varying(36),
    familycodeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    "limit" integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cardtypefamilycodes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardtypefamilycodes OWNER TO gpadmin;

--
-- TOC entry 734 (class 1259 OID 19028)
-- Name: pxf_cardtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardtypes (
    id character varying(36),
    code character varying(36),
    description character varying(100),
    expirycode boolean,
    status character varying(3),
    activefamily boolean,
    vipstatus boolean,
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cardtypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cardtypes OWNER TO gpadmin;

--
-- TOC entry 735 (class 1259 OID 19031)
-- Name: pxf_casegroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_casegroups (
    id character varying(36),
    casegroupcode character varying(8),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.casegroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_casegroups OWNER TO gpadmin;

--
-- TOC entry 736 (class 1259 OID 19034)
-- Name: pxf_casetypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_casetypes (
    id character varying(36),
    casecode character varying(4),
    description character varying(40),
    casegroupid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.casetypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_casetypes OWNER TO gpadmin;

--
-- TOC entry 737 (class 1259 OID 19037)
-- Name: pxf_categories; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_categories (
    id character varying(36),
    catcode character varying(50),
    description character varying(100),
    stockaccountid character varying(36),
    costaccountid character varying(36),
    adjaccountid character varying(36),
    source character varying(4),
    woffaccountid character varying(36),
    expaccountid character varying(36),
    loanaccountid character varying(36),
    cattype character varying(4),
    ispovalidated boolean,
    accrualaccountid character varying(36),
    stocktakeaccountid character varying(36),
    stat character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxmasterid character varying(36),
    productgroupid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.categories?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_categories OWNER TO gpadmin;

--
-- TOC entry 738 (class 1259 OID 19040)
-- Name: pxf_categories_tmpdu; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_categories_tmpdu (
    id character varying(36),
    catcode character varying(50),
    description character varying(100),
    stockacct character varying(36),
    cosacct character varying(36),
    adjacct character varying(36),
    source character varying(4),
    woffacct character varying(36),
    expacct character varying(36),
    loanacct character varying(36),
    cattype character varying(4),
    povalidate boolean,
    accrualacc character varying(36),
    stktakeadjacct character varying(36),
    stat character varying(3),
    compcode character varying(36),
    adduser character varying(36),
    adddate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.categories_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_categories_tmpdu OWNER TO gpadmin;

--
-- TOC entry 728 (class 1259 OID 19008)
-- Name: pxf_cbtransactiondetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cbtransactiondetails (
    id character varying(36),
    cbtransactionid character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    trantype character varying(4),
    auditno integer,
    line integer,
    docdate timestamp without time zone,
    documentno character varying(24),
    amount numeric(21,8),
    reference character varying(255),
    cbflag boolean,
    refsrc character varying(36),
    reftrantype character varying(4),
    refauditno integer,
    bankid character varying(36),
    paymodeid character varying(36),
    commamt numeric(19,8),
    categoryid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8),
    debtoractheaderid character varying(36),
    departmentid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cbtransactiondetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cbtransactiondetails OWNER TO gpadmin;

--
-- TOC entry 729 (class 1259 OID 19013)
-- Name: pxf_cbtransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cbtransactions (
    id character varying(36),
    bankid character varying(36),
    appoperationid character varying(36),
    source character varying(4),
    transtype character varying(4),
    auditno integer,
    postdate timestamp without time zone,
    fiscalyearid character varying(36),
    periodid character varying(36),
    chequetransactionid character varying(36),
    amount numeric(21,8),
    remarks character varying(255),
    bitype character varying(50),
    referance character varying(255),
    stat character varying(2),
    refsource character varying(4),
    reftranstype character varying(4),
    refauditno integer,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.cbtransactions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_cbtransactions OWNER TO gpadmin;

--
-- TOC entry 739 (class 1259 OID 19043)
-- Name: pxf_chargebilltypemarkups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargebilltypemarkups (
    id character varying(36),
    companyid character varying(36),
    billtypeid character varying(36),
    chargegroupid character varying(36),
    chargemasterid character varying(36),
    markuplevel character varying(3),
    markupprecentage numeric(18,2),
    effectivedate timestamp without time zone,
    ischecknextlevel boolean,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    amount numeric(21,8),
    discountchargeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargebilltypemarkups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargebilltypemarkups OWNER TO gpadmin;

--
-- TOC entry 740 (class 1259 OID 19046)
-- Name: pxf_chargeclasses; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargeclasses (
    id character varying(36),
    classcode character varying(4),
    description character varying(40),
    classlevel integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargeclasses?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargeclasses OWNER TO gpadmin;

--
-- TOC entry 741 (class 1259 OID 19049)
-- Name: pxf_chargediscounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargediscounts (
    id character varying(36),
    companyid character varying(36),
    billtypeid character varying(36),
    chargegroupid character varying(36),
    chargemasterid character varying(36),
    discountlevel character varying(3),
    discountprecentage numeric(18,2),
    effectivedate timestamp without time zone,
    ischecknextlevel boolean,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    amount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargediscounts?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargediscounts OWNER TO gpadmin;

--
-- TOC entry 742 (class 1259 OID 19052)
-- Name: pxf_chargegroupdepartments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargegroupdepartments (
    id character varying(36),
    chargegroupid character varying(36),
    departmentid character varying(36),
    remarks character varying(6),
    servicetype character varying(20)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargegroupdepartments?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargegroupdepartments OWNER TO gpadmin;

--
-- TOC entry 743 (class 1259 OID 19055)
-- Name: pxf_chargegroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargegroups (
    id character varying(36),
    groupcode character varying(4),
    description character varying(40),
    queueflag boolean,
    sequencenumber integer,
    status character varying(50),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    standardcodeflag boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargegroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargegroups OWNER TO gpadmin;

--
-- TOC entry 744 (class 1259 OID 19058)
-- Name: pxf_chargemasterbilltypeaccounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargemasterbilltypeaccounts (
    id character varying(36),
    chargemasterid character varying(36),
    billtypeid character varying(36),
    glacccode character varying(10),
    costcode character varying(10),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargemasterbilltypeaccounts?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargemasterbilltypeaccounts OWNER TO gpadmin;

--
-- TOC entry 745 (class 1259 OID 19061)
-- Name: pxf_chargemasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargemasters (
    id character varying(36),
    chargecode character varying(30),
    description character varying(150),
    chargeclassid character varying(36),
    uomid character varying(36),
    packingqty integer,
    inventoryitem boolean,
    priceoverwrite boolean,
    usercreated character varying(200),
    billuom character varying(4),
    datecreated timestamp without time zone,
    doctorstatid boolean,
    queueflag boolean,
    costcode character varying(8),
    chargeflag boolean,
    inpatientaccountcode character varying(8),
    outpatientaccountcode character varying(8),
    iscostdept boolean,
    costdepartmentid character varying(36),
    invgroup character varying(4),
    apprccode character varying(6),
    appracct character varying(8),
    priceactive boolean,
    constype character varying(1),
    dosage boolean,
    druggroupid character varying(36),
    subgroup character varying(36),
    itemgroup character varying(8),
    sequrnceno integer,
    instruction character varying(255),
    groupchargecode character varying(8),
    chargecodeflag character varying(8),
    status character varying(3),
    companyid character varying(36),
    chargetypeid character varying(36),
    chargegroupid character varying(36),
    revenuedepartmentid character varying(36),
    isautopull boolean,
    ischargeifmore boolean,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    isoxytoxic boolean,
    isoxytoxicdefault boolean,
    isrevenuedept boolean,
    isdiscount boolean,
    brandname character varying(60),
    isdietitem boolean,
    isconsprocess boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargemasters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargemasters OWNER TO gpadmin;

--
-- TOC entry 746 (class 1259 OID 19064)
-- Name: pxf_chargetaxes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetaxes (
    id character varying(36),
    compnayid character varying(36),
    chargemasterid character varying(36),
    taxmasterid character varying(36),
    effectivedate timestamp without time zone,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargetaxes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetaxes OWNER TO gpadmin;

--
-- TOC entry 747 (class 1259 OID 19067)
-- Name: pxf_chargetransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetransactions (
    id character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    docref character varying(30),
    chargemasterid character varying(36),
    transdate timestamp without time zone,
    transtype character varying(36),
    billcode numeric(18,0),
    revcd character varying(30),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    doctorid character varying(36),
    unitprice numeric(21,2),
    quantity numeric(21,2),
    amount numeric(21,2),
    taxamount numeric(21,2),
    uomid character varying(36),
    billtypemasterid character varying(36),
    queuestatid character varying(36),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocess boolean,
    billno numeric(18,0),
    departmentid character varying(36),
    reqdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(30),
    resulttype character varying(4),
    resultstatus numeric(18,0),
    inventory boolean,
    updinv numeric(18,0),
    invbatch numeric(18,0),
    doscode character varying(5),
    duration numeric(18,0),
    instructionid character varying(36),
    discountamount numeric(21,2),
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    frequencyid character varying(36),
    ftxtdosage character varying(255),
    dosageid character varying(36),
    svalueone integer,
    svaluetwo integer,
    addinstructions character varying(255),
    debtormasterid character varying(50),
    invgroup character varying(2),
    packageheaderid character varying(36),
    packagemasterid character varying(36),
    isprocessed boolean,
    status character varying(50),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    hourtype character varying(20),
    queueentryid character varying(36),
    transtypeid character varying(36),
    taxdetailid character varying(36),
    isissued boolean,
    taxcalculated boolean,
    baseunitprice numeric(19,2),
    markuppercentage numeric(19,2),
    ispriceoverride boolean,
    discountchargeid character varying(36),
    financeoperation character varying(1),
    iscancelled boolean,
    cancelledby character varying(36),
    cancelledreason character varying(250),
    cancelleddate timestamp without time zone,
    isupdated boolean,
    auditno numeric(18,0),
    medcarechargeid bigint,
    hitstransfer boolean,
    hitstransferdate timestamp without time zone,
    transdateonly character varying,
    transdatetruncatedtominutes character varying
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargetransactions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetransactions OWNER TO gpadmin;

--
-- TOC entry 748 (class 1259 OID 19071)
-- Name: pxf_chargetransactionsextents; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetransactionsextents (
    id character varying(36),
    chargetransactionid character varying(36),
    date timestamp without time zone,
    plantype character varying(10),
    orderdate timestamp without time zone,
    ordertime timestamp without time zone,
    panelhdrid character varying(36),
    priority character varying(20),
    side character varying(20),
    focus character varying(20),
    resulttype character varying(30),
    repeat integer,
    locationid character varying(36),
    donebyid character varying(36),
    queueentryid character varying(36),
    orderrefid character varying(36),
    transref character varying(10),
    processtype character varying(10),
    presdtlid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargetransactionsextents?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetransactionsextents OWNER TO gpadmin;

--
-- TOC entry 749 (class 1259 OID 19074)
-- Name: pxf_chargetypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetypes (
    id character varying(36),
    chargetype character varying(4),
    description character varying(60),
    sequencenumber integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    chargegroupid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chargetypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chargetypes OWNER TO gpadmin;

--
-- TOC entry 750 (class 1259 OID 19077)
-- Name: pxf_chequeregisters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chequeregisters (
    id character varying(36),
    bankid character varying(36),
    startchequeno character varying(10),
    endchequeno character varying(10),
    chequequantity integer,
    stat character varying(2),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chequeregisters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chequeregisters OWNER TO gpadmin;

--
-- TOC entry 751 (class 1259 OID 19080)
-- Name: pxf_chequetransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chequetransactions (
    id character varying(36),
    bankid character varying(36),
    chequeno character varying(10),
    amount numeric(21,8),
    remarks character varying(255),
    trantype character varying(4),
    stat character varying(2),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.chequetransactions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_chequetransactions OWNER TO gpadmin;

--
-- TOC entry 752 (class 1259 OID 19083)
-- Name: pxf_citizenships; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_citizenships (
    id character varying(36),
    citizencode character varying(4),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.citizenships?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_citizenships OWNER TO gpadmin;

--
-- TOC entry 753 (class 1259 OID 19086)
-- Name: pxf_companies; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companies (
    id character varying(36),
    code character varying(10),
    name character varying(100),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    defaultcontactid character varying(36),
    gstno character varying(20)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.companies?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companies OWNER TO gpadmin;

--
-- TOC entry 754 (class 1259 OID 19089)
-- Name: pxf_companydetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companydetails (
    id character varying(36),
    companyid character varying(36),
    registrationno character varying(36),
    address1 character varying(50),
    address2 character varying(50),
    address3 character varying(50),
    address4 character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.companydetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companydetails OWNER TO gpadmin;

--
-- TOC entry 755 (class 1259 OID 19092)
-- Name: pxf_companyinfos; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companyinfos (
    id integer,
    companyid character varying(36),
    phoneno character varying(50),
    faxno character varying(50),
    website character varying(100),
    email character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.companyinfos?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companyinfos OWNER TO gpadmin;

--
-- TOC entry 756 (class 1259 OID 19095)
-- Name: pxf_companylists; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companylists (
    id character varying(50),
    code character varying(50),
    name character varying(50),
    status character varying(50),
    updateuserid character varying(50),
    updatedate character varying(50),
    noteexist character varying(50),
    defaultcontactid character varying(50),
    gstno character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.companylists?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_companylists OWNER TO gpadmin;

--
-- TOC entry 757 (class 1259 OID 19098)
-- Name: pxf_consignmentsku; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_consignmentsku (
    skuno character varying(50),
    itemcode character varying(50),
    itemdesc character varying(100),
    deptcode character(10)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.consignmentsku?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_consignmentsku OWNER TO gpadmin;

--
-- TOC entry 758 (class 1259 OID 19101)
-- Name: pxf_contactbank; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactbank (
    bankid character varying(36),
    contacts_id character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.contactbank?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactbank OWNER TO gpadmin;

--
-- TOC entry 759 (class 1259 OID 19104)
-- Name: pxf_contactdepartment; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactdepartment (
    departments_id character varying(36),
    contacts_id character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.contactdepartment?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactdepartment OWNER TO gpadmin;

--
-- TOC entry 760 (class 1259 OID 19107)
-- Name: pxf_contactemployee; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactemployee (
    employees_id character varying(36),
    contacts_id character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.contactemployee?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contactemployee OWNER TO gpadmin;

--
-- TOC entry 762 (class 1259 OID 19113)
-- Name: pxf_contacts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contacts (
    id character varying(100),
    contactname character varying(255),
    titleid character varying(36),
    companyid character varying(36),
    contacttypeid character varying(36),
    addresstypeid character varying(36),
    address1 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    address4 character varying(255),
    zip character varying(10),
    city character varying(100),
    phone character varying(100),
    fax character varying(100),
    mobile character varying(100),
    email character varying(255),
    countryid character varying(36),
    stateid character varying(36),
    postalcodeid character varying(36),
    areaid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.contacts?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contacts OWNER TO gpadmin;

--
-- TOC entry 761 (class 1259 OID 19110)
-- Name: pxf_contacttypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contacttypes (
    id character varying(36),
    typecode character varying(36),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexists boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.contacttypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_contacttypes OWNER TO gpadmin;

--
-- TOC entry 763 (class 1259 OID 19116)
-- Name: pxf_costcenters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_costcenters (
    id character varying(36),
    costcode character varying(8),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.costcenters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_costcenters OWNER TO gpadmin;

--
-- TOC entry 764 (class 1259 OID 19119)
-- Name: pxf_countries; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_countries (
    id character varying(36),
    countrycode character varying(4),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.countries?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_countries OWNER TO gpadmin;

--
-- TOC entry 765 (class 1259 OID 19122)
-- Name: pxf_crcontrolgrps; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_crcontrolgrps (
    id character varying(36),
    creditcontrogroup character varying(36),
    description character varying(50),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.crcontrolgrps?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_crcontrolgrps OWNER TO gpadmin;

--
-- TOC entry 766 (class 1259 OID 19125)
-- Name: pxf_crossref; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_crossref (
    id character varying(36),
    companyid character varying(36),
    modules character varying(36),
    groupcode character varying(36),
    altcode character varying(36),
    hiscode character varying(36),
    queueno integer,
    remark character varying(100),
    description character varying(100),
    quecode character varying(36),
    remark2 character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.crossref?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_crossref OWNER TO gpadmin;

--
-- TOC entry 767 (class 1259 OID 19128)
-- Name: pxf_currencies; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_currencies (
    id character varying(36),
    code character varying(10),
    name character varying(60),
    islocalcurrency boolean,
    currencysymbol character varying(10),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.currencies?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_currencies OWNER TO gpadmin;

--
-- TOC entry 768 (class 1259 OID 19131)
-- Name: pxf_currencyrates; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_currencyrates (
    id character varying(36),
    currencyid character varying(36),
    effectivedate timestamp without time zone,
    rate numeric(19,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.currencyrates?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_currencyrates OWNER TO gpadmin;

--
-- TOC entry 769 (class 1259 OID 19134)
-- Name: pxf_debtoractheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtoractheaders (
    id character varying(36),
    appoperationid character varying(36),
    companyid character varying(36),
    line integer,
    currencyid character varying(36),
    entryuserid character varying(36),
    payername character varying(100),
    receiptdetailid character varying(36),
    paymodeid character varying(36),
    tilldetailid character varying(36),
    debtorid character varying(50),
    billdebtorid character varying(50),
    dischargedestinationid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    deposittypeid character varying(36),
    tranauditno bigint,
    amount numeric(21,2),
    outamount numeric(21,2),
    entrydate timestamp without time zone,
    displaydocno character varying(25),
    remarks character varying(500),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    iscancelled boolean,
    cancelledby character varying(36),
    cancelledreason character varying(250),
    cancelleddate timestamp without time zone,
    isprinted boolean,
    printedby character varying(36),
    referance character varying(250),
    authno character varying(250),
    expdate timestamp without time zone,
    refrecordid character varying(36),
    financeoperation character varying(1),
    billdepositamount numeric(18,0),
    taxdetailid character varying(36),
    taxamount numeric(21,2),
    refno character varying(50),
    postprocessid character varying(36),
    ispostprocessed boolean,
    iscbflag boolean,
    isupdated boolean,
    chequebank character varying(100),
    chequebranch character varying(100),
    chequenumber character varying(200),
    chequeexpdate timestamp without time zone,
    authuserid character varying(36),
    issupbill boolean,
    receiveridno character varying(50),
    receivername character varying(150)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtoractheaders?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtoractheaders OWNER TO gpadmin;

--
-- TOC entry 770 (class 1259 OID 19138)
-- Name: pxf_debtorgroupexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtorgroupexceptions (
    id character varying(36),
    chargegroupid character varying(36),
    debtormasterid character varying(50),
    companyid character varying(36),
    description character varying(75),
    grouplimit numeric(18,2),
    itemlimit numeric(18,2),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtorgroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtorgroupexceptions OWNER TO gpadmin;

--
-- TOC entry 771 (class 1259 OID 19141)
-- Name: pxf_debtorgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtorgroups (
    id character varying(36),
    debtorgroupcode character varying(36),
    groupdescription character varying(50),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    typegr character varying(10),
    debtortypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtorgroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtorgroups OWNER TO gpadmin;

--
-- TOC entry 772 (class 1259 OID 19144)
-- Name: pxf_debtoritemexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtoritemexceptions (
    id character varying(36),
    chargemasterid character varying(36),
    debtormasterid character varying(50),
    companyid character varying(36),
    description character varying(75),
    itemlimit numeric(18,2),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtoritemexceptions?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtoritemexceptions OWNER TO gpadmin;

--
-- TOC entry 773 (class 1259 OID 19147)
-- Name: pxf_debtormasteronlines; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtormasteronlines (
    id character varying(36),
    debtorcode character varying(50),
    name character varying(100),
    address character varying(100),
    debtortypeid character varying(36),
    status character varying(3),
    hospital character varying(36),
    hospitalcode character varying(50),
    debtorgroupid character varying(36),
    olddebtorcode character varying(50),
    icnopassport character varying(36),
    adduserid character varying(36),
    adddate character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtormasteronlines?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtormasteronlines OWNER TO gpadmin;

--
-- TOC entry 774 (class 1259 OID 19150)
-- Name: pxf_debtormasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtormasters (
    id character varying(50),
    debtortypeid character varying(36),
    debtorcode character varying(50),
    olddebtorcode character varying(50),
    name character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    address3 character varying(100),
    address4 character varying(100),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36),
    contactid character varying(100),
    "position" character varying(20),
    teloffice character varying(30),
    fax character varying(40),
    billtypeid character varying(36),
    billtypeopid character varying(36),
    recstatus character varying(2),
    outamt numeric(19,4),
    depamt numeric(19,4),
    creditlimit numeric(19,4),
    debtorgroupid character varying(36),
    crgroup character varying(36),
    otheraddr1 character varying(40),
    otheraddr2 character varying(40),
    otheraddr3 character varying(40),
    otheraddr4 character varying(40),
    othertel character varying(30),
    requestgl boolean,
    creditterm integer,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    actdebglaccid character varying(36),
    actdebccodeid character varying(36),
    depglaccid character varying(36),
    depccodeid character varying(36),
    otheracctid character varying(36),
    otherccodeid character varying(36),
    contactname character varying(100),
    comments character varying(1000),
    hospitalcode character varying(10),
    adddate timestamp without time zone,
    adduserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtormasters?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtormasters OWNER TO gpadmin;

--
-- TOC entry 775 (class 1259 OID 19153)
-- Name: pxf_debtortypepaymodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtortypepaymodes (
    id character varying(36),
    debtortypeid character varying(36),
    paymodeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtortypepaymodes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtortypepaymodes OWNER TO gpadmin;

--
-- TOC entry 776 (class 1259 OID 19156)
-- Name: pxf_debtortypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtortypes (
    id character varying(36),
    debtortypecode character varying(8),
    ispatient boolean,
    description character varying(40),
    effectivedate timestamp without time zone,
    depccode character varying(6),
    depglacc character varying(6),
    actdebccode character varying(6),
    actdebglacc character varying(8),
    regfees boolean,
    typegrp character varying(8),
    updpayername boolean,
    updepisode boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    depcostcenterid character varying(36),
    depglaccountid character varying(36),
    actdebcostcenterid character varying(36),
    actdebglaccountid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.debtortypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_debtortypes OWNER TO gpadmin;

--
-- TOC entry 777 (class 1259 OID 19159)
-- Name: pxf_deliveryorderdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderdetails (
    id character varying(36),
    doheaderid character varying(36),
    line integer,
    productid character varying(36),
    productdescription character varying(80),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    orderquantity numeric(19,8),
    deliveredquantity numeric(19,8),
    taggedquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaseorderdetailid character varying(36),
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deliveryorderdetails?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderdetails OWNER TO gpadmin;

--
-- TOC entry 778 (class 1259 OID 19164)
-- Name: pxf_deliveryorderdetailstemp30march; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderdetailstemp30march (
    id character varying(36),
    doheaderid character varying(36),
    line integer,
    productid character varying(36),
    productdescription character varying(80),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    orderquantity numeric(19,8),
    deliveredquantity numeric(19,8),
    taggedquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaseorderdetailid character varying(36),
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    taxamount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deliveryorderdetailstemp30march?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderdetailstemp30march OWNER TO gpadmin;

--
-- TOC entry 779 (class 1259 OID 19167)
-- Name: pxf_deliveryorderheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderheaders (
    id character varying(36),
    grnnumber character varying(10),
    invoicenum character varying(100),
    delordernum character varying(30),
    purchaseorderheaderid character varying(36),
    purchasedeptid character varying(36),
    deliverydeptid character varying(36),
    receivedate timestamp without time zone,
    deliverydate timestamp without time zone,
    supplierid character varying(36),
    creditorid character varying(36),
    dostatus character varying(36),
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    dispatchperson character varying(100),
    entereddate timestamp without time zone,
    recordno bigint,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    appoperationid character varying(36),
    isimport boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deliveryorderheaders?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderheaders OWNER TO gpadmin;

--
-- TOC entry 780 (class 1259 OID 19171)
-- Name: pxf_deliveryorderheaderstemp30march; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderheaderstemp30march (
    id character varying(36),
    grnnumber character varying(10),
    invoicenum character varying(10),
    delordernum character varying(30),
    purchaseorderheaderid character varying(36),
    purchasedeptid character varying(36),
    deliverydeptid character varying(36),
    receivedate timestamp without time zone,
    deliverydate timestamp without time zone,
    supplierid character varying(36),
    creditorid character varying(36),
    dostatus character varying(36),
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    dispatchperson character varying(100),
    entereddate timestamp without time zone,
    recordno bigint,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    appoperationid character varying(36),
    isimport boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deliveryorderheaderstemp30march?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deliveryorderheaderstemp30march OWNER TO gpadmin;

--
-- TOC entry 781 (class 1259 OID 19174)
-- Name: pxf_departmentlocations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departmentlocations (
    id character varying(36),
    departmentid character varying(36),
    locationid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.departmentlocations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departmentlocations OWNER TO gpadmin;

--
-- TOC entry 783 (class 1259 OID 19180)
-- Name: pxf_departments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departments (
    id character varying(36),
    code character varying(20),
    name character varying(100),
    costcenterid character varying(36),
    floorid character varying(36),
    ischargedept boolean,
    isadmissiondept boolean,
    isqueuedept boolean,
    isregistrationdept boolean,
    ispurchasedept boolean,
    isword boolean,
    isdispensedept boolean,
    defaultcontactid character varying(36),
    oeprocesstypes character varying(6),
    topposition integer,
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    isdoctor boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.departments?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departments OWNER TO gpadmin;

--
-- TOC entry 782 (class 1259 OID 19177)
-- Name: pxf_departmentuser; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departmentuser (
    departments_id character varying(36),
    users_id character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.departmentuser?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_departmentuser OWNER TO gpadmin;

--
-- TOC entry 784 (class 1259 OID 19183)
-- Name: pxf_deposittransactiontypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deposittransactiontypes (
    id character varying(36),
    deposittransactiontype character varying(2),
    source character varying(2),
    description character varying(30),
    updpayername boolean,
    updepisode boolean,
    depccode character varying(3),
    depglacc character varying(8),
    manualalloc boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deposittransactiontypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deposittransactiontypes OWNER TO gpadmin;

--
-- TOC entry 785 (class 1259 OID 19186)
-- Name: pxf_deposittypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deposittypes (
    id character varying(36),
    deposittypecode character varying(5),
    transgroup character varying(4),
    transtypeid character varying(36),
    description character varying(50),
    isupdatepayername boolean,
    isupdateepisode boolean,
    isupdatedebtor boolean,
    isallowautoallocation boolean,
    isallowmanualallocation boolean,
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    costcenterid character varying(36),
    glaccountid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.deposittypes?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_deposittypes OWNER TO gpadmin;

--
-- TOC entry 786 (class 1259 OID 19189)
-- Name: pxf_designations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_designations (
    id character varying(36),
    code character varying(50),
    status character varying(3),
    description character varying(250),
    companyid character varying(36),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.designations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_designations OWNER TO gpadmin;

--
-- TOC entry 787 (class 1259 OID 19192)
-- Name: pxf_diagnosis; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosis (
    id character varying(36),
    icdcodeid character varying(36),
    crossref character varying(6),
    dateactivated timestamp without time zone,
    datedeactivated timestamp without time zone,
    description character varying(2000),
    lowage integer,
    highage integer,
    sex character varying(1),
    coderest integer,
    area integer,
    ageflag integer,
    extra character varying(10),
    soundex character varying(15),
    descsdx character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.diagnosis?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosis OWNER TO gpadmin;

--
-- TOC entry 789 (class 1259 OID 19198)
-- Name: pxf_diagnosis_diagnosisgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosis_diagnosisgroups (
    id character varying(36),
    diagnosisid character varying(36),
    diagnosisgroupid character varying(36),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.diagnosis_diagnosisgroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosis_diagnosisgroups OWNER TO gpadmin;

--
-- TOC entry 788 (class 1259 OID 19195)
-- Name: pxf_diagnosisgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosisgroups (
    id character varying(36),
    groupcode character varying(8),
    description character varying(50),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.diagnosisgroups?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diagnosisgroups OWNER TO gpadmin;

--
-- TOC entry 790 (class 1259 OID 19201)
-- Name: pxf_dietfooditems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dietfooditems (
    id character varying(36),
    fooditemid character varying(36),
    dietid character varying(36),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.dietfooditems?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dietfooditems OWNER TO gpadmin;

--
-- TOC entry 791 (class 1259 OID 19204)
-- Name: pxf_diets; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diets (
    id character varying(36),
    dietcode character varying(8),
    description character varying(50),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.diets?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_diets OWNER TO gpadmin;

--
-- TOC entry 792 (class 1259 OID 19207)
-- Name: pxf_dischargedestinations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dischargedestinations (
    id character varying(36),
    dischargedestinationcode character varying(4),
    description character varying(30),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.dischargedestinations?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dischargedestinations OWNER TO gpadmin;

--
-- TOC entry 793 (class 1259 OID 19210)
-- Name: pxf_disciplines; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_disciplines (
    id character varying(36),
    disciplinecode character varying(4),
    description character varying(30),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.disciplines?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_disciplines OWNER TO gpadmin;

--
-- TOC entry 794 (class 1259 OID 19213)
-- Name: pxf_dispositionendcasedtls; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dispositionendcasedtls (
    id character varying(36),
    dispositionendcasehdrid character varying(36),
    chragemasterid character varying(36),
    chargehourstype character varying(50),
    consultanthours numeric(18,2),
    amount numeric(18,4),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.dispositionendcasedtls?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dispositionendcasedtls OWNER TO gpadmin;

--
-- TOC entry 795 (class 1259 OID 19216)
-- Name: pxf_dispositionendcasehdrs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dispositionendcasehdrs (
    id character varying(36),
    episodeid character varying(36),
    episodedoctorid character varying(36),
    isendcase boolean,
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.dispositionendcasehdrs?PROFILE=Jdbc&SERVER=sqlserver1'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dispositionendcasehdrs OWNER TO gpadmin;

--
-- TOC entry 796 (class 1259 OID 19231)
-- Name: pxf_doctorallocations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorallocations (
    id character varying(36),
    paramsourceid character varying(36),
    trantypeid character varying(36),
    auditno integer,
    lineno integer,
    drtnauditno integer,
    doctorid character varying(36),
    chargemasterid character varying(36),
    allocdate timestamp without time zone,
    drallocamt numeric(21,8),
    drappamt numeric(21,8),
    cccomamt numeric(21,8),
    approcess boolean,
    paymodesid character varying(36),
    drappstfamt numeric(21,8),
    drtnlineno integer,
    patientid character varying(36),
    episodeid character varying(36),
    drtnbillno integer,
    reccount integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    debtoractheaderid character varying(36),
    isprocess boolean,
    gstpayment numeric(21,8),
    gstmgtfee numeric(21,8),
    gstcommamt numeric(21,8),
    allocdateonly character varying
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorallocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorallocations OWNER TO gpadmin;

--
-- TOC entry 797 (class 1259 OID 19235)
-- Name: pxf_doctorceiling; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorceiling (
    id character varying(36),
    doctorid character varying(36),
    effectivedate timestamp without time zone,
    episodetypeid character varying(36),
    ceilingamount numeric(21,8),
    ceilingpercentage numeric(19,8),
    staffpercentage numeric(19,8),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorceiling?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorceiling OWNER TO gpadmin;

--
-- TOC entry 798 (class 1259 OID 19238)
-- Name: pxf_doctorcontributions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorcontributions (
    id character varying(36),
    doctorid character varying(36),
    chargemasterid character varying(36),
    episodetypeid character varying(36),
    effectivedate timestamp without time zone,
    isconsultancy boolean,
    drpercentage numeric(18,8),
    amount numeric(21,8),
    staffpercentage numeric(18,8),
    staffamount numeric(21,8),
    corppercentage numeric(18,8),
    corpamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorcontributions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorcontributions OWNER TO gpadmin;

--
-- TOC entry 799 (class 1259 OID 19241)
-- Name: pxf_doctorconvs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorconvs (
    id character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    debtoractheaderid character varying(36),
    billdate timestamp without time zone,
    doctorsid character varying(36),
    chargemasterid character varying(36),
    trxdate timestamp without time zone,
    chargeamount numeric(21,8),
    orgoutamount numeric(21,8),
    debtorid character varying(50),
    billamount numeric(21,8),
    newoutamount numeric(21,8),
    rate numeric(21,8),
    ceilingamt numeric(21,8),
    drappamount numeric(21,8),
    drappoutamount numeric(21,8),
    drapppaid numeric(21,8),
    auditno integer,
    source character varying(16),
    transtype character varying(16),
    rate2 numeric(21,8),
    appoperationid character varying(36),
    line integer,
    transactiondate timestamp without time zone,
    drrefno character varying(50),
    totalincome numeric(21,8),
    dramount1 numeric(21,8),
    dramount2 numeric(21,8),
    invappoperationid character varying(36),
    invsource character varying(16),
    invtranstype character varying(16),
    invamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    convepisno character varying(36),
    convepistype character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorconvs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorconvs OWNER TO gpadmin;

--
-- TOC entry 800 (class 1259 OID 19244)
-- Name: pxf_doctorgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorgroups (
    id character varying(36),
    companyid character varying(36),
    groupcode character varying(4),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    effectivedate timestamp without time zone,
    doctorid character varying(36),
    name character varying(50),
    rate numeric(18,0),
    adduserid character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorgroups OWNER TO gpadmin;

--
-- TOC entry 801 (class 1259 OID 19247)
-- Name: pxf_doctorincomes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorincomes (
    id character varying(36),
    companyid character varying(36),
    doctorid character varying(36),
    doctorcode character varying(15),
    episodetypeid character varying(36),
    totalincome numeric(21,8),
    year timestamp without time zone,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorincomes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorincomes OWNER TO gpadmin;

--
-- TOC entry 802 (class 1259 OID 19250)
-- Name: pxf_doctorpreferencesdtls; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorpreferencesdtls (
    id character varying(36),
    doctorpreferencehdrid character varying(36),
    chargemsterid character varying(36),
    dosageid character varying(36),
    instructionid character varying(36),
    quantity numeric(18,8),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorpreferencesdtls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorpreferencesdtls OWNER TO gpadmin;

--
-- TOC entry 803 (class 1259 OID 19253)
-- Name: pxf_doctorpreferenceshdrs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorpreferenceshdrs (
    id character varying(36),
    doctorid character varying(36),
    prefsetname character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorpreferenceshdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorpreferenceshdrs OWNER TO gpadmin;

--
-- TOC entry 807 (class 1259 OID 19266)
-- Name: pxf_doctors; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctors (
    id character varying(36),
    doctorcode character varying(15),
    doctorname character varying(250),
    companyname character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    address3 character varying(100),
    postalcodeid character varying(36),
    stateid character varying(36),
    countryid character varying(36),
    restelno character varying(15),
    hphone character varying(15),
    offtelno character varying(15),
    disciplineid character varying(36),
    extenstion character varying(4),
    specialityid character varying(36),
    type character varying(25),
    doctorstatusid character varying(36),
    doctortype character varying(25),
    chargecodeid character varying(36),
    creditorid character varying(36),
    debtorid character varying(36),
    contraflag boolean,
    cbflag boolean,
    admissionright boolean,
    dateofresignation timestamp without time zone,
    departmentid character varying(36),
    costcodeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    gstpay_processdate timestamp without time zone,
    ccomgst_processdate timestamp without time zone,
    ccom_processdate timestamp without time zone,
    mgtfee_processdate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctors OWNER TO gpadmin;

--
-- TOC entry 804 (class 1259 OID 19256)
-- Name: pxf_doctorstatus; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorstatus (
    id character varying(36),
    statuscode character varying(4),
    description character varying(30),
    grpdoctype character varying(8),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctorstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctorstatus OWNER TO gpadmin;

--
-- TOC entry 805 (class 1259 OID 19259)
-- Name: pxf_doctortaxinvoices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctortaxinvoices (
    id character varying(36),
    appoperationid character varying(36),
    debtoractheaderid character varying(36),
    auditno integer,
    line integer,
    drinvseq integer,
    doctorid character varying(36),
    totalamount numeric(21,8),
    doctoramount numeric(21,8),
    isdoctortaxinv boolean,
    totaltaxamount numeric(21,8),
    doctortaxamount numeric(21,8),
    headerstatus character varying(8),
    remarks character varying(250),
    field1 character varying(250),
    field2 character varying(250),
    field3 character varying(250),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    postprocessid character varying(36),
    ispostprocessed boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctortaxinvoices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctortaxinvoices OWNER TO gpadmin;

--
-- TOC entry 806 (class 1259 OID 19262)
-- Name: pxf_doctortransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctortransactions (
    id character varying(36),
    appoperationid character varying(36),
    source character varying(20),
    transtype character varying(16),
    auditno integer,
    chargetransactionid character varying(36),
    doctorid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    transdate timestamp without time zone,
    refappoperationid character varying(36),
    refsource character varying(4),
    reftranstype character varying(4),
    debtoractheaderid character varying(36),
    billno integer,
    billdate timestamp without time zone,
    drrefno character varying(40),
    chargemasterid character varying(36),
    chargetransdate timestamp without time zone,
    chargeamount numeric(21,8),
    chargeoutamount numeric(21,8),
    invoiceamount numeric(21,8),
    drappamount numeric(21,8),
    drappoutamount numeric(21,8),
    drapppaid numeric(21,8),
    drpercentage integer,
    effectdate timestamp without time zone,
    episodetypeid character varying(36),
    drcontributionamt numeric(21,8),
    drstaffamt numeric(21,8),
    drstaffpercentage numeric(21,8),
    debtormasterid character varying(50),
    line integer,
    consultflag boolean,
    totalincome numeric(21,8),
    drpercentage1 numeric(21,8),
    dramount1 numeric(21,8),
    drpercentage2 numeric(21,8),
    dramount2 numeric(21,8),
    invcode character varying(16),
    fullpaiddate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    previnvcode character varying(16),
    billdetailid character varying(36),
    gstpayment numeric(21,8),
    gstmgtfee numeric(21,8),
    mgtfee numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.doctortransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_doctortransactions OWNER TO gpadmin;

--
-- TOC entry 808 (class 1259 OID 19269)
-- Name: pxf_donebynames; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_donebynames (
    id character varying(36),
    doneby character varying(20),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.donebynames?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_donebynames OWNER TO gpadmin;

--
-- TOC entry 809 (class 1259 OID 19272)
-- Name: pxf_dosages; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dosages (
    id character varying(36),
    dosagecode character varying(40),
    description character varying(255),
    description2 character varying(255),
    dosefactor numeric(12,2),
    dflag boolean,
    rcflag boolean,
    status character varying(50),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.dosages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_dosages OWNER TO gpadmin;

--
-- TOC entry 810 (class 1259 OID 19275)
-- Name: pxf_drugdosages; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_drugdosages (
    id character varying(36),
    dosageid character varying(36),
    druggroupid character varying(36),
    description character varying(255),
    convfactor numeric(12,2),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.drugdosages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_drugdosages OWNER TO gpadmin;

--
-- TOC entry 811 (class 1259 OID 19278)
-- Name: pxf_druggroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_druggroups (
    id character varying(36),
    druggroupcode character varying(40),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.druggroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_druggroups OWNER TO gpadmin;

--
-- TOC entry 812 (class 1259 OID 19281)
-- Name: pxf_ediexportimportdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ediexportimportdetails (
    id character varying(36),
    ediexportimportheaderid character varying(36),
    edidocumentid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    editype character(10),
    line integer,
    itemcode character varying(36),
    uom character(10),
    qty numeric(18,0),
    unitprice numeric(20,8),
    discount1 numeric(20,8),
    discount2 numeric(20,8),
    amount numeric(20,8),
    taxamount numeric(20,8),
    taxcode character(10),
    batchnumber character varying(36),
    expdate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.ediexportimportdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ediexportimportdetails OWNER TO gpadmin;

--
-- TOC entry 813 (class 1259 OID 19285)
-- Name: pxf_ediexportimportheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ediexportimportheaders (
    id character varying(36),
    exportimportid character varying(36),
    purchaseorderheaderid character varying(36),
    deliveryorderheaderid character varying(36),
    batchno character varying(36),
    docno character varying(50),
    exportimporttype character varying(3),
    doctype character varying(20),
    recstatus character varying(3),
    edidate timestamp without time zone,
    filename character varying(200),
    supplierid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    doclineno integer,
    reference character varying(36),
    remarks character varying(120),
    discountamount numeric(18,4),
    subamount numeric(18,4),
    netamount numeric(18,4)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.ediexportimportheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ediexportimportheaders OWNER TO gpadmin;

--
-- TOC entry 814 (class 1259 OID 19290)
-- Name: pxf_employees; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_employees (
    id character varying(36),
    firstname character varying(100),
    lastname character varying(100),
    othernames character varying(255),
    status character varying(3),
    companyid character varying(36),
    departmentid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    defaultcontactid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.employees?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_employees OWNER TO gpadmin;

--
-- TOC entry 815 (class 1259 OID 19293)
-- Name: pxf_episodeadjustment; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeadjustment (
    id character varying(36),
    episodeid character varying(36),
    adjustmenttype character varying(2),
    remarks character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodeadjustment?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeadjustment OWNER TO gpadmin;

--
-- TOC entry 816 (class 1259 OID 19296)
-- Name: pxf_episodealerts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodealerts (
    id character varying(36),
    episodeid character varying(36),
    alertid character varying(36),
    altertext character varying(200),
    createdby character varying(30),
    activatedate timestamp without time zone,
    activatetime timestamp without time zone,
    inactivereasone character varying(200),
    inactivedatetime timestamp without time zone,
    createddatetime timestamp without time zone,
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    doctorid character varying(36),
    departmentid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodealerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodealerts OWNER TO gpadmin;

--
-- TOC entry 817 (class 1259 OID 19299)
-- Name: pxf_episodediagnosis; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodediagnosis (
    id character varying(36),
    episodeid character varying(36),
    diagnosisid character varying(36),
    episodedoctorid character varying(36),
    vaspatient character varying(50),
    vasdoctor character varying(50),
    remarks character varying(75),
    diagnosisdate timestamp without time zone,
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    icdcodeno integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodediagnosis?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodediagnosis OWNER TO gpadmin;

--
-- TOC entry 818 (class 1259 OID 19304)
-- Name: pxf_episodedietorderdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietorderdetails (
    id character varying(36),
    episodedietorderheaderid character varying(36),
    ditefooditemid character varying(36),
    mealshift character varying(3),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedietorderdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietorderdetails OWNER TO gpadmin;

--
-- TOC entry 819 (class 1259 OID 19307)
-- Name: pxf_episodedietorderheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietorderheaders (
    id character varying(36),
    episodediteid character varying(36),
    date timestamp without time zone,
    remarks character varying(150),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedietorderheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietorderheaders OWNER TO gpadmin;

--
-- TOC entry 821 (class 1259 OID 19313)
-- Name: pxf_episodediets; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodediets (
    id character varying(36),
    episodeid character varying(36),
    diteid character varying(36),
    episodeditestatus character varying(3),
    remarks character varying(150),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodediets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodediets OWNER TO gpadmin;

--
-- TOC entry 820 (class 1259 OID 19310)
-- Name: pxf_episodedietstatuschangedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietstatuschangedetails (
    id character varying(36),
    episodedietid character varying(36),
    episodedietstatus character varying(3),
    statussetdate timestamp without time zone,
    statussettime timestamp without time zone,
    remarks character varying(50),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedietstatuschangedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedietstatuschangedetails OWNER TO gpadmin;

--
-- TOC entry 822 (class 1259 OID 19316)
-- Name: pxf_episodedischargecomments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedischargecomments (
    id character varying(36),
    episodeid character varying(36),
    companyid character varying(36),
    comment character varying(500),
    commentdate timestamp without time zone,
    userid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedischargecomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedischargecomments OWNER TO gpadmin;

--
-- TOC entry 823 (class 1259 OID 19319)
-- Name: pxf_episodedispositionappointments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionappointments (
    id character varying(36),
    patientid character varying(36),
    episodedoctorid character varying(36),
    episodeid character varying(36),
    apttype character varying(10),
    date timestamp without time zone,
    "time" timestamp without time zone,
    remarks character varying(60),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedispositionappointments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionappointments OWNER TO gpadmin;

--
-- TOC entry 824 (class 1259 OID 19322)
-- Name: pxf_episodedispositionmedcerts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionmedcerts (
    id character varying(36),
    episodeid character varying(36),
    patientid character varying(36),
    episodedoctorid character varying(36),
    ml_noofdays integer,
    ml_fromdate timestamp without time zone,
    ml_todate timestamp without time zone,
    ld_noofdays integer,
    ld_fromdate timestamp without time zone,
    ld_todate timestamp without time zone,
    ex_noofdays integer,
    ex_fromdate timestamp without time zone,
    ex_todate timestamp without time zone,
    nonhospitalizationmc boolean,
    notexcusefromcourt boolean,
    remarks character varying(60),
    createduserid character varying(36),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedispositionmedcerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionmedcerts OWNER TO gpadmin;

--
-- TOC entry 825 (class 1259 OID 19325)
-- Name: pxf_episodedispositionreferrals; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionreferrals (
    id character varying(36),
    episodeid character varying(36),
    episodedoctorid character varying(36),
    toname character varying(50),
    titledepartment character varying(20),
    refid character varying(36),
    address character varying(150),
    reuseaddress boolean,
    dear character varying(25),
    content character varying(250),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    referraldate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedispositionreferrals?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedispositionreferrals OWNER TO gpadmin;

--
-- TOC entry 826 (class 1259 OID 19328)
-- Name: pxf_episodedoctors; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedoctors (
    id character varying(36),
    episodeid character varying(36),
    doctorid character varying(36),
    doctorstatusid character varying(36),
    date timestamp without time zone,
    "time" timestamp without time zone,
    isqueueentrycreated boolean,
    status character varying(3),
    updateuserid character varying(36),
    companyid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodedoctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodedoctors OWNER TO gpadmin;

--
-- TOC entry 827 (class 1259 OID 19332)
-- Name: pxf_episodeinvspanels; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeinvspanels (
    id character varying(36),
    episodeid character varying(36),
    panelid character varying(36),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodeinvspanels?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeinvspanels OWNER TO gpadmin;

--
-- TOC entry 828 (class 1259 OID 19335)
-- Name: pxf_episodematernities; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodematernities (
    id character varying(36),
    episodeid character varying(36),
    medicalhistory character varying(75),
    surgicalhistory character varying(75),
    familymedicalhistory character varying(100),
    currentmedications character varying(100),
    allergies character varying(100),
    obstetricalhistory character varying(100),
    isih boolean,
    isgestationsldm boolean,
    isasthma boolean,
    isstillbirth boolean,
    isneonataldeath boolean,
    isaph boolean,
    isplacentapraevia boolean,
    placentapraeviatype character varying(50),
    ispreviouslscs boolean,
    isbigbaby boolean,
    ishistorypph boolean,
    ismultiplepregnancy boolean,
    isbloodtransfusion boolean,
    lastchildbirth character varying(50),
    otherbirths character varying(50),
    reason character varying(100),
    nextofkinoccupationid character varying(36),
    consultantid character varying(36),
    reasionforadmission character varying(50),
    gravida integer,
    para integer,
    lmp timestamp without time zone,
    pog integer,
    edd timestamp without time zone,
    temperature numeric(18,2),
    pulse integer,
    respiration numeric(18,2),
    bloodpressure numeric(18,2),
    weight numeric(18,2),
    height numeric(18,2),
    isemotionalcalm boolean,
    isemotionalanxious boolean,
    isemotionaldistressed boolean,
    isemotionaldepressed boolean,
    isemotionalirritable boolean,
    emotionalother character varying(50),
    breastnipple character varying(75),
    isbreastfeeding boolean,
    isantepostnatalclasses boolean,
    isknwofcopingwtihpain boolean,
    modeofadmissionid character varying(36),
    foetuspresandposition character varying(100),
    foetalheartrate numeric(18,2),
    contrfreqtype character(100),
    urineprotein numeric(18,2),
    urinesugar numeric(18,2),
    urineacetone numeric(18,2),
    diagnosisonadmission character(100),
    isperinealshave boolean,
    fleetenema boolean,
    labourtypeid character varying(36),
    inducedmethod character varying(50),
    sedation character varying(50),
    doctorid character varying(36),
    anaesthetist character varying(36),
    conductedby character varying(50),
    witnessby character varying(50),
    deliverytypeid character varying(36),
    deliverycomplicatedtypeid character varying(36),
    deliverycomplicatedother character varying(50),
    stageoneindication character varying(100),
    stageonedetails character varying(100),
    placentadelbytypeid character varying(36),
    bloodlossamt numeric(18,2),
    bloodlosscausetypeid character varying(36),
    bloodlossother character varying(50),
    temperaturestage3 numeric(18,2),
    temperatureonehr numeric(18,2),
    pulsestage3 numeric(18,2),
    pulsestage3onehr numeric(18,2),
    bpstage3 numeric(18,2),
    bpstage3onehr numeric(18,2),
    placentatypeid character varying(36),
    placentaweight numeric(18,2),
    placentaabnormalities character varying(100),
    membranetypeid character varying(36),
    membraneabnormalities character varying(100),
    cordlength numeric(18,2),
    cordarndneck numeric(18,2),
    cordab character varying(100),
    cervix boolean,
    cervixsite character varying(100),
    vagina boolean,
    vaginasite character varying(100),
    pph boolean,
    pphtreatment character varying(50),
    perineumtypeid character varying(36),
    episiotomytypeid character varying(36),
    tearvaluetypeid character varying(36),
    sutureused character varying(50),
    analtone character varying(50),
    rectum character varying(50),
    painrelieftypeid character varying(36),
    membranerupturetypeid character varying(36),
    membranerupturedatetime timestamp without time zone,
    onsetoflabour character varying(100),
    onsetoflabdatetime timestamp without time zone,
    cervix10cm character varying(100),
    cervix10cmdate timestamp without time zone,
    babydeliveredtypeid character varying(36),
    babyrecordid character varying(36),
    placentadeliveredtypeid character varying(36),
    placentadeliverydate timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodematernities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodematernities OWNER TO gpadmin;

--
-- TOC entry 829 (class 1259 OID 19338)
-- Name: pxf_episodenutritions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodenutritions (
    id character varying(36),
    episodeid character varying(36),
    chargemasterid character varying(36),
    dosage character varying(50),
    nutritionsuplystatus character varying(3),
    quntity integer,
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodenutritions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodenutritions OWNER TO gpadmin;

--
-- TOC entry 830 (class 1259 OID 19341)
-- Name: pxf_episodepatientadvices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepatientadvices (
    id character varying(36),
    episodeid character varying(36),
    episodedoctorid character varying(36),
    advise character varying(250),
    date timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodepatientadvices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepatientadvices OWNER TO gpadmin;

--
-- TOC entry 831 (class 1259 OID 19344)
-- Name: pxf_episodepayerguaranteeletters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepayerguaranteeletters (
    id character varying(36),
    episodepayerid character varying(36),
    guaranteeid character varying(36),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodepayerguaranteeletters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepayerguaranteeletters OWNER TO gpadmin;

--
-- TOC entry 832 (class 1259 OID 19348)
-- Name: pxf_episodepayers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepayers (
    id character varying(36),
    episodeid character varying(36),
    debtorid character varying(50),
    paymodeid character varying(36),
    relationshipid character varying(36),
    billtypemasterid character varying(36),
    remarks character varying(150),
    referance character varying(100),
    ourreferance character varying(100),
    lastdebtorid character varying(36),
    allgroups boolean,
    intiallimitamount numeric(10,2),
    totallimitamount numeric(10,2),
    companyid character varying(36),
    status character varying(50),
    isdefaultpayer boolean,
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodepayers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodepayers OWNER TO gpadmin;

--
-- TOC entry 833 (class 1259 OID 19352)
-- Name: pxf_episodeprescriptiondtls; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeprescriptiondtls (
    id character varying(36),
    prescriptionhdrid character varying(36),
    chargemasterid character varying(36),
    episodeinvspanelid character varying(36),
    priority character varying(20),
    departmentid character varying(36),
    depttype character varying(10),
    plantype timestamp without time zone,
    date timestamp without time zone,
    price numeric(18,8),
    quantity numeric(18,8),
    orderdate timestamp without time zone,
    ordertime timestamp without time zone,
    amount numeric(18,8),
    remarks character varying(100),
    startdatetime timestamp without time zone,
    enddatetime timestamp without time zone,
    frequencyid character varying(36),
    duration numeric(18,0),
    locationid character varying(36),
    donebyid character varying(36),
    vas_patient integer,
    vas_doctor integer,
    diagstat character varying(3),
    performstatus character varying(10),
    chargegroupid character varying(36),
    dosageid character varying(36),
    instructionid character varying(36),
    uomid character varying(36),
    isprocessed boolean,
    isbilled boolean,
    isrepeat boolean,
    side character varying(20),
    focus character varying(20),
    resulttype character varying(30),
    shortclinicfind character varying(400),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodeprescriptiondtls?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeprescriptiondtls OWNER TO gpadmin;

--
-- TOC entry 834 (class 1259 OID 19355)
-- Name: pxf_episodeprescriptionhdrs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeprescriptionhdrs (
    id character varying(36),
    episodeid character varying(36),
    recdate timestamp without time zone,
    episodedoctorid character varying(36),
    prestype character varying(10),
    pressubtype character varying(10),
    refqueueentryid character varying(36),
    remarks character varying(200),
    departmentid character varying(36),
    isbilled boolean,
    iscompleted boolean,
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodeprescriptionhdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodeprescriptionhdrs OWNER TO gpadmin;

--
-- TOC entry 837 (class 1259 OID 19364)
-- Name: pxf_episodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodes (
    id character varying(36),
    episodeno integer,
    episodetypeid character varying(36),
    registrationdate timestamp without time zone,
    registrationtime timestamp without time zone,
    registrationdeptid character varying(36),
    adminsourceid character varying(36),
    bedtypeid character varying(36),
    wardid character varying(36),
    depositrequired boolean,
    casetypeid character varying(36),
    treatment character varying(16),
    diagnosisid character varying(36),
    admittingdoctorid character varying(36),
    attendingdoctorid character varying(36),
    referringdoctorid character varying(36),
    iskcisdischarge boolean,
    isdischarge boolean,
    dischargedate timestamp without time zone,
    dischargetime timestamp without time zone,
    medrecord boolean,
    destinationid character varying(36),
    diagnostic character varying(50),
    admissiondate timestamp without time zone,
    admissiontime timestamp without time zone,
    companyid character varying(36),
    previouslybilled boolean,
    deposit numeric(21,8),
    billtypemasterid character varying(36),
    status character varying(50),
    noteexist boolean,
    patientid character varying(36),
    payerid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    otcpatienttype character varying(5),
    medcareepisodeno character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodes OWNER TO gpadmin;

--
-- TOC entry 835 (class 1259 OID 19358)
-- Name: pxf_episodetriages; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodetriages (
    id character varying(36),
    insertdate date,
    inserttime timestamp without time zone,
    episodeid character varying(36),
    bp_sitting_min numeric(6,2),
    bp_sitting_max numeric(6,2),
    bp_standing_min numeric(6,2),
    bp_standing_max numeric(6,2),
    height numeric(6,2),
    weight numeric(6,2),
    bmi numeric(6,2),
    temperature numeric(6,2),
    plusrate integer,
    respiration integer,
    remark character varying(100),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    patientid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodetriages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodetriages OWNER TO gpadmin;

--
-- TOC entry 836 (class 1259 OID 19361)
-- Name: pxf_episodetypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodetypes (
    id character varying(36),
    episodetypecode character varying(4),
    description character varying(30),
    firstchgcode character varying(12),
    subschgcode character varying(12),
    dateofactivation timestamp without time zone,
    isallowbed boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    pricetypeid character varying(36),
    isbilluponfinal boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.episodetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_episodetypes OWNER TO gpadmin;

--
-- TOC entry 838 (class 1259 OID 19367)
-- Name: pxf_familycodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_familycodes (
    id character varying(36),
    code character varying(4),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.familycodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_familycodes OWNER TO gpadmin;

--
-- TOC entry 839 (class 1259 OID 19370)
-- Name: pxf_fiscalyears; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fiscalyears (
    id character varying(36),
    fiscalyear integer,
    iscurrent boolean,
    isclosed boolean,
    currentperiod integer,
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.fiscalyears?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fiscalyears OWNER TO gpadmin;

--
-- TOC entry 840 (class 1259 OID 19373)
-- Name: pxf_fixedassettemps; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fixedassettemps (
    id character varying(36),
    companyid character varying(36),
    entrysource character varying(3),
    description character(100),
    departmentid character varying(36),
    locationid character varying(36),
    purchaceordid character varying(36),
    supplierid character varying(36),
    deliveryorderhdrid character varying(36),
    itemstocklocationid character varying(36),
    assetcategoryid character varying(36),
    assetkey character varying(36),
    apactheaderid character varying(36),
    quantity integer,
    individualtag boolean,
    statdate timestamp without time zone,
    recstatus character varying(36),
    genstat character varying(36),
    trantype character varying(36),
    trandate timestamp without time zone,
    nprefid character varying(36),
    updateuserid character(36),
    updatedate timestamp without time zone,
    origcost numeric(21,8),
    insval numeric(21,8),
    startdep timestamp without time zone,
    currentcost numeric(21,8),
    cuytddep numeric(21,8),
    lstytddep numeric(21,8),
    appoperationid character varying(36),
    assetid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.fixedassettemps?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fixedassettemps OWNER TO gpadmin;

--
-- TOC entry 841 (class 1259 OID 19376)
-- Name: pxf_floors; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_floors (
    id character varying(36),
    code character varying(10),
    level integer,
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist smallint,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.floors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_floors OWNER TO gpadmin;

--
-- TOC entry 842 (class 1259 OID 19379)
-- Name: pxf_fooditems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fooditems (
    id character varying(36),
    itemcode character varying(5),
    itemname character varying(50),
    itemcategory character varying(3),
    diteitemcategory character varying(3),
    issetmenuitem boolean,
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.fooditems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_fooditems OWNER TO gpadmin;

--
-- TOC entry 843 (class 1259 OID 19382)
-- Name: pxf_foodmenuitems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_foodmenuitems (
    id character varying(36),
    setmenuid character varying(36),
    fooditemid character varying(36),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.foodmenuitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_foodmenuitems OWNER TO gpadmin;

--
-- TOC entry 844 (class 1259 OID 19385)
-- Name: pxf_frequencies; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_frequencies (
    id character varying(36),
    frequencycode character varying(40),
    description character varying(255),
    description2 character varying(255),
    dfreq numeric(18,2),
    dflag boolean,
    rcflag boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.frequencies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_frequencies OWNER TO gpadmin;

--
-- TOC entry 852 (class 1259 OID 19409)
-- Name: pxf_glaccountcostcodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccountcostcodes (
    id character varying(36),
    code character varying(50),
    status character varying(3),
    costcenterid character varying(36),
    companyid character varying(36),
    glaccountid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glaccountcostcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccountcostcodes OWNER TO gpadmin;

--
-- TOC entry 853 (class 1259 OID 19412)
-- Name: pxf_glaccountdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccountdetails (
    id character varying(36),
    glaccountcostcodeid character varying(36),
    periodid character varying(36),
    openingbalance numeric(21,8),
    budgetedamount numeric(21,8),
    companyid character varying(36),
    actualamount numeric(21,8),
    foramount numeric(21,8),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    gljournaldetailid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glaccountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccountdetails OWNER TO gpadmin;

--
-- TOC entry 855 (class 1259 OID 19418)
-- Name: pxf_glaccounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounts (
    id character varying(36),
    code character varying(16),
    description character varying(100),
    glaccounttypeid character varying(36),
    nprefid integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    repgroup character varying(50),
    accgroup character varying(50),
    ispettycash boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glaccounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounts OWNER TO gpadmin;

--
-- TOC entry 856 (class 1259 OID 19421)
-- Name: pxf_glaccounts_tmpdu; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounts_tmpdu (
    id character varying(36),
    glaccount character varying(16),
    description character varying(255),
    acttype character varying(255),
    nprefid integer,
    recstatus character varying(255),
    compcode character varying(36),
    repgroup character varying(255),
    accgroup character varying(255),
    adduser character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glaccounts_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounts_tmpdu OWNER TO gpadmin;

--
-- TOC entry 854 (class 1259 OID 19415)
-- Name: pxf_glaccounttypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounttypes (
    id character varying(36),
    code character varying(10),
    companyid character varying(36),
    description character varying(50),
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glaccounttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glaccounttypes OWNER TO gpadmin;

--
-- TOC entry 857 (class 1259 OID 19424)
-- Name: pxf_glconaccountdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconaccountdetails (
    id character varying(36),
    glconaccountid character varying(36),
    glaccountfrom character varying(36),
    glaccountto character varying(36),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glconaccountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconaccountdetails OWNER TO gpadmin;

--
-- TOC entry 858 (class 1259 OID 19427)
-- Name: pxf_glconaccountdetails_temp; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconaccountdetails_temp (
    id character varying(36),
    glconaccountid character varying(36),
    glaccountfrom character varying(36),
    glaccountto character varying(36),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glconaccountdetails_temp?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconaccountdetails_temp OWNER TO gpadmin;

--
-- TOC entry 859 (class 1259 OID 19430)
-- Name: pxf_glcondepartmentdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glcondepartmentdetails (
    id character varying(36),
    glcondepartmentid character varying(36),
    companyid character varying(36),
    costcenterfromid character varying(36),
    costcentertoid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glcondepartmentdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glcondepartmentdetails OWNER TO gpadmin;

--
-- TOC entry 860 (class 1259 OID 19433)
-- Name: pxf_glcondepartments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glcondepartments (
    id character varying(36),
    code character varying(30),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    type character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glcondepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glcondepartments OWNER TO gpadmin;

--
-- TOC entry 861 (class 1259 OID 19436)
-- Name: pxf_glconsolidatedaccounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconsolidatedaccounts (
    id character varying(36),
    code character varying(50),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    isipconrev boolean,
    isopconrev boolean,
    isconappropriation boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glconsolidatedaccounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconsolidatedaccounts OWNER TO gpadmin;

--
-- TOC entry 862 (class 1259 OID 19439)
-- Name: pxf_glconsolidatedaccounts_temp; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconsolidatedaccounts_temp (
    id character varying(36),
    code character varying(50),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    isipconrev boolean,
    isopconrev boolean,
    isconappropriation boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glconsolidatedaccounts_temp?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glconsolidatedaccounts_temp OWNER TO gpadmin;

--
-- TOC entry 850 (class 1259 OID 19403)
-- Name: pxf_gleteritems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gleteritems (
    id character varying(36),
    companyid character varying(36),
    debtormasterid character varying(50),
    patientid character varying(36),
    episodeid character varying(36),
    chargemasterid character varying(36),
    departmentid character varying(36),
    chargegroupid character varying(36),
    totitemlimit numeric(18,8),
    totitembal numeric(18,8),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gleteritems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gleteritems OWNER TO gpadmin;

--
-- TOC entry 851 (class 1259 OID 19406)
-- Name: pxf_gletterdepartments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gletterdepartments (
    id character varying(36),
    companyid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    departmentid character varying(36),
    chargegroupid character varying(36),
    departmentlimit numeric(18,8),
    departmentbalance numeric(18,8),
    grouplimit numeric(18,8),
    groupbalance numeric(18,8),
    inditemlimit numeric(18,8),
    allitems boolean,
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gletterdepartments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gletterdepartments OWNER TO gpadmin;

--
-- TOC entry 845 (class 1259 OID 19388)
-- Name: pxf_glfinancetables; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glfinancetables (
    id character varying(36),
    tablename character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glfinancetables?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glfinancetables OWNER TO gpadmin;

--
-- TOC entry 846 (class 1259 OID 19391)
-- Name: pxf_glgroupexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glgroupexceptions (
    id character varying(36),
    chargegroupid character varying(36),
    glreferenceid character varying(36),
    companyid character varying(36),
    description character varying(75),
    grouplimit numeric(18,2),
    individualitemlimit numeric(18,2),
    isgroupunlimited boolean,
    isitemunlimited boolean,
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glgroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glgroupexceptions OWNER TO gpadmin;

--
-- TOC entry 863 (class 1259 OID 19442)
-- Name: pxf_gliaccountmappings; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gliaccountmappings (
    id character varying(36),
    appoperationid character varying(36),
    entryname character varying(50),
    reftype character varying(10),
    billtypemasterid character varying(36),
    sequence smallint,
    inputquery character varying(2000),
    outputtable character varying(50),
    outputfield character varying(50),
    datatype character varying(30),
    idindex smallint,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gliaccountmappings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gliaccountmappings OWNER TO gpadmin;

--
-- TOC entry 864 (class 1259 OID 19445)
-- Name: pxf_glinterfaces; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glinterfaces (
    id character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantypeid character varying(36),
    reference character varying(250),
    description character varying(500),
    oprtype character varying(1),
    auditno numeric(18,0),
    amount numeric(21,8),
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glinterfaces?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glinterfaces OWNER TO gpadmin;

--
-- TOC entry 847 (class 1259 OID 19394)
-- Name: pxf_glitemexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glitemexceptions (
    id character varying(36),
    chargemasterid character varying(36),
    companyid character varying(36),
    glgroupexceptionid character varying(36),
    description character varying(75),
    itemlimit numeric(18,2),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glitemexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glitemexceptions OWNER TO gpadmin;

--
-- TOC entry 848 (class 1259 OID 19397)
-- Name: pxf_gljournaldetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gljournaldetails (
    id character varying(36),
    gljournalheaderid character varying(36),
    auditno integer,
    line integer,
    drcrsign character varying(4),
    amount numeric(21,8),
    costcenterid character varying(36),
    glaccountid character varying(36),
    docno character varying(36),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gljournaldetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gljournaldetails OWNER TO gpadmin;

--
-- TOC entry 849 (class 1259 OID 19400)
-- Name: pxf_gljournalheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gljournalheaders (
    id character varying(36),
    auditno integer,
    fiscalyearid character varying(36),
    periodid character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    docno character varying(36),
    docdate timestamp without time zone,
    description character varying(100),
    postdate timestamp without time zone,
    difamount numeric(21,8),
    poststatus character varying(3),
    printstatus character varying(3),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    postuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gljournalheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gljournalheaders OWNER TO gpadmin;

--
-- TOC entry 865 (class 1259 OID 19448)
-- Name: pxf_glreportformats; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreportformats (
    id character varying(36),
    glreportid character varying(36),
    linenum integer,
    isprint boolean,
    rowdefinitionid character varying(36),
    code character varying(30),
    description character varying(100),
    formula character varying(100),
    keyno integer,
    companyid character varying(36),
    status character varying(3),
    note integer,
    reversesign boolean,
    costcodefrom character varying(10),
    costcodeto character varying(10),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glreportformats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreportformats OWNER TO gpadmin;

--
-- TOC entry 866 (class 1259 OID 19451)
-- Name: pxf_glreportformats_test; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreportformats_test (
    id character varying(36),
    glreportid character varying(36),
    linenum integer,
    isprint character(10),
    rowdefinitionid character varying(36),
    code character varying(30),
    description character varying(100),
    formula character varying(100),
    keyno integer,
    companyid character varying(36),
    status character varying(3),
    note integer,
    reversesign character(10),
    costcenteridfrom character varying(36),
    costcenteridto character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glreportformats_test?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreportformats_test OWNER TO gpadmin;

--
-- TOC entry 867 (class 1259 OID 19454)
-- Name: pxf_glreports; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreports (
    id character varying(36),
    reportname character varying(30),
    description character varying(100),
    reporttypeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glreports?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glreports OWNER TO gpadmin;

--
-- TOC entry 868 (class 1259 OID 19457)
-- Name: pxf_glsubacctypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glsubacctypes (
    id character varying(36),
    glacctypeid character varying(36),
    subacctypecode character varying(36),
    description character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.glsubacctypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_glsubacctypes OWNER TO gpadmin;

--
-- TOC entry 869 (class 1259 OID 19460)
-- Name: pxf_gltransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gltransactions (
    id character varying(36),
    fiscalyearid character varying(36),
    periodid character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    reference character varying(250),
    description character varying(500),
    auditno numeric(18,0),
    amount numeric(21,8),
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    trantypeid character varying(36),
    postdateyear character varying,
    postdatemonth character varying
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.gltransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_gltransactions OWNER TO gpadmin;

--
-- TOC entry 870 (class 1259 OID 19463)
-- Name: pxf_goodsreturndetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_goodsreturndetails (
    id character varying(36),
    line integer,
    goodsreturnheaderid character varying(36),
    productid character varying(36),
    productdescription character varying(80),
    productpriceid character varying(36),
    uomid character varying(36),
    orderreturned numeric(19,8),
    remarks character varying(255),
    netunitprice numeric(20,8),
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    deliveryorderdetailid character varying(36),
    itembatchid character varying(36),
    batchcode character varying(20),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.goodsreturndetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_goodsreturndetails OWNER TO gpadmin;

--
-- TOC entry 871 (class 1259 OID 19466)
-- Name: pxf_goodsreturnheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_goodsreturnheaders (
    id character varying(36),
    grtnumber character varying(10),
    deliveryorderheaderid character varying(36),
    purchasedeptid character varying(36),
    returndate timestamp without time zone,
    supplierid character varying(36),
    grtstatus character varying(36),
    respersonid character varying(36),
    checkpersonid character varying(36),
    checkdate timestamp without time zone,
    entereddate timestamp without time zone,
    remarks character varying(255),
    discountamount numeric(21,8),
    discountpercentage numeric(21,8),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    recordno bigint,
    reasonid character varying(36),
    returnflag boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.goodsreturnheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_goodsreturnheaders OWNER TO gpadmin;

--
-- TOC entry 872 (class 1259 OID 19469)
-- Name: pxf_groupfunction; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupfunction (
    id character varying(36),
    groups_id character varying(36),
    functions_id character varying(36),
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.groupfunction?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupfunction OWNER TO gpadmin;

--
-- TOC entry 873 (class 1259 OID 19472)
-- Name: pxf_groupoperation; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupoperation (
    groups_id character varying(36),
    operations_id character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.groupoperation?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupoperation OWNER TO gpadmin;

--
-- TOC entry 875 (class 1259 OID 19478)
-- Name: pxf_groups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groups (
    id character varying(36),
    name character varying(100),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.groups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groups OWNER TO gpadmin;

--
-- TOC entry 874 (class 1259 OID 19475)
-- Name: pxf_groupuser; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupuser (
    groups_id character varying(36),
    users_id character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.groupuser?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_groupuser OWNER TO gpadmin;

--
-- TOC entry 876 (class 1259 OID 19481)
-- Name: pxf_guaranteeletterentitledoctors; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteeletterentitledoctors (
    id character varying(36),
    doctorid character varying(36),
    guaranteeletterrefid character varying(36),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.guaranteeletterentitledoctors?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteeletterentitledoctors OWNER TO gpadmin;

--
-- TOC entry 878 (class 1259 OID 20482)
-- Name: pxf_guaranteeletterreferences; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteeletterreferences (
    id character varying(36),
    patientid character varying(36),
    debtorid character varying(50),
    gltypeid character varying(36),
    refno character varying(50),
    ourrefno character varying(50),
    remarks character varying(200),
    enteredby character varying(100),
    effectivedate timestamp without time zone,
    expirydate timestamp without time zone,
    visitno integer,
    membershipno character varying(50),
    visitbalance integer,
    medicalcase character varying(100),
    glcontactperson character varying(100),
    glissuedby character varying(100),
    glinitiallimit numeric(9,2),
    gltotallimit numeric(18,4),
    glbalancelimit numeric(18,4),
    exceptiongrouplimit numeric(18,4),
    exceptionitemlimit numeric(18,4),
    enterdatetime timestamp without time zone,
    scandocpath character varying(100),
    companyid character varying(36),
    confirmationstatus character varying(50),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    allocatedstatus character varying(10),
    relationshipid character varying(36),
    scandoccontent bytea,
    staffname character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.guaranteeletterreferences?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteeletterreferences OWNER TO gpadmin;

--
-- TOC entry 879 (class 1259 OID 21482)
-- Name: pxf_guaranteelettertypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteelettertypes (
    id character varying(36),
    companyid character varying(36),
    gltypecode character varying(5),
    gltypename character varying(50),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.guaranteelettertypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_guaranteelettertypes OWNER TO gpadmin;

--
-- TOC entry 880 (class 1259 OID 21485)
-- Name: pxf_icdcodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdcodes (
    id character varying(36),
    code character varying(8),
    description character varying(2000),
    icdgroupid character varying(36),
    typeid character varying(36),
    icdtext character varying(250),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.icdcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdcodes OWNER TO gpadmin;

--
-- TOC entry 881 (class 1259 OID 21488)
-- Name: pxf_icdgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdgroups (
    id character varying(36),
    groupcode character varying(20),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.icdgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdgroups OWNER TO gpadmin;

--
-- TOC entry 882 (class 1259 OID 21491)
-- Name: pxf_icdtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdtypes (
    id character varying(36),
    icdtypecode character varying(9),
    description character varying(50),
    noteexist boolean,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.icdtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_icdtypes OWNER TO gpadmin;

--
-- TOC entry 883 (class 1259 OID 21494)
-- Name: pxf_idtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_idtypes (
    id character varying(36),
    idtype character varying(4),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.idtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_idtypes OWNER TO gpadmin;

--
-- TOC entry 884 (class 1259 OID 21497)
-- Name: pxf_impfiles; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_impfiles (
    id character varying(36),
    filename character varying(200),
    transtypeid character varying(36),
    docdate timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.impfiles?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_impfiles OWNER TO gpadmin;

--
-- TOC entry 885 (class 1259 OID 21500)
-- Name: pxf_instructions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_instructions (
    id character varying(36),
    instructioncode character varying(40),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.instructions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_instructions OWNER TO gpadmin;

--
-- TOC entry 886 (class 1259 OID 21503)
-- Name: pxf_interfacelogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_interfacelogs (
    id numeric(18,0),
    eventcode character varying(36),
    mrn character varying(50),
    updatedate timestamp without time zone,
    col1 character varying(300),
    col2 character varying(300),
    col3 character varying(300),
    col4 character varying(300),
    col5 character varying(300),
    col6 character varying(300),
    col7 character varying(300),
    col8 character varying(300),
    col9 character varying(300),
    col10 character varying(300),
    col11 character varying(300),
    col12 character varying(300),
    col13 character varying(300),
    col14 character varying(300),
    col15 character varying(300),
    col16 character varying(300),
    col17 character varying(300),
    col18 character varying(300),
    col19 character varying(300),
    col20 character varying(300),
    col21 character varying(300),
    col22 character varying(300),
    col23 character varying(300),
    col24 character varying(300),
    col25 character varying(300),
    col26 character varying(300),
    col27 character varying(300),
    col28 character varying(300),
    col29 character varying(300),
    col30 character varying(300),
    col31 character varying(300),
    col32 character varying(300),
    col33 character varying(300),
    col34 character varying(300),
    col35 character varying(300),
    col36 character varying(300),
    col37 character varying(300),
    col38 character varying(300),
    col39 character varying(300),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.interfacelogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_interfacelogs OWNER TO gpadmin;

--
-- TOC entry 887 (class 1259 OID 21506)
-- Name: pxf_invdspdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invdspdetails (
    id character varying(36),
    recno integer,
    line integer,
    productid character varying(36),
    uomid character varying(36),
    itemstocklocationid character varying(36),
    transqty numeric(20,8),
    netprice numeric(20,8),
    draccountid character varying(36),
    drcostcenterid character varying(36),
    craccountid character varying(36),
    crcostcenterid character varying(36),
    issdepartmentid character varying(36),
    reqdepartmentid character varying(36),
    saleamount numeric(21,8),
    transtypeid character varying(36),
    transdate timestamp without time zone,
    trxauditno integer,
    chargetransactionid character varying(36),
    expdate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    recordstatus boolean,
    quantityonhand numeric(18,0)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invdspdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invdspdetails OWNER TO gpadmin;

--
-- TOC entry 888 (class 1259 OID 21509)
-- Name: pxf_invhistorydetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invhistorydetails (
    id character varying(36),
    invhistoryheaderid character varying(36),
    lineno integer,
    productid character varying(36),
    uomid character varying(36),
    transferqty numeric(18,8),
    netprice numeric(18,8),
    recordnumber integer,
    productcategoryid character varying(36),
    draccno character varying(25),
    drccode character varying(25),
    craccno character varying(25),
    crccode character varying(25),
    expdate timestamp without time zone,
    departmentid character varying(36),
    sndrcv character varying(36),
    recordstatus character varying(20),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invhistorydetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invhistorydetails OWNER TO gpadmin;

--
-- TOC entry 889 (class 1259 OID 21512)
-- Name: pxf_invhistoryheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invhistoryheaders (
    id character varying(36),
    departmentid character varying(36),
    transtypeid character varying(36),
    docno integer,
    sndrcv character varying(36),
    transdate timestamp without time zone,
    datesupret timestamp without time zone,
    dateactret timestamp without time zone,
    ivrequestid character varying(36),
    respersonid character varying(36),
    remarks character varying(200),
    recordstatus character varying(20),
    srcdocno integer,
    sndrcvtype character varying(30),
    amount numeric(18,8),
    recordno integer,
    expdate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invhistoryheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invhistoryheaders OWNER TO gpadmin;

--
-- TOC entry 890 (class 1259 OID 21515)
-- Name: pxf_invrequestdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invrequestdetails (
    id character varying(36),
    reqdepartmentid character varying(36),
    invrequestheaderid character varying(36),
    line integer,
    productid character varying(36),
    uomid character varying(36),
    quantityrequest numeric(18,8),
    quantitytxn numeric(18,8),
    netprice numeric(21,8),
    invissuetype character varying(10),
    remarks character varying(2600),
    quantityonhand numeric(18,8),
    authorid character varying(36),
    qohconfirm integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    receiverqoh integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invrequestdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invrequestdetails OWNER TO gpadmin;

--
-- TOC entry 891 (class 1259 OID 21519)
-- Name: pxf_invrequestheader; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invrequestheader (
    id character varying(36),
    fromdepartmentid character varying(36),
    invrequestno integer,
    requestdate timestamp without time zone,
    reqpersonid character varying(36),
    remarks character varying(100),
    docstatus character varying(36),
    invissuetype character varying(10),
    amount numeric(21,8),
    todepartmentid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invrequestheader?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invrequestheader OWNER TO gpadmin;

--
-- TOC entry 892 (class 1259 OID 21522)
-- Name: pxf_invtransdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invtransdetails (
    id character varying(36),
    invtransheaderid character varying(36),
    linenum integer,
    productid character varying(36),
    uomid character varying(36),
    transactionqty numeric(18,8),
    netprice numeric(21,8),
    recordno integer,
    itembatchid character varying(36),
    remarks character varying(2600),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    drglaccountid character varying(36),
    crglaccountid character varying(36),
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    quantityonhand numeric(19,4),
    expirydate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invtransdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invtransdetails OWNER TO gpadmin;

--
-- TOC entry 893 (class 1259 OID 21526)
-- Name: pxf_invtransheader; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invtransheader (
    id character varying(36),
    fromdepartmentid character varying(36),
    todepartmentid character varying(36),
    invissuetype character varying(10),
    docno integer,
    transdate timestamp without time zone,
    sndrcv character varying(36),
    invrequestheaderid character varying(36),
    resonsiblepersonid character varying(36),
    remarks character varying(200),
    docstatus character varying(10),
    srcdocno integer,
    sndrcvtype character varying(30),
    source character varying(16),
    reference character varying(50),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    recordstatus character varying(20),
    transtypeid character varying(36),
    referenceid character varying(36),
    supplierid character varying(36),
    patientid character varying(36),
    tocompanyid character varying(36),
    amount numeric(18,2),
    recordno character varying(10),
    datesuppreturn timestamp without time zone,
    dateactreturn timestamp without time zone,
    transtatusid character varying(36),
    sndrcvtypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.invtransheader?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_invtransheader OWNER TO gpadmin;

--
-- TOC entry 894 (class 1259 OID 21529)
-- Name: pxf_isolationreasons; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_isolationreasons (
    id character varying(36),
    companyid character varying(36),
    reasoncode character varying(4),
    reason character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.isolationreasons?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_isolationreasons OWNER TO gpadmin;

--
-- TOC entry 895 (class 1259 OID 21532)
-- Name: pxf_itembatches; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itembatches (
    id character varying(36),
    productid character varying(36),
    batchcode character varying(20),
    expirydate timestamp without time zone,
    quantityonhand numeric(18,8),
    fiscalyearid character varying(36),
    uomid character varying(36),
    valueonhand numeric(21,8),
    status character varying(3),
    departmentid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itembatches?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itembatches OWNER TO gpadmin;

--
-- TOC entry 896 (class 1259 OID 21535)
-- Name: pxf_itemcountsets; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsets (
    id character varying(36),
    itemsetcode character varying(10),
    description character varying(80),
    departmentfromid character varying(36),
    departmenttoid character varying(36),
    prodsubcatfromid character varying(36),
    prodsubcattoid character varying(36),
    productfromid character varying(36),
    producttoid character varying(36),
    freeztypeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemcountsets?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsets OWNER TO gpadmin;

--
-- TOC entry 897 (class 1259 OID 21538)
-- Name: pxf_itemcountsetsdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsetsdetails (
    id character varying(36),
    itemcountsetsheaderid character varying(36),
    line integer,
    departmentfromid character varying(36),
    departmenttoid character varying(36),
    prodsubcatfromid character varying(36),
    prodsubcattoid character varying(36),
    productfromid character varying(36),
    producttoid character varying(36),
    freeztypeid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemcountsetsdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsetsdetails OWNER TO gpadmin;

--
-- TOC entry 898 (class 1259 OID 21541)
-- Name: pxf_itemcountsetsheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsetsheaders (
    id character varying(36),
    itemsetcode character varying(10),
    description character varying(80),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemcountsetsheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemcountsetsheaders OWNER TO gpadmin;

--
-- TOC entry 899 (class 1259 OID 21544)
-- Name: pxf_itemmonthlystocks; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemmonthlystocks (
    id character varying(36),
    itemstocklocationid character varying(36),
    periodid character varying(36),
    monthlyquantity numeric(18,8),
    monthlyvalue numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemmonthlystocks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemmonthlystocks OWNER TO gpadmin;

--
-- TOC entry 900 (class 1259 OID 21547)
-- Name: pxf_itemperiodicaveragecosts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemperiodicaveragecosts (
    id character varying(36),
    productid character varying(36),
    fiscalyearid character varying(36),
    periodid character varying(36),
    averagecost numeric(18,8),
    procflag character varying(300),
    uomid character varying(36),
    peropen boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemperiodicaveragecosts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemperiodicaveragecosts OWNER TO gpadmin;

--
-- TOC entry 901 (class 1259 OID 21550)
-- Name: pxf_itemstocklocations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemstocklocations (
    id character varying(36),
    departmentid character varying(36),
    productid character varying(36),
    bincode character varying(16),
    fiscalyearid character varying(36),
    fixuom boolean,
    openingbalanceval numeric(21,8),
    cntdocno character varying(40),
    minquantity numeric(18,8),
    maxquantity numeric(18,8),
    reordlevel numeric(18,8),
    reordquantity numeric(18,8),
    lastissuedate timestamp without time zone,
    uomid character varying(36),
    isfrozen boolean,
    invissuetype character varying(10),
    dispensetype character varying(24),
    rackno character varying(16),
    openbalqty numeric(18,8),
    onhandvalue numeric(21,8),
    onhandquantity numeric(18,8),
    lastfrozendate timestamp without time zone,
    frozenquantity numeric(18,8),
    itemtype character varying(40),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    transtypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemstocklocations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemstocklocations OWNER TO gpadmin;

--
-- TOC entry 902 (class 1259 OID 21553)
-- Name: pxf_itemstocklocations_backup14march; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemstocklocations_backup14march (
    id character varying(36),
    departmentid character varying(36),
    productid character varying(36),
    bincode character varying(16),
    fiscalyearid character varying(36),
    fixuom boolean,
    openingbalanceval numeric(21,8),
    cntdocno character varying(40),
    minquantity numeric(18,8),
    maxquantity numeric(18,8),
    reordlevel numeric(18,8),
    reordquantity numeric(18,8),
    lastissuedate timestamp without time zone,
    uomid character varying(36),
    isfrozen boolean,
    invissuetype character varying(10),
    dispensetype character varying(24),
    rackno character varying(16),
    openbalqty numeric(18,8),
    onhandvalue numeric(21,8),
    onhandquantity numeric(18,8),
    lastfrozendate timestamp without time zone,
    frozenquantity numeric(18,8),
    itemtype character varying(40),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    transtypeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemstocklocations_backup14march?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemstocklocations_backup14march OWNER TO gpadmin;

--
-- TOC entry 903 (class 1259 OID 21556)
-- Name: pxf_itemtaxdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtaxdetails (
    id character varying(36),
    paramsourceid character varying(36),
    transtypeid character varying(36),
    sourceid character varying(36),
    taxmasterid character varying(36),
    effectivedate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemtaxdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtaxdetails OWNER TO gpadmin;

--
-- TOC entry 904 (class 1259 OID 21559)
-- Name: pxf_itemtracks; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtracks (
    id character varying(36),
    itemtransactionid character varying(36),
    itembatchid character varying(36),
    trackquantity numeric(18,8),
    unitcost numeric(21,8),
    trackvalue numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemtracks?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtracks OWNER TO gpadmin;

--
-- TOC entry 905 (class 1259 OID 21562)
-- Name: pxf_itemtransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtransactions (
    id character varying(36),
    productid character varying(36),
    transtypeid character varying(36),
    transrefid character varying(36),
    transdepartmentid character varying(36),
    transquantity numeric(18,8),
    unitcost numeric(21,8),
    transvalue numeric(21,8),
    transdate timestamp without time zone,
    comment character varying(255),
    docrefid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.itemtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_itemtransactions OWNER TO gpadmin;

--
-- TOC entry 906 (class 1259 OID 21565)
-- Name: pxf_languages; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_languages (
    id character varying(36),
    languagecode character varying(4),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    standardlangcode character varying(6),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.languages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_languages OWNER TO gpadmin;

--
-- TOC entry 907 (class 1259 OID 21568)
-- Name: pxf_locations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_locations (
    id character varying(36),
    locationcode character varying(8),
    description character varying(40),
    incharge character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.locations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_locations OWNER TO gpadmin;

--
-- TOC entry 919 (class 1259 OID 21608)
-- Name: pxf_maritalstatus; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maritalstatus (
    id character varying(36),
    maritalstatuscode character varying(4),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maritalstatus?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maritalstatus OWNER TO gpadmin;

--
-- TOC entry 920 (class 1259 OID 21611)
-- Name: pxf_maternityadmissioin; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternityadmissioin (
    id character varying(36),
    maternityid character varying(36),
    episodeid character varying(36),
    companyid character varying(36),
    temperature numeric(18,2),
    pulse integer,
    respiration numeric(18,2),
    bloodpressure numeric(18,2),
    weight numeric(18,2),
    height numeric(18,2),
    isemotionalcalm boolean,
    isemotionalanxious boolean,
    isemotionaldistressed boolean,
    isemotionaldepressed boolean,
    isemotionalirritable boolean,
    emotionalother character varying(50),
    breastnipple character varying(75),
    isbreastfeeding boolean,
    isantepostnatalclasses boolean,
    isknwofcopingwtihpain boolean,
    modeofadmissionid character varying(36),
    foetuspresandposition character varying(100),
    foetalheartrate numeric(18,2),
    contrfreqtype character(100),
    urineprotein numeric(18,2),
    urinesugar numeric(18,2),
    urineacetone numeric(18,2),
    diagnosisonadmission character(100),
    isperinealshave boolean,
    fleetenema boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternityadmissioin?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternityadmissioin OWNER TO gpadmin;

--
-- TOC entry 921 (class 1259 OID 21614)
-- Name: pxf_maternitybabyrecords; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitybabyrecords (
    id character varying(36),
    episodematernityid character varying(36),
    babyno integer,
    babyname character varying(50),
    gender character varying(4),
    birthtypeid character varying(36),
    deliverydatetime timestamp without time zone,
    babystatus character varying(50),
    doctorid character varying(36),
    wardid character varying(36),
    admitbedid character varying(36),
    bcg boolean,
    bcgdate timestamp without time zone,
    hep boolean,
    hepdate timestamp without time zone,
    maturity numeric(18,2),
    weight numeric(18,2),
    length numeric(18,2),
    headcircumference numeric(18,2),
    firstgasp numeric(18,2),
    rhythmicbreathing numeric(18,2),
    apgar1min integer,
    apgar5min integer,
    apgar10min integer,
    inoculationother character varying(255),
    inoculationvitamin character varying(255),
    abnormalities character varying(150),
    resuscitation character varying(100),
    others character varying(300),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternitybabyrecords?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitybabyrecords OWNER TO gpadmin;

--
-- TOC entry 922 (class 1259 OID 21617)
-- Name: pxf_maternitycontrolparams; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitycontrolparams (
    id character varying(36),
    companyid character varying(36),
    controlname character varying(30),
    valuecode character varying(3),
    valuedescription character varying(50),
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternitycontrolparams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitycontrolparams OWNER TO gpadmin;

--
-- TOC entry 923 (class 1259 OID 21620)
-- Name: pxf_maternitylabourdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitylabourdetails (
    id character varying(36),
    memruptype character varying(15),
    membranerupturedatetime timestamp without time zone,
    onsetoflabour character varying(100),
    onsetoflabdatetime timestamp without time zone,
    cervix10cm character varying(100),
    cervix10cmdate timestamp without time zone,
    babydeliverytype character varying(15),
    babyrecordid character varying(36),
    placentadeliverytype character varying(15),
    placentadeliverydate timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternitylabourdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitylabourdetails OWNER TO gpadmin;

--
-- TOC entry 924 (class 1259 OID 21623)
-- Name: pxf_maternityoxytoxicdrugs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternityoxytoxicdrugs (
    id character varying(36),
    episodematernityid character varying(36),
    chargemasterid character varying(36),
    dosageid character varying(36),
    iv1 boolean,
    im1 boolean,
    timing1 timestamp without time zone,
    iv2 boolean,
    im2 boolean,
    timing2 timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    isselected boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternityoxytoxicdrugs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternityoxytoxicdrugs OWNER TO gpadmin;

--
-- TOC entry 925 (class 1259 OID 21626)
-- Name: pxf_maternitystageoneandtwodetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitystageoneandtwodetails (
    id character varying(36),
    labourtypeid character varying(36),
    inducedmethod character varying(50),
    sedation character varying(50),
    doctorid character varying(36),
    anaesthetist character varying(36),
    conductedby character varying(50),
    witnessby character varying(50),
    deliverytypeid character varying(36),
    deliverycomplicatedtypeid character varying(36),
    deliverycomplicatedother character varying(50),
    indication character varying(100),
    details character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternitystageoneandtwodetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitystageoneandtwodetails OWNER TO gpadmin;

--
-- TOC entry 926 (class 1259 OID 21629)
-- Name: pxf_maternitystagethreedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitystagethreedetails (
    id character varying(36),
    maternityid character varying(36),
    placentadelby character varying(15),
    bloodlossamt numeric(18,2),
    bloodlosscause character varying(15),
    bloodlossother character varying(50),
    temperaturestage3 numeric(18,2),
    temperatureonehr numeric(18,2),
    pulsestage3 numeric(18,2),
    pulsestage3onehr numeric(18,2),
    bpstage3 numeric(18,2),
    bpstage3onehr numeric(18,2),
    placentatype character varying(15),
    placentaweight numeric(18,2),
    placentaab character varying(100),
    membranetype character varying(15),
    membraneab character varying(100),
    cordlength numeric(18,2),
    cordarndneck numeric(18,2),
    cordab character varying(100),
    cervix boolean,
    cervixsite character varying(100),
    vagina boolean,
    vaginasite character varying(100),
    pph boolean,
    pphtreatment character varying(50),
    perineum character varying(15),
    episiotomy character varying(15),
    sutureused character varying(50),
    analtone character varying(50),
    rectum character varying(50),
    painrelief character varying(20),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.maternitystagethreedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_maternitystagethreedetails OWNER TO gpadmin;

--
-- TOC entry 927 (class 1259 OID 21632)
-- Name: pxf_medicalrecordmovements; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecordmovements (
    id character varying(36),
    medicalrecordid character varying(36),
    mrrequestid character varying(36),
    movementtype character varying(36),
    movementdate timestamp without time zone,
    sentdeptid character varying(36),
    userid character varying(36),
    status character varying(3),
    noteexist boolean,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    comment character varying(600),
    requestdeptid character varying(36),
    senttime timestamp without time zone,
    requesttime timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.medicalrecordmovements?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecordmovements OWNER TO gpadmin;

--
-- TOC entry 928 (class 1259 OID 21635)
-- Name: pxf_medicalrecordrequests; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecordrequests (
    id character varying(36),
    medicalrecordid character varying(36),
    requesteddeptid character varying(36),
    requireddate timestamp without time zone,
    requesteddate timestamp without time zone,
    requesteduserid character varying(36),
    requeststatus character varying(36),
    appointmentid character varying(36),
    status character varying(3),
    noteexist boolean,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    episodeid character varying(36),
    isprinted boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.medicalrecordrequests?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecordrequests OWNER TO gpadmin;

--
-- TOC entry 929 (class 1259 OID 21638)
-- Name: pxf_medicalrecords; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecords (
    id character varying(36),
    status character varying(3),
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    currentdeptid character varying(36),
    noteexist boolean,
    patientid character varying(36),
    confidential boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.medicalrecords?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_medicalrecords OWNER TO gpadmin;

--
-- TOC entry 931 (class 1259 OID 21644)
-- Name: pxf_membershipcards; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_membershipcards (
    id character varying(36),
    cardtypeid character varying(36),
    cardnumber character varying(36),
    expirydate timestamp without time zone,
    valiedfrom timestamp without time zone,
    isterminate boolean,
    terminatedate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    patientid character varying(36),
    newic character varying(36),
    idtypeid character varying(36),
    otherno character varying(50),
    terminateby character varying(36),
    name character varying(50),
    adddate timestamp without time zone,
    remarks character varying(200),
    entitlement numeric(17,2),
    recstatus character varying(3),
    debtorid character varying(50),
    chargemasterid character varying(36),
    ipbilltype character varying(36),
    opbilltype character varying(36),
    nameoncard character varying(50),
    organisation character varying(36),
    designationid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.membershipcards?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_membershipcards OWNER TO gpadmin;

--
-- TOC entry 930 (class 1259 OID 21641)
-- Name: pxf_membershipcardtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_membershipcardtypes (
    id character varying(36),
    cardtypecode character varying(3),
    cardtypedescription character varying(50),
    maxnoofmembers integer,
    isexpiry boolean,
    isactiveforfamily boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.membershipcardtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_membershipcardtypes OWNER TO gpadmin;

--
-- TOC entry 932 (class 1259 OID 21647)
-- Name: pxf_messages; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_messages (
    messagecode character varying(36),
    systemmessage character varying(400),
    hcmsmessage character varying(400),
    messagetype character varying(30),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.messages?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_messages OWNER TO gpadmin;

--
-- TOC entry 908 (class 1259 OID 21571)
-- Name: pxf_mispatientstatmonth; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mispatientstatmonth (
    id character varying(36),
    companyid character varying(36),
    company character varying(10),
    year integer,
    month integer,
    patientid character varying(36),
    mrn integer,
    visit integer,
    amount numeric(18,2),
    newpatient integer,
    repeatpatient integer,
    rangerepeat character varying(50),
    rangeage character varying(50),
    visitip integer,
    visitop integer,
    visitdp integer,
    visitotc integer,
    newip integer,
    newop integer,
    newdp integer,
    newotc integer,
    repeatip integer,
    repeatop integer,
    repeatdp integer,
    repeatotc integer,
    amountip numeric(18,2),
    amountop numeric(18,2),
    amountdp numeric(18,2),
    amountotc numeric(18,2)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mispatientstatmonth?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mispatientstatmonth OWNER TO gpadmin;

--
-- TOC entry 909 (class 1259 OID 21574)
-- Name: pxf_mispatientstatyear; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mispatientstatyear (
    id character varying(36),
    companyid character varying(36),
    company character varying(20),
    year integer,
    patientid character varying(36),
    mrn integer,
    visit integer,
    amout numeric(18,2),
    newpatient integer,
    repeatpatient integer,
    rangerepeat character varying(50),
    rangeage character varying(50),
    visitip integer,
    visitop integer,
    visitdp integer,
    visitotc integer,
    jan integer,
    feb integer,
    mac integer,
    apr integer,
    may integer,
    june integer,
    july integer,
    aug integer,
    sept integer,
    oct integer,
    nov integer,
    "dec" integer,
    newip integer,
    newop integer,
    newdp integer,
    newotc integer,
    repeatip integer,
    repeatop integer,
    repeatdp integer,
    repeatotc integer,
    amountip numeric(18,2),
    amountop numeric(18,2),
    amountdp numeric(18,2),
    amountotc numeric(18,2)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mispatientstatyear?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mispatientstatyear OWNER TO gpadmin;

--
-- TOC entry 910 (class 1259 OID 21577)
-- Name: pxf_mmaclasses; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmaclasses (
    id character varying(36),
    mmaclasscode character varying(8),
    description character varying(100),
    classlevel integer,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmaclasses?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmaclasses OWNER TO gpadmin;

--
-- TOC entry 911 (class 1259 OID 21580)
-- Name: pxf_mmagroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmagroups (
    id character varying(36),
    mmagroupcode character varying(8),
    description character varying(100),
    qflag boolean,
    seqno integer,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmagroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmagroups OWNER TO gpadmin;

--
-- TOC entry 912 (class 1259 OID 21583)
-- Name: pxf_mmamasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmamasters (
    id character varying(36),
    mmacode character varying(20),
    description character varying,
    category character varying(7),
    version character varying(8),
    effectivedate timestamp without time zone,
    mmaclassid character varying(36),
    mmagroupid character varying(36),
    mmasubgroupid character varying(36),
    mmatypeid character varying(36),
    alternatecode character varying(8),
    overwriteflag boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    islisted boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmamasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmamasters OWNER TO gpadmin;

--
-- TOC entry 913 (class 1259 OID 21586)
-- Name: pxf_mmamasters_tdm; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmamasters_tdm (
    id character varying(255),
    mmacode character varying(255),
    description character varying(255),
    category character varying(255),
    version character varying(255),
    effdate timestamp without time zone,
    mmaclass character varying(255),
    mmagroup character varying(255),
    mmasubgrp character varying(255),
    mmatype character varying(255),
    altcode character varying(255),
    overwrite boolean,
    active character varying(3),
    compcode character varying(36),
    noteex boolean,
    adduser character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmamasters_tdm?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmamasters_tdm OWNER TO gpadmin;

--
-- TOC entry 914 (class 1259 OID 21589)
-- Name: pxf_mmaprices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmaprices (
    id character varying(36),
    mmaconsuloncharge numeric(21,8),
    mmasurgeoncharge numeric(21,8),
    mmaanaesthetistcharge numeric(21,8),
    mmamasterid character varying(36),
    feesconsulton numeric(21,8),
    feessurgeon numeric(21,8),
    feesanaesthetist numeric(21,8),
    feesconsultonmin numeric(21,8),
    feessurgeonmin numeric(21,8),
    feesanaesthetistmin numeric(21,8),
    mmaconsulonchargemin numeric(21,8),
    mmasurgeonchargemin numeric(21,8),
    mmaanaesthetistchargemin numeric(21,8),
    effectivedate timestamp without time zone,
    version character varying(8),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmaprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmaprices OWNER TO gpadmin;

--
-- TOC entry 915 (class 1259 OID 21592)
-- Name: pxf_mmasubgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmasubgroups (
    id character varying(36),
    mmasubgroupcode character varying(8),
    description character varying(120),
    seqno integer,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmasubgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmasubgroups OWNER TO gpadmin;

--
-- TOC entry 916 (class 1259 OID 21598)
-- Name: pxf_mmatransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmatransactions (
    id character varying(36),
    companyid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    episodetypecode character varying(4),
    transtype character varying(2),
    docref character varying(30),
    transdate timestamp without time zone,
    chargemasterid character varying(36),
    chargecode character varying(30),
    billcode numeric(18,0),
    costcode character varying(4),
    revcd character varying(4),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    billtypemasterid character varying(36),
    billtype character varying(5),
    doctorid character varying(36),
    doctorcode character varying(15),
    chargeclass character varying(4),
    unitprice numeric(21,8),
    quantity numeric(21,8),
    amount numeric(21,8),
    chargegroupid character varying(36),
    queuestat character varying(2),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocessed boolean,
    taxamount numeric(21,8),
    billno numeric(18,0),
    auditno numeric(18,0),
    uomid character varying(36),
    invgroup character varying(4),
    regdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(36),
    resulttype character varying(36),
    resultstatus boolean,
    inventory boolean,
    updinv boolean,
    invbatch integer,
    dosageid character varying(36),
    duration integer,
    instructionid character varying(36),
    discountamount numeric(21,8),
    discountcode character varying(36),
    pkgcode character varying(36),
    comment character varying(50),
    authid character varying(50),
    authdate timestamp without time zone,
    mmaflag boolean,
    procno integer,
    overwriteamt numeric(18,8),
    chargetransid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmatransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmatransactions OWNER TO gpadmin;

--
-- TOC entry 917 (class 1259 OID 21602)
-- Name: pxf_mmatypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmatypes (
    id character varying(36),
    mmatypecode character varying(8),
    description character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mmatypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mmatypes OWNER TO gpadmin;

--
-- TOC entry 933 (class 1259 OID 21650)
-- Name: pxf_modificationlogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_modificationlogs (
    id character varying(36),
    lineno integer,
    module character varying(250),
    submodule character varying(100),
    optionname character varying(100),
    "table" character varying(50),
    tablekey character varying(36),
    fieldname character varying(1500),
    modifytype character varying(15),
    modifyfrom character varying(1500),
    modifyto character varying(1500),
    modifyuserid character varying(36),
    modifydate timestamp without time zone,
    modifytime timestamp without time zone,
    appfunctionid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.modificationlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_modificationlogs OWNER TO gpadmin;

--
-- TOC entry 934 (class 1259 OID 21654)
-- Name: pxf_movementstats; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_movementstats (
    id character varying(36),
    name character varying(50),
    description character varying(50),
    status character varying(3),
    departmentid character varying(36),
    companyid character varying(36),
    audit1 character varying(50),
    audit2 character varying(50),
    audit3 character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.movementstats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_movementstats OWNER TO gpadmin;

--
-- TOC entry 935 (class 1259 OID 21657)
-- Name: pxf_mrncomments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mrncomments (
    companyid character varying(36),
    description character varying(50),
    name character varying(50),
    noteexist boolean,
    patientreistrationid character varying(36),
    status character varying(50),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    viptype character varying(50),
    id character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mrncomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mrncomments OWNER TO gpadmin;

--
-- TOC entry 918 (class 1259 OID 21605)
-- Name: pxf_mrrequestnotifications; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mrrequestnotifications (
    id character varying(36),
    mrrequestid character varying(36),
    notificationtext character varying(100),
    touserid character varying(36),
    fromuserid character varying(36),
    notificationdate timestamp without time zone,
    status character varying(3),
    noteexist boolean,
    companyid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.mrrequestnotifications?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_mrrequestnotifications OWNER TO gpadmin;

--
-- TOC entry 936 (class 1259 OID 21660)
-- Name: pxf_nationalities; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nationalities (
    id character varying(36),
    code character varying(4),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.nationalities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nationalities OWNER TO gpadmin;

--
-- TOC entry 938 (class 1259 OID 21667)
-- Name: pxf_nextofkins; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nextofkins (
    id character varying(36),
    episodeid character varying(36),
    seqno integer,
    telnohouse character varying(30),
    name character varying(50),
    relationship character varying(20),
    telnooffice character varying(30),
    addresstypeid character varying(36),
    oldic character varying(15),
    hpno character varying(50),
    street1 character varying(40),
    street2 character varying(40),
    street3 character varying(40),
    newic character varying(15),
    areaid character varying(36),
    postcodeid character varying(36),
    occupationid character varying(36),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.nextofkins?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nextofkins OWNER TO gpadmin;

--
-- TOC entry 939 (class 1259 OID 21670)
-- Name: pxf_notes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_notes (
    id character varying(36),
    tablename character varying(50),
    tablekey character varying(36),
    notetitle character varying(100),
    notecontent character varying,
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.notes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_notes OWNER TO gpadmin;

--
-- TOC entry 940 (class 1259 OID 21673)
-- Name: pxf_nutritionstatuschangedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nutritionstatuschangedetails (
    id character varying(36),
    episodenutritionid character varying(36),
    nutritionsuplystatus character varying(3),
    statussetdate timestamp without time zone,
    statussettime timestamp without time zone,
    remarks character varying(50),
    noteexist boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.nutritionstatuschangedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_nutritionstatuschangedetails OWNER TO gpadmin;

--
-- TOC entry 946 (class 1259 OID 21691)
-- Name: pxf_occupations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_occupations (
    id character varying(36),
    occupationcode character varying(4),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.occupations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_occupations OWNER TO gpadmin;

--
-- TOC entry 947 (class 1259 OID 21694)
-- Name: pxf_operations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_operations (
    id character varying(36),
    name character varying(100),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    functionid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.operations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_operations OWNER TO gpadmin;

--
-- TOC entry 948 (class 1259 OID 21697)
-- Name: pxf_ordersetdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ordersetdetails (
    id character varying(36),
    code character varying(10),
    description character varying(150),
    chargemasterid character varying(36),
    chargegroupid character varying(36),
    quantity numeric(18,0),
    companyid character varying(36),
    ordersetheaderid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    noteexist boolean,
    status character varying(3),
    revcode character varying(10)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.ordersetdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ordersetdetails OWNER TO gpadmin;

--
-- TOC entry 949 (class 1259 OID 21700)
-- Name: pxf_ordersetheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ordersetheaders (
    id character varying(36),
    code character varying(8),
    description character varying(150),
    chargemasterid character varying(36),
    effictivedate timestamp without time zone,
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36),
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.ordersetheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_ordersetheaders OWNER TO gpadmin;

--
-- TOC entry 941 (class 1259 OID 21676)
-- Name: pxf_otdutyroomreservations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otdutyroomreservations (
    id character varying(36),
    companyid character varying(36),
    roomid character varying(36),
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.otdutyroomreservations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otdutyroomreservations OWNER TO gpadmin;

--
-- TOC entry 942 (class 1259 OID 21679)
-- Name: pxf_otoncallteams; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otoncallteams (
    id character varying(36),
    otdutyroomresid character varying(36),
    ottmembertypeid character varying(36),
    companyid character varying(36),
    salutation character varying(50),
    firstname character varying(200),
    lastname character varying(200),
    contactnumber character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.otoncallteams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otoncallteams OWNER TO gpadmin;

--
-- TOC entry 943 (class 1259 OID 21682)
-- Name: pxf_otreservations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otreservations (
    id character varying(36),
    roomid character varying(36),
    companyid character varying(36),
    patientid character varying(36),
    operationprocedure character varying(36),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    varifiedby character varying(36),
    natureofsurgery character varying(250),
    remarks character varying(250),
    actstarttime timestamp without time zone,
    actendtime timestamp without time zone,
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.otreservations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otreservations OWNER TO gpadmin;

--
-- TOC entry 944 (class 1259 OID 21685)
-- Name: pxf_otteammembertypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otteammembertypes (
    id character varying(36),
    code character varying(36),
    description character varying(50),
    sequence smallint,
    teamtype character varying(10),
    ismandatory boolean,
    status character varying(3),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.otteammembertypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otteammembertypes OWNER TO gpadmin;

--
-- TOC entry 945 (class 1259 OID 21688)
-- Name: pxf_otteams; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otteams (
    id character varying(36),
    companyid character varying(36),
    otreservationid character varying(36),
    ottmembertypeid character varying(36),
    salutation character varying(50),
    firstname character varying(200),
    lastname character varying(200),
    contactnumber character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.otteams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_otteams OWNER TO gpadmin;

--
-- TOC entry 953 (class 1259 OID 21712)
-- Name: pxf_packagedetailprices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagedetailprices (
    id character varying(36),
    packagedetailid character varying(36),
    pricetypeid character varying(36),
    packageitemprice numeric(21,8),
    packageitemactprice numeric(21,8),
    totprice numeric(21,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.packagedetailprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagedetailprices OWNER TO gpadmin;

--
-- TOC entry 954 (class 1259 OID 21715)
-- Name: pxf_packagedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagedetails (
    id character varying(36),
    companyid character varying(36),
    packagemasterid character varying(36),
    chargemasterid character varying(36),
    packagerevisiondetailid character varying(36),
    quantity numeric(18,8),
    description character varying(150),
    price numeric(21,8),
    pricetypeid character varying(36),
    actprice numeric(21,8),
    totprice numeric(21,8),
    revcode character varying(4),
    uomid character varying(36),
    chargetypeid character varying(36),
    chargegroupid character varying(36),
    qflag boolean,
    costcodeid character varying(36),
    chgflag character varying(10),
    ipacccodeid character varying(36),
    opacccodeid character varying(36),
    revdept character varying(10),
    chargeclassid character varying(36),
    costdept character varying(10),
    doctorid character varying(36),
    effectivedate timestamp without time zone,
    changedate timestamp without time zone,
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.packagedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagedetails OWNER TO gpadmin;

--
-- TOC entry 955 (class 1259 OID 21718)
-- Name: pxf_packagemasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagemasters (
    id character varying(36),
    packagecode character varying(8),
    pricetypeid character varying(36),
    chargemasterid character varying(36),
    description character varying(150),
    curamount numeric(18,8),
    prevamount numeric(18,8),
    newamount numeric(18,8),
    cureffectivedate timestamp without time zone,
    neweffectivedate timestamp without time zone,
    addchg boolean,
    autopull boolean,
    active boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.packagemasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagemasters OWNER TO gpadmin;

--
-- TOC entry 956 (class 1259 OID 21721)
-- Name: pxf_packagerevisionprices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagerevisionprices (
    id character varying(36),
    packagerevisionid character varying(36),
    pricetypeid character varying(36),
    price numeric(21,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.packagerevisionprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagerevisionprices OWNER TO gpadmin;

--
-- TOC entry 957 (class 1259 OID 21725)
-- Name: pxf_packagerevisions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagerevisions (
    id character varying(36),
    packagemasterid character varying(36),
    effectivedate timestamp without time zone,
    price numeric(21,8),
    pricetypeid character varying(36),
    revisionnumber integer,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.packagerevisions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_packagerevisions OWNER TO gpadmin;

--
-- TOC entry 958 (class 1259 OID 21742)
-- Name: pxf_panelhdrs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_panelhdrs (
    id character varying(36),
    icdid character varying(36),
    doctorid character varying(36),
    panelcode character varying(10),
    description character varying(50),
    paneltype character varying(10),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.panelhdrs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_panelhdrs OWNER TO gpadmin;

--
-- TOC entry 959 (class 1259 OID 21756)
-- Name: pxf_panelitems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_panelitems (
    id character varying(36),
    panelhdrid character varying(36),
    chargemasterid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.panelitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_panelitems OWNER TO gpadmin;

--
-- TOC entry 960 (class 1259 OID 21765)
-- Name: pxf_paramgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paramgroups (
    id character varying(36),
    paramgroupcode character varying(40),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.paramgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paramgroups OWNER TO gpadmin;

--
-- TOC entry 962 (class 1259 OID 21779)
-- Name: pxf_paramsources; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paramsources (
    id character varying(36),
    paramsourcecode character varying(40),
    description character varying(255),
    isglsource boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.paramsources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paramsources OWNER TO gpadmin;

--
-- TOC entry 963 (class 1259 OID 21782)
-- Name: pxf_patientaddress; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientaddress (
    id character varying(36),
    patientid character varying(36),
    areaid character varying(36),
    addresstypeid character varying(36),
    city character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    officetelno character varying(50),
    stateid character varying(36),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.patientaddress?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientaddress OWNER TO gpadmin;

--
-- TOC entry 964 (class 1259 OID 21785)
-- Name: pxf_patientcomments; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientcomments (
    id character varying(36),
    title character varying(100),
    comment character varying,
    commenttype character varying(4),
    patientid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.patientcomments?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientcomments OWNER TO gpadmin;

--
-- TOC entry 965 (class 1259 OID 21788)
-- Name: pxf_patientmovements; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientmovements (
    id character varying(36),
    patientid character varying(36),
    mrnnumber character varying(50),
    name character varying(50),
    episodeid character varying(36),
    trackingtype character varying(50),
    departmentid character varying(36),
    locationid character varying(36),
    process character varying(50),
    movementstatid character varying(36),
    transqueueid character varying(36),
    queuestatid character varying(36),
    timein timestamp without time zone,
    timeout timestamp without time zone,
    timespent numeric(10,2),
    companyid character varying(36),
    queueno integer,
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.patientmovements?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patientmovements OWNER TO gpadmin;

--
-- TOC entry 966 (class 1259 OID 21791)
-- Name: pxf_patients; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patients (
    areaid character varying(36),
    active boolean,
    addresstypeid character varying(36),
    admitic character varying(50),
    admitperson character varying(50),
    aeapproveuserid character varying(36),
    age integer,
    bloodgroup character varying(36),
    childno integer,
    citizenshipid character varying(36),
    city character varying(50),
    companyid character varying(36),
    companyname character varying(50),
    confidential boolean,
    corpinfo character varying(50),
    dateofbirth timestamp without time zone,
    email character varying(60),
    financialstatus character varying(50),
    firstname character varying(200),
    firstvisit timestamp without time zone,
    gender character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    idtypeid character varying(36),
    languageid character varying(36),
    lastname character varying(200),
    lastvisit timestamp without time zone,
    maritalstatusid character varying(36),
    medrecord boolean,
    mrnnumber integer,
    mrntext character varying(50),
    mrntype character varying(50),
    name character varying(200),
    newic character varying(50),
    newmrn integer,
    noteexist boolean,
    occupationid character varying(36),
    officetelno character varying(50),
    oldic character varying(50),
    oldmrn integer,
    otherno integer,
    othernumber character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    raceid character varying(36),
    registrationdate timestamp without time zone,
    relationshipid character varying(36),
    religionid character varying(36),
    staffid character varying(36),
    stateid character varying(36),
    status character varying(15),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    titleid character varying(36),
    patienttype character varying(4),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    id character varying(36),
    picturepath character varying(250),
    recordstatus character varying(5),
    description character varying(250),
    convertedpatientid character varying(36),
    ismedcare boolean,
    ofcaddresstypeid character varying(36),
    ofcstreet1 character varying(50),
    ofcstreet2 character varying(50),
    ofcstreet3 character varying(50),
    ofch_pphoneno character varying(50),
    ofccity character varying(50),
    blockno character varying(50),
    ofcemail character varying(50),
    ofcpostalcodeid character varying(36),
    ofcareaid character varying(36),
    ofcstateid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.patients?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patients OWNER TO gpadmin;

--
-- TOC entry 967 (class 1259 OID 21797)
-- Name: pxf_patients_bkup; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patients_bkup (
    areaid character varying(36),
    active boolean,
    addresstypeid character varying(36),
    admitic character varying(50),
    admitperson character varying(50),
    aeapproveuserid character varying(36),
    age integer,
    bloodgroup character varying(36),
    childno integer,
    citizenshipid character varying(36),
    city character varying(50),
    companyid character varying(36),
    companyname character varying(50),
    confidential boolean,
    corpinfo character varying(50),
    dateofbirth timestamp without time zone,
    email character varying(60),
    financialstatus character varying(50),
    firstname character varying(200),
    firstvisit timestamp without time zone,
    gender character varying(50),
    h_pphoneno character varying(50),
    homephoneno character varying(50),
    housingarea character varying(50),
    idtypeid character varying(36),
    languageid character varying(36),
    lastname character varying(200),
    lastvisit timestamp without time zone,
    maritalstatusid character varying(36),
    medrecord boolean,
    mrnnumber integer,
    mrntext character varying(50),
    mrntype character varying(50),
    name character varying(200),
    newic character varying(50),
    newmrn integer,
    noteexist boolean,
    occupationid character varying(36),
    officetelno character varying(50),
    oldic character varying(50),
    oldmrn integer,
    otherno integer,
    othernumber character varying(50),
    personalemail character varying(50),
    postalcodeid character varying(36),
    raceid character varying(36),
    registrationdate timestamp without time zone,
    relationshipid character varying(36),
    religionid character varying(36),
    staffid character varying(36),
    stateid character varying(36),
    status character varying(15),
    street1 character varying(50),
    street2 character varying(50),
    street3 character varying(50),
    titleid character varying(36),
    patienttype character varying(4),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    id character varying(36),
    picturepath character varying(250),
    recordstatus character varying(5),
    description character varying(250),
    convertedpatientid character varying(36),
    ismedcare boolean,
    ofcaddresstypeid character varying(36),
    ofcstreet1 character varying(50),
    ofcstreet2 character varying(50),
    ofcstreet3 character varying(50),
    ofch_pphoneno character varying(50),
    ofccity character varying(50),
    blockno character varying(50),
    ofcemail character varying(50),
    ofcpostalcodeid character varying(36),
    ofcareaid character varying(36),
    ofcstateid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.patients_bkup?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_patients_bkup OWNER TO gpadmin;

--
-- TOC entry 971 (class 1259 OID 21809)
-- Name: pxf_payergroupexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_payergroupexceptions (
    id character varying(36),
    chargegroupid character varying(36),
    debtormasterid character varying(50),
    companyid character varying(36),
    description character varying(75),
    grouplimit numeric(18,2),
    individualitemlimit numeric(18,2),
    isgroupunlimited boolean,
    isitemunlimited boolean,
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.payergroupexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_payergroupexceptions OWNER TO gpadmin;

--
-- TOC entry 972 (class 1259 OID 21812)
-- Name: pxf_payeritemexceptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_payeritemexceptions (
    id character varying(36),
    chargemasterid character varying(36),
    companyid character varying(36),
    payergroupexceptionid character varying(36),
    description character varying(75),
    itemlimit numeric(18,2),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.payeritemexceptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_payeritemexceptions OWNER TO gpadmin;

--
-- TOC entry 968 (class 1259 OID 21800)
-- Name: pxf_paygrouppaymodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paygrouppaymodes (
    paygroupid character varying(36),
    paymodeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.paygrouppaymodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paygrouppaymodes OWNER TO gpadmin;

--
-- TOC entry 969 (class 1259 OID 21803)
-- Name: pxf_paygroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paygroups (
    id character varying(36),
    paygroup character varying(8),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.paygroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paygroups OWNER TO gpadmin;

--
-- TOC entry 970 (class 1259 OID 21806)
-- Name: pxf_paymodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paymodes (
    id character varying(36),
    paymode character varying(36),
    source character varying(2),
    transtype character varying(4),
    description character varying(100),
    ccode character varying(6),
    glaccno character varying(8),
    isepisode boolean,
    isreceiptandbilling boolean,
    paytype character varying(15),
    cardflag boolean,
    valexpdate boolean,
    comrate numeric(19,4),
    drcommrate numeric(19,4),
    drpayment boolean,
    cardcent character varying(8),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    costcenterid character varying(36),
    glaccountid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.paymodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_paymodes OWNER TO gpadmin;

--
-- TOC entry 973 (class 1259 OID 21815)
-- Name: pxf_pendingprocesses; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pendingprocesses (
    id character varying(36),
    refid character varying(36),
    tablename character varying(100),
    processname character varying(50),
    processed boolean,
    note character varying(255),
    sessionid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    sessioncode character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.pendingprocesses?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pendingprocesses OWNER TO gpadmin;

--
-- TOC entry 974 (class 1259 OID 21820)
-- Name: pxf_periods; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_periods (
    id character varying(36),
    fiscalyearid character varying(36),
    periodnum integer,
    datefrom timestamp without time zone,
    dateto timestamp without time zone,
    isclosed boolean,
    companyid character varying(36),
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.periods?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_periods OWNER TO gpadmin;

--
-- TOC entry 975 (class 1259 OID 21823)
-- Name: pxf_physicalcountdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_physicalcountdetails (
    id character varying(36),
    line_no integer,
    stockcountheaderid character varying(20),
    stockcountdetailsid integer,
    productid character varying(36),
    freezdate timestamp without time zone,
    physicalqty numeric(18,2),
    stocktakedate timestamp without time zone,
    itemsetstatusid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.physicalcountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_physicalcountdetails OWNER TO gpadmin;

--
-- TOC entry 950 (class 1259 OID 21703)
-- Name: pxf_pmtrackings; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pmtrackings (
    id character varying(36),
    departmentid character varying(36),
    episodeid character varying(36),
    locationid character varying(36),
    mrnnumber character varying(50),
    name character varying(50),
    patientreistrationid character varying(36),
    process character varying(50),
    timein timestamp without time zone,
    timeout timestamp without time zone,
    timespent numeric(10,2),
    trackingtype character varying(50),
    transqueueid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.pmtrackings?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pmtrackings OWNER TO gpadmin;

--
-- TOC entry 951 (class 1259 OID 21706)
-- Name: pxf_posignature; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_posignature (
    id character varying(36),
    companyid character varying(36),
    departmentid character varying(36),
    effdate timestamp without time zone,
    signatureno integer,
    lable1 character varying(100),
    name1 character varying(100),
    designation1 character varying(100),
    lable2 character varying(100),
    name2 character varying(100),
    designation2 character varying(100),
    lable3 character varying(100),
    name3 character varying(100),
    designation3 character varying(100),
    lable4 character varying(100),
    name4 character varying(100),
    designation4 character varying(100),
    lable5 character varying(100),
    name5 character varying(100),
    designation5 character varying(100),
    limitflag boolean,
    limitamount numeric(21,2),
    signaturenolimit integer,
    lablelimit1 character varying(100),
    namelimit1 character varying(100),
    designationlimit1 character varying(100),
    lablelimit2 character varying(100),
    namelimit2 character varying(100),
    designationlimit2 character varying(100),
    lablelimit3 character varying(100),
    namelimit3 character varying(100),
    designationlimit3 character varying(100),
    lablelimit4 character varying(100),
    namelimit4 character varying(100),
    designationlimit4 character varying(100),
    lablelimit5 character varying(100),
    namelimit5 character varying(100),
    designationlimit5 character varying(100),
    adddate timestamp without time zone,
    adduserid character varying(36),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    active character varying(36),
    potype character varying(36),
    asset boolean,
    recno integer,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.posignature?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_posignature OWNER TO gpadmin;

--
-- TOC entry 976 (class 1259 OID 21826)
-- Name: pxf_postalcodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_postalcodes (
    id character varying(36),
    postcode character varying(10),
    description character varying(40),
    status character varying(3),
    stateid character varying(36),
    countryid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.postalcodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_postalcodes OWNER TO gpadmin;

--
-- TOC entry 952 (class 1259 OID 21709)
-- Name: pxf_potypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_potypes (
    id character varying(36),
    code character varying(10),
    description character varying(80),
    status character varying(3),
    departmentid character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.potypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_potypes OWNER TO gpadmin;

--
-- TOC entry 977 (class 1259 OID 21829)
-- Name: pxf_pricedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricedetails (
    id character varying(36),
    companyid character varying(36),
    pricetypeid character varying(36),
    chargemasterid character varying(36),
    glaccountcrid character varying(36),
    glaccountdrid character varying(36),
    amount numeric(18,2),
    iscurrent boolean,
    effectivedate timestamp without time zone,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    taxmasterid character varying(36),
    costprice numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.pricedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricedetails OWNER TO gpadmin;

--
-- TOC entry 978 (class 1259 OID 21832)
-- Name: pxf_pricesources; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricesources (
    id character varying(36),
    pricecode character varying(4),
    description character varying(80),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.pricesources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricesources OWNER TO gpadmin;

--
-- TOC entry 979 (class 1259 OID 21835)
-- Name: pxf_pricetypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricetypes (
    id character varying(36),
    companyid character varying(36),
    pricetypecode character varying(5),
    description character varying(100),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.pricetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_pricetypes OWNER TO gpadmin;

--
-- TOC entry 980 (class 1259 OID 21838)
-- Name: pxf_printers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_printers (
    id character varying(36),
    departmentid character varying(36),
    prtname character varying(40),
    pathname character varying(40),
    localid character varying(8),
    seqno integer,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.printers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_printers OWNER TO gpadmin;

--
-- TOC entry 981 (class 1259 OID 21841)
-- Name: pxf_privileges; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_privileges (
    id character varying(36),
    name character varying(225),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.privileges?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_privileges OWNER TO gpadmin;

--
-- TOC entry 982 (class 1259 OID 21844)
-- Name: pxf_privilegesdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_privilegesdetails (
    id character varying(36),
    privilegeid character varying(36),
    name character varying(100),
    description character varying(255),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.privilegesdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_privilegesdetails OWNER TO gpadmin;

--
-- TOC entry 983 (class 1259 OID 21847)
-- Name: pxf_prodsubcategories; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_prodsubcategories (
    id character varying(36),
    productcategoryid character varying(36),
    code character varying(30),
    description character varying(80),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.prodsubcategories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_prodsubcategories OWNER TO gpadmin;

--
-- TOC entry 984 (class 1259 OID 21850)
-- Name: pxf_productcategories; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productcategories (
    id character varying(36),
    catcode character varying(24),
    description character varying(80),
    stockacctid character varying(36),
    costacctid character varying(36),
    adjacctid character varying(36),
    woffacctid character varying(36),
    expacctid character varying(36),
    loanacctid character varying(36),
    accrualaccid character varying(36),
    stktakeadjacctid character varying(36),
    source character varying(4),
    cattype character varying(4),
    povalidatetime boolean,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.productcategories?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productcategories OWNER TO gpadmin;

--
-- TOC entry 985 (class 1259 OID 21853)
-- Name: pxf_productgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productgroups (
    id character varying(36),
    code character varying(30),
    description character varying(50),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.productgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productgroups OWNER TO gpadmin;

--
-- TOC entry 986 (class 1259 OID 21856)
-- Name: pxf_productlogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productlogs (
    id character varying(36),
    productid character varying(36),
    uomid character varying(36),
    avgcost numeric(21,8),
    actavgcost numeric(21,8),
    qtyonhand numeric(21,8),
    supplierid character varying(36),
    currprice numeric(21,8),
    bonqty numeric(21,8),
    minqty numeric(21,8),
    maxqty numeric(21,8),
    reordlevel numeric(21,8),
    reordqty numeric(21,8),
    active boolean,
    chgflag boolean,
    newavgcost numeric(21,8),
    newuomid character varying(36),
    newactive boolean,
    prodlogcat character varying(36),
    remarks character varying(255),
    costmargin numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.productlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_productlogs OWNER TO gpadmin;

--
-- TOC entry 987 (class 1259 OID 21859)
-- Name: pxf_products; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_products (
    id character varying(36),
    itemcode character varying(30),
    description character varying(120),
    genericname character varying(100),
    isantibiotic boolean,
    brandname character varying(30),
    manufacture character varying(30),
    productgroupid character varying(36),
    productcategoryid character varying(36),
    prodsubcategoryid character varying(36),
    chargeuomid character varying(36),
    pouomid character varying(36),
    smalluonid character varying(36),
    repackitem boolean,
    chargeflag boolean,
    reqexpdateflg boolean,
    activeflag boolean,
    reuse boolean,
    mainsupplierid character varying(36),
    mainstoreid character varying(36),
    tagging character varying(16),
    itemtype character varying(40),
    averagecost numeric(23,8),
    actavgcost numeric(23,8),
    currprice numeric(23,8),
    costmargin numeric(19,8),
    quantityonhand numeric(19,4),
    bonqty numeric(19,4),
    minqty integer,
    maxqty integer,
    reordlevel integer,
    reordqty integer,
    trqty integer,
    deactivedate timestamp without time zone,
    remarks character varying(100),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    assetscategoryid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.products?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_products OWNER TO gpadmin;

--
-- TOC entry 988 (class 1259 OID 21862)
-- Name: pxf_products_tmpdu; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_products_tmpdu (
    id character varying(36),
    itemcode character varying(30),
    description character varying(80),
    groupcode character varying(36),
    productcat character varying(36),
    subcatcode character varying(36),
    uomcode character varying(36),
    pouom character varying(36),
    smalluom character varying(36),
    rpkitem boolean,
    chgflag boolean,
    expdtflg boolean,
    active boolean,
    reuse boolean,
    suppcode character varying(36),
    mstore character varying(36),
    tagging character varying(16),
    itemtype character varying(40),
    avgcost double precision,
    actavgcost double precision,
    currprice double precision,
    costmargin double precision,
    qtyonhand double precision,
    bonqty double precision,
    minqty integer,
    maxqty integer,
    reordlevel integer,
    reordqty integer,
    trqty integer,
    deactivedate timestamp without time zone,
    status character varying(3),
    compcode character varying(36),
    adduser character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.products_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_products_tmpdu OWNER TO gpadmin;

--
-- TOC entry 989 (class 1259 OID 21865)
-- Name: pxf_purchaseorderdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaseorderdetails (
    id character varying(36),
    purchaseorderheaderid character varying(36),
    line integer,
    productid character varying(36),
    productdescription character varying(120),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    orderquantity numeric(19,8),
    remarks character varying,
    unitprice numeric(20,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    amount numeric(21,8),
    supplierproductid character varying(36),
    quantitydelivered numeric(19,8),
    purchaserequestdetailid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    linkid character varying(10),
    taxdetailid character varying(36),
    netamount numeric(21,8),
    taxamount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.purchaseorderdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaseorderdetails OWNER TO gpadmin;

--
-- TOC entry 990 (class 1259 OID 21868)
-- Name: pxf_purchaseorderheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaseorderheaders (
    id character varying(36),
    ponumber character varying(10),
    potypeid character varying(36),
    purchasedeptid character varying(36),
    requestdeptid character varying(36),
    deliverydeptid character varying(36),
    orderdate timestamp without time zone,
    expecteddate timestamp without time zone,
    expirydate timestamp without time zone,
    termsid character varying(36),
    supplierid character varying(36),
    postatusid character varying(36),
    issuepersonid character varying(36),
    issuedate timestamp without time zone,
    firstauthpersonid character varying(36),
    firstauthdate timestamp without time zone,
    entereddate timestamp without time zone,
    currancyid character varying(36),
    currencyrateid character varying(36),
    remarks character varying(255),
    discounttypeid character varying(36),
    discountamount numeric(21,8),
    discountpercentage numeric(5,2),
    subamount numeric(21,8),
    totalamount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    recordno character varying(10),
    isexport boolean,
    destinationdeptid character varying(36),
    prheaderid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.purchaseorderheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaseorderheaders OWNER TO gpadmin;

--
-- TOC entry 991 (class 1259 OID 21871)
-- Name: pxf_purchaserequestdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaserequestdetails (
    id character varying(36),
    purchaserequestheaderid character varying(36),
    line integer,
    productid character varying(36),
    productdescription character varying(120),
    supplierid character varying(36),
    productpriceid character varying(36),
    uomid character varying(36),
    requestquantity numeric(19,8),
    remarks character varying(255),
    unitprice numeric(20,8),
    amount numeric(21,8),
    amountdiscount numeric(21,8),
    percentagediscount numeric(5,2),
    percentagetax numeric(5,2),
    amounttax numeric(21,8),
    supplierproductid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    taxdetailid character varying(36),
    ponumber character varying(10),
    purchaseorderheaderid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.purchaserequestdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaserequestdetails OWNER TO gpadmin;

--
-- TOC entry 992 (class 1259 OID 21874)
-- Name: pxf_purchaserequestheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaserequestheaders (
    id character varying(36),
    prnumber character varying(10),
    prdate timestamp without time zone,
    prstatusid character varying(36),
    requestdeptid character varying(36),
    requestpersonid character varying(36),
    purchasedeptid character varying(36),
    authorizepersonid character varying(36),
    authorizedate timestamp without time zone,
    remarks character varying(255),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    supplierid character varying(36),
    subamount numeric(21,8),
    totalamount numeric(21,8)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.purchaserequestheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_purchaserequestheaders OWNER TO gpadmin;

--
-- TOC entry 993 (class 1259 OID 21880)
-- Name: pxf_queueentries; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queueentries (
    id character varying(36),
    queueid character varying(36),
    queueseq integer,
    queuestatid character varying(36),
    queuesourceid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    locationid character varying(36),
    episodeprescriptionhdrid character varying(36),
    highpriority boolean,
    refqueueid character varying(36),
    refqueueentryid character varying(36),
    datetimein timestamp without time zone,
    datetimeout timestamp without time zone,
    isclosed boolean,
    tokenno integer,
    chgtranorderrefid character varying(36),
    remarks character varying(250),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queueentries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queueentries OWNER TO gpadmin;

--
-- TOC entry 998 (class 1259 OID 21895)
-- Name: pxf_queues; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queues (
    id character varying(36),
    queuetypeid character varying(36),
    departmentid character varying(36),
    name character varying(25),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queues?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queues OWNER TO gpadmin;

--
-- TOC entry 994 (class 1259 OID 21883)
-- Name: pxf_queuesources; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuesources (
    id character varying(36),
    code character varying(10),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queuesources?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuesources OWNER TO gpadmin;

--
-- TOC entry 995 (class 1259 OID 21886)
-- Name: pxf_queuestartstats; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuestartstats (
    id character varying(36),
    queuesourceid character varying(36),
    queuetypeid character varying(36),
    startqueuestatid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queuestartstats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuestartstats OWNER TO gpadmin;

--
-- TOC entry 996 (class 1259 OID 21889)
-- Name: pxf_queuestats; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuestats (
    id character varying(36),
    queuetypeid character varying(36),
    name character varying(50),
    description character varying(255),
    sequence smallint,
    formname character varying(50),
    isprocess boolean,
    ismanualprocess boolean,
    isinventoryissue boolean,
    istokenrequired boolean,
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queuestats?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuestats OWNER TO gpadmin;

--
-- TOC entry 997 (class 1259 OID 21892)
-- Name: pxf_queuetypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuetypes (
    id character varying(36),
    name character varying(50),
    description character varying(255),
    isprosseing boolean,
    istokenrequired boolean,
    isdoctorqueue boolean,
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.queuetypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_queuetypes OWNER TO gpadmin;

--
-- TOC entry 999 (class 1259 OID 21898)
-- Name: pxf_races; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_races (
    id character varying(36),
    code character varying(4),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    ismalaysian boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.races?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_races OWNER TO gpadmin;

--
-- TOC entry 1000 (class 1259 OID 21901)
-- Name: pxf_reasoncodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_reasoncodes (
    id character varying(36),
    code character varying(10),
    description character varying(100),
    type character varying(2),
    companyid character varying(36),
    noteexist boolean,
    status character varying(3),
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.reasoncodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_reasoncodes OWNER TO gpadmin;

--
-- TOC entry 1001 (class 1259 OID 21904)
-- Name: pxf_receiptdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_receiptdetails (
    id character varying(36),
    bankid character varying(36),
    branchname character varying(75),
    paidamount numeric(21,8),
    authno character varying(250),
    expiredate timestamp without time zone,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.receiptdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_receiptdetails OWNER TO gpadmin;

--
-- TOC entry 1002 (class 1259 OID 21907)
-- Name: pxf_relationships; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_relationships (
    id character varying(36),
    relationshipcode character varying(4),
    description character varying(30),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.relationships?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_relationships OWNER TO gpadmin;

--
-- TOC entry 1003 (class 1259 OID 21910)
-- Name: pxf_religions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_religions (
    id character varying(36),
    code character varying(4),
    description character varying(40),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.religions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_religions OWNER TO gpadmin;

--
-- TOC entry 1004 (class 1259 OID 21913)
-- Name: pxf_repackitemdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repackitemdetails (
    id character varying(36),
    repackitemid character varying(36),
    line integer,
    productid character varying(36),
    quantity numeric(18,8),
    uomid character varying(36),
    netprice numeric(19,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    repackheaderid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.repackitemdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repackitemdetails OWNER TO gpadmin;

--
-- TOC entry 1005 (class 1259 OID 21916)
-- Name: pxf_repackitems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repackitems (
    id character varying(36),
    departmentid character varying(36),
    productid character varying(36),
    uomid character varying(36),
    description character varying(80),
    quantity numeric(18,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    expdate timestamp without time zone,
    line integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.repackitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repackitems OWNER TO gpadmin;

--
-- TOC entry 1006 (class 1259 OID 21919)
-- Name: pxf_repacktransdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repacktransdetails (
    id character varying(36),
    repackheaderid character varying(36),
    line integer,
    productid character varying(36),
    quantity numeric(18,8),
    uomid character varying(36),
    netprice numeric(21,8),
    amount numeric(21,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.repacktransdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repacktransdetails OWNER TO gpadmin;

--
-- TOC entry 1007 (class 1259 OID 21922)
-- Name: pxf_repacktransheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repacktransheaders (
    id character varying(36),
    repackitemid character varying(36),
    uomid character varying(36),
    documentnum character varying(10),
    departmentid character varying(36),
    transdate timestamp without time zone,
    productid character varying(36),
    userdefinedtypeid character varying(36),
    description character varying(80),
    quantity numeric(18,8),
    repackpersonid character varying(36),
    expirydate timestamp without time zone,
    remarks character varying(255),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    avgcost numeric(18,4),
    amount numeric(18,4)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.repacktransheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_repacktransheaders OWNER TO gpadmin;

--
-- TOC entry 1008 (class 1259 OID 21925)
-- Name: pxf_reporttypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_reporttypes (
    id character varying(36),
    code character varying(20),
    name character varying(50),
    status character varying(3),
    updateuserid character varying(36),
    companyid character varying(36),
    updatedate character varying(36),
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.reporttypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_reporttypes OWNER TO gpadmin;

--
-- TOC entry 1010 (class 1259 OID 21931)
-- Name: pxf_rooms; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_rooms (
    id character varying(36),
    roomtypeid character varying(36),
    roomno character varying(10),
    roomname character varying(30),
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    topposition integer,
    bedorientation character varying(1),
    description character varying(100),
    iswarddefault boolean,
    wardid character varying(36),
    companyid character varying(36),
    status character varying(50),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.rooms?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_rooms OWNER TO gpadmin;

--
-- TOC entry 1009 (class 1259 OID 21928)
-- Name: pxf_roomtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_roomtypes (
    id character varying(36),
    roomtypecode character varying(30),
    description character varying(100),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.roomtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_roomtypes OWNER TO gpadmin;

--
-- TOC entry 1016 (class 1259 OID 21949)
-- Name: pxf_searchoptions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_searchoptions (
    id character varying(36),
    object character varying(75),
    name character varying(30),
    description character varying(40),
    query character varying(500),
    queryvalues character varying(500),
    defaultquery boolean,
    status character varying(50),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.searchoptions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_searchoptions OWNER TO gpadmin;

--
-- TOC entry 1017 (class 1259 OID 21952)
-- Name: pxf_searchproperties; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_searchproperties (
    id character varying(36),
    objname character varying(75),
    propname character varying(75),
    proptype character varying(10),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.searchproperties?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_searchproperties OWNER TO gpadmin;

--
-- TOC entry 1018 (class 1259 OID 21955)
-- Name: pxf_sequences; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sequences (
    id character varying(36),
    transtypeid character varying(36),
    prefix character varying(10),
    nextkey bigint,
    departmentid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    backdays integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.sequences?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sequences OWNER TO gpadmin;

--
-- TOC entry 1019 (class 1259 OID 21958)
-- Name: pxf_sessioncontexts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sessioncontexts (
    id character varying(36),
    sessioncode character varying(36),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    lastaccesstime timestamp without time zone,
    status character varying(36),
    userid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.sessioncontexts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sessioncontexts OWNER TO gpadmin;

--
-- TOC entry 1078 (class 1259 OID 22135)
-- Name: pxf_sloc; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sloc (
    sl_dept character varying(255),
    product_id double precision,
    conversion_factor double precision,
    stockloc_qtyonhand double precision,
    "stockloc_loose_ qtyonhand" double precision,
    product_avgcost double precision
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.sloc?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_sloc OWNER TO gpadmin;

--
-- TOC entry 1011 (class 1259 OID 21934)
-- Name: pxf_slocvsprod; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    "stockloc_qtyonhand * product_avgcost * conversion_factor" character varying(50),
    product_description character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.slocvsprod?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod OWNER TO gpadmin;

--
-- TOC entry 1012 (class 1259 OID 21937)
-- Name: pxf_slocvsprod1; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod1 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    "stockloc_qtyonhand * product_avgcost * conversion_factor" character varying(50),
    product_description character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.slocvsprod1?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod1 OWNER TO gpadmin;

--
-- TOC entry 1013 (class 1259 OID 21940)
-- Name: pxf_slocvsprod3; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod3 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    stockvalue character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.slocvsprod3?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod3 OWNER TO gpadmin;

--
-- TOC entry 1014 (class 1259 OID 21943)
-- Name: pxf_slocvsprod4; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod4 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    stockvalue character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.slocvsprod4?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_slocvsprod4 OWNER TO gpadmin;

--
-- TOC entry 1015 (class 1259 OID 21946)
-- Name: pxf_smsalerts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_smsalerts (
    id character varying(36),
    source character varying(20),
    transtype character varying(36),
    name character varying(60),
    designation character varying(50),
    email character varying(50),
    enddate timestamp without time zone,
    adddate timestamp without time zone,
    updatedate timestamp without time zone,
    adduserid character varying(36),
    updateuserid character varying(36),
    field1 character varying(50),
    field2 character varying(50),
    field3 character varying(50),
    field4 character varying(50),
    field5 character varying(50),
    mobileno character varying(15),
    companyid character varying(36),
    status character varying(3),
    membershipcardid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.smsalerts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_smsalerts OWNER TO gpadmin;

--
-- TOC entry 1020 (class 1259 OID 21961)
-- Name: pxf_specialities; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_specialities (
    id character varying(36),
    specialitycode character varying(15),
    description character varying(40),
    specialitytype character varying(8),
    disciplineid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.specialities?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_specialities OWNER TO gpadmin;

--
-- TOC entry 1021 (class 1259 OID 21964)
-- Name: pxf_states; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_states (
    id character varying(36),
    statecode character varying(4),
    description character varying(40),
    status character varying(3),
    companyid character varying(36),
    countryid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.states?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_states OWNER TO gpadmin;

--
-- TOC entry 1022 (class 1259 OID 21967)
-- Name: pxf_stdcode; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stdcode (
    tablename character varying(50),
    "id-table" character varying(36),
    "old-code" character varying(50),
    "old-desc" character varying(100),
    "new-code" character varying(50),
    "new-desc" character varying(100),
    remark character varying(50),
    type character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.stdcode?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stdcode OWNER TO gpadmin;

--
-- TOC entry 1023 (class 1259 OID 21970)
-- Name: pxf_stockcountbatchs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountbatchs (
    id character varying(15),
    batchno integer,
    fiscalyearid character varying(36),
    periodid character varying(36),
    startdate date,
    enddate date,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.stockcountbatchs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountbatchs OWNER TO gpadmin;

--
-- TOC entry 1024 (class 1259 OID 21973)
-- Name: pxf_stockcountdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountdetails (
    id integer,
    headerid character varying(20),
    linenum integer,
    companyid character varying(36),
    productid character varying(36),
    uomid character varying(36),
    unitcost numeric(18,4),
    stkdate timestamp without time zone,
    phyqty integer,
    thyqty integer,
    dspqty integer,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.stockcountdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountdetails OWNER TO gpadmin;

--
-- TOC entry 1025 (class 1259 OID 21976)
-- Name: pxf_stockcountheaders; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountheaders (
    id character varying(20),
    companyid character varying(36),
    docno integer,
    departmentid character varying(36),
    respersonid character varying(36),
    remarks character varying(250),
    recstatus character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    racknofr character varying(8),
    racknoto character varying(8),
    itemfr character varying(8),
    itemto character varying(8),
    batchid character varying(15),
    freezeuserid character varying(36),
    freezedate timestamp without time zone,
    confirmeddate timestamp without time zone,
    confirmeduserid character varying(36),
    posteddate timestamp without time zone,
    posteduserid character varying(36),
    physicalvalue numeric(18,0),
    systemvalue numeric(18,0)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.stockcountheaders?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcountheaders OWNER TO gpadmin;

--
-- TOC entry 1026 (class 1259 OID 21979)
-- Name: pxf_stockcounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcounts (
    id character varying(36),
    stockcountdetailid integer,
    departmentid character varying(36),
    productid character varying(36),
    physicalquantity numeric(18,8),
    systemquantity numeric(18,8),
    counttime timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.stockcounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_stockcounts OWNER TO gpadmin;

--
-- TOC entry 1027 (class 1259 OID 21982)
-- Name: pxf_supplierbonusitems; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierbonusitems (
    id character varying(36),
    pricesourceid character varying(36),
    supplierproductid character varying(36),
    productid character varying(36),
    uomid character varying(36),
    lineno integer,
    bonusqty numeric(18,8),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    bonussuppitemcode character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.supplierbonusitems?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierbonusitems OWNER TO gpadmin;

--
-- TOC entry 1028 (class 1259 OID 21985)
-- Name: pxf_supplierdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierdetails (
    id character varying(36),
    appoperationid character varying(36),
    supplierid character varying(36),
    pvalue1 character varying(100),
    pvalue2 character varying(100),
    pvalue3 character varying(100),
    pvalue4 character varying(100),
    pvalue5 character varying(100),
    effectivedate timestamp without time zone,
    licno character varying(50),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.supplierdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierdetails OWNER TO gpadmin;

--
-- TOC entry 1029 (class 1259 OID 21988)
-- Name: pxf_suppliergroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliergroups (
    id character varying(36),
    groupcode character varying(4),
    description character varying(80),
    costcenterid character varying(36),
    glaccountid character varying(36),
    advcostcenterid character varying(36),
    advglaccountid character varying(36),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.suppliergroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliergroups OWNER TO gpadmin;

--
-- TOC entry 1030 (class 1259 OID 21991)
-- Name: pxf_supplierproducts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierproducts (
    id character varying(36),
    supplierid character varying(36),
    productid character varying(36),
    code character varying(50),
    rank integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean,
    lineno integer,
    pricecodeid character varying(36),
    uomcodeid character varying(36),
    orderquantity numeric(19,8),
    unitprice numeric(20,8),
    percentagediscount numeric(5,2),
    amountdiscount numeric(21,8),
    amounttax numeric(21,8),
    percentagetax numeric(5,2),
    expiredate timestamp without time zone,
    suppitemcode character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.supplierproducts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_supplierproducts OWNER TO gpadmin;

--
-- TOC entry 1031 (class 1259 OID 21994)
-- Name: pxf_suppliers; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliers (
    id character varying(36),
    suppliercode character varying(20),
    suppliergroupid character varying(36),
    name character varying(100),
    contactperson character varying(100),
    address1 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    address4 character varying(255),
    telephonenumber character varying(40),
    faxnumber character varying(40),
    termothers integer,
    termnondisp integer,
    termdisp integer,
    costcenterid character varying(36),
    glaccountid character varying(36),
    bankid character varying(36),
    supplierbankaccount character(20),
    outstandingamount numeric(19,8),
    companyaccountno character varying(20),
    depamt numeric(19,8),
    miscamt numeric(19,8),
    supplygoods boolean,
    advancecostcenterid character varying(36),
    advanceglaccountid character varying(36),
    misc numeric(19,8),
    remarks character varying(250),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    telephonenumber2 character varying(40),
    mobilenumber character varying(40),
    email character varying(300),
    gstno character varying(20),
    prevosamt numeric(19,8),
    compregno character varying(36),
    suppbranch character varying(100)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.suppliers?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliers OWNER TO gpadmin;

--
-- TOC entry 1032 (class 1259 OID 21997)
-- Name: pxf_suppliers_tmpdu; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliers_tmpdu (
    id character varying(36),
    suppcode character varying(255),
    suppgroup character varying(255),
    name character varying(255),
    contpers character varying(255),
    addr1 character varying(255),
    addr2 character varying(255),
    addr3 character varying(255),
    addr4 character varying(255),
    telno character varying(255),
    faxno character varying(255),
    termothers double precision,
    termnondisp double precision,
    termdisp double precision,
    costcode character varying(36),
    glaccno character varying(36),
    outamt double precision,
    accno character varying(255),
    depamt double precision,
    miscamt double precision,
    suppflg boolean,
    advccode character varying(36),
    advglaccno character varying(36),
    misc double precision,
    stat character varying(3),
    compcode character varying(36),
    noteex boolean,
    adduser character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.suppliers_tmpdu?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_suppliers_tmpdu OWNER TO gpadmin;

--
-- TOC entry 1033 (class 1259 OID 22000)
-- Name: pxf_surgeryprocedures; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_surgeryprocedures (
    id character varying(36),
    companyid character varying(36),
    procedurecode character varying(30),
    description character varying(50),
    pasantage numeric(5,2),
    showinlist boolean,
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    mmatypeid character varying(36),
    sequence integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.surgeryprocedures?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_surgeryprocedures OWNER TO gpadmin;

--
-- TOC entry 1034 (class 1259 OID 22003)
-- Name: pxf_swabcounts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_swabcounts (
    id character varying(36),
    swaptypeid character varying(36),
    episodematernityid character varying(36),
    initialcount numeric(18,2),
    addon numeric(18,2),
    finalcount numeric(18,2),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.swabcounts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_swabcounts OWNER TO gpadmin;

--
-- TOC entry 1035 (class 1259 OID 22006)
-- Name: pxf_swabtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_swabtypes (
    id character varying(36),
    swabcode character varying(20),
    description character varying(30),
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.swabtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_swabtypes OWNER TO gpadmin;

--
-- TOC entry 1036 (class 1259 OID 22009)
-- Name: pxf_systemparameters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_systemparameters (
    id character varying(36),
    source character varying(8),
    paramtype character varying(8),
    description character varying(40),
    pvalue1 character varying(10),
    pvalue2 character varying(20),
    pvalue3 character varying(10),
    pvalue4 character varying(20),
    pvalue5 character varying(20),
    comment character varying(40),
    effectivedate timestamp without time zone,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.systemparameters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_systemparameters OWNER TO gpadmin;

--
-- TOC entry 1037 (class 1259 OID 22012)
-- Name: pxf_systemparams; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_systemparams (
    id character varying(36),
    systemparamcode character varying(40),
    paramsourceid character varying(36),
    paramgroupid character varying(36),
    transtypeid character varying(36),
    description character varying(255),
    value1 character varying(255),
    value1type character varying(40),
    value2 character varying(255),
    value2type character varying(40),
    valueisrange boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    longtext character varying(4000)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.systemparams?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_systemparams OWNER TO gpadmin;

--
-- TOC entry 1044 (class 1259 OID 22033)
-- Name: pxf_taxdetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxdetails (
    id character varying(36),
    companyid character varying(36),
    taxmasterid character varying(36),
    rate numeric(18,8),
    effectivedate timestamp without time zone,
    formula character varying(300),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.taxdetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxdetails OWNER TO gpadmin;

--
-- TOC entry 1045 (class 1259 OID 22036)
-- Name: pxf_taxmasters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxmasters (
    id character varying(36),
    companyid character varying(36),
    taxcode character varying(15),
    description character varying,
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    taxtype character varying(16)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.taxmasters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxmasters OWNER TO gpadmin;

--
-- TOC entry 1046 (class 1259 OID 22039)
-- Name: pxf_taxtransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxtransactions (
    id character varying(36),
    taxmasterid character varying(36),
    transtypeid character varying(36),
    paramsourceid character varying(36),
    line integer,
    transdate timestamp without time zone,
    amount numeric(21,8),
    taxamount numeric(21,8),
    customerid character varying(36),
    itemid character varying(36),
    description character varying(100),
    nvc1 character varying(255),
    nvc2 character varying(255),
    nvc3 character varying(255),
    nvc4 character varying(255),
    nvc5 character varying(255),
    nvc6 character varying(255),
    auditno bigint,
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    taxdetailid character varying(36),
    refid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.taxtransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_taxtransactions OWNER TO gpadmin;

--
-- TOC entry 1053 (class 1259 OID 22060)
-- Name: pxf_temp_bankinregisters; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_bankinregisters (
    id character varying(36),
    paymodeid character varying(36),
    reference character varying(255),
    documentno character varying(24),
    documentdate timestamp without time zone,
    amount numeric(18,2),
    commamount numeric(18,2),
    taxamount numeric(18,2),
    status character varying(4),
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    companyid character varying(36),
    reportid character varying(3),
    reftype character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_bankinregisters?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_bankinregisters OWNER TO gpadmin;

--
-- TOC entry 1054 (class 1259 OID 22063)
-- Name: pxf_temp_budget; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_budget (
    id character varying(36),
    glaccountcostcodeid character varying(36),
    costcenter character varying(36),
    costcenterdesc character varying(100),
    glaccount character varying(36),
    glaccountdesc character varying(100),
    glaccounttype character varying(36),
    period integer,
    fiscalyear integer,
    actamount numeric(21,8),
    budgetamount numeric(21,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_budget?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_budget OWNER TO gpadmin;

--
-- TOC entry 1055 (class 1259 OID 22066)
-- Name: pxf_temp_budgetload; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_budgetload (
    id character varying(36),
    costcenter character varying(36),
    costcenterdesc character varying(100),
    glaccount character varying(36),
    glaccounttype character varying(36),
    glaccountdesc character varying(100),
    actamount numeric(21,8),
    budgetamount numeric(21,8),
    budgetjan numeric(21,8),
    budgetfeb numeric(21,8),
    budgetmac numeric(21,8),
    budgetapril numeric(21,8),
    budgetmei numeric(21,8),
    budgetjun numeric(21,8),
    budgetjuly numeric(21,8),
    budgetaug numeric(21,8),
    budgetsep numeric(21,8),
    budgetoct numeric(21,8),
    budgetnov numeric(21,8),
    budgetdec numeric(21,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_budgetload?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_budgetload OWNER TO gpadmin;

--
-- TOC entry 1038 (class 1259 OID 22015)
-- Name: pxf_temp_klang_patient; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_klang_patient (
    patientid character varying(36),
    mrnnumber integer
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_klang_patient?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_klang_patient OWNER TO gpadmin;

--
-- TOC entry 1079 (class 1259 OID 22138)
-- Name: pxf_temp_klang_prog_pat; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_klang_prog_pat (
    patientid character varying(36),
    conv_patientid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_klang_prog_pat?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_klang_prog_pat OWNER TO gpadmin;

--
-- TOC entry 1056 (class 1259 OID 22069)
-- Name: pxf_temp_paymentsubmission; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_paymentsubmission (
    id character varying(36),
    payto character varying(36),
    source character varying(36),
    trantype character varying(36),
    auditno integer,
    bankcode character varying(36),
    entrydate timestamp without time zone,
    recdate timestamp without time zone,
    amount numeric(21,8),
    stat character varying(2),
    batchno character varying(36),
    chequeno character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_paymentsubmission?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_paymentsubmission OWNER TO gpadmin;

--
-- TOC entry 1057 (class 1259 OID 22072)
-- Name: pxf_temp_summaryin; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_summaryin (
    audino integer,
    ageinga numeric(18,2),
    ageingd numeric(18,2),
    gltransa numeric(18,2),
    gltransd numeric(18,2),
    variance character varying(50),
    statuses character varying(50)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.temp_summaryin?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_temp_summaryin OWNER TO gpadmin;

--
-- TOC entry 1047 (class 1259 OID 22042)
-- Name: pxf_tempbeds; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempbeds (
    ward character varying(255),
    room character varying(255),
    "bed no" character varying(255),
    "bed type" character varying(255),
    "charge code" character varying(255)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempbeds?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempbeds OWNER TO gpadmin;

--
-- TOC entry 1048 (class 1259 OID 22045)
-- Name: pxf_tempicd1; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd1 (
    icdcode character varying(255),
    lastupdate timestamp without time zone,
    description character varying,
    lowage double precision,
    highage double precision,
    coderest double precision,
    sex double precision,
    area double precision,
    ageflag double precision,
    extra character varying(255),
    deactivedate character varying(255),
    type character varying(255),
    soundex character varying(255),
    icdgrp character varying(255),
    descsdx character varying(255)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempicd1?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd1 OWNER TO gpadmin;

--
-- TOC entry 1049 (class 1259 OID 22048)
-- Name: pxf_tempicd2; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd2 (
    f1 character varying(255)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempicd2?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd2 OWNER TO gpadmin;

--
-- TOC entry 1050 (class 1259 OID 22051)
-- Name: pxf_tempicd3; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd3 (
    f1 character varying(255)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempicd3?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempicd3 OWNER TO gpadmin;

--
-- TOC entry 1051 (class 1259 OID 22054)
-- Name: pxf_tempsloc; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempsloc (
    deptcode character varying(255),
    itemcode double precision,
    uomcode character varying(255),
    factor double precision,
    qtyonhand double precision,
    "average cost" double precision,
    value double precision
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempsloc?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempsloc OWNER TO gpadmin;

--
-- TOC entry 1052 (class 1259 OID 22057)
-- Name: pxf_tempuploadhris; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempuploadhris (
    id character varying(36),
    source character varying(36),
    trantype character varying(36),
    reference character varying(250),
    description character varying(500),
    oprtype character varying(1),
    auditno character varying(36),
    amount numeric(21,8),
    draccount character varying(36),
    craccount character varying(36),
    line integer,
    drcostcenter character varying(36),
    crcostcenter character varying(36),
    postdate timestamp without time zone,
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tempuploadhris?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tempuploadhris OWNER TO gpadmin;

--
-- TOC entry 1058 (class 1259 OID 22075)
-- Name: pxf_tilldetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tilldetails (
    id character varying(36),
    tillid character varying(36),
    opencashamt numeric(20,8),
    opencardamt numeric(20,8),
    openchqamt numeric(20,8),
    opendate timestamp without time zone,
    closedate timestamp without time zone,
    cashierid character varying(36),
    cashamt numeric(20,8),
    cardamt numeric(20,8),
    chqamt numeric(20,8),
    companyid character varying(36),
    tillno integer,
    refdcashamt numeric(20,8),
    refdcardamt numeric(20,8),
    refdchqamt numeric(20,8),
    actclosecashbal numeric(20,8),
    actclosecardbal numeric(20,8),
    actclosechqbal numeric(20,8),
    reason character varying(100),
    cnamt numeric(20,8),
    otheramt numeric(20,8),
    isclosed boolean,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tilldetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tilldetails OWNER TO gpadmin;

--
-- TOC entry 1059 (class 1259 OID 22078)
-- Name: pxf_tillregistrations; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tillregistrations (
    id character varying(36),
    tillcode character varying(8),
    description character varying(40),
    defopenamt numeric(20,8),
    departmentid character varying(36),
    effectivedate timestamp without time zone,
    tillstatus character varying(10),
    lastrcptnumber integer,
    lastrefundno integer,
    lastcrnoteno integer,
    status character varying(3),
    companyid character varying(36),
    lastuserid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tillregistrations?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tillregistrations OWNER TO gpadmin;

--
-- TOC entry 1060 (class 1259 OID 22081)
-- Name: pxf_titlecodes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_titlecodes (
    id character varying(36),
    titlecode character varying(6),
    description character varying(30),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.titlecodes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_titlecodes OWNER TO gpadmin;

--
-- TOC entry 1039 (class 1259 OID 22018)
-- Name: pxf_tmp_chargetransactions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_chargetransactions (
    id character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    episodetypeid character varying(36),
    docref character varying(30),
    chargepriceid character varying(36),
    chargemasterid character varying(36),
    chargegroupid character varying(36),
    transdate timestamp without time zone,
    transtype character varying(2),
    billcode numeric(18,0),
    revcd character varying(4),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    doctorid character varying(36),
    unitprice numeric(21,8),
    quantity numeric(21,8),
    amount numeric(21,8),
    taxamount numeric(21,8),
    uomid character varying(36),
    billtypemasterid character varying(36),
    qstat character varying(1),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocess boolean,
    billno numeric(18,0),
    auditno numeric(18,0),
    departmentid character varying(36),
    reqdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(30),
    resulttype character varying(4),
    resultstatus numeric(18,0),
    inventory boolean,
    updinv numeric(18,0),
    invbatch numeric(18,0),
    doscode character varying(5),
    duration numeric(18,0),
    instructionid character varying(36),
    discountamount numeric(21,8),
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    frequencyid character varying(36),
    ftxtdosage character varying(255),
    dosageid character varying(36),
    addinstructions character varying(255),
    debtormasterid character varying(36),
    payername character varying(40),
    invgroup character varying(2),
    chargeclassid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_chargetransactions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_chargetransactions OWNER TO gpadmin;

--
-- TOC entry 1040 (class 1259 OID 22021)
-- Name: pxf_tmp_dietsummaries; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_dietsummaries (
    id bigint,
    usersessionid character varying(36),
    episodeid character varying(36),
    episodedietid character varying(36),
    bedallocationid character varying(36),
    bedno character varying(10),
    wardid character varying(36),
    wardcode character varying(50),
    dietid character varying(36),
    episodedietstatus character varying(10),
    dietcode character varying(10),
    dietdescription character varying(36),
    remarks character varying(225),
    isbreakfirst boolean,
    islunch boolean,
    isdinner boolean,
    isnutrition boolean,
    companyid character varying(36),
    orderheaderid character varying(36),
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_dietsummaries?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_dietsummaries OWNER TO gpadmin;

--
-- TOC entry 1041 (class 1259 OID 22024)
-- Name: pxf_tmp_dietsummarieswithmealshifts; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_dietsummarieswithmealshifts (
    id bigint,
    usersessionid character varying(36),
    episodeid character varying(36),
    episodedietid character varying(36),
    bedallocationid character varying(36),
    bedno character varying(10),
    wardid character varying(36),
    wardcode character varying(50),
    dietid character varying(36),
    episodedietstatus character varying(10),
    dietcode character varying(10),
    dietdescription character varying(36),
    mealshift character varying(3),
    remarks character varying(225),
    main character varying(750),
    drink character varying(750),
    desert character varying(750),
    companyid character varying(36),
    orderheaderid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_dietsummarieswithmealshifts?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_dietsummarieswithmealshifts OWNER TO gpadmin;

--
-- TOC entry 1042 (class 1259 OID 22027)
-- Name: pxf_tmp_episodenutritions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_episodenutritions (
    id bigint,
    usersessionid character varying(36),
    episodeid character varying(36),
    bedallocationid character varying(36),
    bedno character varying(10),
    wardid character varying(36),
    wardcode character varying(50),
    status character varying(10),
    nutritionname character varying(100),
    charagecode character varying(25),
    remarks character varying(225),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_episodenutritions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_episodenutritions OWNER TO gpadmin;

--
-- TOC entry 1043 (class 1259 OID 22030)
-- Name: pxf_tmp_glinterfaces; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_glinterfaces (
    id character varying(36),
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    reference character varying(250),
    description character varying(100),
    auditno numeric(18,0),
    amount numeric(21,8),
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3),
    sessionid character varying(36),
    updated boolean,
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    oprtype character varying(1)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_glinterfaces?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_glinterfaces OWNER TO gpadmin;

--
-- TOC entry 1062 (class 1259 OID 22087)
-- Name: pxf_tmp_userfunctions; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_userfunctions (
    id character varying(36),
    users_id character varying(36),
    functions_id character varying(36),
    "exclude" boolean,
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean,
    isquickaccess boolean,
    sessionid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmp_userfunctions?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmp_userfunctions OWNER TO gpadmin;

--
-- TOC entry 1061 (class 1259 OID 22084)
-- Name: pxf_tmpchargeprices; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpchargeprices (
    id character varying(36),
    isselect boolean,
    chargemasterid character varying(36),
    chargecode character varying(30),
    chargedescription character varying(150),
    chargegroupid character varying(36),
    chargegroupcode character varying(4),
    chargegroupdescription character varying(40),
    ispricedefined boolean,
    pricedetailid character varying(36),
    biltypeid character varying(36),
    billtypecode character varying(5),
    pricetypeid character varying(36),
    pricetypecode character varying(5),
    uomid character varying(36),
    uomcode character varying(4),
    effectivedate timestamp without time zone,
    price numeric(21,8),
    markupprecentage numeric(18,8),
    discountprecentage numeric(18,8),
    finalprice numeric(21,8),
    panelheaderid character varying(36),
    panelcode character varying(10),
    paneldetailid character varying(36),
    companyid character varying(36),
    sessionid character varying(36),
    ispriceoverwrite boolean,
    discountamount numeric(21,8),
    markupamount numeric(21,8),
    hasdiscountcharge boolean,
    isdiscountcharge boolean,
    discountchargeid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmpchargeprices?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpchargeprices OWNER TO gpadmin;

--
-- TOC entry 1080 (class 1259 OID 22141)
-- Name: pxf_tmpglinterface; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpglinterface (
    compcode character varying(4),
    source character varying(20),
    trantype character varying(16),
    reference character varying(80),
    description character varying(80),
    auditno integer,
    amount numeric(18,0),
    dracc character varying(16),
    cracc character varying(16),
    idno character varying(20),
    lineno integer,
    flag character varying(2),
    oprtype character varying(2),
    lastuser character varying(26),
    lastupdate timestamp without time zone,
    drccode character varying(6),
    crccode character varying(6),
    postdate timestamp without time zone,
    id character varying(36),
    companyid character varying(36),
    sessionid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmpglinterface?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpglinterface OWNER TO gpadmin;

--
-- TOC entry 1081 (class 1259 OID 22144)
-- Name: pxf_tmpglinterface_error; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpglinterface_error (
    compcode character varying(4),
    source character varying(20),
    trantype character varying(16),
    reference character varying(80),
    description character varying(80),
    auditno integer,
    amount numeric(18,0),
    dracc character varying(16),
    cracc character varying(16),
    idno character varying(20),
    lineno integer,
    flag character varying(2),
    oprtype character varying(2),
    lastuser character varying(26),
    lastupdate timestamp without time zone,
    drccode character varying(6),
    crccode character varying(6),
    postdate timestamp without time zone,
    id character varying(36),
    companyid character varying(36),
    sessionid character varying(36),
    errormsg character varying(255)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.tmpglinterface_error?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_tmpglinterface_error OWNER TO gpadmin;

--
-- TOC entry 1063 (class 1259 OID 22090)
-- Name: pxf_trankeys; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_trankeys (
    id character varying(36),
    transtypeid character varying(36),
    departmentid character varying(36),
    keysequence integer,
    backdateduration integer,
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.trankeys?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_trankeys OWNER TO gpadmin;

--
-- TOC entry 1068 (class 1259 OID 22105)
-- Name: pxf_transactionlogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transactionlogs (
    id character varying(36),
    module character varying(100),
    submodule character varying(100),
    tablename character varying(100),
    tablekey character varying(36),
    activitytype character varying(10),
    fields character varying,
    fromvalues character varying,
    tovalues character varying,
    logdatetime timestamp without time zone,
    userid character varying(36),
    companyid character varying(36),
    sessioncontextid character varying(36),
    functionid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.transactionlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transactionlogs OWNER TO gpadmin;

--
-- TOC entry 1064 (class 1259 OID 22093)
-- Name: pxf_transgroups; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transgroups (
    id character varying(36),
    transgroupcode character varying(10),
    transgroupdesc character varying(30),
    companyid character varying(36),
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.transgroups?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transgroups OWNER TO gpadmin;

--
-- TOC entry 1065 (class 1259 OID 22096)
-- Name: pxf_transqueues; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transqueues (
    id character varying(36),
    companyid character varying(36),
    patientid character varying(36),
    episodeid character varying(36),
    episodeprescriptionhdrid character varying(36),
    queueno integer,
    queuestatid character varying(36),
    status character varying(50),
    queuetypeid character varying(36),
    departmentid character varying(36),
    locationid character varying(36),
    highpriority boolean,
    refqueueid character varying(36),
    queuesourceid character varying(36),
    refsourceid character varying(36),
    refsourcetype character varying(10),
    isclosed boolean,
    noteexist boolean,
    updatedate timestamp without time zone,
    updateuserid character varying(36),
    datetimein timestamp without time zone,
    datetimeout timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.transqueues?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transqueues OWNER TO gpadmin;

--
-- TOC entry 1066 (class 1259 OID 22099)
-- Name: pxf_transtitles; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transtitles (
    id character varying(36),
    titleid character varying(36),
    description character varying(30),
    companyid character varying(36),
    languageid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    status character varying(3)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.transtitles?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transtitles OWNER TO gpadmin;

--
-- TOC entry 1067 (class 1259 OID 22102)
-- Name: pxf_transtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transtypes (
    id character varying(36),
    transtype character varying(10),
    description character varying(50),
    transgroupid character varying(36),
    glsubacctypeid character varying(36),
    isdeposittype boolean,
    isinventorytype boolean,
    crdrsign character varying(10),
    isupdatequantity boolean,
    isupdateamount boolean,
    invissuetype character varying(10),
    tranbyinv boolean,
    isupdateproductqty boolean,
    status character varying(3),
    companyid character varying(36),
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.transtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_transtypes OWNER TO gpadmin;

--
-- TOC entry 1069 (class 1259 OID 22108)
-- Name: pxf_uoms; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_uoms (
    id character varying(36),
    uomcode character varying(20),
    description character varying(30),
    convfactor numeric(18,8),
    remarks character varying(255),
    companyid character varying(36),
    status character varying(3),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.uoms?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_uoms OWNER TO gpadmin;

--
-- TOC entry 1070 (class 1259 OID 22111)
-- Name: pxf_usercompanies; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_usercompanies (
    id character varying(36),
    userid character varying(36),
    permissioncompanyid character varying(36),
    isdefaultcompany boolean,
    status character varying(5),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.usercompanies?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_usercompanies OWNER TO gpadmin;

--
-- TOC entry 1071 (class 1259 OID 22114)
-- Name: pxf_userdefinedtypes; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userdefinedtypes (
    id character varying(36),
    typecode character varying(30),
    desctiption character varying(100),
    typekey character varying(10),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.userdefinedtypes?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userdefinedtypes OWNER TO gpadmin;

--
-- TOC entry 1072 (class 1259 OID 22117)
-- Name: pxf_userfunction; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userfunction (
    id character varying(100),
    users_id character varying(36),
    functions_id character varying(36),
    "exclude" boolean,
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean,
    isquickaccess boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.userfunction?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userfunction OWNER TO gpadmin;

--
-- TOC entry 1073 (class 1259 OID 22120)
-- Name: pxf_userlogs; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userlogs (
    id character varying(36),
    userid character varying(36),
    name character varying(80),
    module character varying(80),
    program character varying(80),
    tab character varying(80),
    timein timestamp without time zone,
    date timestamp without time zone,
    appfunctionid character varying(36),
    companyid character varying(36)
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.userlogs?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userlogs OWNER TO gpadmin;

--
-- TOC entry 1074 (class 1259 OID 22123)
-- Name: pxf_useroperation; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_useroperation (
    users_id character varying(36),
    operations_id character varying(36),
    "exclude" boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.useroperation?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_useroperation OWNER TO gpadmin;

--
-- TOC entry 1075 (class 1259 OID 22126)
-- Name: pxf_userprivilegedetails; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userprivilegedetails (
    id character varying(36),
    userprivilegeid character varying(36),
    privilegedetailid character varying(36),
    upperlimit numeric(18,4),
    lowerlimit numeric(18,4),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.userprivilegedetails?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userprivilegedetails OWNER TO gpadmin;

--
-- TOC entry 1076 (class 1259 OID 22129)
-- Name: pxf_userprivileges; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userprivileges (
    id character varying(36),
    privilegeid character varying(36),
    userid character varying(36),
    status character varying(3),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    noteexist boolean
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.userprivileges?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_userprivileges OWNER TO gpadmin;

--
-- TOC entry 1077 (class 1259 OID 22132)
-- Name: pxf_users; Type: EXTERNAL TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_users (
    id character varying(36),
    loginname character varying(30),
    password character varying(30),
    username character varying(50),
    status character varying(3),
    companyid character varying(36),
    loggedin smallint,
    loginattempt smallint,
    employeeid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    currentsessioncontextid character varying(32),
    defaultdepartmentid character varying(36),
    languageid character varying(36),
    designationid character varying(36),
    domainuser character varying(50),
    expirydate timestamp without time zone,
    adduserid character varying(36),
    adddate timestamp without time zone
) LOCATION (
    'pxf://MDMHITS2_KLGSH.dbo.users?PROFILE=Jdbc&SERVER=sqlserver1&QUOTE_COLUMNS=true'
) ON ALL 
FORMAT 'custom' (formatter = 'pxfwritable_import')
ENCODING 'UTF8';


ALTER EXTERNAL TABLE staging_mdmhits2_klgsh.pxf_users OWNER TO gpadmin;

--
-- TOC entry 584 (class 1259 OID 18542)
-- Name: queueentries; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queueentries (
    id character varying(36) NOT NULL,
    queueid character varying(36) NOT NULL,
    queueseq integer,
    queuestatid character varying(36) NOT NULL,
    queuesourceid character varying(36),
    patientid character varying(36) NOT NULL,
    episodeid character varying(36),
    locationid character varying(36),
    episodeprescriptionhdrid character varying(36),
    highpriority boolean NOT NULL,
    refqueueid character varying(36),
    refqueueentryid character varying(36),
    datetimein timestamp without time zone,
    datetimeout timestamp without time zone,
    isclosed boolean NOT NULL,
    tokenno integer,
    chgtranorderrefid character varying(36),
    remarks character varying(250),
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queueentries OWNER TO gpadmin;

--
-- TOC entry 589 (class 1259 OID 18557)
-- Name: queues; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queues (
    id character varying(36) NOT NULL,
    queuetypeid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    name character varying(25) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queues OWNER TO gpadmin;

--
-- TOC entry 585 (class 1259 OID 18545)
-- Name: queuesources; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queuesources (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queuesources OWNER TO gpadmin;

--
-- TOC entry 586 (class 1259 OID 18548)
-- Name: queuestartstats; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queuestartstats (
    id character varying(36) NOT NULL,
    queuesourceid character varying(36) NOT NULL,
    queuetypeid character varying(36) NOT NULL,
    startqueuestatid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queuestartstats OWNER TO gpadmin;

--
-- TOC entry 587 (class 1259 OID 18551)
-- Name: queuestats; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queuestats (
    id character varying(36) NOT NULL,
    queuetypeid character varying(36) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    sequence smallint NOT NULL,
    formname character varying(50) NOT NULL,
    isprocess boolean NOT NULL,
    ismanualprocess boolean NOT NULL,
    isinventoryissue boolean NOT NULL,
    istokenrequired boolean NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queuestats OWNER TO gpadmin;

--
-- TOC entry 588 (class 1259 OID 18554)
-- Name: queuetypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.queuetypes (
    id character varying(36) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    isprosseing boolean NOT NULL,
    istokenrequired boolean NOT NULL,
    isdoctorqueue boolean,
    companyid character varying(36) NOT NULL,
    status character varying(3),
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.queuetypes OWNER TO gpadmin;

--
-- TOC entry 590 (class 1259 OID 18560)
-- Name: races; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.races (
    id character varying(36) NOT NULL,
    code character varying(4) NOT NULL,
    description character varying(40),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL,
    ismalaysian boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.races OWNER TO gpadmin;

--
-- TOC entry 591 (class 1259 OID 18563)
-- Name: reasoncodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.reasoncodes (
    id character varying(36) NOT NULL,
    code character varying(10) NOT NULL,
    description character varying(100) NOT NULL,
    type character varying(2) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    status character varying(3) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.reasoncodes OWNER TO gpadmin;

--
-- TOC entry 592 (class 1259 OID 18566)
-- Name: receiptdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.receiptdetails (
    id character varying(36) NOT NULL,
    bankid character varying(36),
    branchname character varying(75),
    paidamount numeric(21,8) NOT NULL,
    authno character varying(250),
    expiredate timestamp without time zone,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.receiptdetails OWNER TO gpadmin;

--
-- TOC entry 593 (class 1259 OID 18569)
-- Name: relationships; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.relationships (
    id character varying(36) NOT NULL,
    relationshipcode character varying(4) NOT NULL,
    description character varying(30),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.relationships OWNER TO gpadmin;

--
-- TOC entry 594 (class 1259 OID 18572)
-- Name: religions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.religions (
    id character varying(36) NOT NULL,
    code character varying(4) NOT NULL,
    description character varying(40),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.religions OWNER TO gpadmin;

--
-- TOC entry 595 (class 1259 OID 18575)
-- Name: repackitemdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.repackitemdetails (
    id character varying(36) NOT NULL,
    repackitemid character varying(36),
    line integer,
    productid character varying(36),
    quantity numeric(18,8),
    uomid character varying(36),
    netprice numeric(19,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    repackheaderid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.repackitemdetails OWNER TO gpadmin;

--
-- TOC entry 596 (class 1259 OID 18578)
-- Name: repackitems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.repackitems (
    id character varying(36) NOT NULL,
    departmentid character varying(36),
    productid character varying(36) NOT NULL,
    uomid character varying(36),
    description character varying(80),
    quantity numeric(18,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    expdate timestamp without time zone,
    line integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.repackitems OWNER TO gpadmin;

--
-- TOC entry 597 (class 1259 OID 18581)
-- Name: repacktransdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.repacktransdetails (
    id character varying(36) NOT NULL,
    repackheaderid character varying(36),
    line integer,
    productid character varying(36),
    quantity numeric(18,8),
    uomid character varying(36),
    netprice numeric(21,8),
    amount numeric(21,8),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.repacktransdetails OWNER TO gpadmin;

--
-- TOC entry 598 (class 1259 OID 18584)
-- Name: repacktransheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.repacktransheaders (
    id character varying(36) NOT NULL,
    repackitemid character varying(36),
    uomid character varying(36),
    documentnum character varying(10),
    departmentid character varying(36) NOT NULL,
    transdate timestamp without time zone NOT NULL,
    productid character varying(36) NOT NULL,
    userdefinedtypeid character varying(36) NOT NULL,
    description character varying(80),
    quantity numeric(18,8),
    repackpersonid character varying(36),
    expirydate timestamp without time zone,
    remarks character varying(255),
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    avgcost numeric(18,4),
    amount numeric(18,4)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.repacktransheaders OWNER TO gpadmin;

--
-- TOC entry 599 (class 1259 OID 18587)
-- Name: reporttypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.reporttypes (
    id character varying(36) NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    updatedate character varying(36),
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.reporttypes OWNER TO gpadmin;

--
-- TOC entry 601 (class 1259 OID 18593)
-- Name: rooms; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.rooms (
    id character varying(36) NOT NULL,
    roomtypeid character varying(36) NOT NULL,
    roomno character varying(10) NOT NULL,
    roomname character varying(30),
    height numeric(18,0),
    width numeric(18,0),
    leftposition integer,
    topposition integer,
    bedorientation character varying(1),
    description character varying(100),
    iswarddefault boolean NOT NULL,
    wardid character varying(36),
    companyid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.rooms OWNER TO gpadmin;

--
-- TOC entry 600 (class 1259 OID 18590)
-- Name: roomtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.roomtypes (
    id character varying(36) NOT NULL,
    roomtypecode character varying(30) NOT NULL,
    description character varying(100),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.roomtypes OWNER TO gpadmin;

--
-- TOC entry 607 (class 1259 OID 18611)
-- Name: searchoptions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.searchoptions (
    id character varying(36) NOT NULL,
    object character varying(75) NOT NULL,
    name character varying(30),
    description character varying(40),
    query character varying(500),
    queryvalues character varying(500),
    defaultquery boolean NOT NULL,
    status character varying(50) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.searchoptions OWNER TO gpadmin;

--
-- TOC entry 608 (class 1259 OID 18614)
-- Name: searchproperties; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.searchproperties (
    id character varying(36) NOT NULL,
    objname character varying(75) NOT NULL,
    propname character varying(75) NOT NULL,
    proptype character varying(10),
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.searchproperties OWNER TO gpadmin;

--
-- TOC entry 609 (class 1259 OID 18617)
-- Name: sequences; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.sequences (
    id character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL,
    prefix character varying(10),
    nextkey bigint NOT NULL,
    departmentid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    backdays integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.sequences OWNER TO gpadmin;

--
-- TOC entry 610 (class 1259 OID 18620)
-- Name: sessioncontexts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.sessioncontexts (
    id character varying(36) NOT NULL,
    sessioncode character varying(36) NOT NULL,
    starttime timestamp without time zone NOT NULL,
    endtime timestamp without time zone NOT NULL,
    lastaccesstime timestamp without time zone NOT NULL,
    status character varying(36) NOT NULL,
    userid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.sessioncontexts OWNER TO gpadmin;

--
-- TOC entry 669 (class 1259 OID 18818)
-- Name: sloc; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.sloc (
    sl_dept character varying(255),
    product_id double precision,
    conversion_factor double precision,
    stockloc_qtyonhand double precision,
    "stockloc_loose_ qtyonhand" double precision,
    product_avgcost double precision
)
 DISTRIBUTED BY (sl_dept);


ALTER TABLE staging_mdmhits2_klgsh.sloc OWNER TO gpadmin;

--
-- TOC entry 602 (class 1259 OID 18596)
-- Name: slocvsprod; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.slocvsprod (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    "stockloc_qtyonhand * product_avgcost * conversion_factor" character varying(50),
    product_description character varying(50)
)
 DISTRIBUTED BY (sl_dept);


ALTER TABLE staging_mdmhits2_klgsh.slocvsprod OWNER TO gpadmin;

--
-- TOC entry 603 (class 1259 OID 18599)
-- Name: slocvsprod1; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.slocvsprod1 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    "stockloc_qtyonhand * product_avgcost * conversion_factor" character varying(50),
    product_description character varying(50)
)
 DISTRIBUTED BY (sl_dept);


ALTER TABLE staging_mdmhits2_klgsh.slocvsprod1 OWNER TO gpadmin;

--
-- TOC entry 604 (class 1259 OID 18602)
-- Name: slocvsprod3; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.slocvsprod3 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    stockvalue character varying(50)
)
 DISTRIBUTED BY (sl_dept);


ALTER TABLE staging_mdmhits2_klgsh.slocvsprod3 OWNER TO gpadmin;

--
-- TOC entry 605 (class 1259 OID 18605)
-- Name: slocvsprod4; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.slocvsprod4 (
    sl_dept character varying(50),
    product_id character varying(50),
    conversion_factor character varying(50),
    stockloc_qtyonhand character varying(50),
    "stockloc_loose_ qtyonhand" character varying(50),
    product_avgcost character varying(50),
    stockvalue character varying(50)
)
 DISTRIBUTED BY (sl_dept);


ALTER TABLE staging_mdmhits2_klgsh.slocvsprod4 OWNER TO gpadmin;

--
-- TOC entry 606 (class 1259 OID 18608)
-- Name: smsalerts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.smsalerts (
    id character varying(36) NOT NULL,
    source character varying(20) NOT NULL,
    transtype character varying(36) NOT NULL,
    name character varying(60) NOT NULL,
    designation character varying(50),
    email character varying(50),
    enddate timestamp without time zone,
    adddate timestamp without time zone NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    adduserid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    field1 character varying(50),
    field2 character varying(50),
    field3 character varying(50),
    field4 character varying(50),
    field5 character varying(50),
    mobileno character varying(15) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    membershipcardid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.smsalerts OWNER TO gpadmin;

--
-- TOC entry 611 (class 1259 OID 18623)
-- Name: specialities; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.specialities (
    id character varying(36) NOT NULL,
    specialitycode character varying(15) NOT NULL,
    description character varying(40),
    specialitytype character varying(8),
    disciplineid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.specialities OWNER TO gpadmin;

--
-- TOC entry 612 (class 1259 OID 18626)
-- Name: states; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.states (
    id character varying(36) NOT NULL,
    statecode character varying(4) NOT NULL,
    description character varying(40),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    countryid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.states OWNER TO gpadmin;

--
-- TOC entry 613 (class 1259 OID 18629)
-- Name: stdcode; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.stdcode (
    tablename character varying(50) NOT NULL,
    "id-table" character varying(36),
    "old-code" character varying(50),
    "old-desc" character varying(100),
    "new-code" character varying(50),
    "new-desc" character varying(100),
    remark character varying(50),
    type character varying(100)
)
 DISTRIBUTED BY (tablename);


ALTER TABLE staging_mdmhits2_klgsh.stdcode OWNER TO gpadmin;

--
-- TOC entry 614 (class 1259 OID 18632)
-- Name: stockcountbatchs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.stockcountbatchs (
    id character varying(15) NOT NULL,
    batchno integer NOT NULL,
    fiscalyearid character varying(36) NOT NULL,
    periodid character varying(36) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.stockcountbatchs OWNER TO gpadmin;

--
-- TOC entry 615 (class 1259 OID 18635)
-- Name: stockcountdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.stockcountdetails (
    id integer NOT NULL,
    headerid character varying(20) NOT NULL,
    linenum integer NOT NULL,
    companyid character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    uomid character varying(36) NOT NULL,
    unitcost numeric(18,4) NOT NULL,
    stkdate timestamp without time zone NOT NULL,
    phyqty integer NOT NULL,
    thyqty integer NOT NULL,
    dspqty integer,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.stockcountdetails OWNER TO gpadmin;

--
-- TOC entry 616 (class 1259 OID 18638)
-- Name: stockcountheaders; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.stockcountheaders (
    id character varying(20) NOT NULL,
    companyid character varying(36) NOT NULL,
    docno integer,
    departmentid character varying(36),
    respersonid character varying(36),
    remarks character varying(250),
    recstatus character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone,
    racknofr character varying(8),
    racknoto character varying(8),
    itemfr character varying(8),
    itemto character varying(8),
    batchid character varying(15),
    freezeuserid character varying(36),
    freezedate timestamp without time zone,
    confirmeddate timestamp without time zone,
    confirmeduserid character varying(36),
    posteddate timestamp without time zone,
    posteduserid character varying(36),
    physicalvalue numeric(18,0),
    systemvalue numeric(18,0)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.stockcountheaders OWNER TO gpadmin;

--
-- TOC entry 617 (class 1259 OID 18641)
-- Name: stockcounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.stockcounts (
    id character varying(36) NOT NULL,
    stockcountdetailid integer,
    departmentid character varying(36),
    productid character varying(36),
    physicalquantity numeric(18,8),
    systemquantity numeric(18,8),
    counttime timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.stockcounts OWNER TO gpadmin;

--
-- TOC entry 618 (class 1259 OID 18644)
-- Name: supplierbonusitems; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.supplierbonusitems (
    id character varying(36) NOT NULL,
    pricesourceid character varying(36) NOT NULL,
    supplierproductid character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    uomid character varying(36) NOT NULL,
    lineno integer NOT NULL,
    bonusqty numeric(18,8) NOT NULL,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    bonussuppitemcode character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.supplierbonusitems OWNER TO gpadmin;

--
-- TOC entry 619 (class 1259 OID 18647)
-- Name: supplierdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.supplierdetails (
    id character varying(36) NOT NULL,
    appoperationid character varying(36),
    supplierid character varying(36),
    pvalue1 character varying(100),
    pvalue2 character varying(100),
    pvalue3 character varying(100),
    pvalue4 character varying(100),
    pvalue5 character varying(100),
    effectivedate timestamp without time zone,
    licno character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.supplierdetails OWNER TO gpadmin;

--
-- TOC entry 620 (class 1259 OID 18650)
-- Name: suppliergroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.suppliergroups (
    id character varying(36) NOT NULL,
    groupcode character varying(4),
    description character varying(80),
    costcenterid character varying(36),
    glaccountid character varying(36),
    advcostcenterid character varying(36),
    advglaccountid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.suppliergroups OWNER TO gpadmin;

--
-- TOC entry 621 (class 1259 OID 18653)
-- Name: supplierproducts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.supplierproducts (
    id character varying(36) NOT NULL,
    supplierid character varying(36) NOT NULL,
    productid character varying(36) NOT NULL,
    code character varying(50),
    rank integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean,
    lineno integer,
    pricecodeid character varying(36),
    uomcodeid character varying(36),
    orderquantity numeric(19,8),
    unitprice numeric(20,8),
    percentagediscount numeric(5,2),
    amountdiscount numeric(21,8),
    amounttax numeric(21,8),
    percentagetax numeric(5,2),
    expiredate timestamp without time zone,
    suppitemcode character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.supplierproducts OWNER TO gpadmin;

--
-- TOC entry 622 (class 1259 OID 18656)
-- Name: suppliers; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.suppliers (
    id character varying(36) NOT NULL,
    suppliercode character varying(20),
    suppliergroupid character varying(36),
    name character varying(100),
    contactperson character varying(100),
    address1 character varying(255),
    address2 character varying(255),
    address3 character varying(255),
    address4 character varying(255),
    telephonenumber character varying(40),
    faxnumber character varying(40),
    termothers integer,
    termnondisp integer,
    termdisp integer,
    costcenterid character varying(36),
    glaccountid character varying(36),
    bankid character varying(36),
    supplierbankaccount character(20),
    outstandingamount numeric(19,8),
    companyaccountno character varying(20),
    depamt numeric(19,8),
    miscamt numeric(19,8),
    supplygoods boolean,
    advancecostcenterid character varying(36),
    advanceglaccountid character varying(36),
    misc numeric(19,8),
    remarks character varying(250),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    telephonenumber2 character varying(40),
    mobilenumber character varying(40),
    email character varying(300),
    gstno character varying(20),
    prevosamt numeric(19,8),
    compregno character varying(36),
    suppbranch character varying(100)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.suppliers OWNER TO gpadmin;

--
-- TOC entry 623 (class 1259 OID 18662)
-- Name: suppliers_tmpdu; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.suppliers_tmpdu (
    id character varying(36),
    suppcode character varying(255),
    suppgroup character varying(255),
    name character varying(255),
    contpers character varying(255),
    addr1 character varying(255),
    addr2 character varying(255),
    addr3 character varying(255),
    addr4 character varying(255),
    telno character varying(255),
    faxno character varying(255),
    termothers double precision,
    termnondisp double precision,
    termdisp double precision,
    costcode character varying(36),
    glaccno character varying(36),
    outamt double precision,
    accno character varying(255),
    depamt double precision,
    miscamt double precision,
    suppflg boolean,
    advccode character varying(36),
    advglaccno character varying(36),
    misc double precision,
    stat character varying(3),
    compcode character varying(36),
    noteex boolean,
    adduser character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.suppliers_tmpdu OWNER TO gpadmin;

--
-- TOC entry 624 (class 1259 OID 18668)
-- Name: surgeryprocedures; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.surgeryprocedures (
    id character varying(36) NOT NULL,
    companyid character varying(36),
    procedurecode character varying(30) NOT NULL,
    description character varying(50),
    pasantage numeric(5,2),
    showinlist boolean,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    mmatypeid character varying(36),
    sequence integer
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.surgeryprocedures OWNER TO gpadmin;

--
-- TOC entry 625 (class 1259 OID 18671)
-- Name: swabcounts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.swabcounts (
    id character varying(36) NOT NULL,
    swaptypeid character varying(36) NOT NULL,
    episodematernityid character varying(36) NOT NULL,
    initialcount numeric(18,2) NOT NULL,
    addon numeric(18,2) NOT NULL,
    finalcount numeric(18,2) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.swabcounts OWNER TO gpadmin;

--
-- TOC entry 626 (class 1259 OID 18674)
-- Name: swabtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.swabtypes (
    id character varying(36) NOT NULL,
    swabcode character varying(20) NOT NULL,
    description character varying(30),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.swabtypes OWNER TO gpadmin;

--
-- TOC entry 627 (class 1259 OID 18677)
-- Name: systemparameters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.systemparameters (
    id character varying(36) NOT NULL,
    source character varying(8) NOT NULL,
    paramtype character varying(8) NOT NULL,
    description character varying(40),
    pvalue1 character varying(10),
    pvalue2 character varying(20),
    pvalue3 character varying(10),
    pvalue4 character varying(20),
    pvalue5 character varying(20),
    comment character varying(40),
    effectivedate timestamp without time zone,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.systemparameters OWNER TO gpadmin;

--
-- TOC entry 628 (class 1259 OID 18680)
-- Name: systemparams; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.systemparams (
    id character varying(36) NOT NULL,
    systemparamcode character varying(40) NOT NULL,
    paramsourceid character varying(36),
    paramgroupid character varying(36),
    transtypeid character varying(36),
    description character varying(255),
    value1 character varying(255),
    value1type character varying(40),
    value2 character varying(255),
    value2type character varying(40),
    valueisrange boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    longtext character varying(4000)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.systemparams OWNER TO gpadmin;

--
-- TOC entry 635 (class 1259 OID 18707)
-- Name: taxdetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.taxdetails (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    taxmasterid character varying(36) NOT NULL,
    rate numeric(18,8) NOT NULL,
    effectivedate timestamp without time zone NOT NULL,
    formula character varying(300),
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.taxdetails OWNER TO gpadmin;

--
-- TOC entry 636 (class 1259 OID 18710)
-- Name: taxmasters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.taxmasters (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    taxcode character varying(15) NOT NULL,
    description character varying,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    taxtype character varying(16)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.taxmasters OWNER TO gpadmin;

--
-- TOC entry 637 (class 1259 OID 18716)
-- Name: taxtransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.taxtransactions (
    id character varying(36) NOT NULL,
    taxmasterid character varying(36),
    transtypeid character varying(36),
    paramsourceid character varying(36),
    line integer,
    transdate timestamp without time zone,
    amount numeric(21,8),
    taxamount numeric(21,8),
    customerid character varying(36),
    itemid character varying(36),
    description character varying(100),
    nvc1 character varying(255),
    nvc2 character varying(255),
    nvc3 character varying(255),
    nvc4 character varying(255),
    nvc5 character varying(255),
    nvc6 character varying(255),
    auditno bigint,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    taxdetailid character varying(36),
    refid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.taxtransactions OWNER TO gpadmin;

--
-- TOC entry 644 (class 1259 OID 18740)
-- Name: temp_bankinregisters; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_bankinregisters (
    id character varying(36) NOT NULL,
    paymodeid character varying(36) NOT NULL,
    reference character varying(255),
    documentno character varying(24),
    documentdate timestamp without time zone,
    amount numeric(18,2),
    commamount numeric(18,2),
    taxamount numeric(18,2),
    status character varying(4) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    reportid character varying(3),
    reftype character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.temp_bankinregisters OWNER TO gpadmin;

--
-- TOC entry 645 (class 1259 OID 18743)
-- Name: temp_budget; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_budget (
    id character varying(36) NOT NULL,
    glaccountcostcodeid character varying(36),
    costcenter character varying(36),
    costcenterdesc character varying(100),
    glaccount character varying(36),
    glaccountdesc character varying(100),
    glaccounttype character varying(36),
    period integer,
    fiscalyear integer,
    actamount numeric(21,8),
    budgetamount numeric(21,8),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.temp_budget OWNER TO gpadmin;

--
-- TOC entry 646 (class 1259 OID 18746)
-- Name: temp_budgetload; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_budgetload (
    id character varying(36) NOT NULL,
    costcenter character varying(36),
    costcenterdesc character varying(100),
    glaccount character varying(36),
    glaccounttype character varying(36),
    glaccountdesc character varying(100),
    actamount numeric(21,8),
    budgetamount numeric(21,8),
    budgetjan numeric(21,8),
    budgetfeb numeric(21,8),
    budgetmac numeric(21,8),
    budgetapril numeric(21,8),
    budgetmei numeric(21,8),
    budgetjun numeric(21,8),
    budgetjuly numeric(21,8),
    budgetaug numeric(21,8),
    budgetsep numeric(21,8),
    budgetoct numeric(21,8),
    budgetnov numeric(21,8),
    budgetdec numeric(21,8),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.temp_budgetload OWNER TO gpadmin;

--
-- TOC entry 629 (class 1259 OID 18686)
-- Name: temp_klang_patient; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_klang_patient (
    patientid character varying(36),
    mrnnumber integer
)
 DISTRIBUTED BY (patientid);


ALTER TABLE staging_mdmhits2_klgsh.temp_klang_patient OWNER TO gpadmin;

--
-- TOC entry 670 (class 1259 OID 18821)
-- Name: temp_klang_prog_pat; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_klang_prog_pat (
    patientid character varying(36),
    conv_patientid character varying(36)
)
 DISTRIBUTED BY (patientid);


ALTER TABLE staging_mdmhits2_klgsh.temp_klang_prog_pat OWNER TO gpadmin;

--
-- TOC entry 647 (class 1259 OID 18749)
-- Name: temp_paymentsubmission; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_paymentsubmission (
    id character varying(36) NOT NULL,
    payto character varying(36),
    source character varying(36),
    trantype character varying(36),
    auditno integer,
    bankcode character varying(36),
    entrydate timestamp without time zone,
    recdate timestamp without time zone,
    amount numeric(21,8),
    stat character varying(2),
    batchno character varying(36),
    chequeno character varying(36),
    companyid character varying(36),
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.temp_paymentsubmission OWNER TO gpadmin;

--
-- TOC entry 648 (class 1259 OID 18752)
-- Name: temp_summaryin; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.temp_summaryin (
    audino integer,
    ageinga numeric(18,2),
    ageingd numeric(18,2),
    gltransa numeric(18,2),
    gltransd numeric(18,2),
    variance character varying(50),
    statuses character varying(50)
)
 DISTRIBUTED BY (audino);


ALTER TABLE staging_mdmhits2_klgsh.temp_summaryin OWNER TO gpadmin;

--
-- TOC entry 638 (class 1259 OID 18719)
-- Name: tempbeds; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempbeds (
    ward character varying(255),
    room character varying(255),
    "bed no" character varying(255),
    "bed type" character varying(255),
    "charge code" character varying(255)
)
 DISTRIBUTED BY (ward);


ALTER TABLE staging_mdmhits2_klgsh.tempbeds OWNER TO gpadmin;

--
-- TOC entry 639 (class 1259 OID 18722)
-- Name: tempicd1; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempicd1 (
    icdcode character varying(255),
    lastupdate timestamp without time zone,
    description character varying,
    lowage double precision,
    highage double precision,
    coderest double precision,
    sex double precision,
    area double precision,
    ageflag double precision,
    extra character varying(255),
    deactivedate character varying(255),
    type character varying(255),
    soundex character varying(255),
    icdgrp character varying(255),
    descsdx character varying(255)
)
 DISTRIBUTED BY (icdcode);


ALTER TABLE staging_mdmhits2_klgsh.tempicd1 OWNER TO gpadmin;

--
-- TOC entry 640 (class 1259 OID 18728)
-- Name: tempicd2; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempicd2 (
    f1 character varying(255)
)
 DISTRIBUTED BY (f1);


ALTER TABLE staging_mdmhits2_klgsh.tempicd2 OWNER TO gpadmin;

--
-- TOC entry 641 (class 1259 OID 18731)
-- Name: tempicd3; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempicd3 (
    f1 character varying(255)
)
 DISTRIBUTED BY (f1);


ALTER TABLE staging_mdmhits2_klgsh.tempicd3 OWNER TO gpadmin;

--
-- TOC entry 642 (class 1259 OID 18734)
-- Name: tempsloc; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempsloc (
    deptcode character varying(255),
    itemcode double precision,
    uomcode character varying(255),
    factor double precision,
    qtyonhand double precision,
    "average cost" double precision,
    value double precision
)
 DISTRIBUTED BY (deptcode);


ALTER TABLE staging_mdmhits2_klgsh.tempsloc OWNER TO gpadmin;

--
-- TOC entry 643 (class 1259 OID 18737)
-- Name: tempuploadhris; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tempuploadhris (
    id character varying(36) NOT NULL,
    source character varying(36) NOT NULL,
    trantype character varying(36) NOT NULL,
    reference character varying(250),
    description character varying(500),
    oprtype character varying(1) NOT NULL,
    auditno character varying(36) NOT NULL,
    amount numeric(21,8) NOT NULL,
    draccount character varying(36) NOT NULL,
    craccount character varying(36) NOT NULL,
    line integer NOT NULL,
    drcostcenter character varying(36) NOT NULL,
    crcostcenter character varying(36) NOT NULL,
    postdate timestamp without time zone NOT NULL,
    companyid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tempuploadhris OWNER TO gpadmin;

--
-- TOC entry 649 (class 1259 OID 18755)
-- Name: tilldetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tilldetails (
    id character varying(36) NOT NULL,
    tillid character varying(36) NOT NULL,
    opencashamt numeric(20,8),
    opencardamt numeric(20,8),
    openchqamt numeric(20,8),
    opendate timestamp without time zone,
    closedate timestamp without time zone,
    cashierid character varying(36),
    cashamt numeric(20,8),
    cardamt numeric(20,8),
    chqamt numeric(20,8),
    companyid character varying(36) NOT NULL,
    tillno integer,
    refdcashamt numeric(20,8),
    refdcardamt numeric(20,8),
    refdchqamt numeric(20,8),
    actclosecashbal numeric(20,8),
    actclosecardbal numeric(20,8),
    actclosechqbal numeric(20,8),
    reason character varying(100),
    cnamt numeric(20,8),
    otheramt numeric(20,8),
    isclosed boolean,
    noteexist boolean,
    updateuserid character varying(36),
    updatedate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tilldetails OWNER TO gpadmin;

--
-- TOC entry 650 (class 1259 OID 18758)
-- Name: tillregistrations; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tillregistrations (
    id character varying(36) NOT NULL,
    tillcode character varying(8) NOT NULL,
    description character varying(40),
    defopenamt numeric(20,8),
    departmentid character varying(36),
    effectivedate timestamp without time zone,
    tillstatus character varying(10),
    lastrcptnumber integer,
    lastrefundno integer,
    lastcrnoteno integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    lastuserid character varying(36),
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tillregistrations OWNER TO gpadmin;

--
-- TOC entry 651 (class 1259 OID 18761)
-- Name: titlecodes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.titlecodes (
    id character varying(36) NOT NULL,
    titlecode character varying(6) NOT NULL,
    description character varying(30),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.titlecodes OWNER TO gpadmin;

--
-- TOC entry 630 (class 1259 OID 18689)
-- Name: tmp_chargetransactions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_chargetransactions (
    id character varying(36) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    episodetypeid character varying(36),
    docref character varying(30),
    chargepriceid character varying(36) NOT NULL,
    chargemasterid character varying(36),
    chargegroupid character varying(36),
    transdate timestamp without time zone,
    transtype character varying(2),
    billcode numeric(18,0),
    revcd character varying(4),
    mmamasterid character varying(36),
    billed boolean,
    billdate timestamp without time zone,
    doctorid character varying(36),
    unitprice numeric(21,8),
    quantity numeric(21,8),
    amount numeric(21,8),
    taxamount numeric(21,8),
    uomid character varying(36),
    billtypemasterid character varying(36),
    qstat character varying(1),
    dracccode character varying(30),
    cracccode character varying(30),
    arprocess boolean,
    billno numeric(18,0),
    auditno numeric(18,0),
    departmentid character varying(36),
    reqdepartmentid character varying(36),
    issuedepartmentid character varying(36),
    invcode character varying(30),
    resulttype character varying(4),
    resultstatus numeric(18,0),
    inventory boolean,
    updinv numeric(18,0),
    invbatch numeric(18,0),
    doscode character varying(5),
    duration numeric(18,0),
    instructionid character varying(36),
    discountamount numeric(21,8),
    discountcode character varying(36),
    packagecode character varying(36),
    remarks character varying(255),
    frequencyid character varying(36),
    ftxtdosage character varying(255),
    dosageid character varying(36),
    addinstructions character varying(255),
    debtormasterid character varying(36),
    payername character varying(40),
    invgroup character varying(2),
    chargeclassid character varying(36),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_chargetransactions OWNER TO gpadmin;

--
-- TOC entry 631 (class 1259 OID 18692)
-- Name: tmp_dietsummaries; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_dietsummaries (
    id bigint NOT NULL,
    usersessionid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodedietid character varying(36) NOT NULL,
    bedallocationid character varying(36) NOT NULL,
    bedno character varying(10) NOT NULL,
    wardid character varying(36) NOT NULL,
    wardcode character varying(50) NOT NULL,
    dietid character varying(36) NOT NULL,
    episodedietstatus character varying(10) NOT NULL,
    dietcode character varying(10) NOT NULL,
    dietdescription character varying(36) NOT NULL,
    remarks character varying(225),
    isbreakfirst boolean NOT NULL,
    islunch boolean NOT NULL,
    isdinner boolean,
    isnutrition boolean NOT NULL,
    companyid character varying(36),
    orderheaderid character varying(36),
    status character varying(3)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_dietsummaries OWNER TO gpadmin;

--
-- TOC entry 632 (class 1259 OID 18695)
-- Name: tmp_dietsummarieswithmealshifts; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_dietsummarieswithmealshifts (
    id bigint NOT NULL,
    usersessionid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    episodedietid character varying(36) NOT NULL,
    bedallocationid character varying(36) NOT NULL,
    bedno character varying(10) NOT NULL,
    wardid character varying(36) NOT NULL,
    wardcode character varying(50) NOT NULL,
    dietid character varying(36) NOT NULL,
    episodedietstatus character varying(10) NOT NULL,
    dietcode character varying(10) NOT NULL,
    dietdescription character varying(36) NOT NULL,
    mealshift character varying(3) NOT NULL,
    remarks character varying(225),
    main character varying(750),
    drink character varying(750),
    desert character varying(750),
    companyid character varying(36),
    orderheaderid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_dietsummarieswithmealshifts OWNER TO gpadmin;

--
-- TOC entry 633 (class 1259 OID 18701)
-- Name: tmp_episodenutritions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_episodenutritions (
    id bigint NOT NULL,
    usersessionid character varying(36) NOT NULL,
    episodeid character varying(36) NOT NULL,
    bedallocationid character varying(36) NOT NULL,
    bedno character varying(10) NOT NULL,
    wardid character varying(36) NOT NULL,
    wardcode character varying(50) NOT NULL,
    status character varying(10) NOT NULL,
    nutritionname character varying(100),
    charagecode character varying(25),
    remarks character varying(225),
    companyid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_episodenutritions OWNER TO gpadmin;

--
-- TOC entry 634 (class 1259 OID 18704)
-- Name: tmp_glinterfaces; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_glinterfaces (
    id character varying(36) NOT NULL,
    paramsourceid character varying(36),
    appoperationid character varying(36),
    trantype character varying(36),
    reference character varying(250),
    description character varying(100),
    auditno numeric(18,0),
    amount numeric(21,8) NOT NULL,
    draccountid character varying(36),
    craccountid character varying(36),
    idno character varying(36),
    line integer,
    drcostcenterid character varying(36),
    crcostcenterid character varying(36),
    postdate timestamp without time zone,
    status character varying(3) NOT NULL,
    sessionid character varying(36),
    updated boolean,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    oprtype character varying(1)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_glinterfaces OWNER TO gpadmin;

--
-- TOC entry 653 (class 1259 OID 18767)
-- Name: tmp_userfunctions; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmp_userfunctions (
    id character varying(36) NOT NULL,
    users_id character varying(36) NOT NULL,
    functions_id character varying(36) NOT NULL,
    "exclude" boolean,
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean,
    isquickaccess boolean,
    sessionid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmp_userfunctions OWNER TO gpadmin;

--
-- TOC entry 652 (class 1259 OID 18764)
-- Name: tmpchargeprices; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmpchargeprices (
    id character varying(36) NOT NULL,
    isselect boolean,
    chargemasterid character varying(36),
    chargecode character varying(30),
    chargedescription character varying(150),
    chargegroupid character varying(36),
    chargegroupcode character varying(4),
    chargegroupdescription character varying(40),
    ispricedefined boolean,
    pricedetailid character varying(36),
    biltypeid character varying(36),
    billtypecode character varying(5),
    pricetypeid character varying(36),
    pricetypecode character varying(5),
    uomid character varying(36),
    uomcode character varying(4),
    effectivedate timestamp without time zone,
    price numeric(21,8),
    markupprecentage numeric(18,8),
    discountprecentage numeric(18,8),
    finalprice numeric(21,8),
    panelheaderid character varying(36),
    panelcode character varying(10),
    paneldetailid character varying(36),
    companyid character varying(36) NOT NULL,
    sessionid character varying(36),
    ispriceoverwrite boolean,
    discountamount numeric(21,8),
    markupamount numeric(21,8),
    hasdiscountcharge boolean,
    isdiscountcharge boolean,
    discountchargeid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.tmpchargeprices OWNER TO gpadmin;

--
-- TOC entry 671 (class 1259 OID 18824)
-- Name: tmpglinterface; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmpglinterface (
    compcode character varying(4),
    source character varying(20),
    trantype character varying(16),
    reference character varying(80),
    description character varying(80),
    auditno integer,
    amount numeric(18,0),
    dracc character varying(16),
    cracc character varying(16),
    idno character varying(20),
    lineno integer,
    flag character varying(2),
    oprtype character varying(2),
    lastuser character varying(26),
    lastupdate timestamp without time zone,
    drccode character varying(6),
    crccode character varying(6),
    postdate timestamp without time zone,
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    sessionid character varying(36)
)
 DISTRIBUTED BY (compcode);


ALTER TABLE staging_mdmhits2_klgsh.tmpglinterface OWNER TO gpadmin;

--
-- TOC entry 672 (class 1259 OID 18827)
-- Name: tmpglinterface_error; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.tmpglinterface_error (
    compcode character varying(4),
    source character varying(20),
    trantype character varying(16),
    reference character varying(80),
    description character varying(80),
    auditno integer,
    amount numeric(18,0),
    dracc character varying(16),
    cracc character varying(16),
    idno character varying(20),
    lineno integer,
    flag character varying(2),
    oprtype character varying(2),
    lastuser character varying(26),
    lastupdate timestamp without time zone,
    drccode character varying(6),
    crccode character varying(6),
    postdate timestamp without time zone,
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    sessionid character varying(36),
    errormsg character varying(255)
)
 DISTRIBUTED BY (compcode);


ALTER TABLE staging_mdmhits2_klgsh.tmpglinterface_error OWNER TO gpadmin;

--
-- TOC entry 654 (class 1259 OID 18770)
-- Name: trankeys; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.trankeys (
    id character varying(36) NOT NULL,
    transtypeid character varying(36) NOT NULL,
    departmentid character varying(36),
    keysequence integer,
    backdateduration integer,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.trankeys OWNER TO gpadmin;

--
-- TOC entry 659 (class 1259 OID 18785)
-- Name: transactionlogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.transactionlogs (
    id character varying(36) NOT NULL,
    module character varying(100) NOT NULL,
    submodule character varying(100) NOT NULL,
    tablename character varying(100) NOT NULL,
    tablekey character varying(36) NOT NULL,
    activitytype character varying(10) NOT NULL,
    fields character varying NOT NULL,
    fromvalues character varying NOT NULL,
    tovalues character varying NOT NULL,
    logdatetime timestamp without time zone NOT NULL,
    userid character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    sessioncontextid character varying(36) NOT NULL,
    functionid character varying(36) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.transactionlogs OWNER TO gpadmin;

--
-- TOC entry 655 (class 1259 OID 18773)
-- Name: transgroups; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.transgroups (
    id character varying(36) NOT NULL,
    transgroupcode character varying(10) NOT NULL,
    transgroupdesc character varying(30) NOT NULL,
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    noteexist boolean,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.transgroups OWNER TO gpadmin;

--
-- TOC entry 656 (class 1259 OID 18776)
-- Name: transqueues; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.transqueues (
    id character varying(36) NOT NULL,
    companyid character varying(36) NOT NULL,
    patientid character varying(36),
    episodeid character varying(36),
    episodeprescriptionhdrid character varying(36),
    queueno integer NOT NULL,
    queuestatid character varying(36) NOT NULL,
    status character varying(50) NOT NULL,
    queuetypeid character varying(36) NOT NULL,
    departmentid character varying(36) NOT NULL,
    locationid character varying(36),
    highpriority boolean,
    refqueueid character varying(36),
    queuesourceid character varying(36),
    refsourceid character varying(36),
    refsourcetype character varying(10),
    isclosed boolean NOT NULL,
    noteexist boolean,
    updatedate timestamp without time zone NOT NULL,
    updateuserid character varying(36) NOT NULL,
    datetimein timestamp without time zone,
    datetimeout timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.transqueues OWNER TO gpadmin;

--
-- TOC entry 657 (class 1259 OID 18779)
-- Name: transtitles; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.transtitles (
    id character varying(36) NOT NULL,
    titleid character varying(36) NOT NULL,
    description character varying(30) NOT NULL,
    companyid character varying(36) NOT NULL,
    languageid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    status character varying(3) NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.transtitles OWNER TO gpadmin;

--
-- TOC entry 658 (class 1259 OID 18782)
-- Name: transtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.transtypes (
    id character varying(36) NOT NULL,
    transtype character varying(10) NOT NULL,
    description character varying(50) NOT NULL,
    transgroupid character varying(36) NOT NULL,
    glsubacctypeid character varying(36),
    isdeposittype boolean,
    isinventorytype boolean,
    crdrsign character varying(10),
    isupdatequantity boolean,
    isupdateamount boolean,
    invissuetype character varying(10),
    tranbyinv boolean,
    isupdateproductqty boolean,
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    noteexist boolean NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.transtypes OWNER TO gpadmin;

--
-- TOC entry 660 (class 1259 OID 18791)
-- Name: uoms; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.uoms (
    id character varying(36) NOT NULL,
    uomcode character varying(20),
    description character varying(30),
    convfactor numeric(18,8),
    remarks character varying(255),
    companyid character varying(36) NOT NULL,
    status character varying(3) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.uoms OWNER TO gpadmin;

--
-- TOC entry 661 (class 1259 OID 18794)
-- Name: usercompanies; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.usercompanies (
    id character varying(36) NOT NULL,
    userid character varying(36) NOT NULL,
    permissioncompanyid character varying(36) NOT NULL,
    isdefaultcompany boolean,
    status character varying(5),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.usercompanies OWNER TO gpadmin;

--
-- TOC entry 662 (class 1259 OID 18797)
-- Name: userdefinedtypes; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.userdefinedtypes (
    id character varying(36) NOT NULL,
    typecode character varying(30) NOT NULL,
    desctiption character varying(100),
    typekey character varying(10) NOT NULL,
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.userdefinedtypes OWNER TO gpadmin;

--
-- TOC entry 663 (class 1259 OID 18800)
-- Name: userfunction; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.userfunction (
    id character varying(100) NOT NULL,
    users_id character varying(36) NOT NULL,
    functions_id character varying(36) NOT NULL,
    "exclude" boolean,
    canview boolean,
    canadd boolean,
    canupdate boolean,
    candelete boolean,
    canexecute boolean,
    isquickaccess boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.userfunction OWNER TO gpadmin;

--
-- TOC entry 664 (class 1259 OID 18803)
-- Name: userlogs; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.userlogs (
    id character varying(36) NOT NULL,
    userid character varying(36),
    name character varying(80),
    module character varying(80),
    program character varying(80),
    tab character varying(80),
    timein timestamp without time zone,
    date timestamp without time zone,
    appfunctionid character varying(36),
    companyid character varying(36)
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.userlogs OWNER TO gpadmin;

--
-- TOC entry 665 (class 1259 OID 18806)
-- Name: useroperation; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.useroperation (
    users_id character varying(36) NOT NULL,
    operations_id character varying(36) NOT NULL,
    "exclude" boolean
)
 DISTRIBUTED BY (users_id);


ALTER TABLE staging_mdmhits2_klgsh.useroperation OWNER TO gpadmin;

--
-- TOC entry 666 (class 1259 OID 18809)
-- Name: userprivilegedetails; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.userprivilegedetails (
    id character varying(36) NOT NULL,
    userprivilegeid character varying(36) NOT NULL,
    privilegedetailid character varying(36) NOT NULL,
    upperlimit numeric(18,4),
    lowerlimit numeric(18,4),
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean NOT NULL
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.userprivilegedetails OWNER TO gpadmin;

--
-- TOC entry 667 (class 1259 OID 18812)
-- Name: userprivileges; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.userprivileges (
    id character varying(36) NOT NULL,
    privilegeid character varying(36) NOT NULL,
    userid character varying(36) NOT NULL,
    status character varying(3),
    companyid character varying(36) NOT NULL,
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    noteexist boolean
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.userprivileges OWNER TO gpadmin;

--
-- TOC entry 668 (class 1259 OID 18815)
-- Name: users; Type: TABLE; Schema: staging_mdmhits2_klgsh; Owner: gpadmin; Tablespace: 
--

CREATE TABLE staging_mdmhits2_klgsh.users (
    id character varying(36) NOT NULL,
    loginname character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    username character varying(50),
    status character varying(3) NOT NULL,
    companyid character varying(36) NOT NULL,
    loggedin smallint,
    loginattempt smallint,
    employeeid character varying(36),
    updateuserid character varying(36) NOT NULL,
    updatedate timestamp without time zone NOT NULL,
    currentsessioncontextid character varying(32),
    defaultdepartmentid character varying(36),
    languageid character varying(36),
    designationid character varying(36),
    domainuser character varying(50),
    expirydate timestamp without time zone,
    adduserid character varying(36),
    adddate timestamp without time zone
)
 DISTRIBUTED BY (id);


ALTER TABLE staging_mdmhits2_klgsh.users OWNER TO gpadmin;

-- Completed on 2020-09-07 23:25:38 PHT

--
-- Greenplum Database database dump complete
--

