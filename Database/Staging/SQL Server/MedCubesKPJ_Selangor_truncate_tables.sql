\SET ON_ERROR_STOP on

set search_path=staging_medcubeskpj_selangor;

TRUNCATE TABLE assignedconsultant ;
TRUNCATE TABLE casedata ;
TRUNCATE TABLE employer ;
TRUNCATE TABLE insuredperson ;
TRUNCATE TABLE medicalcasedata ;
TRUNCATE TABLE medicalrecord ;
TRUNCATE TABLE patient ;
TRUNCATE TABLE patientappointmenttimepoint ;
TRUNCATE TABLE patientappointmenttimepointmaterial ;
TRUNCATE TABLE patientcontact ;
TRUNCATE TABLE patientinsurance ;
TRUNCATE TABLE patientservice ;
TRUNCATE TABLE patientservicebill ;
TRUNCATE TABLE patientservicematerialrelationship ;
TRUNCATE TABLE patientservicevariableprice ;
TRUNCATE TABLE physicalcasedata ;
TRUNCATE TABLE physicalcasevacation ;
TRUNCATE TABLE plannedcasedataextension ;
TRUNCATE TABLE vipinfo ;
TRUNCATE TABLE virtualpatient ;
TRUNCATE TABLE accountingunit ;
TRUNCATE TABLE bed ;
TRUNCATE TABLE city ;
TRUNCATE TABLE closetime ;
TRUNCATE TABLE debtor ;
TRUNCATE TABLE department ;
TRUNCATE TABLE examinationunit ;
TRUNCATE TABLE externalcontact ;
TRUNCATE TABLE material ;
TRUNCATE TABLE materialdocumentrelationship ;
TRUNCATE TABLE room ;
TRUNCATE TABLE service ;
TRUNCATE TABLE servicedocumentrelationship ;
TRUNCATE TABLE servicematerialrelationship ;
TRUNCATE TABLE servicereference ;
TRUNCATE TABLE serviceunit ;
TRUNCATE TABLE serviceunitreportextension ;
TRUNCATE TABLE syntaxformofapplication ;
TRUNCATE TABLE timeduration ;
TRUNCATE TABLE timeinterval ;
TRUNCATE TABLE timescheme ;
TRUNCATE TABLE patientcalendarentry ;
TRUNCATE TABLE patientcalendarentryresourcerelationship ;
TRUNCATE TABLE "resource" ;
TRUNCATE TABLE resourcegroup ;
TRUNCATE TABLE resourceresourcegrouprelationship ;
TRUNCATE TABLE resourcetime ;
TRUNCATE TABLE serviceresourcegrouprelationship ;
TRUNCATE TABLE documentinfo ;
TRUNCATE TABLE documentstatus ;
TRUNCATE TABLE documenttype ;
TRUNCATE TABLE actiontile ;
TRUNCATE TABLE activeusers ;
TRUNCATE TABLE annotation ;
TRUNCATE TABLE appassembly ;
TRUNCATE TABLE appassemblyreference ;
TRUNCATE TABLE apppartner ;
TRUNCATE TABLE clientcachedata ;
TRUNCATE TABLE culture ;
TRUNCATE TABLE customer ;
TRUNCATE TABLE desktoponprofile ;
TRUNCATE TABLE doctornote ;
TRUNCATE TABLE doctornoteanswer ;
TRUNCATE TABLE dynamicappdatatoprefill ;
TRUNCATE TABLE dynamicappmasterdata ;
TRUNCATE TABLE dynamicapppageofwizard ;
TRUNCATE TABLE dynamicappwizardmasterdata ;
TRUNCATE TABLE dynamicdatacontent ;
TRUNCATE TABLE dynamicdatacontentwizardrelationship ;
TRUNCATE TABLE dynamicdatarecord ;
TRUNCATE TABLE dynamicdatarecordscreenshot ;
TRUNCATE TABLE dynamicextendabletables ;
TRUNCATE TABLE dynamicfields ;
TRUNCATE TABLE dynamicsubtables ;
TRUNCATE TABLE function ;
TRUNCATE TABLE functionofpermissiongrid ;
TRUNCATE TABLE globaltables ;
TRUNCATE TABLE headlinefields ;
TRUNCATE TABLE history ;
TRUNCATE TABLE icon ;
TRUNCATE TABLE logentry ;
TRUNCATE TABLE manualactiontilestate ;
TRUNCATE TABLE masterdataexporttables ;
TRUNCATE TABLE mcrichtextboxdatacontent ;
TRUNCATE TABLE mcrichtextboxdatarecord ;
TRUNCATE TABLE mcrichtextboxdefaultvalue ;
TRUNCATE TABLE moduleinfo ;
TRUNCATE TABLE "option" ;
TRUNCATE TABLE patidokhistory ;
TRUNCATE TABLE permissiongrid ;
TRUNCATE TABLE phoneconnection ;
TRUNCATE TABLE popupentry ;
TRUNCATE TABLE popupheader ;
TRUNCATE TABLE popupmapping ;
TRUNCATE TABLE profile ;
TRUNCATE TABLE profileofuser ;
TRUNCATE TABLE refreshstate ;
TRUNCATE TABLE reportofapp ;
TRUNCATE TABLE reportpermission ;
TRUNCATE TABLE rssitem ;
TRUNCATE TABLE scopepermissiongridrelationship ;
TRUNCATE TABLE searchstructure ;
TRUNCATE TABLE searchstructureconfig ;
TRUNCATE TABLE searchstructuredata ;
TRUNCATE TABLE searchstructurefilter ;
TRUNCATE TABLE searchstructurehidden ;
TRUNCATE TABLE sequences ;
TRUNCATE TABLE serverconfig ;
TRUNCATE TABLE tempreportingobjects ;
TRUNCATE TABLE tenant ;
TRUNCATE TABLE tenantofuser ;
TRUNCATE TABLE textphrase ;
TRUNCATE TABLE tilecontext ;
TRUNCATE TABLE tilestyle ;
TRUNCATE TABLE timetracking ;
TRUNCATE TABLE timetrackingkeyword ;
TRUNCATE TABLE traceables ;
TRUNCATE TABLE translationdata ;
TRUNCATE TABLE translationdataclientcache ;
TRUNCATE TABLE translationsource ;
TRUNCATE TABLE translationtable ;
TRUNCATE TABLE uiapp ;
TRUNCATE TABLE uibuttononpage ;
TRUNCATE TABLE uidesktop ;
TRUNCATE TABLE uipage ;
TRUNCATE TABLE uipageondesktop ;
TRUNCATE TABLE "user" ;
TRUNCATE TABLE userconfig ;
TRUNCATE TABLE userenvironment ;
TRUNCATE TABLE wfactivity ;
TRUNCATE TABLE wftask ;
TRUNCATE TABLE wfcustomizedactivitytask ;
TRUNCATE TABLE hl7component ;
TRUNCATE TABLE hl7component2property ;
TRUNCATE TABLE hl7device ;
TRUNCATE TABLE hl7devicemessagetype ;
TRUNCATE TABLE hl7event ;
TRUNCATE TABLE hl7eventsegmentconfiguration ;
TRUNCATE TABLE hl7field ;
TRUNCATE TABLE hl7idmapper ;
TRUNCATE TABLE hl7mapper ;
TRUNCATE TABLE hl7mapper2component ;
TRUNCATE TABLE hl7mappingvalue ;
TRUNCATE TABLE hl7messagelog ;
TRUNCATE TABLE hl7messagetype ;
TRUNCATE TABLE hl7segment ;
TRUNCATE TABLE clientmission ;
TRUNCATE TABLE missiontype ;
TRUNCATE TABLE workflowmessage ;
TRUNCATE TABLE workflowtopic ;
TRUNCATE TABLE workflowtopicofuser ;
TRUNCATE TABLE assessment ;
TRUNCATE TABLE measurement ;
TRUNCATE TABLE medcaseconfig ;
TRUNCATE TABLE parameter ;
TRUNCATE TABLE unit ;
TRUNCATE TABLE "value" ;
TRUNCATE TABLE anamnesis ;
TRUNCATE TABLE anamnesisdiagnosis ;
TRUNCATE TABLE anamnesisdynamicappdata ;
TRUNCATE TABLE anamnesispathway ;
TRUNCATE TABLE lesionannotationstyle ;
TRUNCATE TABLE lesionassessment ;
TRUNCATE TABLE lesiondata ;
TRUNCATE TABLE nursingbasedata ;
TRUNCATE TABLE nursingbasedocumentrelationship ;
TRUNCATE TABLE nursingcaregiver ;
TRUNCATE TABLE nursingcaregroup ;
TRUNCATE TABLE nursingcaregroupbedrelationship ;
TRUNCATE TABLE nursingcaregroupphysicalcasedatarelationship ;
TRUNCATE TABLE nursingdiagnosisbasedatarelationship ;
TRUNCATE TABLE nursingdiagnosisdata ;
TRUNCATE TABLE nursingdiagnosisdatareferencerelationship ;
TRUNCATE TABLE nursingdiagnosisdocumentrelationship ;
TRUNCATE TABLE nursingdiagnosisoutcomerelationship ;
TRUNCATE TABLE nursingdynfieldtodiagorpathwayrelationship ;
TRUNCATE TABLE nursingoutcomedata ;
TRUNCATE TABLE nursingoutcomedocumentrelationship ;
TRUNCATE TABLE nursingoutcomeservicerelationship ;
TRUNCATE TABLE nursingreference ;
TRUNCATE TABLE nursingtododata ;
TRUNCATE TABLE pathway ;
TRUNCATE TABLE pathwaybasedata ;
TRUNCATE TABLE pathwaydiagnosis ;
TRUNCATE TABLE pathwaymaterial ;
TRUNCATE TABLE pathwayoutcome ;
TRUNCATE TABLE pathwayservice ;
TRUNCATE TABLE patientnursingbasedata ;
TRUNCATE TABLE patientnursingdiagnosis ;
TRUNCATE TABLE patientnursingmaterial ;
TRUNCATE TABLE patientnursingoutcome ;
TRUNCATE TABLE patientnursingservice ;
TRUNCATE TABLE patientnursingserviceduration ;
TRUNCATE TABLE patientnursingserviceinterval ;
TRUNCATE TABLE patientnursingservicetimepoint ;
TRUNCATE TABLE patientnursingtodo ;
TRUNCATE TABLE patientnursingtodopause ;
TRUNCATE TABLE serviceunitsofuser ;
TRUNCATE TABLE drug ;
TRUNCATE TABLE wound ;
TRUNCATE TABLE woundassessment ;
TRUNCATE TABLE woundassessmentdata ;
TRUNCATE TABLE woundassessmentimage ;
TRUNCATE TABLE wounddynamicrecordrelationship ;
TRUNCATE TABLE woundlocalizationcontrol ;
TRUNCATE TABLE woundlocalizationdata ;
TRUNCATE TABLE woundmeasurement ;
TRUNCATE TABLE woundmeasurementarea ;
TRUNCATE TABLE woundmeasurementpoint ;
TRUNCATE TABLE woundpatientnursingdiagnosisrelationship ;
TRUNCATE TABLE woundstate ;
TRUNCATE TABLE woundtype ;
TRUNCATE TABLE woundtyperelationship ;
TRUNCATE TABLE woundwizardpage ;
TRUNCATE TABLE allergy ;
TRUNCATE TABLE diagnosis ;
TRUNCATE TABLE growthchartmaindata ;
TRUNCATE TABLE patientallergy ;
TRUNCATE TABLE patientdiagnosis ;
TRUNCATE TABLE patienttentativediagnosis ;
TRUNCATE TABLE reportnote ;
TRUNCATE TABLE reportnotecategory ;
TRUNCATE TABLE reportnotetype ;
TRUNCATE TABLE vitalparameter ;
TRUNCATE TABLE vitalparameterarrangement ;
TRUNCATE TABLE vitalparameterarrangementrelationship ;
TRUNCATE TABLE vitalparametercollection ;
TRUNCATE TABLE vitalparametercollectionrelationship ;
TRUNCATE TABLE vitalparameterdata ;
TRUNCATE TABLE vitalparameterdynamicappdataorigin ;
TRUNCATE TABLE vitalparametergrowthitem ;
TRUNCATE TABLE vitalparameterlistitem ;
TRUNCATE TABLE laboratoryacquisition ;
TRUNCATE TABLE laboratoryanalysis ;
TRUNCATE TABLE laboratoryordermaterialrelationship ;
TRUNCATE TABLE laboratoryorderservice ;
TRUNCATE TABLE laboratoryprofile ;
TRUNCATE TABLE laboratoryprofiletoanalysisrelationship ;
TRUNCATE TABLE laboratoryscreen ;
TRUNCATE TABLE laboratoryscreenrelationship ;
TRUNCATE TABLE "order" ;
TRUNCATE TABLE orderservice ;
TRUNCATE TABLE orderservicematerialrelationship ;
TRUNCATE TABLE serviceunitstoscreenrelationship ;
TRUNCATE TABLE atcgroup ;
TRUNCATE TABLE drugdispenseconfirmation ;
TRUNCATE TABLE indicationgroup ;
TRUNCATE TABLE meddosage ;
TRUNCATE TABLE medinterval ;
TRUNCATE TABLE medondemand ;
TRUNCATE TABLE medprescription ;
TRUNCATE TABLE medtimepoint ;
TRUNCATE TABLE medicationactivesubstancedata ;
TRUNCATE TABLE medicationarticledata ;
TRUNCATE TABLE medicationdrug ;
TRUNCATE TABLE medicationdruginhousecatalogue ;
TRUNCATE TABLE medicationdrugtoactivesubstancerelation ;
TRUNCATE TABLE medicationdrugtoatcgrouprelation ;
TRUNCATE TABLE medicationdrugtoindicationgrouprelation ;
TRUNCATE TABLE medicationdrugtowarningrelation ;
TRUNCATE TABLE medicationwarning ;
TRUNCATE TABLE mimsrequest ;
TRUNCATE TABLE patientmeddosage ;
TRUNCATE TABLE patientmeddosagebalance ;
TRUNCATE TABLE patientmedexpense ;
TRUNCATE TABLE patientmedexpenseservice ;
TRUNCATE TABLE patientmedinterval ;
TRUNCATE TABLE patientmedondemand ;
TRUNCATE TABLE patientmedpause ;
TRUNCATE TABLE patientmedprescription ;
TRUNCATE TABLE patientmedprescriptionconfirmed ;
TRUNCATE TABLE patientmedtimepoint ;
TRUNCATE TABLE patientmedwarning ;
TRUNCATE TABLE pharmacyorder ;
TRUNCATE TABLE pharmacyorderitem ;
TRUNCATE TABLE pharmacyorderstatetransition ;
TRUNCATE TABLE pharmacyservice ;
TRUNCATE TABLE pharmacystock ;
TRUNCATE TABLE pharmacystockarticle ;
TRUNCATE TABLE pharmacystocktodepartmentrelation ;
TRUNCATE TABLE pharmacystocktoserviceunitrelation ;
TRUNCATE TABLE pharmacywarning ;
TRUNCATE TABLE casedatacommunication ;
TRUNCATE TABLE casedatacommunicationread ;
TRUNCATE TABLE message ;
TRUNCATE TABLE mediastorage ;

