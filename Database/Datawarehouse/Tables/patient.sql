--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.24
-- Dumped by pg_dump version 9.6.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: patient; Type: TABLE; Schema: datawarehouse; Owner: gpadmin
--

CREATE TABLE datawarehouse.patient (
    id bigint NOT NULL,
    created_by character varying(250),
    created_date timestamp without time zone,
    updated_by character varying(250),
    updated_date timestamp without time zone,
    index boolean,
    birth_dt timestamp without time zone,
    birthplace character varying(255),
    citizenship character varying(255),
    death_dt timestamp without time zone,
    deceased boolean,
    gender character varying(255),
    identity_reliability character varying(255),
    pin character varying(255),
    unknown_identity boolean,
    ethnic_group character varying(255),
    language character varying(255),
    marital_status character varying(255),
    nationality character varying(255),
    occupation character varying(255),
    prod_class character varying(255),
    race character varying(255),
    religion character varying(255),
    strain character varying(255),
    degree character varying(255),
    family_name character varying(255),
    given_name character varying(255),
    middle_name character varying(255),
    prefix character varying(255),
    suffix character varying(255),
    reservation_flag boolean,
    version bigint,
    email_address character varying(255),
    absconded boolean,
    absconded_dt timestamp without time zone,
    alias character varying(255),
    alias_actual_path character varying(255),
    alias_content_type character varying(255),
    alias_filename character varying(255),
    alias_uuid character varying(255),
    use_alias boolean,
    allergy_id bigint,
    deactivated boolean,
    deactivated_dt timestamp without time zone,
    deactivated_reason character varying(255),
    photo_actual_path character varying(255),
    photo_content_type character varying(255),
    photo_filename character varying(255),
    photo_uuid character varying(255),
    encounter_id bigint,
    height character varying(255),
    weight character varying(255),
    height_unit character varying(255),
    weight_unit character varying(255),
    business_company_name character varying(255),
    old_patient_id character varying(255),
    extract_flag character(1),
    maiden_family_name character varying(255),
    maiden_given_name character varying(255),
    maiden_middle_name character varying(255),
    maiden_suffix character varying(255),
    maiden_prefix character varying(255),
    maiden_degree character varying(255),
    dual_citizenship boolean,
    dms_extract_flag character(1),
    created_by_name character varying(255),
    phic_flag character(1),
    phic_pat_id bigint
);


ALTER TABLE datawarehouse.patient OWNER TO gpadmin;

--
-- Name: patient patientpk; Type: CONSTRAINT; Schema: datawarehouse; Owner: gpadmin
--

ALTER TABLE ONLY datawarehouse.patient
    ADD CONSTRAINT patientpk PRIMARY KEY (id);


--
-- Name: patient_deactivated_idx; Type: INDEX; Schema: datawarehouse; Owner: gpadmin
--

CREATE INDEX patient_deactivated_idx ON datawarehouse.patient USING btree (deactivated);


--
-- Name: patient_id_version_idx; Type: INDEX; Schema: datawarehouse; Owner: gpadmin
--

CREATE INDEX patient_id_version_idx ON datawarehouse.patient USING btree (id, version);


--
-- Name: patient_phic_flag_idx; Type: INDEX; Schema: datawarehouse; Owner: gpadmin
--

CREATE INDEX patient_phic_flag_idx ON datawarehouse.patient USING btree (phic_flag);


--
-- PostgreSQL database dump complete
--

