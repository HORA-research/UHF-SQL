/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create history views
-- =========================================================================== A
*/

create or replace view "mimiciv_hosp@V@UHF".d_hcpcs_history AS
  with grouping as
    (
      select "code" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_since"
      union
      select "code" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_during"
      union
      select "code" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_hcpcs_category_history AS
  with grouping as
    (
      select "code" , 
             "category" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_category_since"
      union
      select "code" , 
             "category" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_category_during"
      union
      select "code" , 
             "category" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_category_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history AS
  with grouping as
    (
      select "code" , 
             "long_description" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_since"
      union
      select "code" , 
             "long_description" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during"
      union
      select "code" , 
             "long_description" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history AS
  with grouping as
    (
      select "code" , 
             "short_description" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_since"
      union
      select "code" , 
             "short_description" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during"
      union
      select "code" , 
             "short_description" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_icd_diagnoses_history AS
  with grouping as
    (
      select "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_since"
      union
      select "icd_code" , 
             "icd_version" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during"
      union
      select "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history AS
  with grouping as
    (
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_since"
      union
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during"
      union
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_icd_procedures_history AS
  with grouping as
    (
      select "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_since"
      union
      select "icd_code" , 
             "icd_version" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_during"
      union
      select "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history AS
  with grouping as
    (
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_since"
      union
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during"
      union
      select "icd_code" , 
             "icd_version" , 
             "long_title" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_labitems_history AS
  with grouping as
    (
      select "itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_since"
      union
      select "itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_during"
      union
      select "itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_labitems_label_history AS
  with grouping as
    (
      select "itemid" , 
             "label" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_label_since"
      union
      select "itemid" , 
             "label" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_label_during"
      union
      select "itemid" , 
             "label" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_label_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_labitems_fluid_history AS
  with grouping as
    (
      select "itemid" , 
             "fluid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_fluid_since"
      union
      select "itemid" , 
             "fluid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_fluid_during"
      union
      select "itemid" , 
             "fluid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_fluid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".d_labitems_category_history AS
  with grouping as
    (
      select "itemid" , 
             "category" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_category_since"
      union
      select "itemid" , 
             "category" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_category_during"
      union
      select "itemid" , 
             "category" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."d_labitems_category_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".omr_history AS
  with grouping as
    (
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_since"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_during"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".omr_result_name_history AS
  with grouping as
    (
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_name_since"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_name" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_name_during"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_name_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".omr_result_value_history AS
  with grouping as
    (
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_value" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_value_since"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_value" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_value_during"
      union
      select "subject_id" , 
             "chartdate" , 
             "seq_num" , 
             "result_value" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."omr_result_value_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_history AS
  with grouping as
    (
      select "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_since"
      union
      select "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_during"
      union
      select "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_gender_history AS
  with grouping as
    (
      select "subject_id" , 
             "gender" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_gender_since"
      union
      select "subject_id" , 
             "gender" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_gender_during"
      union
      select "subject_id" , 
             "gender" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_gender_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_anchor_age_history AS
  with grouping as
    (
      select "subject_id" , 
             "anchor_age" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_age_since"
      union
      select "subject_id" , 
             "anchor_age" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_age_during"
      union
      select "subject_id" , 
             "anchor_age" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_age_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_anchor_year_history AS
  with grouping as
    (
      select "subject_id" , 
             "anchor_year" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_since"
      union
      select "subject_id" , 
             "anchor_year" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_during"
      union
      select "subject_id" , 
             "anchor_year" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_anchor_year_group_history AS
  with grouping as
    (
      select "subject_id" , 
             "anchor_year_group" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_group_since"
      union
      select "subject_id" , 
             "anchor_year_group" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during"
      union
      select "subject_id" , 
             "anchor_year_group" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_anchor_year_group_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".patients_dod_history AS
  with grouping as
    (
      select "subject_id" , 
             "dod" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_dod_since"
      union
      select "subject_id" , 
             "dod" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_dod_during"
      union
      select "subject_id" , 
             "dod" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."patients_dod_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".provider_history AS
  with grouping as
    (
      select "provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."provider_since"
      union
      select "provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."provider_during"
      union
      select "provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."provider_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_history AS
  with grouping as
    (
      select "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_since"
      union
      select "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_during"
      union
      select "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_subject_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_subject_id_since"
      union
      select "hadm_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_subject_id_during"
      union
      select "hadm_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_admittime_history AS
  with grouping as
    (
      select "hadm_id" , 
             "admittime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admittime_since"
      union
      select "hadm_id" , 
             "admittime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admittime_during"
      union
      select "hadm_id" , 
             "admittime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admittime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_dischtime_history AS
  with grouping as
    (
      select "hadm_id" , 
             "dischtime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_dischtime_since"
      union
      select "hadm_id" , 
             "dischtime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_dischtime_during"
      union
      select "hadm_id" , 
             "dischtime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_dischtime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_deathtime_history AS
  with grouping as
    (
      select "hadm_id" , 
             "deathtime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_deathtime_since"
      union
      select "hadm_id" , 
             "deathtime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_deathtime_during"
      union
      select "hadm_id" , 
             "deathtime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_deathtime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_admission_type_history AS
  with grouping as
    (
      select "hadm_id" , 
             "admission_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_type_since"
      union
      select "hadm_id" , 
             "admission_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_type_during"
      union
      select "hadm_id" , 
             "admission_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "admit_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_since"
      union
      select "hadm_id" , 
             "admit_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during"
      union
      select "hadm_id" , 
             "admit_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_admission_location_history AS
  with grouping as
    (
      select "hadm_id" , 
             "admission_location" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_location_since"
      union
      select "hadm_id" , 
             "admission_location" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_location_during"
      union
      select "hadm_id" , 
             "admission_location" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_admission_location_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_discharge_location_history AS
  with grouping as
    (
      select "hadm_id" , 
             "discharge_location" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_discharge_location_since"
      union
      select "hadm_id" , 
             "discharge_location" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_discharge_location_during"
      union
      select "hadm_id" , 
             "discharge_location" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_discharge_location_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_insurance_history AS
  with grouping as
    (
      select "hadm_id" , 
             "insurance" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_insurance_since"
      union
      select "hadm_id" , 
             "insurance" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_insurance_during"
      union
      select "hadm_id" , 
             "insurance" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_insurance_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_language_history AS
  with grouping as
    (
      select "hadm_id" , 
             "language" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_language_since"
      union
      select "hadm_id" , 
             "language" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_language_during"
      union
      select "hadm_id" , 
             "language" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_language_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_marital_status_history AS
  with grouping as
    (
      select "hadm_id" , 
             "marital_status" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_marital_status_since"
      union
      select "hadm_id" , 
             "marital_status" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_marital_status_during"
      union
      select "hadm_id" , 
             "marital_status" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_marital_status_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_race_history AS
  with grouping as
    (
      select "hadm_id" , 
             "race" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_race_since"
      union
      select "hadm_id" , 
             "race" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_race_during"
      union
      select "hadm_id" , 
             "race" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_race_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_edregtime_history AS
  with grouping as
    (
      select "hadm_id" , 
             "edregtime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edregtime_since"
      union
      select "hadm_id" , 
             "edregtime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edregtime_during"
      union
      select "hadm_id" , 
             "edregtime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edregtime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_edouttime_history AS
  with grouping as
    (
      select "hadm_id" , 
             "edouttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edouttime_since"
      union
      select "hadm_id" , 
             "edouttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edouttime_during"
      union
      select "hadm_id" , 
             "edouttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_edouttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history AS
  with grouping as
    (
      select "hadm_id" , 
             "hospital_expire_flag" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_since"
      union
      select "hadm_id" , 
             "hospital_expire_flag" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during"
      union
      select "hadm_id" , 
             "hospital_expire_flag" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_history AS
  with grouping as
    (
      select "labevent_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_since"
      union
      select "labevent_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_during"
      union
      select "labevent_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_subject_id_history AS
  with grouping as
    (
      select "labevent_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_subject_id_since"
      union
      select "labevent_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_subject_id_during"
      union
      select "labevent_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_hadm_id_history AS
  with grouping as
    (
      select "labevent_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_hadm_id_since"
      union
      select "labevent_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_hadm_id_during"
      union
      select "labevent_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_specimen_id_history AS
  with grouping as
    (
      select "labevent_id" , 
             "specimen_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_specimen_id_since"
      union
      select "labevent_id" , 
             "specimen_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_specimen_id_during"
      union
      select "labevent_id" , 
             "specimen_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_specimen_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_itemid_history AS
  with grouping as
    (
      select "labevent_id" , 
             "itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_itemid_since"
      union
      select "labevent_id" , 
             "itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_itemid_during"
      union
      select "labevent_id" , 
             "itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_itemid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_order_provider_id_history AS
  with grouping as
    (
      select "labevent_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_order_provider_id_since"
      union
      select "labevent_id" , 
             "order_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during"
      union
      select "labevent_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_order_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_charttime_history AS
  with grouping as
    (
      select "labevent_id" , 
             "charttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_charttime_since"
      union
      select "labevent_id" , 
             "charttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_charttime_during"
      union
      select "labevent_id" , 
             "charttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_charttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_storetime_history AS
  with grouping as
    (
      select "labevent_id" , 
             "storetime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_storetime_since"
      union
      select "labevent_id" , 
             "storetime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_storetime_during"
      union
      select "labevent_id" , 
             "storetime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_storetime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_value_history AS
  with grouping as
    (
      select "labevent_id" , 
             "value" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_value_since"
      union
      select "labevent_id" , 
             "value" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_value_during"
      union
      select "labevent_id" , 
             "value" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_value_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_valuenum_history AS
  with grouping as
    (
      select "labevent_id" , 
             "valuenum" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valuenum_since"
      union
      select "labevent_id" , 
             "valuenum" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valuenum_during"
      union
      select "labevent_id" , 
             "valuenum" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valuenum_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_valueuom_history AS
  with grouping as
    (
      select "labevent_id" , 
             "valueuom" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valueuom_since"
      union
      select "labevent_id" , 
             "valueuom" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valueuom_during"
      union
      select "labevent_id" , 
             "valueuom" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_valueuom_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history AS
  with grouping as
    (
      select "labevent_id" , 
             "ref_range_lower" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_since"
      union
      select "labevent_id" , 
             "ref_range_lower" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during"
      union
      select "labevent_id" , 
             "ref_range_lower" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history AS
  with grouping as
    (
      select "labevent_id" , 
             "ref_range_upper" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_since"
      union
      select "labevent_id" , 
             "ref_range_upper" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during"
      union
      select "labevent_id" , 
             "ref_range_upper" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_flag_history AS
  with grouping as
    (
      select "labevent_id" , 
             "flag" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_flag_since"
      union
      select "labevent_id" , 
             "flag" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_flag_during"
      union
      select "labevent_id" , 
             "flag" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_flag_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_priority_history AS
  with grouping as
    (
      select "labevent_id" , 
             "priority" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_priority_since"
      union
      select "labevent_id" , 
             "priority" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_priority_during"
      union
      select "labevent_id" , 
             "priority" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_priority_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".labevents_comments_history AS
  with grouping as
    (
      select "labevent_id" , 
             "comments" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_comments_since"
      union
      select "labevent_id" , 
             "comments" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_comments_during"
      union
      select "labevent_id" , 
             "comments" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."labevents_comments_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_history AS
  with grouping as
    (
      select "transfer_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_since"
      union
      select "transfer_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_during"
      union
      select "transfer_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_subject_id_history AS
  with grouping as
    (
      select "transfer_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_subject_id_since"
      union
      select "transfer_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_subject_id_during"
      union
      select "transfer_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_hadm_id_history AS
  with grouping as
    (
      select "transfer_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_hadm_id_since"
      union
      select "transfer_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_hadm_id_during"
      union
      select "transfer_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_eventtype_history AS
  with grouping as
    (
      select "transfer_id" , 
             "eventtype" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_eventtype_since"
      union
      select "transfer_id" , 
             "eventtype" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_eventtype_during"
      union
      select "transfer_id" , 
             "eventtype" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_eventtype_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_careunit_history AS
  with grouping as
    (
      select "transfer_id" , 
             "careunit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_careunit_since"
      union
      select "transfer_id" , 
             "careunit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_careunit_during"
      union
      select "transfer_id" , 
             "careunit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_careunit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_intime_history AS
  with grouping as
    (
      select "transfer_id" , 
             "intime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_intime_since"
      union
      select "transfer_id" , 
             "intime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_intime_during"
      union
      select "transfer_id" , 
             "intime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_intime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".transfers_outtime_history AS
  with grouping as
    (
      select "transfer_id" , 
             "outtime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_outtime_since"
      union
      select "transfer_id" , 
             "outtime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_outtime_during"
      union
      select "transfer_id" , 
             "outtime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."transfers_outtime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".diagnoses_icd_history AS
  with grouping as
    (
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_since"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_during"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_since"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".drgcodes_history AS
  with grouping as
    (
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_since"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_during"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".drgcodes_drg_type_history AS
  with grouping as
    (
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_type_since"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".drgcodes_description_history AS
  with grouping as
    (
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "description" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_description_since"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "description" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_description_during"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "description" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_description_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history AS
  with grouping as
    (
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_severity" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_since"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_severity" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_severity" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history AS
  with grouping as
    (
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_mortality" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_since"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_mortality" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during"
      union
      select "subject_id" , 
             "hadm_id" , 
             "drg_code" , 
             "drg_mortality" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_history AS
  with grouping as
    (
      select "emar_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_since"
      union
      select "emar_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_during"
      union
      select "emar_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_subject_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_subject_id_since"
      union
      select "emar_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_subject_id_during"
      union
      select "emar_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_hadm_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_hadm_id_since"
      union
      select "emar_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_hadm_id_during"
      union
      select "emar_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_emar_seq_history AS
  with grouping as
    (
      select "emar_id" , 
             "emar_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_emar_seq_since"
      union
      select "emar_id" , 
             "emar_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_emar_seq_during"
      union
      select "emar_id" , 
             "emar_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_emar_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_poe_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_poe_id_since"
      union
      select "emar_id" , 
             "poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_poe_id_during"
      union
      select "emar_id" , 
             "poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_poe_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_pharmacy_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "pharmacy_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_pharmacy_id_since"
      union
      select "emar_id" , 
             "pharmacy_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during"
      union
      select "emar_id" , 
             "pharmacy_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_pharmacy_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_enter_provider_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "enter_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_enter_provider_id_since"
      union
      select "emar_id" , 
             "enter_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during"
      union
      select "emar_id" , 
             "enter_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_enter_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_charttime_history AS
  with grouping as
    (
      select "emar_id" , 
             "charttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_charttime_since"
      union
      select "emar_id" , 
             "charttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_charttime_during"
      union
      select "emar_id" , 
             "charttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_charttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_medication_history AS
  with grouping as
    (
      select "emar_id" , 
             "medication" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_medication_since"
      union
      select "emar_id" , 
             "medication" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_medication_during"
      union
      select "emar_id" , 
             "medication" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_medication_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_event_txt_history AS
  with grouping as
    (
      select "emar_id" , 
             "event_txt" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_event_txt_since"
      union
      select "emar_id" , 
             "event_txt" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_event_txt_during"
      union
      select "emar_id" , 
             "event_txt" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_event_txt_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_scheduletime_history AS
  with grouping as
    (
      select "emar_id" , 
             "scheduletime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_scheduletime_since"
      union
      select "emar_id" , 
             "scheduletime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_scheduletime_during"
      union
      select "emar_id" , 
             "scheduletime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_scheduletime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_storetime_history AS
  with grouping as
    (
      select "emar_id" , 
             "storetime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_storetime_since"
      union
      select "emar_id" , 
             "storetime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_storetime_during"
      union
      select "emar_id" , 
             "storetime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_storetime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".hcpcsevents_history AS
  with grouping as
    (
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_since"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_during"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_since"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history AS
  with grouping as
    (
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "chartdate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_since"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "chartdate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "chartdate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history AS
  with grouping as
    (
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "short_description" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_since"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "short_description" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during"
      union
      select "hadm_id" , 
             "hcpcs_cd" , 
             "seq_num" , 
             "short_description" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_history AS
  with grouping as
    (
      select "microevent_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_since"
      union
      select "microevent_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_during"
      union
      select "microevent_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history AS
  with grouping as
    (
      select "microevent_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_since"
      union
      select "microevent_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during"
      union
      select "microevent_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history AS
  with grouping as
    (
      select "microevent_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_since"
      union
      select "microevent_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during"
      union
      select "microevent_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history AS
  with grouping as
    (
      select "microevent_id" , 
             "micro_specimen_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_since"
      union
      select "microevent_id" , 
             "micro_specimen_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during"
      union
      select "microevent_id" , 
             "micro_specimen_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history AS
  with grouping as
    (
      select "microevent_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_since"
      union
      select "microevent_id" , 
             "order_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during"
      union
      select "microevent_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history AS
  with grouping as
    (
      select "microevent_id" , 
             "chartdate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_since"
      union
      select "microevent_id" , 
             "chartdate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during"
      union
      select "microevent_id" , 
             "chartdate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history AS
  with grouping as
    (
      select "microevent_id" , 
             "charttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_since"
      union
      select "microevent_id" , 
             "charttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during"
      union
      select "microevent_id" , 
             "charttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history AS
  with grouping as
    (
      select "microevent_id" , 
             "spec_itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_since"
      union
      select "microevent_id" , 
             "spec_itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during"
      union
      select "microevent_id" , 
             "spec_itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history AS
  with grouping as
    (
      select "microevent_id" , 
             "spec_type_desc" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_since"
      union
      select "microevent_id" , 
             "spec_type_desc" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during"
      union
      select "microevent_id" , 
             "spec_type_desc" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history AS
  with grouping as
    (
      select "microevent_id" , 
             "test_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_since"
      union
      select "microevent_id" , 
             "test_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during"
      union
      select "microevent_id" , 
             "test_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history AS
  with grouping as
    (
      select "microevent_id" , 
             "storedate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_since"
      union
      select "microevent_id" , 
             "storedate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during"
      union
      select "microevent_id" , 
             "storedate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history AS
  with grouping as
    (
      select "microevent_id" , 
             "storetime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_since"
      union
      select "microevent_id" , 
             "storetime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during"
      union
      select "microevent_id" , 
             "storetime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history AS
  with grouping as
    (
      select "microevent_id" , 
             "test_itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_since"
      union
      select "microevent_id" , 
             "test_itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during"
      union
      select "microevent_id" , 
             "test_itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history AS
  with grouping as
    (
      select "microevent_id" , 
             "test_name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_since"
      union
      select "microevent_id" , 
             "test_name" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during"
      union
      select "microevent_id" , 
             "test_name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history AS
  with grouping as
    (
      select "microevent_id" , 
             "org_itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_since"
      union
      select "microevent_id" , 
             "org_itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during"
      union
      select "microevent_id" , 
             "org_itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history AS
  with grouping as
    (
      select "microevent_id" , 
             "org_name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_since"
      union
      select "microevent_id" , 
             "org_name" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during"
      union
      select "microevent_id" , 
             "org_name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history AS
  with grouping as
    (
      select "microevent_id" , 
             "isolate_num" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_since"
      union
      select "microevent_id" , 
             "isolate_num" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during"
      union
      select "microevent_id" , 
             "isolate_num" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history AS
  with grouping as
    (
      select "microevent_id" , 
             "quantity" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_since"
      union
      select "microevent_id" , 
             "quantity" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during"
      union
      select "microevent_id" , 
             "quantity" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history AS
  with grouping as
    (
      select "microevent_id" , 
             "ab_itemid" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_since"
      union
      select "microevent_id" , 
             "ab_itemid" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during"
      union
      select "microevent_id" , 
             "ab_itemid" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history AS
  with grouping as
    (
      select "microevent_id" , 
             "ab_name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_since"
      union
      select "microevent_id" , 
             "ab_name" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during"
      union
      select "microevent_id" , 
             "ab_name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history AS
  with grouping as
    (
      select "microevent_id" , 
             "dilution_text" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_since"
      union
      select "microevent_id" , 
             "dilution_text" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during"
      union
      select "microevent_id" , 
             "dilution_text" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history AS
  with grouping as
    (
      select "microevent_id" , 
             "dilution_comparison" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_since"
      union
      select "microevent_id" , 
             "dilution_comparison" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during"
      union
      select "microevent_id" , 
             "dilution_comparison" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history AS
  with grouping as
    (
      select "microevent_id" , 
             "dilution_value" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_since"
      union
      select "microevent_id" , 
             "dilution_value" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during"
      union
      select "microevent_id" , 
             "dilution_value" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history AS
  with grouping as
    (
      select "microevent_id" , 
             "interpretation" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_since"
      union
      select "microevent_id" , 
             "interpretation" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during"
      union
      select "microevent_id" , 
             "interpretation" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".microbiologyevents_comments_history AS
  with grouping as
    (
      select "microevent_id" , 
             "comments" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_comments_since"
      union
      select "microevent_id" , 
             "comments" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during"
      union
      select "microevent_id" , 
             "comments" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."microbiologyevents_comments_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_since"
      union
      select "pharmacy_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_during"
      union
      select "pharmacy_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_subject_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_subject_id_since"
      union
      select "pharmacy_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during"
      union
      select "pharmacy_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_since"
      union
      select "pharmacy_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during"
      union
      select "pharmacy_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_poe_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_poe_id_since"
      union
      select "pharmacy_id" , 
             "poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during"
      union
      select "pharmacy_id" , 
             "poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_poe_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_starttime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "starttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_starttime_since"
      union
      select "pharmacy_id" , 
             "starttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_starttime_during"
      union
      select "pharmacy_id" , 
             "starttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_starttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_stoptime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "stoptime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_stoptime_since"
      union
      select "pharmacy_id" , 
             "stoptime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during"
      union
      select "pharmacy_id" , 
             "stoptime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_stoptime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_medication_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "medication" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_medication_since"
      union
      select "pharmacy_id" , 
             "medication" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_medication_during"
      union
      select "pharmacy_id" , 
             "medication" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_medication_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_proc_type_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "proc_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_proc_type_since"
      union
      select "pharmacy_id" , 
             "proc_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during"
      union
      select "pharmacy_id" , 
             "proc_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_proc_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_status_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "status" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_status_since"
      union
      select "pharmacy_id" , 
             "status" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_status_during"
      union
      select "pharmacy_id" , 
             "status" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_status_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_entertime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "entertime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_entertime_since"
      union
      select "pharmacy_id" , 
             "entertime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_entertime_during"
      union
      select "pharmacy_id" , 
             "entertime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_entertime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "verifiedtime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_since"
      union
      select "pharmacy_id" , 
             "verifiedtime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during"
      union
      select "pharmacy_id" , 
             "verifiedtime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_route_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "route" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_route_since"
      union
      select "pharmacy_id" , 
             "route" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_route_during"
      union
      select "pharmacy_id" , 
             "route" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_route_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_frequency_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "frequency" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_frequency_since"
      union
      select "pharmacy_id" , 
             "frequency" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_frequency_during"
      union
      select "pharmacy_id" , 
             "frequency" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_frequency_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "disp_sched" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_since"
      union
      select "pharmacy_id" , 
             "disp_sched" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during"
      union
      select "pharmacy_id" , 
             "disp_sched" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "infusion_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_since"
      union
      select "pharmacy_id" , 
             "infusion_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during"
      union
      select "pharmacy_id" , 
             "infusion_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "sliding_scale" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_since"
      union
      select "pharmacy_id" , 
             "sliding_scale" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during"
      union
      select "pharmacy_id" , 
             "sliding_scale" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "lockout_interval" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_since"
      union
      select "pharmacy_id" , 
             "lockout_interval" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during"
      union
      select "pharmacy_id" , 
             "lockout_interval" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "basal_rate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_since"
      union
      select "pharmacy_id" , 
             "basal_rate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during"
      union
      select "pharmacy_id" , 
             "basal_rate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "one_hr_max" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_since"
      union
      select "pharmacy_id" , 
             "one_hr_max" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during"
      union
      select "pharmacy_id" , 
             "one_hr_max" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "doses_per_24_hrs" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_since"
      union
      select "pharmacy_id" , 
             "doses_per_24_hrs" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during"
      union
      select "pharmacy_id" , 
             "doses_per_24_hrs" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_duration_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "duration" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_since"
      union
      select "pharmacy_id" , 
             "duration" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_during"
      union
      select "pharmacy_id" , 
             "duration" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "duration_interval" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_since"
      union
      select "pharmacy_id" , 
             "duration_interval" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during"
      union
      select "pharmacy_id" , 
             "duration_interval" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "expiration_value" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_since"
      union
      select "pharmacy_id" , 
             "expiration_value" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during"
      union
      select "pharmacy_id" , 
             "expiration_value" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "expiration_unit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_since"
      union
      select "pharmacy_id" , 
             "expiration_unit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during"
      union
      select "pharmacy_id" , 
             "expiration_unit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "expirationdate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_since"
      union
      select "pharmacy_id" , 
             "expirationdate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during"
      union
      select "pharmacy_id" , 
             "expirationdate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_dispensation_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "dispensation" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_dispensation_since"
      union
      select "pharmacy_id" , 
             "dispensation" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during"
      union
      select "pharmacy_id" , 
             "dispensation" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_dispensation_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "fill_quantity" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_since"
      union
      select "pharmacy_id" , 
             "fill_quantity" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during"
      union
      select "pharmacy_id" , 
             "fill_quantity" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_history AS
  with grouping as
    (
      select "poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_since"
      union
      select "poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_during"
      union
      select "poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_poe_seq_history AS
  with grouping as
    (
      select "poe_id" , 
             "poe_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_poe_seq_since"
      union
      select "poe_id" , 
             "poe_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_poe_seq_during"
      union
      select "poe_id" , 
             "poe_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_poe_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_subject_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_subject_id_since"
      union
      select "poe_id" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_subject_id_during"
      union
      select "poe_id" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_hadm_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_hadm_id_since"
      union
      select "poe_id" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_hadm_id_during"
      union
      select "poe_id" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_ordertime_history AS
  with grouping as
    (
      select "poe_id" , 
             "ordertime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_ordertime_since"
      union
      select "poe_id" , 
             "ordertime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_ordertime_during"
      union
      select "poe_id" , 
             "ordertime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_ordertime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_order_type_history AS
  with grouping as
    (
      select "poe_id" , 
             "order_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_type_since"
      union
      select "poe_id" , 
             "order_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_type_during"
      union
      select "poe_id" , 
             "order_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_order_subtype_history AS
  with grouping as
    (
      select "poe_id" , 
             "order_subtype" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_subtype_since"
      union
      select "poe_id" , 
             "order_subtype" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_subtype_during"
      union
      select "poe_id" , 
             "order_subtype" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_subtype_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_transaction_type_history AS
  with grouping as
    (
      select "poe_id" , 
             "transaction_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_transaction_type_since"
      union
      select "poe_id" , 
             "transaction_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_transaction_type_during"
      union
      select "poe_id" , 
             "transaction_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_transaction_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "discontinue_of_poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_since"
      union
      select "poe_id" , 
             "discontinue_of_poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during"
      union
      select "poe_id" , 
             "discontinue_of_poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "discontinued_by_poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_since"
      union
      select "poe_id" , 
             "discontinued_by_poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during"
      union
      select "poe_id" , 
             "discontinued_by_poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_order_provider_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_provider_id_since"
      union
      select "poe_id" , 
             "order_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_provider_id_during"
      union
      select "poe_id" , 
             "order_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_order_status_history AS
  with grouping as
    (
      select "poe_id" , 
             "order_status" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_status_since"
      union
      select "poe_id" , 
             "order_status" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_status_during"
      union
      select "poe_id" , 
             "order_status" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_order_status_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_subject_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_subject_id_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "hadm_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "hadm_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "hadm_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_poe_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_id_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "poe_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "order_provider_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "order_provider_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "order_provider_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_starttime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "starttime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_starttime_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "starttime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_starttime_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "starttime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_starttime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_stoptime_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "stoptime" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_stoptime_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "stoptime" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "stoptime" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_stoptime_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "formulary_drug_cd" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "formulary_drug_cd" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "formulary_drug_cd" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_gsn_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "gsn" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_gsn_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "gsn" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_gsn_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "gsn" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_gsn_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_ndc_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "ndc" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_ndc_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "ndc" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_ndc_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "ndc" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_ndc_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "prod_strength" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "prod_strength" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "prod_strength" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_form_rx_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_rx" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_rx_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_rx" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_rx" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_rx_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_val_rx" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_val_rx" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_val_rx" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_unit_rx" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_unit_rx" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "dose_unit_rx" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_val_disp" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_val_disp" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_val_disp" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_unit_disp" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_unit_disp" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "form_unit_disp" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "doses_per_24_hrs" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "doses_per_24_hrs" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "doses_per_24_hrs" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".prescriptions_route_history AS
  with grouping as
    (
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "route" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_route_since"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "route" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_route_during"
      union
      select "pharmacy_id" , 
             "drug_type" , 
             "drug" , 
             "route" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."prescriptions_route_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".procedures_icd_history AS
  with grouping as
    (
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_since"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_during"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_since"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history AS
  with grouping as
    (
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "chartdate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_since"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "chartdate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during"
      union
      select "hadm_id" , 
             "seq_num" , 
             "icd_code" , 
             "icd_version" , 
             "chartdate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".services_history AS
  with grouping as
    (
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_since"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_during"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".services_subject_id_history AS
  with grouping as
    (
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_subject_id_since"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_subject_id_during"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".services_prev_service_history AS
  with grouping as
    (
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "prev_service" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_prev_service_since"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "prev_service" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_prev_service_during"
      union
      select "hadm_id" , 
             "transfertime" , 
             "curr_service" , 
             "prev_service" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."services_prev_service_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_subject_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_subject_id_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "emar_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "emar_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "emar_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_administration_type_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "administration_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_administration_type_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "administration_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "administration_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_administration_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "pharmacy_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "pharmacy_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "pharmacy_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "barcode_type" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "barcode_type" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "barcode_type" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "reason_for_no_barcode" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "reason_for_no_barcode" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "reason_for_no_barcode" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "complete_dose_not_given" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "complete_dose_not_given" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "complete_dose_not_given" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_dose_due_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due_unit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due_unit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_due_unit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_dose_given_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given_unit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given_unit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "dose_given_unit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "will_remainder_of_dose_be_given" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "will_remainder_of_dose_be_given" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "will_remainder_of_dose_be_given" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_amount_given" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_amount_given" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_amount_given" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_product_unit_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_unit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_unit_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_unit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_unit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_unit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_product_code_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_code" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_code_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_code" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_code_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_code" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_code_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_product_description_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description_other" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description_other" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "product_description_other" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "prior_infusion_rate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "prior_infusion_rate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "prior_infusion_rate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment_amount" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment_amount" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_adjustment_amount" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_unit" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_unit" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_rate_unit" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_route_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "route" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_route_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "route" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_route_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "route" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_route_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_complete" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_complete" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "infusion_complete" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "completion_interval" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "completion_interval" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "completion_interval" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "new_iv_bag_hung" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "new_iv_bag_hung" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "new_iv_bag_hung" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "continued_infusion_in_other_location" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "continued_infusion_in_other_location" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "continued_infusion_in_other_location" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "restart_interval" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "restart_interval" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "restart_interval" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_side_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "side" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_side_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "side" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_side_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "side" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_side_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_site_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "site" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_site_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "site" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_site_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "site" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_site_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history AS
  with grouping as
    (
      select "emar_id" , 
             "parent_field_ordinal" , 
             "non_formulary_visual_verification" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_since"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "non_formulary_visual_verification" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during"
      union
      select "emar_id" , 
             "parent_field_ordinal" , 
             "non_formulary_visual_verification" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_detail_history AS
  with grouping as
    (
      select "poe_id" , 
             "field_name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_since"
      union
      select "poe_id" , 
             "field_name" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_during"
      union
      select "poe_id" , 
             "field_name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history AS
  with grouping as
    (
      select "poe_id" , 
             "field_name" , 
             "poe_seq" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_since"
      union
      select "poe_id" , 
             "field_name" , 
             "poe_seq" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during"
      union
      select "poe_id" , 
             "field_name" , 
             "poe_seq" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_detail_subject_id_history AS
  with grouping as
    (
      select "poe_id" , 
             "field_name" , 
             "subject_id" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_subject_id_since"
      union
      select "poe_id" , 
             "field_name" , 
             "subject_id" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during"
      union
      select "poe_id" , 
             "field_name" , 
             "subject_id" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_subject_id_until"
    )
  select *
  from grouping;

create or replace view "mimiciv_hosp@V@UHF".poe_detail_field_value_history AS
  with grouping as
    (
      select "poe_id" , 
             "field_name" , 
             "field_value" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_field_value_since"
      union
      select "poe_id" , 
             "field_name" , 
             "field_value" , 
             "during"  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_field_value_during"
      union
      select "poe_id" , 
             "field_name" , 
             "field_value" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "mimiciv_hosp@V@UHF"."poe_detail_field_value_until"
    )
  select *
  from grouping;

