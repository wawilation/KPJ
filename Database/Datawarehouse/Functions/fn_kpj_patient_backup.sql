CREATE OR REPLACE FUNCTION fn_kpj_patient() RETURNS VOID AS $$
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

DROP TABLE IF EXISTS tmp_sfa_channel;

SET client_min_messages = notice;

CREATE TEMPORARY TABLE tmp_sfa_channel
(pkid int,
sdesc varchar(60),
--isactive boolean,
isactive char(1),
date_added timestamp with time zone,
added_by varchar(15),
date_modified timestamp with time zone,
modified_by varchar(15)
) DISTRIBUTED BY (pkid);

--INSERT INTO tmp_sfa_channel SELECT * FROM pxf_sfa_channel;
--INSERT INTO tmp_sfa_channel SELECT * FROM pxf_sfa_channel WHERE isactive = '1' EXCEPT SELECT * FROM sfa_channel;
INSERT INTO tmp_sfa_channel SELECT * FROM pxf_sfa_channel EXCEPT SELECT * FROM sfa_channel;

LOCK TABLE sfa_channel IN EXCLUSIVE MODE;

UPDATE sfa_channel
SET 
pkid = tmp_sfa_channel.pkid,
sdesc = tmp_sfa_channel.sdesc,
isactive = tmp_sfa_channel.isactive,
date_added = tmp_sfa_channel.date_added,
added_by = tmp_sfa_channel.added_by,
date_modified = tmp_sfa_channel.date_modified,
modified_by = tmp_sfa_channel.modified_by
FROM tmp_sfa_channel
WHERE tmp_sfa_channel.pkid = sfa_channel.pkid;

GET DIAGNOSTICS update_rec_count = ROW_COUNT;

INSERT INTO sfa_channel
SELECT tmp_sfa_channel.*
FROM tmp_sfa_channel
LEFT OUTER JOIN sfa_channel ON (sfa_channel.pkid = tmp_sfa_channel.pkid)
WHERE sfa_channel.pkid IS NULL;

GET DIAGNOSTICS insert_rec_count = ROW_COUNT;

TRUNCATE TABLE tmp_sfa_channel;
INSERT INTO tmp_sfa_channel SELECT * FROM sfa_channel EXCEPT SELECT * FROM pxf_sfa_channel;

DELETE FROM sfa_channel WHERE pkid IN (SELECT pkid FROM tmp_sfa_channel);

/**DELETE FROM sfa_channel WHERE pkid IN
(SELECT sfa_channel.pkid
FROM tmp_sfa_channel
RIGHT OUTER JOIN sfa_channel ON (sfa_channel.pkid = tmp_sfa_channel.pkid)
WHERE tmp_sfa_channel.pkid IS NULL);**/

GET DIAGNOSTICS del_rec_count = ROW_COUNT;

RAISE INFO '**************************************************';
RAISE INFO 'TABLE: sfa_channel';
RAISE INFO 'DATE: %', NOW();
RAISE INFO 'STATUS: % rows updated; % rows inserted; % rows deleted', update_rec_count, insert_rec_count, del_rec_count;
end_time := clock_timestamp();
RAISE INFO 'DURATION: % seconds', EXTRACT(EPOCH FROM (end_time -  start_time));
RAISE INFO '**************************************************';

END;
$$ LANGUAGE plpgsql;
