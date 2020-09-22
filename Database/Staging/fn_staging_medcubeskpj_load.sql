CREATE OR REPLACE FUNCTION fn_staging_medcubeskpj_load() RETURNS VOID AS $$
BEGIN

INSERT INTO assignedconsultant SELECT * FROM pxf_assignedconsultant;
INSERT INTO casedata SELECT * FROM pxf_casedata;
INSERT INTO employer SELECT * FROM pxf_employer;
INSERT INTO insuredperson SELECT * FROM pxf_insuredperson;
INSERT INTO medicalcasedata SELECT * FROM pxf_medicalcasedata;
INSERT INTO medicalrecord SELECT * FROM pxf_medicalrecord;
INSERT INTO patient SELECT * FROM pxf_patient;
INSERT INTO patientappointmenttimepoint SELECT * FROM pxf_patientappointmenttimepoint;
INSERT INTO patientappointmenttimepointmaterial SELECT * FROM pxf_patientappointmenttimepointmaterial;
INSERT INTO patientcontact SELECT * FROM pxf_patientcontact;
INSERT INTO patientinsurance SELECT * FROM pxf_patientinsurance;
INSERT INTO patientservice SELECT * FROM pxf_patientservice;
INSERT INTO patientservicebill SELECT * FROM pxf_patientservicebill;
INSERT INTO patientservicematerialrelationship SELECT * FROM pxf_patientservicematerialrelationship;
INSERT INTO patientservicevariableprice SELECT * FROM pxf_patientservicevariableprice;
INSERT INTO physicalcasedata SELECT * FROM pxf_physicalcasedata;
INSERT INTO physicalcasevacation SELECT * FROM pxf_physicalcasevacation;
INSERT INTO plannedcasedataextension SELECT * FROM pxf_plannedcasedataextension;
INSERT INTO vipinfo SELECT * FROM pxf_vipinfo;
INSERT INTO virtualpatient SELECT * FROM pxf_virtualpatient;
INSERT INTO accountingunit SELECT * FROM pxf_accountingunit;
INSERT INTO bed SELECT * FROM pxf_bed;
INSERT INTO city SELECT * FROM pxf_city;
INSERT INTO closetime SELECT * FROM pxf_closetime;
INSERT INTO debtor SELECT * FROM pxf_debtor;
INSERT INTO department SELECT * FROM pxf_department;
INSERT INTO examinationunit SELECT * FROM pxf_examinationunit;
INSERT INTO externalcontact SELECT * FROM pxf_externalcontact;
INSERT INTO material SELECT * FROM pxf_material;
INSERT INTO materialdocumentrelationship SELECT * FROM pxf_materialdocumentrelationship;
INSERT INTO room SELECT * FROM pxf_room;
INSERT INTO service SELECT * FROM pxf_service;
INSERT INTO servicedocumentrelationship SELECT * FROM pxf_servicedocumentrelationship;
INSERT INTO servicematerialrelationship SELECT * FROM pxf_servicematerialrelationship;
INSERT INTO servicereference SELECT * FROM pxf_servicereference;
INSERT INTO serviceunit SELECT * FROM pxf_serviceunit;
INSERT INTO serviceunitreportextension SELECT * FROM pxf_serviceunitreportextension;
INSERT INTO syntaxformofapplication SELECT * FROM pxf_syntaxformofapplication;
INSERT INTO timeduration SELECT * FROM pxf_timeduration;
INSERT INTO timeinterval SELECT * FROM pxf_timeinterval;
INSERT INTO timescheme SELECT * FROM pxf_timescheme;
INSERT INTO patientcalendarentry SELECT * FROM pxf_patientcalendarentry;
INSERT INTO patientcalendarentryresourcerelationship SELECT * FROM pxf_patientcalendarentryresourcerelationship;
INSERT INTO resource SELECT * FROM pxf_resource;
INSERT INTO resourcegroup SELECT * FROM pxf_resourcegroup;
INSERT INTO resourceresourcegrouprelationship SELECT * FROM pxf_resourceresourcegrouprelationship;
INSERT INTO resourcetime SELECT * FROM pxf_resourcetime;
INSERT INTO serviceresourcegrouprelationship SELECT * FROM pxf_serviceresourcegrouprelationship;
INSERT INTO documentinfo SELECT * FROM pxf_documentinfo;
INSERT INTO documentstatus SELECT * FROM pxf_documentstatus;
INSERT INTO documenttype SELECT * FROM pxf_documenttype;
INSERT INTO actiontile SELECT * FROM pxf_actiontile;
INSERT INTO activeusers SELECT * FROM pxf_activeusers;
INSERT INTO annotation SELECT * FROM pxf_annotation;
INSERT INTO appassembly SELECT * FROM pxf_appassembly;
INSERT INTO appassemblyreference SELECT * FROM pxf_appassemblyreference;
INSERT INTO apppartner SELECT * FROM pxf_apppartner;
INSERT INTO clientcachedata SELECT * FROM pxf_clientcachedata;
INSERT INTO culture SELECT * FROM pxf_culture;
INSERT INTO customer SELECT * FROM pxf_customer;
INSERT INTO desktoponprofile SELECT * FROM pxf_desktoponprofile;
INSERT INTO doctornote SELECT * FROM pxf_doctornote;
INSERT INTO doctornoteanswer SELECT * FROM pxf_doctornoteanswer;
INSERT INTO dynamicappdatatoprefill SELECT * FROM pxf_dynamicappdatatoprefill;
INSERT INTO dynamicappmasterdata SELECT * FROM pxf_dynamicappmasterdata;
INSERT INTO dynamicapppageofwizard SELECT * FROM pxf_dynamicapppageofwizard;
INSERT INTO dynamicappwizardmasterdata SELECT * FROM pxf_dynamicappwizardmasterdata;
INSERT INTO dynamicdatacontent SELECT * FROM pxf_dynamicdatacontent;
INSERT INTO dynamicdatacontentwizardrelationship SELECT * FROM pxf_dynamicdatacontentwizardrelationship;
INSERT INTO dynamicdatarecord SELECT * FROM pxf_dynamicdatarecord;
INSERT INTO dynamicdatarecordscreenshot SELECT * FROM pxf_dynamicdatarecordscreenshot;
INSERT INTO dynamicextendabletables SELECT * FROM pxf_dynamicextendabletables;
INSERT INTO dynamicfields SELECT * FROM pxf_dynamicfields;
INSERT INTO dynamicsubtables SELECT * FROM pxf_dynamicsubtables;
INSERT INTO "function" SELECT * FROM pxf_function;
INSERT INTO functionofpermissiongrid SELECT * FROM pxf_functionofpermissiongrid;
INSERT INTO globaltables SELECT * FROM pxf_globaltables;
INSERT INTO headlinefields SELECT * FROM pxf_headlinefields;
INSERT INTO history SELECT * FROM pxf_history;
INSERT INTO icon SELECT * FROM pxf_icon;
INSERT INTO logentry SELECT * FROM pxf_logentry;
INSERT INTO manualactiontilestate SELECT * FROM pxf_manualactiontilestate;
INSERT INTO masterdataexporttables SELECT * FROM pxf_masterdataexporttables;
INSERT INTO mcrichtextboxdatacontent SELECT * FROM pxf_mcrichtextboxdatacontent;
INSERT INTO mcrichtextboxdatarecord SELECT * FROM pxf_mcrichtextboxdatarecord;
INSERT INTO mcrichtextboxdefaultvalue SELECT * FROM pxf_mcrichtextboxdefaultvalue;
INSERT INTO moduleinfo SELECT * FROM pxf_moduleinfo;
INSERT INTO option SELECT * FROM pxf_option;
INSERT INTO patidokhistory SELECT * FROM pxf_patidokhistory;
INSERT INTO permissiongrid SELECT * FROM pxf_permissiongrid;
INSERT INTO phoneconnection SELECT * FROM pxf_phoneconnection;
INSERT INTO popupentry SELECT * FROM pxf_popupentry;
INSERT INTO popupheader SELECT * FROM pxf_popupheader;
INSERT INTO popupmapping SELECT * FROM pxf_popupmapping;
INSERT INTO profile SELECT * FROM pxf_profile;
INSERT INTO profileofuser SELECT * FROM pxf_profileofuser;
INSERT INTO refreshstate SELECT * FROM pxf_refreshstate;
INSERT INTO reportofapp SELECT * FROM pxf_reportofapp;
INSERT INTO reportpermission SELECT * FROM pxf_reportpermission;
INSERT INTO rssitem SELECT * FROM pxf_rssitem;
INSERT INTO scopepermissiongridrelationship SELECT * FROM pxf_scopepermissiongridrelationship;
INSERT INTO searchstructure SELECT * FROM pxf_searchstructure;
INSERT INTO searchstructureconfig SELECT * FROM pxf_searchstructureconfig;
INSERT INTO searchstructuredata SELECT * FROM pxf_searchstructuredata;
INSERT INTO searchstructurefilter SELECT * FROM pxf_searchstructurefilter;
INSERT INTO searchstructurehidden SELECT * FROM pxf_searchstructurehidden;
INSERT INTO sequences SELECT * FROM pxf_sequences;
INSERT INTO serverconfig SELECT * FROM pxf_serverconfig;
INSERT INTO tempreportingobjects SELECT * FROM pxf_tempreportingobjects;
INSERT INTO tenant SELECT * FROM pxf_tenant;
INSERT INTO tenantofuser SELECT * FROM pxf_tenantofuser;
INSERT INTO textphrase SELECT * FROM pxf_textphrase;
INSERT INTO tilecontext SELECT * FROM pxf_tilecontext;
INSERT INTO tilestyle SELECT * FROM pxf_tilestyle;
INSERT INTO timetracking SELECT * FROM pxf_timetracking;
INSERT INTO timetrackingkeyword SELECT * FROM pxf_timetrackingkeyword;
INSERT INTO traceables SELECT * FROM pxf_traceables;
INSERT INTO translationdata SELECT * FROM pxf_translationdata;
INSERT INTO translationdataclientcache SELECT * FROM pxf_translationdataclientcache;
INSERT INTO translationsource SELECT * FROM pxf_translationsource;
INSERT INTO translationtable SELECT * FROM pxf_translationtable;
INSERT INTO uiapp SELECT * FROM pxf_uiapp;
INSERT INTO uibuttononpage SELECT * FROM pxf_uibuttononpage;
INSERT INTO uidesktop SELECT * FROM pxf_uidesktop;
INSERT INTO uipage SELECT * FROM pxf_uipage;
INSERT INTO uipageondesktop SELECT * FROM pxf_uipageondesktop;
INSERT INTO "user" SELECT * FROM pxf_user;
INSERT INTO userconfig SELECT * FROM pxf_userconfig;
INSERT INTO userenvironment SELECT * FROM pxf_userenvironment;
INSERT INTO wfactivity SELECT * FROM pxf_wfactivity;
INSERT INTO wftask SELECT * FROM pxf_wftask;
INSERT INTO wfcustomizedactivitytask SELECT * FROM pxf_wfcustomizedactivitytask;
INSERT INTO compareareacode SELECT * FROM pxf_compareareacode;
INSERT INTO comparedataafter SELECT * FROM pxf_comparedataafter;
INSERT INTO hl7component SELECT * FROM pxf_hl7component;
INSERT INTO hl7component2property SELECT * FROM pxf_hl7component2property;
INSERT INTO hl7device SELECT * FROM pxf_hl7device;
INSERT INTO hl7devicemessagetype SELECT * FROM pxf_hl7devicemessagetype;
INSERT INTO hl7event SELECT * FROM pxf_hl7event;
INSERT INTO hl7eventsegmentconfiguration SELECT * FROM pxf_hl7eventsegmentconfiguration;
INSERT INTO hl7field SELECT * FROM pxf_hl7field;
INSERT INTO hl7idmapper SELECT * FROM pxf_hl7idmapper;
INSERT INTO hl7mapper SELECT * FROM pxf_hl7mapper;
INSERT INTO hl7mapper2component SELECT * FROM pxf_hl7mapper2component;
INSERT INTO hl7mappingvalue SELECT * FROM pxf_hl7mappingvalue;
INSERT INTO hl7messagelog SELECT * FROM pxf_hl7messagelog;
INSERT INTO hl7messagetype SELECT * FROM pxf_hl7messagetype;
INSERT INTO hl7segment SELECT * FROM pxf_hl7segment;
INSERT INTO clientmission SELECT * FROM pxf_clientmission;
INSERT INTO missiontype SELECT * FROM pxf_missiontype;
INSERT INTO workflowmessage SELECT * FROM pxf_workflowmessage;
INSERT INTO workflowtopic SELECT * FROM pxf_workflowtopic;
INSERT INTO workflowtopicofuser SELECT * FROM pxf_workflowtopicofuser;
INSERT INTO assessment SELECT * FROM pxf_assessment;
INSERT INTO measurement SELECT * FROM pxf_measurement;
INSERT INTO medcaseconfig SELECT * FROM pxf_medcaseconfig;
INSERT INTO parameter SELECT * FROM pxf_parameter;
INSERT INTO unit SELECT * FROM pxf_unit;
INSERT INTO value SELECT * FROM pxf_value;
INSERT INTO anamnesis SELECT * FROM pxf_anamnesis;
INSERT INTO anamnesisdiagnosis SELECT * FROM pxf_anamnesisdiagnosis;
INSERT INTO anamnesisdynamicappdata SELECT * FROM pxf_anamnesisdynamicappdata;
INSERT INTO anamnesispathway SELECT * FROM pxf_anamnesispathway;
INSERT INTO lesionannotationstyle SELECT * FROM pxf_lesionannotationstyle;
INSERT INTO lesionassessment SELECT * FROM pxf_lesionassessment;
INSERT INTO lesiondata SELECT * FROM pxf_lesiondata;
INSERT INTO nursingbasedata SELECT * FROM pxf_nursingbasedata;
INSERT INTO nursingbasedocumentrelationship SELECT * FROM pxf_nursingbasedocumentrelationship;
INSERT INTO nursingcaregiver SELECT * FROM pxf_nursingcaregiver;
INSERT INTO nursingcaregroup SELECT * FROM pxf_nursingcaregroup;
INSERT INTO nursingcaregroupbedrelationship SELECT * FROM pxf_nursingcaregroupbedrelationship;
INSERT INTO nursingcaregroupphysicalcasedatarelationship SELECT * FROM pxf_nursingcaregroupphysicalcasedatarelationship;
INSERT INTO nursingdiagnosisbasedatarelationship SELECT * FROM pxf_nursingdiagnosisbasedatarelationship;
INSERT INTO nursingdiagnosisdata SELECT * FROM pxf_nursingdiagnosisdata;
INSERT INTO nursingdiagnosisdatareferencerelationship SELECT * FROM pxf_nursingdiagnosisdatareferencerelationship;
INSERT INTO nursingdiagnosisdocumentrelationship SELECT * FROM pxf_nursingdiagnosisdocumentrelationship;
INSERT INTO nursingdiagnosisoutcomerelationship SELECT * FROM pxf_nursingdiagnosisoutcomerelationship;
INSERT INTO nursingdynfieldtodiagorpathwayrelationship SELECT * FROM pxf_nursingdynfieldtodiagorpathwayrelationship;
INSERT INTO nursingoutcomedata SELECT * FROM pxf_nursingoutcomedata;
INSERT INTO nursingoutcomedocumentrelationship SELECT * FROM pxf_nursingoutcomedocumentrelationship;
INSERT INTO nursingoutcomeservicerelationship SELECT * FROM pxf_nursingoutcomeservicerelationship;
INSERT INTO nursingreference SELECT * FROM pxf_nursingreference;
INSERT INTO nursingtododata SELECT * FROM pxf_nursingtododata;
INSERT INTO pathway SELECT * FROM pxf_pathway;
INSERT INTO pathwaybasedata SELECT * FROM pxf_pathwaybasedata;
INSERT INTO pathwaydiagnosis SELECT * FROM pxf_pathwaydiagnosis;
INSERT INTO pathwaymaterial SELECT * FROM pxf_pathwaymaterial;
INSERT INTO pathwayoutcome SELECT * FROM pxf_pathwayoutcome;
INSERT INTO pathwayservice SELECT * FROM pxf_pathwayservice;
INSERT INTO patientnursingbasedata SELECT * FROM pxf_patientnursingbasedata;
INSERT INTO patientnursingdiagnosis SELECT * FROM pxf_patientnursingdiagnosis;
INSERT INTO patientnursingmaterial SELECT * FROM pxf_patientnursingmaterial;
INSERT INTO patientnursingoutcome SELECT * FROM pxf_patientnursingoutcome;
INSERT INTO patientnursingservice SELECT * FROM pxf_patientnursingservice;
INSERT INTO patientnursingserviceduration SELECT * FROM pxf_patientnursingserviceduration;
INSERT INTO patientnursingserviceinterval SELECT * FROM pxf_patientnursingserviceinterval;
INSERT INTO patientnursingservicetimepoint SELECT * FROM pxf_patientnursingservicetimepoint;
INSERT INTO patientnursingtodo SELECT * FROM pxf_patientnursingtodo;
INSERT INTO patientnursingtodopause SELECT * FROM pxf_patientnursingtodopause;
INSERT INTO serviceunitsofuser SELECT * FROM pxf_serviceunitsofuser;
INSERT INTO casedatatemp SELECT * FROM pxf_casedatatemp;
INSERT INTO drug SELECT * FROM pxf_drug;
INSERT INTO laboratoryacquisitiontemp SELECT * FROM pxf_laboratoryacquisitiontemp;
INSERT INTO laboratoyorderservicetemp SELECT * FROM pxf_laboratoyorderservicetemp;
INSERT INTO medicalcasedatatemp SELECT * FROM pxf_medicalcasedatatemp;
INSERT INTO ordertemp SELECT * FROM pxf_ordertemp;
INSERT INTO patienttemp SELECT * FROM pxf_patienttemp;
INSERT INTO physicalcasedatatemp SELECT * FROM pxf_physicalcasedatatemp;
INSERT INTO wound SELECT * FROM pxf_wound;
INSERT INTO woundassessment SELECT * FROM pxf_woundassessment;
INSERT INTO woundassessmentdata SELECT * FROM pxf_woundassessmentdata;
INSERT INTO woundassessmentimage SELECT * FROM pxf_woundassessmentimage;
INSERT INTO wounddynamicrecordrelationship SELECT * FROM pxf_wounddynamicrecordrelationship;
INSERT INTO woundlocalizationcontrol SELECT * FROM pxf_woundlocalizationcontrol;
INSERT INTO woundlocalizationdata SELECT * FROM pxf_woundlocalizationdata;
INSERT INTO woundmeasurement SELECT * FROM pxf_woundmeasurement;
INSERT INTO woundmeasurementarea SELECT * FROM pxf_woundmeasurementarea;
INSERT INTO woundmeasurementpoint SELECT * FROM pxf_woundmeasurementpoint;
INSERT INTO woundpatientnursingdiagnosisrelationship SELECT * FROM pxf_woundpatientnursingdiagnosisrelationship;
INSERT INTO woundstate SELECT * FROM pxf_woundstate;
INSERT INTO woundtype SELECT * FROM pxf_woundtype;
INSERT INTO woundtyperelationship SELECT * FROM pxf_woundtyperelationship;
INSERT INTO woundwizardpage SELECT * FROM pxf_woundwizardpage;
INSERT INTO allergy SELECT * FROM pxf_allergy;
INSERT INTO diagnosis SELECT * FROM pxf_diagnosis;
INSERT INTO growthchartmaindata SELECT * FROM pxf_growthchartmaindata;
INSERT INTO patientallergy SELECT * FROM pxf_patientallergy;
INSERT INTO patientdiagnosis SELECT * FROM pxf_patientdiagnosis;
INSERT INTO patienttentativediagnosis SELECT * FROM pxf_patienttentativediagnosis;
INSERT INTO reportnote SELECT * FROM pxf_reportnote;
INSERT INTO reportnotecategory SELECT * FROM pxf_reportnotecategory;
INSERT INTO reportnotetype SELECT * FROM pxf_reportnotetype;
INSERT INTO vitalparameter SELECT * FROM pxf_vitalparameter;
INSERT INTO vitalparameterarrangement SELECT * FROM pxf_vitalparameterarrangement;
INSERT INTO vitalparameterarrangementrelationship SELECT * FROM pxf_vitalparameterarrangementrelationship;
INSERT INTO vitalparametercollection SELECT * FROM pxf_vitalparametercollection;
INSERT INTO vitalparametercollectionrelationship SELECT * FROM pxf_vitalparametercollectionrelationship;
INSERT INTO vitalparameterdata SELECT * FROM pxf_vitalparameterdata;
INSERT INTO vitalparameterdynamicappdataorigin SELECT * FROM pxf_vitalparameterdynamicappdataorigin;
INSERT INTO vitalparametergrowthitem SELECT * FROM pxf_vitalparametergrowthitem;
INSERT INTO vitalparameterlistitem SELECT * FROM pxf_vitalparameterlistitem;
INSERT INTO laboratoryacquisition SELECT * FROM pxf_laboratoryacquisition;
INSERT INTO laboratoryanalysis SELECT * FROM pxf_laboratoryanalysis;
INSERT INTO laboratoryordermaterialrelationship SELECT * FROM pxf_laboratoryordermaterialrelationship;
INSERT INTO laboratoryorderservice SELECT * FROM pxf_laboratoryorderservice;
INSERT INTO laboratoryprofile SELECT * FROM pxf_laboratoryprofile;
INSERT INTO laboratoryprofiletoanalysisrelationship SELECT * FROM pxf_laboratoryprofiletoanalysisrelationship;
INSERT INTO laboratoryscreen SELECT * FROM pxf_laboratoryscreen;
INSERT INTO laboratoryscreenrelationship SELECT * FROM pxf_laboratoryscreenrelationship;
INSERT INTO "order" SELECT * FROM pxf_order;
INSERT INTO "orderservice" SELECT * FROM pxf_orderservice;
INSERT INTO "orderservicematerialrelationship" SELECT * FROM pxf_orderservicematerialrelationship;
INSERT INTO "serviceunitstoscreenrelationship" SELECT * FROM pxf_serviceunitstoscreenrelationship;
INSERT INTO "atcgroup" SELECT * FROM pxf_atcgroup;
INSERT INTO "drugdispenseconfirmation" SELECT * FROM pxf_drugdispenseconfirmation;
INSERT INTO "indicationgroup" SELECT * FROM pxf_indicationgroup;
INSERT INTO "meddosage" SELECT * FROM pxf_meddosage;
INSERT INTO "medinterval" SELECT * FROM pxf_medinterval;
INSERT INTO "medondemand" SELECT * FROM pxf_medondemand;
INSERT INTO "medprescription" SELECT * FROM pxf_medprescription;
INSERT INTO "medtimepoint" SELECT * FROM pxf_medtimepoint;
INSERT INTO "medicationactivesubstancedata" SELECT * FROM pxf_medicationactivesubstancedata;
INSERT INTO "medicationarticledata" SELECT * FROM pxf_medicationarticledata;
INSERT INTO "medicationdrug" SELECT * FROM pxf_medicationdrug;
INSERT INTO "medicationdruginhousecatalogue" SELECT * FROM pxf_medicationdruginhousecatalogue;
INSERT INTO "medicationdrugtoactivesubstancerelation" SELECT * FROM pxf_medicationdrugtoactivesubstancerelation;
INSERT INTO "medicationdrugtoatcgrouprelation" SELECT * FROM pxf_medicationdrugtoatcgrouprelation;
INSERT INTO "medicationdrugtoindicationgrouprelation" SELECT * FROM pxf_medicationdrugtoindicationgrouprelation;
INSERT INTO "medicationdrugtowarningrelation" SELECT * FROM pxf_medicationdrugtowarningrelation;
INSERT INTO "medicationwarning" SELECT * FROM pxf_medicationwarning;
INSERT INTO "mimsrequest" SELECT * FROM pxf_mimsrequest;
INSERT INTO "patientmeddosage" SELECT * FROM pxf_patientmeddosage;
INSERT INTO "patientmeddosagebalance" SELECT * FROM pxf_patientmeddosagebalance;
INSERT INTO "patientmedexpense" SELECT * FROM pxf_patientmedexpense;
INSERT INTO "patientmedexpenseservice" SELECT * FROM pxf_patientmedexpenseservice;
INSERT INTO "patientmedinterval" SELECT * FROM pxf_patientmedinterval;
INSERT INTO "patientmedondemand" SELECT * FROM pxf_patientmedondemand;
INSERT INTO "patientmedpause" SELECT * FROM pxf_patientmedpause;
INSERT INTO "patientmedprescription" SELECT * FROM pxf_patientmedprescription;
INSERT INTO "patientmedprescriptionconfirmed" SELECT * FROM pxf_patientmedprescriptionconfirmed;
INSERT INTO "patientmedtimepoint" SELECT * FROM pxf_patientmedtimepoint;
INSERT INTO "patientmedwarning" SELECT * FROM pxf_patientmedwarning;
INSERT INTO "pharmacyorder" SELECT * FROM pxf_pharmacyorder;
INSERT INTO "pharmacyorderitem" SELECT * FROM pxf_pharmacyorderitem;
INSERT INTO "pharmacyorderstatetransition" SELECT * FROM pxf_pharmacyorderstatetransition;
INSERT INTO "pharmacyservice" SELECT * FROM pxf_pharmacyservice;
INSERT INTO "pharmacystock" SELECT * FROM pxf_pharmacystock;
INSERT INTO "pharmacystockarticle" SELECT * FROM pxf_pharmacystockarticle;
INSERT INTO "pharmacystocktodepartmentrelation" SELECT * FROM pxf_pharmacystocktodepartmentrelation;
INSERT INTO "pharmacystocktoserviceunitrelation" SELECT * FROM pxf_pharmacystocktoserviceunitrelation;
INSERT INTO "pharmacywarning" SELECT * FROM pxf_pharmacywarning;
INSERT INTO "casedatacommunication" SELECT * FROM pxf_casedatacommunication;
INSERT INTO "casedatacommunicationread" SELECT * FROM pxf_casedatacommunicationread;
INSERT INTO "message" SELECT * FROM pxf_message;
--INSERT INTO "mediastorage" SELECT * FROM pxf_mediastorage;

END;
$$ LANGUAGE plpgsql;
