/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create temporal constraints
-- =========================================================================== A
*/

-- No redundancy constraint for d_hcpcs_short_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during"
  add constraint d_hcpcs_short_description_during_redundancy
  exclude using gist("code" WITH =, "short_description" WITH =,"during" WITH &&);

comment on constraint d_hcpcs_short_description_during_redundancy on "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during" is 'Check redundancy constraint for d_hcpcs_short_description_during';

-- No redundancy constraint for d_hcpcs_long_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during"
  add constraint d_hcpcs_long_description_during_redundancy
  exclude using gist("code" WITH =, "long_description" WITH =,"during" WITH &&);

comment on constraint d_hcpcs_long_description_during_redundancy on "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during" is 'Check redundancy constraint for d_hcpcs_long_description_during';

-- No redundancy constraint for d_hcpcs_category_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during"
  add constraint d_hcpcs_category_during_redundancy
  exclude using gist("code" WITH =, "category" WITH =,"during" WITH &&);

comment on constraint d_hcpcs_category_during_redundancy on "mimiciv_hosp@V@UHF"."d_hcpcs_category_during" is 'Check redundancy constraint for d_hcpcs_category_during';

-- No redundancy constraint for d_hcpcs_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_during"
  add constraint d_hcpcs_during_redundancy
  exclude using gist("code" WITH =,"during" WITH &&);

comment on constraint d_hcpcs_during_redundancy on "mimiciv_hosp@V@UHF"."d_hcpcs_during" is 'Check redundancy constraint for d_hcpcs_during';

-- No redundancy constraint for d_icd_diagnoses_during
alter table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during"
  add constraint d_icd_diagnoses_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =,"during" WITH &&);

comment on constraint d_icd_diagnoses_during_redundancy on "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during" is 'Check redundancy constraint for d_icd_diagnoses_during';

-- No redundancy constraint for d_icd_diagnoses_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during"
  add constraint d_icd_diagnoses_long_title_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "long_title" WITH =,"during" WITH &&);

comment on constraint d_icd_diagnoses_long_title_during_redundancy on "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during" is 'Check redundancy constraint for d_icd_diagnoses_long_title_during';

-- No redundancy constraint for d_icd_procedures_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during"
  add constraint d_icd_procedures_long_title_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "long_title" WITH =,"during" WITH &&);

comment on constraint d_icd_procedures_long_title_during_redundancy on "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during" is 'Check redundancy constraint for d_icd_procedures_long_title_during';

-- No redundancy constraint for d_icd_procedures_during
alter table "mimiciv_hosp@V@UHF"."d_icd_procedures_during"
  add constraint d_icd_procedures_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =,"during" WITH &&);

comment on constraint d_icd_procedures_during_redundancy on "mimiciv_hosp@V@UHF"."d_icd_procedures_during" is 'Check redundancy constraint for d_icd_procedures_during';

-- No redundancy constraint for d_labitems_label_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_label_during"
  add constraint d_labitems_label_during_redundancy
  exclude using gist("itemid" WITH =, "label" WITH =,"during" WITH &&);

comment on constraint d_labitems_label_during_redundancy on "mimiciv_hosp@V@UHF"."d_labitems_label_during" is 'Check redundancy constraint for d_labitems_label_during';

-- No redundancy constraint for d_labitems_fluid_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during"
  add constraint d_labitems_fluid_during_redundancy
  exclude using gist("itemid" WITH =, "fluid" WITH =,"during" WITH &&);

comment on constraint d_labitems_fluid_during_redundancy on "mimiciv_hosp@V@UHF"."d_labitems_fluid_during" is 'Check redundancy constraint for d_labitems_fluid_during';

-- No redundancy constraint for d_labitems_category_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_category_during"
  add constraint d_labitems_category_during_redundancy
  exclude using gist("itemid" WITH =, "category" WITH =,"during" WITH &&);

comment on constraint d_labitems_category_during_redundancy on "mimiciv_hosp@V@UHF"."d_labitems_category_during" is 'Check redundancy constraint for d_labitems_category_during';

-- No redundancy constraint for d_labitems_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_during"
  add constraint d_labitems_during_redundancy
  exclude using gist("itemid" WITH =,"during" WITH &&);

comment on constraint d_labitems_during_redundancy on "mimiciv_hosp@V@UHF"."d_labitems_during" is 'Check redundancy constraint for d_labitems_during';

-- No redundancy constraint for omr_result_name_during
alter table "mimiciv_hosp@V@UHF"."omr_result_name_during"
  add constraint omr_result_name_during_redundancy
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH =, "result_name" WITH =,"during" WITH &&);

comment on constraint omr_result_name_during_redundancy on "mimiciv_hosp@V@UHF"."omr_result_name_during" is 'Check redundancy constraint for omr_result_name_during';

-- No redundancy constraint for omr_result_value_during
alter table "mimiciv_hosp@V@UHF"."omr_result_value_during"
  add constraint omr_result_value_during_redundancy
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH =, "result_value" WITH =,"during" WITH &&);

comment on constraint omr_result_value_during_redundancy on "mimiciv_hosp@V@UHF"."omr_result_value_during" is 'Check redundancy constraint for omr_result_value_during';

-- No redundancy constraint for omr_during
alter table "mimiciv_hosp@V@UHF"."omr_during"
  add constraint omr_during_redundancy
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH =,"during" WITH &&);

comment on constraint omr_during_redundancy on "mimiciv_hosp@V@UHF"."omr_during" is 'Check redundancy constraint for omr_during';

-- No redundancy constraint for patients_gender_during
alter table "mimiciv_hosp@V@UHF"."patients_gender_during"
  add constraint patients_gender_during_redundancy
  exclude using gist("subject_id" WITH =, "gender" WITH =,"during" WITH &&);

comment on constraint patients_gender_during_redundancy on "mimiciv_hosp@V@UHF"."patients_gender_during" is 'Check redundancy constraint for patients_gender_during';

-- No redundancy constraint for patients_dod_during
alter table "mimiciv_hosp@V@UHF"."patients_dod_during"
  add constraint patients_dod_during_redundancy
  exclude using gist("subject_id" WITH =, "dod" WITH =,"during" WITH &&);

comment on constraint patients_dod_during_redundancy on "mimiciv_hosp@V@UHF"."patients_dod_during" is 'Check redundancy constraint for patients_dod_during';

-- No redundancy constraint for patients_during
alter table "mimiciv_hosp@V@UHF"."patients_during"
  add constraint patients_during_redundancy
  exclude using gist("subject_id" WITH =,"during" WITH &&);

comment on constraint patients_during_redundancy on "mimiciv_hosp@V@UHF"."patients_during" is 'Check redundancy constraint for patients_during';

-- No redundancy constraint for patients_anchor_age_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_age_during"
  add constraint patients_anchor_age_during_redundancy
  exclude using gist("subject_id" WITH =, "anchor_age" WITH =,"during" WITH &&);

comment on constraint patients_anchor_age_during_redundancy on "mimiciv_hosp@V@UHF"."patients_anchor_age_during" is 'Check redundancy constraint for patients_anchor_age_during';

-- No redundancy constraint for patients_anchor_year_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_during"
  add constraint patients_anchor_year_during_redundancy
  exclude using gist("subject_id" WITH =, "anchor_year" WITH =,"during" WITH &&);

comment on constraint patients_anchor_year_during_redundancy on "mimiciv_hosp@V@UHF"."patients_anchor_year_during" is 'Check redundancy constraint for patients_anchor_year_during';

-- No redundancy constraint for patients_anchor_year_group_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during"
  add constraint patients_anchor_year_group_during_redundancy
  exclude using gist("subject_id" WITH =, "anchor_year_group" WITH =,"during" WITH &&);

comment on constraint patients_anchor_year_group_during_redundancy on "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during" is 'Check redundancy constraint for patients_anchor_year_group_during';

-- No redundancy constraint for provider_during
alter table "mimiciv_hosp@V@UHF"."provider_during"
  add constraint provider_during_redundancy
  exclude using gist("provider_id" WITH =,"during" WITH &&);

comment on constraint provider_during_redundancy on "mimiciv_hosp@V@UHF"."provider_during" is 'Check redundancy constraint for provider_during';

-- No redundancy constraint for admissions_admit_provider_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during"
  add constraint admissions_admit_provider_id_during_redundancy
  exclude using gist("hadm_id" WITH =, "admit_provider_id" WITH =,"during" WITH &&);

comment on constraint admissions_admit_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during" is 'Check redundancy constraint for admissions_admit_provider_id_during';

-- No redundancy constraint for admissions_admittime_during
alter table "mimiciv_hosp@V@UHF"."admissions_admittime_during"
  add constraint admissions_admittime_during_redundancy
  exclude using gist("hadm_id" WITH =, "admittime" WITH =,"during" WITH &&);

comment on constraint admissions_admittime_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_admittime_during" is 'Check redundancy constraint for admissions_admittime_during';

-- No redundancy constraint for admissions_dischtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_dischtime_during"
  add constraint admissions_dischtime_during_redundancy
  exclude using gist("hadm_id" WITH =, "dischtime" WITH =,"during" WITH &&);

comment on constraint admissions_dischtime_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_dischtime_during" is 'Check redundancy constraint for admissions_dischtime_during';

-- No redundancy constraint for admissions_during
alter table "mimiciv_hosp@V@UHF"."admissions_during"
  add constraint admissions_during_redundancy
  exclude using gist("hadm_id" WITH =,"during" WITH &&);

comment on constraint admissions_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_during" is 'Check redundancy constraint for admissions_during';

-- No redundancy constraint for admissions_discharge_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during"
  add constraint admissions_discharge_location_during_redundancy
  exclude using gist("hadm_id" WITH =, "discharge_location" WITH =,"during" WITH &&);

comment on constraint admissions_discharge_location_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_discharge_location_during" is 'Check redundancy constraint for admissions_discharge_location_during';

-- No redundancy constraint for admissions_race_during
alter table "mimiciv_hosp@V@UHF"."admissions_race_during"
  add constraint admissions_race_during_redundancy
  exclude using gist("hadm_id" WITH =, "race" WITH =,"during" WITH &&);

comment on constraint admissions_race_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_race_during" is 'Check redundancy constraint for admissions_race_during';

-- No redundancy constraint for admissions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_subject_id_during"
  add constraint admissions_subject_id_during_redundancy
  exclude using gist("hadm_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint admissions_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_subject_id_during" is 'Check redundancy constraint for admissions_subject_id_during';

-- No redundancy constraint for admissions_admission_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_location_during"
  add constraint admissions_admission_location_during_redundancy
  exclude using gist("hadm_id" WITH =, "admission_location" WITH =,"during" WITH &&);

comment on constraint admissions_admission_location_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_admission_location_during" is 'Check redundancy constraint for admissions_admission_location_during';

-- No redundancy constraint for admissions_hospital_expire_flag_during
alter table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during"
  add constraint admissions_hospital_expire_flag_during_redundancy
  exclude using gist("hadm_id" WITH =, "hospital_expire_flag" WITH =,"during" WITH &&);

comment on constraint admissions_hospital_expire_flag_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during" is 'Check redundancy constraint for admissions_hospital_expire_flag_during';

-- No redundancy constraint for admissions_deathtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_deathtime_during"
  add constraint admissions_deathtime_during_redundancy
  exclude using gist("hadm_id" WITH =, "deathtime" WITH =,"during" WITH &&);

comment on constraint admissions_deathtime_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_deathtime_during" is 'Check redundancy constraint for admissions_deathtime_during';

-- No redundancy constraint for admissions_edregtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edregtime_during"
  add constraint admissions_edregtime_during_redundancy
  exclude using gist("hadm_id" WITH =, "edregtime" WITH =,"during" WITH &&);

comment on constraint admissions_edregtime_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_edregtime_during" is 'Check redundancy constraint for admissions_edregtime_during';

-- No redundancy constraint for admissions_language_during
alter table "mimiciv_hosp@V@UHF"."admissions_language_during"
  add constraint admissions_language_during_redundancy
  exclude using gist("hadm_id" WITH =, "language" WITH =,"during" WITH &&);

comment on constraint admissions_language_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_language_during" is 'Check redundancy constraint for admissions_language_during';

-- No redundancy constraint for admissions_insurance_during
alter table "mimiciv_hosp@V@UHF"."admissions_insurance_during"
  add constraint admissions_insurance_during_redundancy
  exclude using gist("hadm_id" WITH =, "insurance" WITH =,"during" WITH &&);

comment on constraint admissions_insurance_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_insurance_during" is 'Check redundancy constraint for admissions_insurance_during';

-- No redundancy constraint for admissions_edouttime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edouttime_during"
  add constraint admissions_edouttime_during_redundancy
  exclude using gist("hadm_id" WITH =, "edouttime" WITH =,"during" WITH &&);

comment on constraint admissions_edouttime_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_edouttime_during" is 'Check redundancy constraint for admissions_edouttime_during';

-- No redundancy constraint for admissions_admission_type_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_type_during"
  add constraint admissions_admission_type_during_redundancy
  exclude using gist("hadm_id" WITH =, "admission_type" WITH =,"during" WITH &&);

comment on constraint admissions_admission_type_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_admission_type_during" is 'Check redundancy constraint for admissions_admission_type_during';

-- No redundancy constraint for admissions_marital_status_during
alter table "mimiciv_hosp@V@UHF"."admissions_marital_status_during"
  add constraint admissions_marital_status_during_redundancy
  exclude using gist("hadm_id" WITH =, "marital_status" WITH =,"during" WITH &&);

comment on constraint admissions_marital_status_during_redundancy on "mimiciv_hosp@V@UHF"."admissions_marital_status_during" is 'Check redundancy constraint for admissions_marital_status_during';

-- No redundancy constraint for labevents_itemid_during
alter table "mimiciv_hosp@V@UHF"."labevents_itemid_during"
  add constraint labevents_itemid_during_redundancy
  exclude using gist("labevent_id" WITH =, "itemid" WITH =,"during" WITH &&);

comment on constraint labevents_itemid_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_itemid_during" is 'Check redundancy constraint for labevents_itemid_during';

-- No redundancy constraint for labevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during"
  add constraint labevents_hadm_id_during_redundancy
  exclude using gist("labevent_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint labevents_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_hadm_id_during" is 'Check redundancy constraint for labevents_hadm_id_during';

-- No redundancy constraint for labevents_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during"
  add constraint labevents_specimen_id_during_redundancy
  exclude using gist("labevent_id" WITH =, "specimen_id" WITH =,"during" WITH &&);

comment on constraint labevents_specimen_id_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_specimen_id_during" is 'Check redundancy constraint for labevents_specimen_id_during';

-- No redundancy constraint for labevents_comments_during
alter table "mimiciv_hosp@V@UHF"."labevents_comments_during"
  add constraint labevents_comments_during_redundancy
  exclude using gist("labevent_id" WITH =, "comments" WITH =,"during" WITH &&);

comment on constraint labevents_comments_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_comments_during" is 'Check redundancy constraint for labevents_comments_during';

-- No redundancy constraint for labevents_ref_range_lower_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during"
  add constraint labevents_ref_range_lower_during_redundancy
  exclude using gist("labevent_id" WITH =, "ref_range_lower" WITH =,"during" WITH &&);

comment on constraint labevents_ref_range_lower_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during" is 'Check redundancy constraint for labevents_ref_range_lower_during';

-- No redundancy constraint for labevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during"
  add constraint labevents_order_provider_id_during_redundancy
  exclude using gist("labevent_id" WITH =, "order_provider_id" WITH =,"during" WITH &&);

comment on constraint labevents_order_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during" is 'Check redundancy constraint for labevents_order_provider_id_during';

-- No redundancy constraint for labevents_ref_range_upper_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during"
  add constraint labevents_ref_range_upper_during_redundancy
  exclude using gist("labevent_id" WITH =, "ref_range_upper" WITH =,"during" WITH &&);

comment on constraint labevents_ref_range_upper_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during" is 'Check redundancy constraint for labevents_ref_range_upper_during';

-- No redundancy constraint for labevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_subject_id_during"
  add constraint labevents_subject_id_during_redundancy
  exclude using gist("labevent_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint labevents_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_subject_id_during" is 'Check redundancy constraint for labevents_subject_id_during';

-- No redundancy constraint for labevents_valueuom_during
alter table "mimiciv_hosp@V@UHF"."labevents_valueuom_during"
  add constraint labevents_valueuom_during_redundancy
  exclude using gist("labevent_id" WITH =, "valueuom" WITH =,"during" WITH &&);

comment on constraint labevents_valueuom_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_valueuom_during" is 'Check redundancy constraint for labevents_valueuom_during';

-- No redundancy constraint for labevents_flag_during
alter table "mimiciv_hosp@V@UHF"."labevents_flag_during"
  add constraint labevents_flag_during_redundancy
  exclude using gist("labevent_id" WITH =, "flag" WITH =,"during" WITH &&);

comment on constraint labevents_flag_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_flag_during" is 'Check redundancy constraint for labevents_flag_during';

-- No redundancy constraint for labevents_valuenum_during
alter table "mimiciv_hosp@V@UHF"."labevents_valuenum_during"
  add constraint labevents_valuenum_during_redundancy
  exclude using gist("labevent_id" WITH =, "valuenum" WITH =,"during" WITH &&);

comment on constraint labevents_valuenum_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_valuenum_during" is 'Check redundancy constraint for labevents_valuenum_during';

-- No redundancy constraint for labevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."labevents_charttime_during"
  add constraint labevents_charttime_during_redundancy
  exclude using gist("labevent_id" WITH =, "charttime" WITH =,"during" WITH &&);

comment on constraint labevents_charttime_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_charttime_during" is 'Check redundancy constraint for labevents_charttime_during';

-- No redundancy constraint for labevents_priority_during
alter table "mimiciv_hosp@V@UHF"."labevents_priority_during"
  add constraint labevents_priority_during_redundancy
  exclude using gist("labevent_id" WITH =, "priority" WITH =,"during" WITH &&);

comment on constraint labevents_priority_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_priority_during" is 'Check redundancy constraint for labevents_priority_during';

-- No redundancy constraint for labevents_during
alter table "mimiciv_hosp@V@UHF"."labevents_during"
  add constraint labevents_during_redundancy
  exclude using gist("labevent_id" WITH =,"during" WITH &&);

comment on constraint labevents_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_during" is 'Check redundancy constraint for labevents_during';

-- No redundancy constraint for labevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."labevents_storetime_during"
  add constraint labevents_storetime_during_redundancy
  exclude using gist("labevent_id" WITH =, "storetime" WITH =,"during" WITH &&);

comment on constraint labevents_storetime_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_storetime_during" is 'Check redundancy constraint for labevents_storetime_during';

-- No redundancy constraint for labevents_value_during
alter table "mimiciv_hosp@V@UHF"."labevents_value_during"
  add constraint labevents_value_during_redundancy
  exclude using gist("labevent_id" WITH =, "value" WITH =,"during" WITH &&);

comment on constraint labevents_value_during_redundancy on "mimiciv_hosp@V@UHF"."labevents_value_during" is 'Check redundancy constraint for labevents_value_during';

-- No redundancy constraint for transfers_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during"
  add constraint transfers_hadm_id_during_redundancy
  exclude using gist("transfer_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint transfers_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_hadm_id_during" is 'Check redundancy constraint for transfers_hadm_id_during';

-- No redundancy constraint for transfers_subject_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_subject_id_during"
  add constraint transfers_subject_id_during_redundancy
  exclude using gist("transfer_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint transfers_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_subject_id_during" is 'Check redundancy constraint for transfers_subject_id_during';

-- No redundancy constraint for transfers_outtime_during
alter table "mimiciv_hosp@V@UHF"."transfers_outtime_during"
  add constraint transfers_outtime_during_redundancy
  exclude using gist("transfer_id" WITH =, "outtime" WITH =,"during" WITH &&);

comment on constraint transfers_outtime_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_outtime_during" is 'Check redundancy constraint for transfers_outtime_during';

-- No redundancy constraint for transfers_during
alter table "mimiciv_hosp@V@UHF"."transfers_during"
  add constraint transfers_during_redundancy
  exclude using gist("transfer_id" WITH =,"during" WITH &&);

comment on constraint transfers_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_during" is 'Check redundancy constraint for transfers_during';

-- No redundancy constraint for transfers_intime_during
alter table "mimiciv_hosp@V@UHF"."transfers_intime_during"
  add constraint transfers_intime_during_redundancy
  exclude using gist("transfer_id" WITH =, "intime" WITH =,"during" WITH &&);

comment on constraint transfers_intime_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_intime_during" is 'Check redundancy constraint for transfers_intime_during';

-- No redundancy constraint for transfers_careunit_during
alter table "mimiciv_hosp@V@UHF"."transfers_careunit_during"
  add constraint transfers_careunit_during_redundancy
  exclude using gist("transfer_id" WITH =, "careunit" WITH =,"during" WITH &&);

comment on constraint transfers_careunit_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_careunit_during" is 'Check redundancy constraint for transfers_careunit_during';

-- No redundancy constraint for transfers_eventtype_during
alter table "mimiciv_hosp@V@UHF"."transfers_eventtype_during"
  add constraint transfers_eventtype_during_redundancy
  exclude using gist("transfer_id" WITH =, "eventtype" WITH =,"during" WITH &&);

comment on constraint transfers_eventtype_during_redundancy on "mimiciv_hosp@V@UHF"."transfers_eventtype_during" is 'Check redundancy constraint for transfers_eventtype_during';

-- No redundancy constraint for diagnoses_icd_during
alter table "mimiciv_hosp@V@UHF"."diagnoses_icd_during"
  add constraint diagnoses_icd_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =,"during" WITH &&);

comment on constraint diagnoses_icd_during_redundancy on "mimiciv_hosp@V@UHF"."diagnoses_icd_during" is 'Check redundancy constraint for diagnoses_icd_during';

-- No redundancy constraint for diagnoses_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during"
  add constraint diagnoses_icd_subject_id_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint diagnoses_icd_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during" is 'Check redundancy constraint for diagnoses_icd_subject_id_during';

-- No redundancy constraint for drgcodes_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_during"
  add constraint drgcodes_during_redundancy
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =,"during" WITH &&);

comment on constraint drgcodes_during_redundancy on "mimiciv_hosp@V@UHF"."drgcodes_during" is 'Check redundancy constraint for drgcodes_during';

-- No redundancy constraint for drgcodes_description_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_description_during"
  add constraint drgcodes_description_during_redundancy
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "description" WITH =,"during" WITH &&);

comment on constraint drgcodes_description_during_redundancy on "mimiciv_hosp@V@UHF"."drgcodes_description_during" is 'Check redundancy constraint for drgcodes_description_during';

-- No redundancy constraint for drgcodes_drg_type_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during"
  add constraint drgcodes_drg_type_during_redundancy
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_type" WITH =,"during" WITH &&);

comment on constraint drgcodes_drg_type_during_redundancy on "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during" is 'Check redundancy constraint for drgcodes_drg_type_during';

-- No redundancy constraint for drgcodes_drg_severity_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during"
  add constraint drgcodes_drg_severity_during_redundancy
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_severity" WITH =,"during" WITH &&);

comment on constraint drgcodes_drg_severity_during_redundancy on "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during" is 'Check redundancy constraint for drgcodes_drg_severity_during';

-- No redundancy constraint for drgcodes_drg_mortality_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during"
  add constraint drgcodes_drg_mortality_during_redundancy
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_mortality" WITH =,"during" WITH &&);

comment on constraint drgcodes_drg_mortality_during_redundancy on "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during" is 'Check redundancy constraint for drgcodes_drg_mortality_during';

-- No redundancy constraint for emar_charttime_during
alter table "mimiciv_hosp@V@UHF"."emar_charttime_during"
  add constraint emar_charttime_during_redundancy
  exclude using gist("emar_id" WITH =, "charttime" WITH =,"during" WITH &&);

comment on constraint emar_charttime_during_redundancy on "mimiciv_hosp@V@UHF"."emar_charttime_during" is 'Check redundancy constraint for emar_charttime_during';

-- No redundancy constraint for emar_poe_id_during
alter table "mimiciv_hosp@V@UHF"."emar_poe_id_during"
  add constraint emar_poe_id_during_redundancy
  exclude using gist("emar_id" WITH =, "poe_id" WITH =,"during" WITH &&);

comment on constraint emar_poe_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_poe_id_during" is 'Check redundancy constraint for emar_poe_id_during';

-- No redundancy constraint for emar_enter_provider_id_during
alter table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during"
  add constraint emar_enter_provider_id_during_redundancy
  exclude using gist("emar_id" WITH =, "enter_provider_id" WITH =,"during" WITH &&);

comment on constraint emar_enter_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during" is 'Check redundancy constraint for emar_enter_provider_id_during';

-- No redundancy constraint for emar_medication_during
alter table "mimiciv_hosp@V@UHF"."emar_medication_during"
  add constraint emar_medication_during_redundancy
  exclude using gist("emar_id" WITH =, "medication" WITH =,"during" WITH &&);

comment on constraint emar_medication_during_redundancy on "mimiciv_hosp@V@UHF"."emar_medication_during" is 'Check redundancy constraint for emar_medication_during';

-- No redundancy constraint for emar_scheduletime_during
alter table "mimiciv_hosp@V@UHF"."emar_scheduletime_during"
  add constraint emar_scheduletime_during_redundancy
  exclude using gist("emar_id" WITH =, "scheduletime" WITH =,"during" WITH &&);

comment on constraint emar_scheduletime_during_redundancy on "mimiciv_hosp@V@UHF"."emar_scheduletime_during" is 'Check redundancy constraint for emar_scheduletime_during';

-- No redundancy constraint for emar_storetime_during
alter table "mimiciv_hosp@V@UHF"."emar_storetime_during"
  add constraint emar_storetime_during_redundancy
  exclude using gist("emar_id" WITH =, "storetime" WITH =,"during" WITH &&);

comment on constraint emar_storetime_during_redundancy on "mimiciv_hosp@V@UHF"."emar_storetime_during" is 'Check redundancy constraint for emar_storetime_during';

-- No redundancy constraint for emar_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."emar_hadm_id_during"
  add constraint emar_hadm_id_during_redundancy
  exclude using gist("emar_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint emar_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_hadm_id_during" is 'Check redundancy constraint for emar_hadm_id_during';

-- No redundancy constraint for emar_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_emar_seq_during"
  add constraint emar_emar_seq_during_redundancy
  exclude using gist("emar_id" WITH =, "emar_seq" WITH =,"during" WITH &&);

comment on constraint emar_emar_seq_during_redundancy on "mimiciv_hosp@V@UHF"."emar_emar_seq_during" is 'Check redundancy constraint for emar_emar_seq_during';

-- No redundancy constraint for emar_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during"
  add constraint emar_pharmacy_id_during_redundancy
  exclude using gist("emar_id" WITH =, "pharmacy_id" WITH =,"during" WITH &&);

comment on constraint emar_pharmacy_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during" is 'Check redundancy constraint for emar_pharmacy_id_during';

-- No redundancy constraint for emar_event_txt_during
alter table "mimiciv_hosp@V@UHF"."emar_event_txt_during"
  add constraint emar_event_txt_during_redundancy
  exclude using gist("emar_id" WITH =, "event_txt" WITH =,"during" WITH &&);

comment on constraint emar_event_txt_during_redundancy on "mimiciv_hosp@V@UHF"."emar_event_txt_during" is 'Check redundancy constraint for emar_event_txt_during';

-- No redundancy constraint for emar_during
alter table "mimiciv_hosp@V@UHF"."emar_during"
  add constraint emar_during_redundancy
  exclude using gist("emar_id" WITH =,"during" WITH &&);

comment on constraint emar_during_redundancy on "mimiciv_hosp@V@UHF"."emar_during" is 'Check redundancy constraint for emar_during';

-- No redundancy constraint for emar_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_subject_id_during"
  add constraint emar_subject_id_during_redundancy
  exclude using gist("emar_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint emar_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_subject_id_during" is 'Check redundancy constraint for emar_subject_id_during';

-- No redundancy constraint for hcpcsevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during"
  add constraint hcpcsevents_subject_id_during_redundancy
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint hcpcsevents_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during" is 'Check redundancy constraint for hcpcsevents_subject_id_during';

-- No redundancy constraint for hcpcsevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during"
  add constraint hcpcsevents_chartdate_during_redundancy
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "chartdate" WITH =,"during" WITH &&);

comment on constraint hcpcsevents_chartdate_during_redundancy on "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during" is 'Check redundancy constraint for hcpcsevents_chartdate_during';

-- No redundancy constraint for hcpcsevents_short_description_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during"
  add constraint hcpcsevents_short_description_during_redundancy
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "short_description" WITH =,"during" WITH &&);

comment on constraint hcpcsevents_short_description_during_redundancy on "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during" is 'Check redundancy constraint for hcpcsevents_short_description_during';

-- No redundancy constraint for hcpcsevents_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_during"
  add constraint hcpcsevents_during_redundancy
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =,"during" WITH &&);

comment on constraint hcpcsevents_during_redundancy on "mimiciv_hosp@V@UHF"."hcpcsevents_during" is 'Check redundancy constraint for hcpcsevents_during';

-- No redundancy constraint for microbiologyevents_quantity_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during"
  add constraint microbiologyevents_quantity_during_redundancy
  exclude using gist("microevent_id" WITH =, "quantity" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_quantity_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during" is 'Check redundancy constraint for microbiologyevents_quantity_during';

-- No redundancy constraint for microbiologyevents_micro_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during"
  add constraint microbiologyevents_micro_specimen_id_during_redundancy
  exclude using gist("microevent_id" WITH =, "micro_specimen_id" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_micro_specimen_id_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during" is 'Check redundancy constraint for microbiologyevents_micro_specimen_id_during';

-- No redundancy constraint for microbiologyevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during"
  add constraint microbiologyevents_storetime_during_redundancy
  exclude using gist("microevent_id" WITH =, "storetime" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_storetime_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during" is 'Check redundancy constraint for microbiologyevents_storetime_during';

-- No redundancy constraint for microbiologyevents_org_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during"
  add constraint microbiologyevents_org_name_during_redundancy
  exclude using gist("microevent_id" WITH =, "org_name" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_org_name_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during" is 'Check redundancy constraint for microbiologyevents_org_name_during';

-- No redundancy constraint for microbiologyevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during"
  add constraint microbiologyevents_order_provider_id_during_redundancy
  exclude using gist("microevent_id" WITH =, "order_provider_id" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_order_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during" is 'Check redundancy constraint for microbiologyevents_order_provider_id_during';

-- No redundancy constraint for microbiologyevents_isolate_num_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during"
  add constraint microbiologyevents_isolate_num_during_redundancy
  exclude using gist("microevent_id" WITH =, "isolate_num" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_isolate_num_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during" is 'Check redundancy constraint for microbiologyevents_isolate_num_during';

-- No redundancy constraint for microbiologyevents_org_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during"
  add constraint microbiologyevents_org_itemid_during_redundancy
  exclude using gist("microevent_id" WITH =, "org_itemid" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_org_itemid_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during" is 'Check redundancy constraint for microbiologyevents_org_itemid_during';

-- No redundancy constraint for microbiologyevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during"
  add constraint microbiologyevents_chartdate_during_redundancy
  exclude using gist("microevent_id" WITH =, "chartdate" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_chartdate_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during" is 'Check redundancy constraint for microbiologyevents_chartdate_during';

-- No redundancy constraint for microbiologyevents_spec_type_desc_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during"
  add constraint microbiologyevents_spec_type_desc_during_redundancy
  exclude using gist("microevent_id" WITH =, "spec_type_desc" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_spec_type_desc_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during" is 'Check redundancy constraint for microbiologyevents_spec_type_desc_during';

-- No redundancy constraint for microbiologyevents_dilution_value_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during"
  add constraint microbiologyevents_dilution_value_during_redundancy
  exclude using gist("microevent_id" WITH =, "dilution_value" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_dilution_value_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during" is 'Check redundancy constraint for microbiologyevents_dilution_value_during';

-- No redundancy constraint for microbiologyevents_interpretation_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during"
  add constraint microbiologyevents_interpretation_during_redundancy
  exclude using gist("microevent_id" WITH =, "interpretation" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_interpretation_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during" is 'Check redundancy constraint for microbiologyevents_interpretation_during';

-- No redundancy constraint for microbiologyevents_storedate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during"
  add constraint microbiologyevents_storedate_during_redundancy
  exclude using gist("microevent_id" WITH =, "storedate" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_storedate_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during" is 'Check redundancy constraint for microbiologyevents_storedate_during';

-- No redundancy constraint for microbiologyevents_ab_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during"
  add constraint microbiologyevents_ab_name_during_redundancy
  exclude using gist("microevent_id" WITH =, "ab_name" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_ab_name_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during" is 'Check redundancy constraint for microbiologyevents_ab_name_during';

-- No redundancy constraint for microbiologyevents_dilution_text_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during"
  add constraint microbiologyevents_dilution_text_during_redundancy
  exclude using gist("microevent_id" WITH =, "dilution_text" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_dilution_text_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during" is 'Check redundancy constraint for microbiologyevents_dilution_text_during';

-- No redundancy constraint for microbiologyevents_ab_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during"
  add constraint microbiologyevents_ab_itemid_during_redundancy
  exclude using gist("microevent_id" WITH =, "ab_itemid" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_ab_itemid_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during" is 'Check redundancy constraint for microbiologyevents_ab_itemid_during';

-- No redundancy constraint for microbiologyevents_test_seq_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during"
  add constraint microbiologyevents_test_seq_during_redundancy
  exclude using gist("microevent_id" WITH =, "test_seq" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_test_seq_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during" is 'Check redundancy constraint for microbiologyevents_test_seq_during';

-- No redundancy constraint for microbiologyevents_dilution_comparison_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during"
  add constraint microbiologyevents_dilution_comparison_during_redundancy
  exclude using gist("microevent_id" WITH =, "dilution_comparison" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_dilution_comparison_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during" is 'Check redundancy constraint for microbiologyevents_dilution_comparison_during';

-- No redundancy constraint for microbiologyevents_test_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during"
  add constraint microbiologyevents_test_name_during_redundancy
  exclude using gist("microevent_id" WITH =, "test_name" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_test_name_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during" is 'Check redundancy constraint for microbiologyevents_test_name_during';

-- No redundancy constraint for microbiologyevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during"
  add constraint microbiologyevents_hadm_id_during_redundancy
  exclude using gist("microevent_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during" is 'Check redundancy constraint for microbiologyevents_hadm_id_during';

-- No redundancy constraint for microbiologyevents_comments_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during"
  add constraint microbiologyevents_comments_during_redundancy
  exclude using gist("microevent_id" WITH =, "comments" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_comments_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during" is 'Check redundancy constraint for microbiologyevents_comments_during';

-- No redundancy constraint for microbiologyevents_spec_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during"
  add constraint microbiologyevents_spec_itemid_during_redundancy
  exclude using gist("microevent_id" WITH =, "spec_itemid" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_spec_itemid_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during" is 'Check redundancy constraint for microbiologyevents_spec_itemid_during';

-- No redundancy constraint for microbiologyevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during"
  add constraint microbiologyevents_charttime_during_redundancy
  exclude using gist("microevent_id" WITH =, "charttime" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_charttime_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during" is 'Check redundancy constraint for microbiologyevents_charttime_during';

-- No redundancy constraint for microbiologyevents_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_during"
  add constraint microbiologyevents_during_redundancy
  exclude using gist("microevent_id" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_during" is 'Check redundancy constraint for microbiologyevents_during';

-- No redundancy constraint for microbiologyevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during"
  add constraint microbiologyevents_subject_id_during_redundancy
  exclude using gist("microevent_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during" is 'Check redundancy constraint for microbiologyevents_subject_id_during';

-- No redundancy constraint for microbiologyevents_test_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during"
  add constraint microbiologyevents_test_itemid_during_redundancy
  exclude using gist("microevent_id" WITH =, "test_itemid" WITH =,"during" WITH &&);

comment on constraint microbiologyevents_test_itemid_during_redundancy on "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during" is 'Check redundancy constraint for microbiologyevents_test_itemid_during';

-- No redundancy constraint for pharmacy_medication_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_medication_during"
  add constraint pharmacy_medication_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "medication" WITH =,"during" WITH &&);

comment on constraint pharmacy_medication_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_medication_during" is 'Check redundancy constraint for pharmacy_medication_during';

-- No redundancy constraint for pharmacy_lockout_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during"
  add constraint pharmacy_lockout_interval_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "lockout_interval" WITH =,"during" WITH &&);

comment on constraint pharmacy_lockout_interval_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during" is 'Check redundancy constraint for pharmacy_lockout_interval_during';

-- No redundancy constraint for pharmacy_fill_quantity_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during"
  add constraint pharmacy_fill_quantity_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "fill_quantity" WITH =,"during" WITH &&);

comment on constraint pharmacy_fill_quantity_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during" is 'Check redundancy constraint for pharmacy_fill_quantity_during';

-- No redundancy constraint for pharmacy_sliding_scale_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during"
  add constraint pharmacy_sliding_scale_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "sliding_scale" WITH =,"during" WITH &&);

comment on constraint pharmacy_sliding_scale_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during" is 'Check redundancy constraint for pharmacy_sliding_scale_during';

-- No redundancy constraint for pharmacy_expiration_value_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during"
  add constraint pharmacy_expiration_value_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "expiration_value" WITH =,"during" WITH &&);

comment on constraint pharmacy_expiration_value_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during" is 'Check redundancy constraint for pharmacy_expiration_value_during';

-- No redundancy constraint for pharmacy_duration_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during"
  add constraint pharmacy_duration_interval_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "duration_interval" WITH =,"during" WITH &&);

comment on constraint pharmacy_duration_interval_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during" is 'Check redundancy constraint for pharmacy_duration_interval_during';

-- No redundancy constraint for pharmacy_basal_rate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during"
  add constraint pharmacy_basal_rate_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "basal_rate" WITH =,"during" WITH &&);

comment on constraint pharmacy_basal_rate_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during" is 'Check redundancy constraint for pharmacy_basal_rate_during';

-- No redundancy constraint for pharmacy_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_during"
  add constraint pharmacy_during_redundancy
  exclude using gist("pharmacy_id" WITH =,"during" WITH &&);

comment on constraint pharmacy_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_during" is 'Check redundancy constraint for pharmacy_during';

-- No redundancy constraint for pharmacy_stoptime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during"
  add constraint pharmacy_stoptime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "stoptime" WITH =,"during" WITH &&);

comment on constraint pharmacy_stoptime_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during" is 'Check redundancy constraint for pharmacy_stoptime_during';

-- No redundancy constraint for pharmacy_subject_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during"
  add constraint pharmacy_subject_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint pharmacy_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during" is 'Check redundancy constraint for pharmacy_subject_id_during';

-- No redundancy constraint for pharmacy_entertime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during"
  add constraint pharmacy_entertime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "entertime" WITH =,"during" WITH &&);

comment on constraint pharmacy_entertime_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_entertime_during" is 'Check redundancy constraint for pharmacy_entertime_during';

-- No redundancy constraint for pharmacy_poe_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during"
  add constraint pharmacy_poe_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "poe_id" WITH =,"during" WITH &&);

comment on constraint pharmacy_poe_id_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during" is 'Check redundancy constraint for pharmacy_poe_id_during';

-- No redundancy constraint for pharmacy_status_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_status_during"
  add constraint pharmacy_status_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "status" WITH =,"during" WITH &&);

comment on constraint pharmacy_status_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_status_during" is 'Check redundancy constraint for pharmacy_status_during';

-- No redundancy constraint for pharmacy_infusion_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during"
  add constraint pharmacy_infusion_type_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "infusion_type" WITH =,"during" WITH &&);

comment on constraint pharmacy_infusion_type_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during" is 'Check redundancy constraint for pharmacy_infusion_type_during';

-- No redundancy constraint for pharmacy_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during"
  add constraint pharmacy_hadm_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint pharmacy_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during" is 'Check redundancy constraint for pharmacy_hadm_id_during';

-- No redundancy constraint for pharmacy_expiration_unit_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during"
  add constraint pharmacy_expiration_unit_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "expiration_unit" WITH =,"during" WITH &&);

comment on constraint pharmacy_expiration_unit_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during" is 'Check redundancy constraint for pharmacy_expiration_unit_during';

-- No redundancy constraint for pharmacy_verifiedtime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during"
  add constraint pharmacy_verifiedtime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "verifiedtime" WITH =,"during" WITH &&);

comment on constraint pharmacy_verifiedtime_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during" is 'Check redundancy constraint for pharmacy_verifiedtime_during';

-- No redundancy constraint for pharmacy_duration_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_during"
  add constraint pharmacy_duration_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "duration" WITH =,"during" WITH &&);

comment on constraint pharmacy_duration_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_duration_during" is 'Check redundancy constraint for pharmacy_duration_during';

-- No redundancy constraint for pharmacy_dispensation_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during"
  add constraint pharmacy_dispensation_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "dispensation" WITH =,"during" WITH &&);

comment on constraint pharmacy_dispensation_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during" is 'Check redundancy constraint for pharmacy_dispensation_during';

-- No redundancy constraint for pharmacy_route_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_route_during"
  add constraint pharmacy_route_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "route" WITH =,"during" WITH &&);

comment on constraint pharmacy_route_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_route_during" is 'Check redundancy constraint for pharmacy_route_during';

-- No redundancy constraint for pharmacy_expirationdate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during"
  add constraint pharmacy_expirationdate_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "expirationdate" WITH =,"during" WITH &&);

comment on constraint pharmacy_expirationdate_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during" is 'Check redundancy constraint for pharmacy_expirationdate_during';

-- No redundancy constraint for pharmacy_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during"
  add constraint pharmacy_doses_per_24_hrs_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "doses_per_24_hrs" WITH =,"during" WITH &&);

comment on constraint pharmacy_doses_per_24_hrs_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during" is 'Check redundancy constraint for pharmacy_doses_per_24_hrs_during';

-- No redundancy constraint for pharmacy_proc_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during"
  add constraint pharmacy_proc_type_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "proc_type" WITH =,"during" WITH &&);

comment on constraint pharmacy_proc_type_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during" is 'Check redundancy constraint for pharmacy_proc_type_during';

-- No redundancy constraint for pharmacy_frequency_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during"
  add constraint pharmacy_frequency_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "frequency" WITH =,"during" WITH &&);

comment on constraint pharmacy_frequency_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_frequency_during" is 'Check redundancy constraint for pharmacy_frequency_during';

-- No redundancy constraint for pharmacy_one_hr_max_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during"
  add constraint pharmacy_one_hr_max_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "one_hr_max" WITH =,"during" WITH &&);

comment on constraint pharmacy_one_hr_max_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during" is 'Check redundancy constraint for pharmacy_one_hr_max_during';

-- No redundancy constraint for pharmacy_starttime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during"
  add constraint pharmacy_starttime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "starttime" WITH =,"during" WITH &&);

comment on constraint pharmacy_starttime_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_starttime_during" is 'Check redundancy constraint for pharmacy_starttime_during';

-- No redundancy constraint for pharmacy_disp_sched_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during"
  add constraint pharmacy_disp_sched_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "disp_sched" WITH =,"during" WITH &&);

comment on constraint pharmacy_disp_sched_during_redundancy on "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during" is 'Check redundancy constraint for pharmacy_disp_sched_during';

-- No redundancy constraint for poe_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_poe_seq_during"
  add constraint poe_poe_seq_during_redundancy
  exclude using gist("poe_id" WITH =, "poe_seq" WITH =,"during" WITH &&);

comment on constraint poe_poe_seq_during_redundancy on "mimiciv_hosp@V@UHF"."poe_poe_seq_during" is 'Check redundancy constraint for poe_poe_seq_during';

-- No redundancy constraint for poe_discontinued_by_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during"
  add constraint poe_discontinued_by_poe_id_during_redundancy
  exclude using gist("poe_id" WITH =, "discontinued_by_poe_id" WITH =,"during" WITH &&);

comment on constraint poe_discontinued_by_poe_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during" is 'Check redundancy constraint for poe_discontinued_by_poe_id_during';

-- No redundancy constraint for poe_ordertime_during
alter table "mimiciv_hosp@V@UHF"."poe_ordertime_during"
  add constraint poe_ordertime_during_redundancy
  exclude using gist("poe_id" WITH =, "ordertime" WITH =,"during" WITH &&);

comment on constraint poe_ordertime_during_redundancy on "mimiciv_hosp@V@UHF"."poe_ordertime_during" is 'Check redundancy constraint for poe_ordertime_during';

-- No redundancy constraint for poe_order_subtype_during
alter table "mimiciv_hosp@V@UHF"."poe_order_subtype_during"
  add constraint poe_order_subtype_during_redundancy
  exclude using gist("poe_id" WITH =, "order_subtype" WITH =,"during" WITH &&);

comment on constraint poe_order_subtype_during_redundancy on "mimiciv_hosp@V@UHF"."poe_order_subtype_during" is 'Check redundancy constraint for poe_order_subtype_during';

-- No redundancy constraint for poe_order_status_during
alter table "mimiciv_hosp@V@UHF"."poe_order_status_during"
  add constraint poe_order_status_during_redundancy
  exclude using gist("poe_id" WITH =, "order_status" WITH =,"during" WITH &&);

comment on constraint poe_order_status_during_redundancy on "mimiciv_hosp@V@UHF"."poe_order_status_during" is 'Check redundancy constraint for poe_order_status_during';

-- No redundancy constraint for poe_during
alter table "mimiciv_hosp@V@UHF"."poe_during"
  add constraint poe_during_redundancy
  exclude using gist("poe_id" WITH =,"during" WITH &&);

comment on constraint poe_during_redundancy on "mimiciv_hosp@V@UHF"."poe_during" is 'Check redundancy constraint for poe_during';

-- No redundancy constraint for poe_discontinue_of_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during"
  add constraint poe_discontinue_of_poe_id_during_redundancy
  exclude using gist("poe_id" WITH =, "discontinue_of_poe_id" WITH =,"during" WITH &&);

comment on constraint poe_discontinue_of_poe_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during" is 'Check redundancy constraint for poe_discontinue_of_poe_id_during';

-- No redundancy constraint for poe_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during"
  add constraint poe_order_provider_id_during_redundancy
  exclude using gist("poe_id" WITH =, "order_provider_id" WITH =,"during" WITH &&);

comment on constraint poe_order_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_order_provider_id_during" is 'Check redundancy constraint for poe_order_provider_id_during';

-- No redundancy constraint for poe_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_subject_id_during"
  add constraint poe_subject_id_during_redundancy
  exclude using gist("poe_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint poe_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_subject_id_during" is 'Check redundancy constraint for poe_subject_id_during';

-- No redundancy constraint for poe_transaction_type_during
alter table "mimiciv_hosp@V@UHF"."poe_transaction_type_during"
  add constraint poe_transaction_type_during_redundancy
  exclude using gist("poe_id" WITH =, "transaction_type" WITH =,"during" WITH &&);

comment on constraint poe_transaction_type_during_redundancy on "mimiciv_hosp@V@UHF"."poe_transaction_type_during" is 'Check redundancy constraint for poe_transaction_type_during';

-- No redundancy constraint for poe_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."poe_hadm_id_during"
  add constraint poe_hadm_id_during_redundancy
  exclude using gist("poe_id" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint poe_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_hadm_id_during" is 'Check redundancy constraint for poe_hadm_id_during';

-- No redundancy constraint for poe_order_type_during
alter table "mimiciv_hosp@V@UHF"."poe_order_type_during"
  add constraint poe_order_type_during_redundancy
  exclude using gist("poe_id" WITH =, "order_type" WITH =,"during" WITH &&);

comment on constraint poe_order_type_during_redundancy on "mimiciv_hosp@V@UHF"."poe_order_type_during" is 'Check redundancy constraint for poe_order_type_during';

-- No redundancy constraint for prescriptions_formulary_drug_cd_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during"
  add constraint prescriptions_formulary_drug_cd_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "formulary_drug_cd" WITH =,"during" WITH &&);

comment on constraint prescriptions_formulary_drug_cd_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during" is 'Check redundancy constraint for prescriptions_formulary_drug_cd_during';

-- No redundancy constraint for prescriptions_form_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during"
  add constraint prescriptions_form_rx_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_rx" WITH =,"during" WITH &&);

comment on constraint prescriptions_form_rx_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during" is 'Check redundancy constraint for prescriptions_form_rx_during';

-- No redundancy constraint for prescriptions_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during"
  add constraint prescriptions_hadm_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint prescriptions_hadm_id_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during" is 'Check redundancy constraint for prescriptions_hadm_id_during';

-- No redundancy constraint for prescriptions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during"
  add constraint prescriptions_subject_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint prescriptions_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during" is 'Check redundancy constraint for prescriptions_subject_id_during';

-- No redundancy constraint for prescriptions_stoptime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during"
  add constraint prescriptions_stoptime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "stoptime" WITH =,"during" WITH &&);

comment on constraint prescriptions_stoptime_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during" is 'Check redundancy constraint for prescriptions_stoptime_during';

-- No redundancy constraint for prescriptions_dose_unit_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during"
  add constraint prescriptions_dose_unit_rx_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "dose_unit_rx" WITH =,"during" WITH &&);

comment on constraint prescriptions_dose_unit_rx_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during" is 'Check redundancy constraint for prescriptions_dose_unit_rx_during';

-- No redundancy constraint for prescriptions_poe_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during"
  add constraint prescriptions_poe_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "poe_id" WITH =,"during" WITH &&);

comment on constraint prescriptions_poe_id_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during" is 'Check redundancy constraint for prescriptions_poe_id_during';

-- No redundancy constraint for prescriptions_prod_strength_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during"
  add constraint prescriptions_prod_strength_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "prod_strength" WITH =,"during" WITH &&);

comment on constraint prescriptions_prod_strength_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during" is 'Check redundancy constraint for prescriptions_prod_strength_during';

-- No redundancy constraint for prescriptions_form_unit_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during"
  add constraint prescriptions_form_unit_disp_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_unit_disp" WITH =,"during" WITH &&);

comment on constraint prescriptions_form_unit_disp_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during" is 'Check redundancy constraint for prescriptions_form_unit_disp_during';

-- No redundancy constraint for prescriptions_dose_val_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during"
  add constraint prescriptions_dose_val_rx_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "dose_val_rx" WITH =,"during" WITH &&);

comment on constraint prescriptions_dose_val_rx_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during" is 'Check redundancy constraint for prescriptions_dose_val_rx_during';

-- No redundancy constraint for prescriptions_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during"
  add constraint prescriptions_poe_seq_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "poe_seq" WITH =,"during" WITH &&);

comment on constraint prescriptions_poe_seq_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during" is 'Check redundancy constraint for prescriptions_poe_seq_during';

-- No redundancy constraint for prescriptions_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_during"
  add constraint prescriptions_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =,"during" WITH &&);

comment on constraint prescriptions_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_during" is 'Check redundancy constraint for prescriptions_during';

-- No redundancy constraint for prescriptions_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during"
  add constraint prescriptions_order_provider_id_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "order_provider_id" WITH =,"during" WITH &&);

comment on constraint prescriptions_order_provider_id_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during" is 'Check redundancy constraint for prescriptions_order_provider_id_during';

-- No redundancy constraint for prescriptions_starttime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during"
  add constraint prescriptions_starttime_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "starttime" WITH =,"during" WITH &&);

comment on constraint prescriptions_starttime_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_starttime_during" is 'Check redundancy constraint for prescriptions_starttime_during';

-- No redundancy constraint for prescriptions_form_val_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during"
  add constraint prescriptions_form_val_disp_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_val_disp" WITH =,"during" WITH &&);

comment on constraint prescriptions_form_val_disp_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during" is 'Check redundancy constraint for prescriptions_form_val_disp_during';

-- No redundancy constraint for prescriptions_ndc_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during"
  add constraint prescriptions_ndc_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "ndc" WITH =,"during" WITH &&);

comment on constraint prescriptions_ndc_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_ndc_during" is 'Check redundancy constraint for prescriptions_ndc_during';

-- No redundancy constraint for prescriptions_gsn_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during"
  add constraint prescriptions_gsn_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "gsn" WITH =,"during" WITH &&);

comment on constraint prescriptions_gsn_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_gsn_during" is 'Check redundancy constraint for prescriptions_gsn_during';

-- No redundancy constraint for prescriptions_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during"
  add constraint prescriptions_doses_per_24_hrs_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "doses_per_24_hrs" WITH =,"during" WITH &&);

comment on constraint prescriptions_doses_per_24_hrs_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during" is 'Check redundancy constraint for prescriptions_doses_per_24_hrs_during';

-- No redundancy constraint for prescriptions_route_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_route_during"
  add constraint prescriptions_route_during_redundancy
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "route" WITH =,"during" WITH &&);

comment on constraint prescriptions_route_during_redundancy on "mimiciv_hosp@V@UHF"."prescriptions_route_during" is 'Check redundancy constraint for prescriptions_route_during';

-- No redundancy constraint for procedures_icd_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_during"
  add constraint procedures_icd_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =,"during" WITH &&);

comment on constraint procedures_icd_during_redundancy on "mimiciv_hosp@V@UHF"."procedures_icd_during" is 'Check redundancy constraint for procedures_icd_during';

-- No redundancy constraint for procedures_icd_chartdate_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during"
  add constraint procedures_icd_chartdate_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "chartdate" WITH =,"during" WITH &&);

comment on constraint procedures_icd_chartdate_during_redundancy on "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during" is 'Check redundancy constraint for procedures_icd_chartdate_during';

-- No redundancy constraint for procedures_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during"
  add constraint procedures_icd_subject_id_during_redundancy
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint procedures_icd_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during" is 'Check redundancy constraint for procedures_icd_subject_id_during';

-- No redundancy constraint for services_prev_service_during
alter table "mimiciv_hosp@V@UHF"."services_prev_service_during"
  add constraint services_prev_service_during_redundancy
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH =, "prev_service" WITH =,"during" WITH &&);

comment on constraint services_prev_service_during_redundancy on "mimiciv_hosp@V@UHF"."services_prev_service_during" is 'Check redundancy constraint for services_prev_service_during';

-- No redundancy constraint for services_during
alter table "mimiciv_hosp@V@UHF"."services_during"
  add constraint services_during_redundancy
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH =,"during" WITH &&);

comment on constraint services_during_redundancy on "mimiciv_hosp@V@UHF"."services_during" is 'Check redundancy constraint for services_during';

-- No redundancy constraint for services_subject_id_during
alter table "mimiciv_hosp@V@UHF"."services_subject_id_during"
  add constraint services_subject_id_during_redundancy
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint services_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."services_subject_id_during" is 'Check redundancy constraint for services_subject_id_during';

-- No redundancy constraint for emar_detail_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during"
  add constraint emar_detail_pharmacy_id_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "pharmacy_id" WITH =,"during" WITH &&);

comment on constraint emar_detail_pharmacy_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during" is 'Check redundancy constraint for emar_detail_pharmacy_id_during';

-- No redundancy constraint for emar_detail_side_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_side_during"
  add constraint emar_detail_side_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "side" WITH =,"during" WITH &&);

comment on constraint emar_detail_side_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_side_during" is 'Check redundancy constraint for emar_detail_side_during';

-- No redundancy constraint for emar_detail_site_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_site_during"
  add constraint emar_detail_site_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "site" WITH =,"during" WITH &&);

comment on constraint emar_detail_site_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_site_during" is 'Check redundancy constraint for emar_detail_site_during';

-- No redundancy constraint for emar_detail_dose_due_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during"
  add constraint emar_detail_dose_due_unit_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_due_unit" WITH =,"during" WITH &&);

comment on constraint emar_detail_dose_due_unit_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during" is 'Check redundancy constraint for emar_detail_dose_due_unit_during';

-- No redundancy constraint for emar_detail_barcode_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during"
  add constraint emar_detail_barcode_type_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "barcode_type" WITH =,"during" WITH &&);

comment on constraint emar_detail_barcode_type_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during" is 'Check redundancy constraint for emar_detail_barcode_type_during';

-- No redundancy constraint for emar_detail_will_remainder_of_dose_be_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during"
  add constraint emar_detail_will_remainder_of_dose_be_given_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "will_remainder_of_dose_be_given" WITH =,"during" WITH &&);

comment on constraint emar_detail_will_remainder_of_dose_be_given_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during" is 'Check redundancy constraint for emar_detail_will_remainder_of_dose_be_given_during';

-- No redundancy constraint for emar_detail_dose_due_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during"
  add constraint emar_detail_dose_due_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_due" WITH =,"during" WITH &&);

comment on constraint emar_detail_dose_due_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during" is 'Check redundancy constraint for emar_detail_dose_due_during';

-- No redundancy constraint for emar_detail_reason_for_no_barcode_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during"
  add constraint emar_detail_reason_for_no_barcode_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "reason_for_no_barcode" WITH =,"during" WITH &&);

comment on constraint emar_detail_reason_for_no_barcode_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during" is 'Check redundancy constraint for emar_detail_reason_for_no_barcode_during';

-- No redundancy constraint for emar_detail_infusion_rate_adjustment_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during"
  add constraint emar_detail_infusion_rate_adjustment_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_adjustment" WITH =,"during" WITH &&);

comment on constraint emar_detail_infusion_rate_adjustment_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during" is 'Check redundancy constraint for emar_detail_infusion_rate_adjustment_during';

-- No redundancy constraint for emar_detail_infusion_rate_adjustment_amount_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during"
  add constraint emar_detail_infusion_rate_adjustment_amount_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_adjustment_amount" WITH =,"during" WITH &&);

comment on constraint emar_detail_infusion_rate_adjustment_amount_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during" is 'Check redundancy constraint for emar_detail_infusion_rate_adjustment_amount_during';

-- No redundancy constraint for emar_detail_non_formulary_visual_verification_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during"
  add constraint emar_detail_non_formulary_visual_verification_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "non_formulary_visual_verification" WITH =,"during" WITH &&);

comment on constraint emar_detail_non_formulary_visual_verification_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during" is 'Check redundancy constraint for emar_detail_non_formulary_visual_verification_during';

-- No redundancy constraint for emar_detail_dose_given_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during"
  add constraint emar_detail_dose_given_unit_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_given_unit" WITH =,"during" WITH &&);

comment on constraint emar_detail_dose_given_unit_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during" is 'Check redundancy constraint for emar_detail_dose_given_unit_during';

-- No redundancy constraint for emar_detail_complete_dose_not_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during"
  add constraint emar_detail_complete_dose_not_given_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "complete_dose_not_given" WITH =,"during" WITH &&);

comment on constraint emar_detail_complete_dose_not_given_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during" is 'Check redundancy constraint for emar_detail_complete_dose_not_given_during';

-- No redundancy constraint for emar_detail_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_during"
  add constraint emar_detail_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =,"during" WITH &&);

comment on constraint emar_detail_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_during" is 'Check redundancy constraint for emar_detail_during';

-- No redundancy constraint for emar_detail_new_iv_bag_hung_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during"
  add constraint emar_detail_new_iv_bag_hung_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "new_iv_bag_hung" WITH =,"during" WITH &&);

comment on constraint emar_detail_new_iv_bag_hung_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during" is 'Check redundancy constraint for emar_detail_new_iv_bag_hung_during';

-- No redundancy constraint for emar_detail_product_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during"
  add constraint emar_detail_product_unit_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_unit" WITH =,"during" WITH &&);

comment on constraint emar_detail_product_unit_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during" is 'Check redundancy constraint for emar_detail_product_unit_during';

-- No redundancy constraint for emar_detail_product_code_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during"
  add constraint emar_detail_product_code_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_code" WITH =,"during" WITH &&);

comment on constraint emar_detail_product_code_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_product_code_during" is 'Check redundancy constraint for emar_detail_product_code_during';

-- No redundancy constraint for emar_detail_restart_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during"
  add constraint emar_detail_restart_interval_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "restart_interval" WITH =,"during" WITH &&);

comment on constraint emar_detail_restart_interval_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during" is 'Check redundancy constraint for emar_detail_restart_interval_during';

-- No redundancy constraint for emar_detail_administration_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during"
  add constraint emar_detail_administration_type_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "administration_type" WITH =,"during" WITH &&);

comment on constraint emar_detail_administration_type_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during" is 'Check redundancy constraint for emar_detail_administration_type_during';

-- No redundancy constraint for emar_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during"
  add constraint emar_detail_subject_id_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint emar_detail_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during" is 'Check redundancy constraint for emar_detail_subject_id_during';

-- No redundancy constraint for emar_detail_product_amount_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during"
  add constraint emar_detail_product_amount_given_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_amount_given" WITH =,"during" WITH &&);

comment on constraint emar_detail_product_amount_given_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during" is 'Check redundancy constraint for emar_detail_product_amount_given_during';

-- No redundancy constraint for emar_detail_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during"
  add constraint emar_detail_emar_seq_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "emar_seq" WITH =,"during" WITH &&);

comment on constraint emar_detail_emar_seq_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during" is 'Check redundancy constraint for emar_detail_emar_seq_during';

-- No redundancy constraint for emar_detail_infusion_complete_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during"
  add constraint emar_detail_infusion_complete_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_complete" WITH =,"during" WITH &&);

comment on constraint emar_detail_infusion_complete_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during" is 'Check redundancy constraint for emar_detail_infusion_complete_during';

-- No redundancy constraint for emar_detail_prior_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during"
  add constraint emar_detail_prior_infusion_rate_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "prior_infusion_rate" WITH =,"during" WITH &&);

comment on constraint emar_detail_prior_infusion_rate_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during" is 'Check redundancy constraint for emar_detail_prior_infusion_rate_during';

-- No redundancy constraint for emar_detail_continued_infusion_in_other_location_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during"
  add constraint emar_detail_continued_infusion_in_other_location_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "continued_infusion_in_other_location" WITH =,"during" WITH &&);

comment on constraint emar_detail_continued_infusion_in_other_location_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during" is 'Check redundancy constraint for emar_detail_continued_infusion_in_other_location_during';

-- No redundancy constraint for emar_detail_dose_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during"
  add constraint emar_detail_dose_given_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_given" WITH =,"during" WITH &&);

comment on constraint emar_detail_dose_given_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during" is 'Check redundancy constraint for emar_detail_dose_given_during';

-- No redundancy constraint for emar_detail_route_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_route_during"
  add constraint emar_detail_route_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "route" WITH =,"during" WITH &&);

comment on constraint emar_detail_route_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_route_during" is 'Check redundancy constraint for emar_detail_route_during';

-- No redundancy constraint for emar_detail_product_description_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during"
  add constraint emar_detail_product_description_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_description" WITH =,"during" WITH &&);

comment on constraint emar_detail_product_description_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_product_description_during" is 'Check redundancy constraint for emar_detail_product_description_during';

-- No redundancy constraint for emar_detail_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during"
  add constraint emar_detail_infusion_rate_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate" WITH =,"during" WITH &&);

comment on constraint emar_detail_infusion_rate_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during" is 'Check redundancy constraint for emar_detail_infusion_rate_during';

-- No redundancy constraint for emar_detail_infusion_rate_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during"
  add constraint emar_detail_infusion_rate_unit_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_unit" WITH =,"during" WITH &&);

comment on constraint emar_detail_infusion_rate_unit_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during" is 'Check redundancy constraint for emar_detail_infusion_rate_unit_during';

-- No redundancy constraint for emar_detail_completion_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during"
  add constraint emar_detail_completion_interval_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "completion_interval" WITH =,"during" WITH &&);

comment on constraint emar_detail_completion_interval_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during" is 'Check redundancy constraint for emar_detail_completion_interval_during';

-- No redundancy constraint for emar_detail_product_description_other_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during"
  add constraint emar_detail_product_description_other_during_redundancy
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_description_other" WITH =,"during" WITH &&);

comment on constraint emar_detail_product_description_other_during_redundancy on "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during" is 'Check redundancy constraint for emar_detail_product_description_other_during';

-- No redundancy constraint for poe_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during"
  add constraint poe_detail_subject_id_during_redundancy
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "subject_id" WITH =,"during" WITH &&);

comment on constraint poe_detail_subject_id_during_redundancy on "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during" is 'Check redundancy constraint for poe_detail_subject_id_during';

-- No redundancy constraint for poe_detail_field_value_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during"
  add constraint poe_detail_field_value_during_redundancy
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "field_value" WITH =,"during" WITH &&);

comment on constraint poe_detail_field_value_during_redundancy on "mimiciv_hosp@V@UHF"."poe_detail_field_value_during" is 'Check redundancy constraint for poe_detail_field_value_during';

-- No redundancy constraint for poe_detail_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_during"
  add constraint poe_detail_during_redundancy
  exclude using gist("poe_id" WITH =, "field_name" WITH =,"during" WITH &&);

comment on constraint poe_detail_during_redundancy on "mimiciv_hosp@V@UHF"."poe_detail_during" is 'Check redundancy constraint for poe_detail_during';

-- No redundancy constraint for poe_detail_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during"
  add constraint poe_detail_poe_seq_during_redundancy
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "poe_seq" WITH =,"during" WITH &&);

comment on constraint poe_detail_poe_seq_during_redundancy on "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during" is 'Check redundancy constraint for poe_detail_poe_seq_during';

-- No circumlocution constraint for d_hcpcs_short_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during"
  add constraint d_hcpcs_short_description_during_circumlocution
  exclude using gist("code" WITH = , "short_description" WITH =,"during" WITH -|-);

 comment on constraint d_hcpcs_short_description_during_circumlocution on "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during" is 'Check circumlocution constraint for d_hcpcs_short_description_during';

-- No circumlocution constraint for d_hcpcs_long_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during"
  add constraint d_hcpcs_long_description_during_circumlocution
  exclude using gist("code" WITH = , "long_description" WITH =,"during" WITH -|-);

 comment on constraint d_hcpcs_long_description_during_circumlocution on "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during" is 'Check circumlocution constraint for d_hcpcs_long_description_during';

-- No circumlocution constraint for d_hcpcs_category_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during"
  add constraint d_hcpcs_category_during_circumlocution
  exclude using gist("code" WITH = , "category" WITH =,"during" WITH -|-);

 comment on constraint d_hcpcs_category_during_circumlocution on "mimiciv_hosp@V@UHF"."d_hcpcs_category_during" is 'Check circumlocution constraint for d_hcpcs_category_during';

-- No circumlocution constraint for d_hcpcs_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_during"
  add constraint d_hcpcs_during_circumlocution
  exclude using gist("code" WITH = ,"during" WITH -|-);

 comment on constraint d_hcpcs_during_circumlocution on "mimiciv_hosp@V@UHF"."d_hcpcs_during" is 'Check circumlocution constraint for d_hcpcs_during';

-- No circumlocution constraint for d_icd_diagnoses_during
alter table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during"
  add constraint d_icd_diagnoses_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH = ,"during" WITH -|-);

 comment on constraint d_icd_diagnoses_during_circumlocution on "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during" is 'Check circumlocution constraint for d_icd_diagnoses_during';

-- No circumlocution constraint for d_icd_diagnoses_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during"
  add constraint d_icd_diagnoses_long_title_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH = , "long_title" WITH =,"during" WITH -|-);

 comment on constraint d_icd_diagnoses_long_title_during_circumlocution on "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during" is 'Check circumlocution constraint for d_icd_diagnoses_long_title_during';

-- No circumlocution constraint for d_icd_procedures_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during"
  add constraint d_icd_procedures_long_title_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH = , "long_title" WITH =,"during" WITH -|-);

 comment on constraint d_icd_procedures_long_title_during_circumlocution on "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during" is 'Check circumlocution constraint for d_icd_procedures_long_title_during';

-- No circumlocution constraint for d_icd_procedures_during
alter table "mimiciv_hosp@V@UHF"."d_icd_procedures_during"
  add constraint d_icd_procedures_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH = ,"during" WITH -|-);

 comment on constraint d_icd_procedures_during_circumlocution on "mimiciv_hosp@V@UHF"."d_icd_procedures_during" is 'Check circumlocution constraint for d_icd_procedures_during';

-- No circumlocution constraint for d_labitems_label_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_label_during"
  add constraint d_labitems_label_during_circumlocution
  exclude using gist("itemid" WITH = , "label" WITH =,"during" WITH -|-);

 comment on constraint d_labitems_label_during_circumlocution on "mimiciv_hosp@V@UHF"."d_labitems_label_during" is 'Check circumlocution constraint for d_labitems_label_during';

-- No circumlocution constraint for d_labitems_fluid_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during"
  add constraint d_labitems_fluid_during_circumlocution
  exclude using gist("itemid" WITH = , "fluid" WITH =,"during" WITH -|-);

 comment on constraint d_labitems_fluid_during_circumlocution on "mimiciv_hosp@V@UHF"."d_labitems_fluid_during" is 'Check circumlocution constraint for d_labitems_fluid_during';

-- No circumlocution constraint for d_labitems_category_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_category_during"
  add constraint d_labitems_category_during_circumlocution
  exclude using gist("itemid" WITH = , "category" WITH =,"during" WITH -|-);

 comment on constraint d_labitems_category_during_circumlocution on "mimiciv_hosp@V@UHF"."d_labitems_category_during" is 'Check circumlocution constraint for d_labitems_category_during';

-- No circumlocution constraint for d_labitems_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_during"
  add constraint d_labitems_during_circumlocution
  exclude using gist("itemid" WITH = ,"during" WITH -|-);

 comment on constraint d_labitems_during_circumlocution on "mimiciv_hosp@V@UHF"."d_labitems_during" is 'Check circumlocution constraint for d_labitems_during';

-- No circumlocution constraint for omr_result_name_during
alter table "mimiciv_hosp@V@UHF"."omr_result_name_during"
  add constraint omr_result_name_during_circumlocution
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH = , "result_name" WITH =,"during" WITH -|-);

 comment on constraint omr_result_name_during_circumlocution on "mimiciv_hosp@V@UHF"."omr_result_name_during" is 'Check circumlocution constraint for omr_result_name_during';

-- No circumlocution constraint for omr_result_value_during
alter table "mimiciv_hosp@V@UHF"."omr_result_value_during"
  add constraint omr_result_value_during_circumlocution
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH = , "result_value" WITH =,"during" WITH -|-);

 comment on constraint omr_result_value_during_circumlocution on "mimiciv_hosp@V@UHF"."omr_result_value_during" is 'Check circumlocution constraint for omr_result_value_during';

-- No circumlocution constraint for omr_during
alter table "mimiciv_hosp@V@UHF"."omr_during"
  add constraint omr_during_circumlocution
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH = ,"during" WITH -|-);

 comment on constraint omr_during_circumlocution on "mimiciv_hosp@V@UHF"."omr_during" is 'Check circumlocution constraint for omr_during';

-- No circumlocution constraint for patients_gender_during
alter table "mimiciv_hosp@V@UHF"."patients_gender_during"
  add constraint patients_gender_during_circumlocution
  exclude using gist("subject_id" WITH = , "gender" WITH =,"during" WITH -|-);

 comment on constraint patients_gender_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_gender_during" is 'Check circumlocution constraint for patients_gender_during';

-- No circumlocution constraint for patients_dod_during
alter table "mimiciv_hosp@V@UHF"."patients_dod_during"
  add constraint patients_dod_during_circumlocution
  exclude using gist("subject_id" WITH = , "dod" WITH =,"during" WITH -|-);

 comment on constraint patients_dod_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_dod_during" is 'Check circumlocution constraint for patients_dod_during';

-- No circumlocution constraint for patients_during
alter table "mimiciv_hosp@V@UHF"."patients_during"
  add constraint patients_during_circumlocution
  exclude using gist("subject_id" WITH = ,"during" WITH -|-);

 comment on constraint patients_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_during" is 'Check circumlocution constraint for patients_during';

-- No circumlocution constraint for patients_anchor_age_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_age_during"
  add constraint patients_anchor_age_during_circumlocution
  exclude using gist("subject_id" WITH = , "anchor_age" WITH =,"during" WITH -|-);

 comment on constraint patients_anchor_age_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_anchor_age_during" is 'Check circumlocution constraint for patients_anchor_age_during';

-- No circumlocution constraint for patients_anchor_year_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_during"
  add constraint patients_anchor_year_during_circumlocution
  exclude using gist("subject_id" WITH = , "anchor_year" WITH =,"during" WITH -|-);

 comment on constraint patients_anchor_year_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_anchor_year_during" is 'Check circumlocution constraint for patients_anchor_year_during';

-- No circumlocution constraint for patients_anchor_year_group_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during"
  add constraint patients_anchor_year_group_during_circumlocution
  exclude using gist("subject_id" WITH = , "anchor_year_group" WITH =,"during" WITH -|-);

 comment on constraint patients_anchor_year_group_during_circumlocution on "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during" is 'Check circumlocution constraint for patients_anchor_year_group_during';

-- No circumlocution constraint for provider_during
alter table "mimiciv_hosp@V@UHF"."provider_during"
  add constraint provider_during_circumlocution
  exclude using gist("provider_id" WITH = ,"during" WITH -|-);

 comment on constraint provider_during_circumlocution on "mimiciv_hosp@V@UHF"."provider_during" is 'Check circumlocution constraint for provider_during';

-- No circumlocution constraint for admissions_admit_provider_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during"
  add constraint admissions_admit_provider_id_during_circumlocution
  exclude using gist("hadm_id" WITH = , "admit_provider_id" WITH =,"during" WITH -|-);

 comment on constraint admissions_admit_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during" is 'Check circumlocution constraint for admissions_admit_provider_id_during';

-- No circumlocution constraint for admissions_admittime_during
alter table "mimiciv_hosp@V@UHF"."admissions_admittime_during"
  add constraint admissions_admittime_during_circumlocution
  exclude using gist("hadm_id" WITH = , "admittime" WITH =,"during" WITH -|-);

 comment on constraint admissions_admittime_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_admittime_during" is 'Check circumlocution constraint for admissions_admittime_during';

-- No circumlocution constraint for admissions_dischtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_dischtime_during"
  add constraint admissions_dischtime_during_circumlocution
  exclude using gist("hadm_id" WITH = , "dischtime" WITH =,"during" WITH -|-);

 comment on constraint admissions_dischtime_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_dischtime_during" is 'Check circumlocution constraint for admissions_dischtime_during';

-- No circumlocution constraint for admissions_during
alter table "mimiciv_hosp@V@UHF"."admissions_during"
  add constraint admissions_during_circumlocution
  exclude using gist("hadm_id" WITH = ,"during" WITH -|-);

 comment on constraint admissions_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_during" is 'Check circumlocution constraint for admissions_during';

-- No circumlocution constraint for admissions_discharge_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during"
  add constraint admissions_discharge_location_during_circumlocution
  exclude using gist("hadm_id" WITH = , "discharge_location" WITH =,"during" WITH -|-);

 comment on constraint admissions_discharge_location_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_discharge_location_during" is 'Check circumlocution constraint for admissions_discharge_location_during';

-- No circumlocution constraint for admissions_race_during
alter table "mimiciv_hosp@V@UHF"."admissions_race_during"
  add constraint admissions_race_during_circumlocution
  exclude using gist("hadm_id" WITH = , "race" WITH =,"during" WITH -|-);

 comment on constraint admissions_race_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_race_during" is 'Check circumlocution constraint for admissions_race_during';

-- No circumlocution constraint for admissions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_subject_id_during"
  add constraint admissions_subject_id_during_circumlocution
  exclude using gist("hadm_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint admissions_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_subject_id_during" is 'Check circumlocution constraint for admissions_subject_id_during';

-- No circumlocution constraint for admissions_admission_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_location_during"
  add constraint admissions_admission_location_during_circumlocution
  exclude using gist("hadm_id" WITH = , "admission_location" WITH =,"during" WITH -|-);

 comment on constraint admissions_admission_location_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_admission_location_during" is 'Check circumlocution constraint for admissions_admission_location_during';

-- No circumlocution constraint for admissions_hospital_expire_flag_during
alter table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during"
  add constraint admissions_hospital_expire_flag_during_circumlocution
  exclude using gist("hadm_id" WITH = , "hospital_expire_flag" WITH =,"during" WITH -|-);

 comment on constraint admissions_hospital_expire_flag_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during" is 'Check circumlocution constraint for admissions_hospital_expire_flag_during';

-- No circumlocution constraint for admissions_deathtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_deathtime_during"
  add constraint admissions_deathtime_during_circumlocution
  exclude using gist("hadm_id" WITH = , "deathtime" WITH =,"during" WITH -|-);

 comment on constraint admissions_deathtime_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_deathtime_during" is 'Check circumlocution constraint for admissions_deathtime_during';

-- No circumlocution constraint for admissions_edregtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edregtime_during"
  add constraint admissions_edregtime_during_circumlocution
  exclude using gist("hadm_id" WITH = , "edregtime" WITH =,"during" WITH -|-);

 comment on constraint admissions_edregtime_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_edregtime_during" is 'Check circumlocution constraint for admissions_edregtime_during';

-- No circumlocution constraint for admissions_language_during
alter table "mimiciv_hosp@V@UHF"."admissions_language_during"
  add constraint admissions_language_during_circumlocution
  exclude using gist("hadm_id" WITH = , "language" WITH =,"during" WITH -|-);

 comment on constraint admissions_language_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_language_during" is 'Check circumlocution constraint for admissions_language_during';

-- No circumlocution constraint for admissions_insurance_during
alter table "mimiciv_hosp@V@UHF"."admissions_insurance_during"
  add constraint admissions_insurance_during_circumlocution
  exclude using gist("hadm_id" WITH = , "insurance" WITH =,"during" WITH -|-);

 comment on constraint admissions_insurance_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_insurance_during" is 'Check circumlocution constraint for admissions_insurance_during';

-- No circumlocution constraint for admissions_edouttime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edouttime_during"
  add constraint admissions_edouttime_during_circumlocution
  exclude using gist("hadm_id" WITH = , "edouttime" WITH =,"during" WITH -|-);

 comment on constraint admissions_edouttime_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_edouttime_during" is 'Check circumlocution constraint for admissions_edouttime_during';

-- No circumlocution constraint for admissions_admission_type_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_type_during"
  add constraint admissions_admission_type_during_circumlocution
  exclude using gist("hadm_id" WITH = , "admission_type" WITH =,"during" WITH -|-);

 comment on constraint admissions_admission_type_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_admission_type_during" is 'Check circumlocution constraint for admissions_admission_type_during';

-- No circumlocution constraint for admissions_marital_status_during
alter table "mimiciv_hosp@V@UHF"."admissions_marital_status_during"
  add constraint admissions_marital_status_during_circumlocution
  exclude using gist("hadm_id" WITH = , "marital_status" WITH =,"during" WITH -|-);

 comment on constraint admissions_marital_status_during_circumlocution on "mimiciv_hosp@V@UHF"."admissions_marital_status_during" is 'Check circumlocution constraint for admissions_marital_status_during';

-- No circumlocution constraint for labevents_itemid_during
alter table "mimiciv_hosp@V@UHF"."labevents_itemid_during"
  add constraint labevents_itemid_during_circumlocution
  exclude using gist("labevent_id" WITH = , "itemid" WITH =,"during" WITH -|-);

 comment on constraint labevents_itemid_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_itemid_during" is 'Check circumlocution constraint for labevents_itemid_during';

-- No circumlocution constraint for labevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during"
  add constraint labevents_hadm_id_during_circumlocution
  exclude using gist("labevent_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint labevents_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_hadm_id_during" is 'Check circumlocution constraint for labevents_hadm_id_during';

-- No circumlocution constraint for labevents_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during"
  add constraint labevents_specimen_id_during_circumlocution
  exclude using gist("labevent_id" WITH = , "specimen_id" WITH =,"during" WITH -|-);

 comment on constraint labevents_specimen_id_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_specimen_id_during" is 'Check circumlocution constraint for labevents_specimen_id_during';

-- No circumlocution constraint for labevents_comments_during
alter table "mimiciv_hosp@V@UHF"."labevents_comments_during"
  add constraint labevents_comments_during_circumlocution
  exclude using gist("labevent_id" WITH = , "comments" WITH =,"during" WITH -|-);

 comment on constraint labevents_comments_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_comments_during" is 'Check circumlocution constraint for labevents_comments_during';

-- No circumlocution constraint for labevents_ref_range_lower_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during"
  add constraint labevents_ref_range_lower_during_circumlocution
  exclude using gist("labevent_id" WITH = , "ref_range_lower" WITH =,"during" WITH -|-);

 comment on constraint labevents_ref_range_lower_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during" is 'Check circumlocution constraint for labevents_ref_range_lower_during';

-- No circumlocution constraint for labevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during"
  add constraint labevents_order_provider_id_during_circumlocution
  exclude using gist("labevent_id" WITH = , "order_provider_id" WITH =,"during" WITH -|-);

 comment on constraint labevents_order_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during" is 'Check circumlocution constraint for labevents_order_provider_id_during';

-- No circumlocution constraint for labevents_ref_range_upper_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during"
  add constraint labevents_ref_range_upper_during_circumlocution
  exclude using gist("labevent_id" WITH = , "ref_range_upper" WITH =,"during" WITH -|-);

 comment on constraint labevents_ref_range_upper_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during" is 'Check circumlocution constraint for labevents_ref_range_upper_during';

-- No circumlocution constraint for labevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_subject_id_during"
  add constraint labevents_subject_id_during_circumlocution
  exclude using gist("labevent_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint labevents_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_subject_id_during" is 'Check circumlocution constraint for labevents_subject_id_during';

-- No circumlocution constraint for labevents_valueuom_during
alter table "mimiciv_hosp@V@UHF"."labevents_valueuom_during"
  add constraint labevents_valueuom_during_circumlocution
  exclude using gist("labevent_id" WITH = , "valueuom" WITH =,"during" WITH -|-);

 comment on constraint labevents_valueuom_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_valueuom_during" is 'Check circumlocution constraint for labevents_valueuom_during';

-- No circumlocution constraint for labevents_flag_during
alter table "mimiciv_hosp@V@UHF"."labevents_flag_during"
  add constraint labevents_flag_during_circumlocution
  exclude using gist("labevent_id" WITH = , "flag" WITH =,"during" WITH -|-);

 comment on constraint labevents_flag_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_flag_during" is 'Check circumlocution constraint for labevents_flag_during';

-- No circumlocution constraint for labevents_valuenum_during
alter table "mimiciv_hosp@V@UHF"."labevents_valuenum_during"
  add constraint labevents_valuenum_during_circumlocution
  exclude using gist("labevent_id" WITH = , "valuenum" WITH =,"during" WITH -|-);

 comment on constraint labevents_valuenum_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_valuenum_during" is 'Check circumlocution constraint for labevents_valuenum_during';

-- No circumlocution constraint for labevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."labevents_charttime_during"
  add constraint labevents_charttime_during_circumlocution
  exclude using gist("labevent_id" WITH = , "charttime" WITH =,"during" WITH -|-);

 comment on constraint labevents_charttime_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_charttime_during" is 'Check circumlocution constraint for labevents_charttime_during';

-- No circumlocution constraint for labevents_priority_during
alter table "mimiciv_hosp@V@UHF"."labevents_priority_during"
  add constraint labevents_priority_during_circumlocution
  exclude using gist("labevent_id" WITH = , "priority" WITH =,"during" WITH -|-);

 comment on constraint labevents_priority_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_priority_during" is 'Check circumlocution constraint for labevents_priority_during';

-- No circumlocution constraint for labevents_during
alter table "mimiciv_hosp@V@UHF"."labevents_during"
  add constraint labevents_during_circumlocution
  exclude using gist("labevent_id" WITH = ,"during" WITH -|-);

 comment on constraint labevents_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_during" is 'Check circumlocution constraint for labevents_during';

-- No circumlocution constraint for labevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."labevents_storetime_during"
  add constraint labevents_storetime_during_circumlocution
  exclude using gist("labevent_id" WITH = , "storetime" WITH =,"during" WITH -|-);

 comment on constraint labevents_storetime_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_storetime_during" is 'Check circumlocution constraint for labevents_storetime_during';

-- No circumlocution constraint for labevents_value_during
alter table "mimiciv_hosp@V@UHF"."labevents_value_during"
  add constraint labevents_value_during_circumlocution
  exclude using gist("labevent_id" WITH = , "value" WITH =,"during" WITH -|-);

 comment on constraint labevents_value_during_circumlocution on "mimiciv_hosp@V@UHF"."labevents_value_during" is 'Check circumlocution constraint for labevents_value_during';

-- No circumlocution constraint for transfers_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during"
  add constraint transfers_hadm_id_during_circumlocution
  exclude using gist("transfer_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint transfers_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_hadm_id_during" is 'Check circumlocution constraint for transfers_hadm_id_during';

-- No circumlocution constraint for transfers_subject_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_subject_id_during"
  add constraint transfers_subject_id_during_circumlocution
  exclude using gist("transfer_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint transfers_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_subject_id_during" is 'Check circumlocution constraint for transfers_subject_id_during';

-- No circumlocution constraint for transfers_outtime_during
alter table "mimiciv_hosp@V@UHF"."transfers_outtime_during"
  add constraint transfers_outtime_during_circumlocution
  exclude using gist("transfer_id" WITH = , "outtime" WITH =,"during" WITH -|-);

 comment on constraint transfers_outtime_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_outtime_during" is 'Check circumlocution constraint for transfers_outtime_during';

-- No circumlocution constraint for transfers_during
alter table "mimiciv_hosp@V@UHF"."transfers_during"
  add constraint transfers_during_circumlocution
  exclude using gist("transfer_id" WITH = ,"during" WITH -|-);

 comment on constraint transfers_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_during" is 'Check circumlocution constraint for transfers_during';

-- No circumlocution constraint for transfers_intime_during
alter table "mimiciv_hosp@V@UHF"."transfers_intime_during"
  add constraint transfers_intime_during_circumlocution
  exclude using gist("transfer_id" WITH = , "intime" WITH =,"during" WITH -|-);

 comment on constraint transfers_intime_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_intime_during" is 'Check circumlocution constraint for transfers_intime_during';

-- No circumlocution constraint for transfers_careunit_during
alter table "mimiciv_hosp@V@UHF"."transfers_careunit_during"
  add constraint transfers_careunit_during_circumlocution
  exclude using gist("transfer_id" WITH = , "careunit" WITH =,"during" WITH -|-);

 comment on constraint transfers_careunit_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_careunit_during" is 'Check circumlocution constraint for transfers_careunit_during';

-- No circumlocution constraint for transfers_eventtype_during
alter table "mimiciv_hosp@V@UHF"."transfers_eventtype_during"
  add constraint transfers_eventtype_during_circumlocution
  exclude using gist("transfer_id" WITH = , "eventtype" WITH =,"during" WITH -|-);

 comment on constraint transfers_eventtype_during_circumlocution on "mimiciv_hosp@V@UHF"."transfers_eventtype_during" is 'Check circumlocution constraint for transfers_eventtype_during';

-- No circumlocution constraint for diagnoses_icd_during
alter table "mimiciv_hosp@V@UHF"."diagnoses_icd_during"
  add constraint diagnoses_icd_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH = ,"during" WITH -|-);

 comment on constraint diagnoses_icd_during_circumlocution on "mimiciv_hosp@V@UHF"."diagnoses_icd_during" is 'Check circumlocution constraint for diagnoses_icd_during';

-- No circumlocution constraint for diagnoses_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during"
  add constraint diagnoses_icd_subject_id_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint diagnoses_icd_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during" is 'Check circumlocution constraint for diagnoses_icd_subject_id_during';

-- No circumlocution constraint for drgcodes_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_during"
  add constraint drgcodes_during_circumlocution
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH = ,"during" WITH -|-);

 comment on constraint drgcodes_during_circumlocution on "mimiciv_hosp@V@UHF"."drgcodes_during" is 'Check circumlocution constraint for drgcodes_during';

-- No circumlocution constraint for drgcodes_description_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_description_during"
  add constraint drgcodes_description_during_circumlocution
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH = , "description" WITH =,"during" WITH -|-);

 comment on constraint drgcodes_description_during_circumlocution on "mimiciv_hosp@V@UHF"."drgcodes_description_during" is 'Check circumlocution constraint for drgcodes_description_during';

-- No circumlocution constraint for drgcodes_drg_type_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during"
  add constraint drgcodes_drg_type_during_circumlocution
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH = , "drg_type" WITH =,"during" WITH -|-);

 comment on constraint drgcodes_drg_type_during_circumlocution on "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during" is 'Check circumlocution constraint for drgcodes_drg_type_during';

-- No circumlocution constraint for drgcodes_drg_severity_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during"
  add constraint drgcodes_drg_severity_during_circumlocution
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH = , "drg_severity" WITH =,"during" WITH -|-);

 comment on constraint drgcodes_drg_severity_during_circumlocution on "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during" is 'Check circumlocution constraint for drgcodes_drg_severity_during';

-- No circumlocution constraint for drgcodes_drg_mortality_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during"
  add constraint drgcodes_drg_mortality_during_circumlocution
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH = , "drg_mortality" WITH =,"during" WITH -|-);

 comment on constraint drgcodes_drg_mortality_during_circumlocution on "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during" is 'Check circumlocution constraint for drgcodes_drg_mortality_during';

-- No circumlocution constraint for emar_charttime_during
alter table "mimiciv_hosp@V@UHF"."emar_charttime_during"
  add constraint emar_charttime_during_circumlocution
  exclude using gist("emar_id" WITH = , "charttime" WITH =,"during" WITH -|-);

 comment on constraint emar_charttime_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_charttime_during" is 'Check circumlocution constraint for emar_charttime_during';

-- No circumlocution constraint for emar_poe_id_during
alter table "mimiciv_hosp@V@UHF"."emar_poe_id_during"
  add constraint emar_poe_id_during_circumlocution
  exclude using gist("emar_id" WITH = , "poe_id" WITH =,"during" WITH -|-);

 comment on constraint emar_poe_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_poe_id_during" is 'Check circumlocution constraint for emar_poe_id_during';

-- No circumlocution constraint for emar_enter_provider_id_during
alter table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during"
  add constraint emar_enter_provider_id_during_circumlocution
  exclude using gist("emar_id" WITH = , "enter_provider_id" WITH =,"during" WITH -|-);

 comment on constraint emar_enter_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during" is 'Check circumlocution constraint for emar_enter_provider_id_during';

-- No circumlocution constraint for emar_medication_during
alter table "mimiciv_hosp@V@UHF"."emar_medication_during"
  add constraint emar_medication_during_circumlocution
  exclude using gist("emar_id" WITH = , "medication" WITH =,"during" WITH -|-);

 comment on constraint emar_medication_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_medication_during" is 'Check circumlocution constraint for emar_medication_during';

-- No circumlocution constraint for emar_scheduletime_during
alter table "mimiciv_hosp@V@UHF"."emar_scheduletime_during"
  add constraint emar_scheduletime_during_circumlocution
  exclude using gist("emar_id" WITH = , "scheduletime" WITH =,"during" WITH -|-);

 comment on constraint emar_scheduletime_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_scheduletime_during" is 'Check circumlocution constraint for emar_scheduletime_during';

-- No circumlocution constraint for emar_storetime_during
alter table "mimiciv_hosp@V@UHF"."emar_storetime_during"
  add constraint emar_storetime_during_circumlocution
  exclude using gist("emar_id" WITH = , "storetime" WITH =,"during" WITH -|-);

 comment on constraint emar_storetime_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_storetime_during" is 'Check circumlocution constraint for emar_storetime_during';

-- No circumlocution constraint for emar_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."emar_hadm_id_during"
  add constraint emar_hadm_id_during_circumlocution
  exclude using gist("emar_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint emar_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_hadm_id_during" is 'Check circumlocution constraint for emar_hadm_id_during';

-- No circumlocution constraint for emar_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_emar_seq_during"
  add constraint emar_emar_seq_during_circumlocution
  exclude using gist("emar_id" WITH = , "emar_seq" WITH =,"during" WITH -|-);

 comment on constraint emar_emar_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_emar_seq_during" is 'Check circumlocution constraint for emar_emar_seq_during';

-- No circumlocution constraint for emar_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during"
  add constraint emar_pharmacy_id_during_circumlocution
  exclude using gist("emar_id" WITH = , "pharmacy_id" WITH =,"during" WITH -|-);

 comment on constraint emar_pharmacy_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during" is 'Check circumlocution constraint for emar_pharmacy_id_during';

-- No circumlocution constraint for emar_event_txt_during
alter table "mimiciv_hosp@V@UHF"."emar_event_txt_during"
  add constraint emar_event_txt_during_circumlocution
  exclude using gist("emar_id" WITH = , "event_txt" WITH =,"during" WITH -|-);

 comment on constraint emar_event_txt_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_event_txt_during" is 'Check circumlocution constraint for emar_event_txt_during';

-- No circumlocution constraint for emar_during
alter table "mimiciv_hosp@V@UHF"."emar_during"
  add constraint emar_during_circumlocution
  exclude using gist("emar_id" WITH = ,"during" WITH -|-);

 comment on constraint emar_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_during" is 'Check circumlocution constraint for emar_during';

-- No circumlocution constraint for emar_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_subject_id_during"
  add constraint emar_subject_id_during_circumlocution
  exclude using gist("emar_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint emar_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_subject_id_during" is 'Check circumlocution constraint for emar_subject_id_during';

-- No circumlocution constraint for hcpcsevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during"
  add constraint hcpcsevents_subject_id_during_circumlocution
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint hcpcsevents_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during" is 'Check circumlocution constraint for hcpcsevents_subject_id_during';

-- No circumlocution constraint for hcpcsevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during"
  add constraint hcpcsevents_chartdate_during_circumlocution
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "chartdate" WITH =,"during" WITH -|-);

 comment on constraint hcpcsevents_chartdate_during_circumlocution on "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during" is 'Check circumlocution constraint for hcpcsevents_chartdate_during';

-- No circumlocution constraint for hcpcsevents_short_description_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during"
  add constraint hcpcsevents_short_description_during_circumlocution
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "short_description" WITH =,"during" WITH -|-);

 comment on constraint hcpcsevents_short_description_during_circumlocution on "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during" is 'Check circumlocution constraint for hcpcsevents_short_description_during';

-- No circumlocution constraint for hcpcsevents_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_during"
  add constraint hcpcsevents_during_circumlocution
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH = ,"during" WITH -|-);

 comment on constraint hcpcsevents_during_circumlocution on "mimiciv_hosp@V@UHF"."hcpcsevents_during" is 'Check circumlocution constraint for hcpcsevents_during';

-- No circumlocution constraint for microbiologyevents_quantity_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during"
  add constraint microbiologyevents_quantity_during_circumlocution
  exclude using gist("microevent_id" WITH = , "quantity" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_quantity_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during" is 'Check circumlocution constraint for microbiologyevents_quantity_during';

-- No circumlocution constraint for microbiologyevents_micro_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during"
  add constraint microbiologyevents_micro_specimen_id_during_circumlocution
  exclude using gist("microevent_id" WITH = , "micro_specimen_id" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_micro_specimen_id_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during" is 'Check circumlocution constraint for microbiologyevents_micro_specimen_id_during';

-- No circumlocution constraint for microbiologyevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during"
  add constraint microbiologyevents_storetime_during_circumlocution
  exclude using gist("microevent_id" WITH = , "storetime" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_storetime_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during" is 'Check circumlocution constraint for microbiologyevents_storetime_during';

-- No circumlocution constraint for microbiologyevents_org_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during"
  add constraint microbiologyevents_org_name_during_circumlocution
  exclude using gist("microevent_id" WITH = , "org_name" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_org_name_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during" is 'Check circumlocution constraint for microbiologyevents_org_name_during';

-- No circumlocution constraint for microbiologyevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during"
  add constraint microbiologyevents_order_provider_id_during_circumlocution
  exclude using gist("microevent_id" WITH = , "order_provider_id" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_order_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during" is 'Check circumlocution constraint for microbiologyevents_order_provider_id_during';

-- No circumlocution constraint for microbiologyevents_isolate_num_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during"
  add constraint microbiologyevents_isolate_num_during_circumlocution
  exclude using gist("microevent_id" WITH = , "isolate_num" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_isolate_num_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during" is 'Check circumlocution constraint for microbiologyevents_isolate_num_during';

-- No circumlocution constraint for microbiologyevents_org_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during"
  add constraint microbiologyevents_org_itemid_during_circumlocution
  exclude using gist("microevent_id" WITH = , "org_itemid" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_org_itemid_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during" is 'Check circumlocution constraint for microbiologyevents_org_itemid_during';

-- No circumlocution constraint for microbiologyevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during"
  add constraint microbiologyevents_chartdate_during_circumlocution
  exclude using gist("microevent_id" WITH = , "chartdate" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_chartdate_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during" is 'Check circumlocution constraint for microbiologyevents_chartdate_during';

-- No circumlocution constraint for microbiologyevents_spec_type_desc_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during"
  add constraint microbiologyevents_spec_type_desc_during_circumlocution
  exclude using gist("microevent_id" WITH = , "spec_type_desc" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_spec_type_desc_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during" is 'Check circumlocution constraint for microbiologyevents_spec_type_desc_during';

-- No circumlocution constraint for microbiologyevents_dilution_value_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during"
  add constraint microbiologyevents_dilution_value_during_circumlocution
  exclude using gist("microevent_id" WITH = , "dilution_value" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_dilution_value_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during" is 'Check circumlocution constraint for microbiologyevents_dilution_value_during';

-- No circumlocution constraint for microbiologyevents_interpretation_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during"
  add constraint microbiologyevents_interpretation_during_circumlocution
  exclude using gist("microevent_id" WITH = , "interpretation" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_interpretation_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during" is 'Check circumlocution constraint for microbiologyevents_interpretation_during';

-- No circumlocution constraint for microbiologyevents_storedate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during"
  add constraint microbiologyevents_storedate_during_circumlocution
  exclude using gist("microevent_id" WITH = , "storedate" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_storedate_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during" is 'Check circumlocution constraint for microbiologyevents_storedate_during';

-- No circumlocution constraint for microbiologyevents_ab_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during"
  add constraint microbiologyevents_ab_name_during_circumlocution
  exclude using gist("microevent_id" WITH = , "ab_name" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_ab_name_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during" is 'Check circumlocution constraint for microbiologyevents_ab_name_during';

-- No circumlocution constraint for microbiologyevents_dilution_text_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during"
  add constraint microbiologyevents_dilution_text_during_circumlocution
  exclude using gist("microevent_id" WITH = , "dilution_text" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_dilution_text_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during" is 'Check circumlocution constraint for microbiologyevents_dilution_text_during';

-- No circumlocution constraint for microbiologyevents_ab_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during"
  add constraint microbiologyevents_ab_itemid_during_circumlocution
  exclude using gist("microevent_id" WITH = , "ab_itemid" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_ab_itemid_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during" is 'Check circumlocution constraint for microbiologyevents_ab_itemid_during';

-- No circumlocution constraint for microbiologyevents_test_seq_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during"
  add constraint microbiologyevents_test_seq_during_circumlocution
  exclude using gist("microevent_id" WITH = , "test_seq" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_test_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during" is 'Check circumlocution constraint for microbiologyevents_test_seq_during';

-- No circumlocution constraint for microbiologyevents_dilution_comparison_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during"
  add constraint microbiologyevents_dilution_comparison_during_circumlocution
  exclude using gist("microevent_id" WITH = , "dilution_comparison" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_dilution_comparison_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during" is 'Check circumlocution constraint for microbiologyevents_dilution_comparison_during';

-- No circumlocution constraint for microbiologyevents_test_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during"
  add constraint microbiologyevents_test_name_during_circumlocution
  exclude using gist("microevent_id" WITH = , "test_name" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_test_name_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during" is 'Check circumlocution constraint for microbiologyevents_test_name_during';

-- No circumlocution constraint for microbiologyevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during"
  add constraint microbiologyevents_hadm_id_during_circumlocution
  exclude using gist("microevent_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during" is 'Check circumlocution constraint for microbiologyevents_hadm_id_during';

-- No circumlocution constraint for microbiologyevents_comments_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during"
  add constraint microbiologyevents_comments_during_circumlocution
  exclude using gist("microevent_id" WITH = , "comments" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_comments_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during" is 'Check circumlocution constraint for microbiologyevents_comments_during';

-- No circumlocution constraint for microbiologyevents_spec_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during"
  add constraint microbiologyevents_spec_itemid_during_circumlocution
  exclude using gist("microevent_id" WITH = , "spec_itemid" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_spec_itemid_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during" is 'Check circumlocution constraint for microbiologyevents_spec_itemid_during';

-- No circumlocution constraint for microbiologyevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during"
  add constraint microbiologyevents_charttime_during_circumlocution
  exclude using gist("microevent_id" WITH = , "charttime" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_charttime_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during" is 'Check circumlocution constraint for microbiologyevents_charttime_during';

-- No circumlocution constraint for microbiologyevents_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_during"
  add constraint microbiologyevents_during_circumlocution
  exclude using gist("microevent_id" WITH = ,"during" WITH -|-);

 comment on constraint microbiologyevents_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_during" is 'Check circumlocution constraint for microbiologyevents_during';

-- No circumlocution constraint for microbiologyevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during"
  add constraint microbiologyevents_subject_id_during_circumlocution
  exclude using gist("microevent_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during" is 'Check circumlocution constraint for microbiologyevents_subject_id_during';

-- No circumlocution constraint for microbiologyevents_test_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during"
  add constraint microbiologyevents_test_itemid_during_circumlocution
  exclude using gist("microevent_id" WITH = , "test_itemid" WITH =,"during" WITH -|-);

 comment on constraint microbiologyevents_test_itemid_during_circumlocution on "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during" is 'Check circumlocution constraint for microbiologyevents_test_itemid_during';

-- No circumlocution constraint for pharmacy_medication_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_medication_during"
  add constraint pharmacy_medication_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "medication" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_medication_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_medication_during" is 'Check circumlocution constraint for pharmacy_medication_during';

-- No circumlocution constraint for pharmacy_lockout_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during"
  add constraint pharmacy_lockout_interval_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "lockout_interval" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_lockout_interval_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during" is 'Check circumlocution constraint for pharmacy_lockout_interval_during';

-- No circumlocution constraint for pharmacy_fill_quantity_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during"
  add constraint pharmacy_fill_quantity_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "fill_quantity" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_fill_quantity_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during" is 'Check circumlocution constraint for pharmacy_fill_quantity_during';

-- No circumlocution constraint for pharmacy_sliding_scale_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during"
  add constraint pharmacy_sliding_scale_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "sliding_scale" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_sliding_scale_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during" is 'Check circumlocution constraint for pharmacy_sliding_scale_during';

-- No circumlocution constraint for pharmacy_expiration_value_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during"
  add constraint pharmacy_expiration_value_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "expiration_value" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_expiration_value_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during" is 'Check circumlocution constraint for pharmacy_expiration_value_during';

-- No circumlocution constraint for pharmacy_duration_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during"
  add constraint pharmacy_duration_interval_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "duration_interval" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_duration_interval_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during" is 'Check circumlocution constraint for pharmacy_duration_interval_during';

-- No circumlocution constraint for pharmacy_basal_rate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during"
  add constraint pharmacy_basal_rate_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "basal_rate" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_basal_rate_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during" is 'Check circumlocution constraint for pharmacy_basal_rate_during';

-- No circumlocution constraint for pharmacy_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_during"
  add constraint pharmacy_during_circumlocution
  exclude using gist("pharmacy_id" WITH = ,"during" WITH -|-);

 comment on constraint pharmacy_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_during" is 'Check circumlocution constraint for pharmacy_during';

-- No circumlocution constraint for pharmacy_stoptime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during"
  add constraint pharmacy_stoptime_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "stoptime" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_stoptime_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during" is 'Check circumlocution constraint for pharmacy_stoptime_during';

-- No circumlocution constraint for pharmacy_subject_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during"
  add constraint pharmacy_subject_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during" is 'Check circumlocution constraint for pharmacy_subject_id_during';

-- No circumlocution constraint for pharmacy_entertime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during"
  add constraint pharmacy_entertime_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "entertime" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_entertime_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_entertime_during" is 'Check circumlocution constraint for pharmacy_entertime_during';

-- No circumlocution constraint for pharmacy_poe_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during"
  add constraint pharmacy_poe_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "poe_id" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_poe_id_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during" is 'Check circumlocution constraint for pharmacy_poe_id_during';

-- No circumlocution constraint for pharmacy_status_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_status_during"
  add constraint pharmacy_status_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "status" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_status_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_status_during" is 'Check circumlocution constraint for pharmacy_status_during';

-- No circumlocution constraint for pharmacy_infusion_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during"
  add constraint pharmacy_infusion_type_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "infusion_type" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_infusion_type_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during" is 'Check circumlocution constraint for pharmacy_infusion_type_during';

-- No circumlocution constraint for pharmacy_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during"
  add constraint pharmacy_hadm_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during" is 'Check circumlocution constraint for pharmacy_hadm_id_during';

-- No circumlocution constraint for pharmacy_expiration_unit_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during"
  add constraint pharmacy_expiration_unit_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "expiration_unit" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_expiration_unit_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during" is 'Check circumlocution constraint for pharmacy_expiration_unit_during';

-- No circumlocution constraint for pharmacy_verifiedtime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during"
  add constraint pharmacy_verifiedtime_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "verifiedtime" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_verifiedtime_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during" is 'Check circumlocution constraint for pharmacy_verifiedtime_during';

-- No circumlocution constraint for pharmacy_duration_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_during"
  add constraint pharmacy_duration_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "duration" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_duration_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_duration_during" is 'Check circumlocution constraint for pharmacy_duration_during';

-- No circumlocution constraint for pharmacy_dispensation_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during"
  add constraint pharmacy_dispensation_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "dispensation" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_dispensation_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during" is 'Check circumlocution constraint for pharmacy_dispensation_during';

-- No circumlocution constraint for pharmacy_route_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_route_during"
  add constraint pharmacy_route_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "route" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_route_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_route_during" is 'Check circumlocution constraint for pharmacy_route_during';

-- No circumlocution constraint for pharmacy_expirationdate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during"
  add constraint pharmacy_expirationdate_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "expirationdate" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_expirationdate_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during" is 'Check circumlocution constraint for pharmacy_expirationdate_during';

-- No circumlocution constraint for pharmacy_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during"
  add constraint pharmacy_doses_per_24_hrs_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "doses_per_24_hrs" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_doses_per_24_hrs_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during" is 'Check circumlocution constraint for pharmacy_doses_per_24_hrs_during';

-- No circumlocution constraint for pharmacy_proc_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during"
  add constraint pharmacy_proc_type_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "proc_type" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_proc_type_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during" is 'Check circumlocution constraint for pharmacy_proc_type_during';

-- No circumlocution constraint for pharmacy_frequency_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during"
  add constraint pharmacy_frequency_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "frequency" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_frequency_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_frequency_during" is 'Check circumlocution constraint for pharmacy_frequency_during';

-- No circumlocution constraint for pharmacy_one_hr_max_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during"
  add constraint pharmacy_one_hr_max_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "one_hr_max" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_one_hr_max_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during" is 'Check circumlocution constraint for pharmacy_one_hr_max_during';

-- No circumlocution constraint for pharmacy_starttime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during"
  add constraint pharmacy_starttime_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "starttime" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_starttime_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_starttime_during" is 'Check circumlocution constraint for pharmacy_starttime_during';

-- No circumlocution constraint for pharmacy_disp_sched_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during"
  add constraint pharmacy_disp_sched_during_circumlocution
  exclude using gist("pharmacy_id" WITH = , "disp_sched" WITH =,"during" WITH -|-);

 comment on constraint pharmacy_disp_sched_during_circumlocution on "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during" is 'Check circumlocution constraint for pharmacy_disp_sched_during';

-- No circumlocution constraint for poe_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_poe_seq_during"
  add constraint poe_poe_seq_during_circumlocution
  exclude using gist("poe_id" WITH = , "poe_seq" WITH =,"during" WITH -|-);

 comment on constraint poe_poe_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_poe_seq_during" is 'Check circumlocution constraint for poe_poe_seq_during';

-- No circumlocution constraint for poe_discontinued_by_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during"
  add constraint poe_discontinued_by_poe_id_during_circumlocution
  exclude using gist("poe_id" WITH = , "discontinued_by_poe_id" WITH =,"during" WITH -|-);

 comment on constraint poe_discontinued_by_poe_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during" is 'Check circumlocution constraint for poe_discontinued_by_poe_id_during';

-- No circumlocution constraint for poe_ordertime_during
alter table "mimiciv_hosp@V@UHF"."poe_ordertime_during"
  add constraint poe_ordertime_during_circumlocution
  exclude using gist("poe_id" WITH = , "ordertime" WITH =,"during" WITH -|-);

 comment on constraint poe_ordertime_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_ordertime_during" is 'Check circumlocution constraint for poe_ordertime_during';

-- No circumlocution constraint for poe_order_subtype_during
alter table "mimiciv_hosp@V@UHF"."poe_order_subtype_during"
  add constraint poe_order_subtype_during_circumlocution
  exclude using gist("poe_id" WITH = , "order_subtype" WITH =,"during" WITH -|-);

 comment on constraint poe_order_subtype_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_order_subtype_during" is 'Check circumlocution constraint for poe_order_subtype_during';

-- No circumlocution constraint for poe_order_status_during
alter table "mimiciv_hosp@V@UHF"."poe_order_status_during"
  add constraint poe_order_status_during_circumlocution
  exclude using gist("poe_id" WITH = , "order_status" WITH =,"during" WITH -|-);

 comment on constraint poe_order_status_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_order_status_during" is 'Check circumlocution constraint for poe_order_status_during';

-- No circumlocution constraint for poe_during
alter table "mimiciv_hosp@V@UHF"."poe_during"
  add constraint poe_during_circumlocution
  exclude using gist("poe_id" WITH = ,"during" WITH -|-);

 comment on constraint poe_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_during" is 'Check circumlocution constraint for poe_during';

-- No circumlocution constraint for poe_discontinue_of_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during"
  add constraint poe_discontinue_of_poe_id_during_circumlocution
  exclude using gist("poe_id" WITH = , "discontinue_of_poe_id" WITH =,"during" WITH -|-);

 comment on constraint poe_discontinue_of_poe_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during" is 'Check circumlocution constraint for poe_discontinue_of_poe_id_during';

-- No circumlocution constraint for poe_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during"
  add constraint poe_order_provider_id_during_circumlocution
  exclude using gist("poe_id" WITH = , "order_provider_id" WITH =,"during" WITH -|-);

 comment on constraint poe_order_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_order_provider_id_during" is 'Check circumlocution constraint for poe_order_provider_id_during';

-- No circumlocution constraint for poe_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_subject_id_during"
  add constraint poe_subject_id_during_circumlocution
  exclude using gist("poe_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint poe_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_subject_id_during" is 'Check circumlocution constraint for poe_subject_id_during';

-- No circumlocution constraint for poe_transaction_type_during
alter table "mimiciv_hosp@V@UHF"."poe_transaction_type_during"
  add constraint poe_transaction_type_during_circumlocution
  exclude using gist("poe_id" WITH = , "transaction_type" WITH =,"during" WITH -|-);

 comment on constraint poe_transaction_type_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_transaction_type_during" is 'Check circumlocution constraint for poe_transaction_type_during';

-- No circumlocution constraint for poe_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."poe_hadm_id_during"
  add constraint poe_hadm_id_during_circumlocution
  exclude using gist("poe_id" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint poe_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_hadm_id_during" is 'Check circumlocution constraint for poe_hadm_id_during';

-- No circumlocution constraint for poe_order_type_during
alter table "mimiciv_hosp@V@UHF"."poe_order_type_during"
  add constraint poe_order_type_during_circumlocution
  exclude using gist("poe_id" WITH = , "order_type" WITH =,"during" WITH -|-);

 comment on constraint poe_order_type_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_order_type_during" is 'Check circumlocution constraint for poe_order_type_during';

-- No circumlocution constraint for prescriptions_formulary_drug_cd_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during"
  add constraint prescriptions_formulary_drug_cd_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "formulary_drug_cd" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_formulary_drug_cd_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during" is 'Check circumlocution constraint for prescriptions_formulary_drug_cd_during';

-- No circumlocution constraint for prescriptions_form_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during"
  add constraint prescriptions_form_rx_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "form_rx" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_form_rx_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during" is 'Check circumlocution constraint for prescriptions_form_rx_during';

-- No circumlocution constraint for prescriptions_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during"
  add constraint prescriptions_hadm_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "hadm_id" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_hadm_id_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during" is 'Check circumlocution constraint for prescriptions_hadm_id_during';

-- No circumlocution constraint for prescriptions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during"
  add constraint prescriptions_subject_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during" is 'Check circumlocution constraint for prescriptions_subject_id_during';

-- No circumlocution constraint for prescriptions_stoptime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during"
  add constraint prescriptions_stoptime_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "stoptime" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_stoptime_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during" is 'Check circumlocution constraint for prescriptions_stoptime_during';

-- No circumlocution constraint for prescriptions_dose_unit_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during"
  add constraint prescriptions_dose_unit_rx_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "dose_unit_rx" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_dose_unit_rx_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during" is 'Check circumlocution constraint for prescriptions_dose_unit_rx_during';

-- No circumlocution constraint for prescriptions_poe_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during"
  add constraint prescriptions_poe_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "poe_id" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_poe_id_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during" is 'Check circumlocution constraint for prescriptions_poe_id_during';

-- No circumlocution constraint for prescriptions_prod_strength_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during"
  add constraint prescriptions_prod_strength_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "prod_strength" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_prod_strength_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during" is 'Check circumlocution constraint for prescriptions_prod_strength_during';

-- No circumlocution constraint for prescriptions_form_unit_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during"
  add constraint prescriptions_form_unit_disp_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "form_unit_disp" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_form_unit_disp_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during" is 'Check circumlocution constraint for prescriptions_form_unit_disp_during';

-- No circumlocution constraint for prescriptions_dose_val_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during"
  add constraint prescriptions_dose_val_rx_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "dose_val_rx" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_dose_val_rx_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during" is 'Check circumlocution constraint for prescriptions_dose_val_rx_during';

-- No circumlocution constraint for prescriptions_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during"
  add constraint prescriptions_poe_seq_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "poe_seq" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_poe_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during" is 'Check circumlocution constraint for prescriptions_poe_seq_during';

-- No circumlocution constraint for prescriptions_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_during"
  add constraint prescriptions_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = ,"during" WITH -|-);

 comment on constraint prescriptions_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_during" is 'Check circumlocution constraint for prescriptions_during';

-- No circumlocution constraint for prescriptions_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during"
  add constraint prescriptions_order_provider_id_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "order_provider_id" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_order_provider_id_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during" is 'Check circumlocution constraint for prescriptions_order_provider_id_during';

-- No circumlocution constraint for prescriptions_starttime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during"
  add constraint prescriptions_starttime_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "starttime" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_starttime_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_starttime_during" is 'Check circumlocution constraint for prescriptions_starttime_during';

-- No circumlocution constraint for prescriptions_form_val_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during"
  add constraint prescriptions_form_val_disp_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "form_val_disp" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_form_val_disp_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during" is 'Check circumlocution constraint for prescriptions_form_val_disp_during';

-- No circumlocution constraint for prescriptions_ndc_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during"
  add constraint prescriptions_ndc_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "ndc" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_ndc_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_ndc_during" is 'Check circumlocution constraint for prescriptions_ndc_during';

-- No circumlocution constraint for prescriptions_gsn_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during"
  add constraint prescriptions_gsn_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "gsn" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_gsn_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_gsn_during" is 'Check circumlocution constraint for prescriptions_gsn_during';

-- No circumlocution constraint for prescriptions_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during"
  add constraint prescriptions_doses_per_24_hrs_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "doses_per_24_hrs" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_doses_per_24_hrs_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during" is 'Check circumlocution constraint for prescriptions_doses_per_24_hrs_during';

-- No circumlocution constraint for prescriptions_route_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_route_during"
  add constraint prescriptions_route_during_circumlocution
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH = , "route" WITH =,"during" WITH -|-);

 comment on constraint prescriptions_route_during_circumlocution on "mimiciv_hosp@V@UHF"."prescriptions_route_during" is 'Check circumlocution constraint for prescriptions_route_during';

-- No circumlocution constraint for procedures_icd_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_during"
  add constraint procedures_icd_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH = ,"during" WITH -|-);

 comment on constraint procedures_icd_during_circumlocution on "mimiciv_hosp@V@UHF"."procedures_icd_during" is 'Check circumlocution constraint for procedures_icd_during';

-- No circumlocution constraint for procedures_icd_chartdate_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during"
  add constraint procedures_icd_chartdate_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "chartdate" WITH =,"during" WITH -|-);

 comment on constraint procedures_icd_chartdate_during_circumlocution on "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during" is 'Check circumlocution constraint for procedures_icd_chartdate_during';

-- No circumlocution constraint for procedures_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during"
  add constraint procedures_icd_subject_id_during_circumlocution
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint procedures_icd_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during" is 'Check circumlocution constraint for procedures_icd_subject_id_during';

-- No circumlocution constraint for services_prev_service_during
alter table "mimiciv_hosp@V@UHF"."services_prev_service_during"
  add constraint services_prev_service_during_circumlocution
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH = , "prev_service" WITH =,"during" WITH -|-);

 comment on constraint services_prev_service_during_circumlocution on "mimiciv_hosp@V@UHF"."services_prev_service_during" is 'Check circumlocution constraint for services_prev_service_during';

-- No circumlocution constraint for services_during
alter table "mimiciv_hosp@V@UHF"."services_during"
  add constraint services_during_circumlocution
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH = ,"during" WITH -|-);

 comment on constraint services_during_circumlocution on "mimiciv_hosp@V@UHF"."services_during" is 'Check circumlocution constraint for services_during';

-- No circumlocution constraint for services_subject_id_during
alter table "mimiciv_hosp@V@UHF"."services_subject_id_during"
  add constraint services_subject_id_during_circumlocution
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint services_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."services_subject_id_during" is 'Check circumlocution constraint for services_subject_id_during';

-- No circumlocution constraint for emar_detail_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during"
  add constraint emar_detail_pharmacy_id_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "pharmacy_id" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_pharmacy_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during" is 'Check circumlocution constraint for emar_detail_pharmacy_id_during';

-- No circumlocution constraint for emar_detail_side_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_side_during"
  add constraint emar_detail_side_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "side" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_side_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_side_during" is 'Check circumlocution constraint for emar_detail_side_during';

-- No circumlocution constraint for emar_detail_site_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_site_during"
  add constraint emar_detail_site_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "site" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_site_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_site_during" is 'Check circumlocution constraint for emar_detail_site_during';

-- No circumlocution constraint for emar_detail_dose_due_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during"
  add constraint emar_detail_dose_due_unit_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "dose_due_unit" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_dose_due_unit_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during" is 'Check circumlocution constraint for emar_detail_dose_due_unit_during';

-- No circumlocution constraint for emar_detail_barcode_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during"
  add constraint emar_detail_barcode_type_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "barcode_type" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_barcode_type_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during" is 'Check circumlocution constraint for emar_detail_barcode_type_during';

-- No circumlocution constraint for emar_detail_will_remainder_of_dose_be_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during"
  add constraint emar_detail_will_remainder_of_dose_be_given_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "will_remainder_of_dose_be_given" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_will_remainder_of_dose_be_given_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during" is 'Check circumlocution constraint for emar_detail_will_remainder_of_dose_be_given_during';

-- No circumlocution constraint for emar_detail_dose_due_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during"
  add constraint emar_detail_dose_due_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "dose_due" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_dose_due_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during" is 'Check circumlocution constraint for emar_detail_dose_due_during';

-- No circumlocution constraint for emar_detail_reason_for_no_barcode_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during"
  add constraint emar_detail_reason_for_no_barcode_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "reason_for_no_barcode" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_reason_for_no_barcode_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during" is 'Check circumlocution constraint for emar_detail_reason_for_no_barcode_during';

-- No circumlocution constraint for emar_detail_infusion_rate_adjustment_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during"
  add constraint emar_detail_infusion_rate_adjustment_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "infusion_rate_adjustment" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_infusion_rate_adjustment_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during" is 'Check circumlocution constraint for emar_detail_infusion_rate_adjustment_during';

-- No circumlocution constraint for emar_detail_infusion_rate_adjustment_amount_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during"
  add constraint emar_detail_infusion_rate_adjustment_amount_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "infusion_rate_adjustment_amount" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_infusion_rate_adjustment_amount_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during" is 'Check circumlocution constraint for emar_detail_infusion_rate_adjustment_amount_during';

-- No circumlocution constraint for emar_detail_non_formulary_visual_verification_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during"
  add constraint emar_detail_non_formulary_visual_verification_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "non_formulary_visual_verification" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_non_formulary_visual_verification_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during" is 'Check circumlocution constraint for emar_detail_non_formulary_visual_verification_during';

-- No circumlocution constraint for emar_detail_dose_given_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during"
  add constraint emar_detail_dose_given_unit_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "dose_given_unit" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_dose_given_unit_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during" is 'Check circumlocution constraint for emar_detail_dose_given_unit_during';

-- No circumlocution constraint for emar_detail_complete_dose_not_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during"
  add constraint emar_detail_complete_dose_not_given_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "complete_dose_not_given" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_complete_dose_not_given_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during" is 'Check circumlocution constraint for emar_detail_complete_dose_not_given_during';

-- No circumlocution constraint for emar_detail_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_during"
  add constraint emar_detail_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = ,"during" WITH -|-);

 comment on constraint emar_detail_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_during" is 'Check circumlocution constraint for emar_detail_during';

-- No circumlocution constraint for emar_detail_new_iv_bag_hung_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during"
  add constraint emar_detail_new_iv_bag_hung_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "new_iv_bag_hung" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_new_iv_bag_hung_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during" is 'Check circumlocution constraint for emar_detail_new_iv_bag_hung_during';

-- No circumlocution constraint for emar_detail_product_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during"
  add constraint emar_detail_product_unit_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "product_unit" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_product_unit_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during" is 'Check circumlocution constraint for emar_detail_product_unit_during';

-- No circumlocution constraint for emar_detail_product_code_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during"
  add constraint emar_detail_product_code_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "product_code" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_product_code_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_product_code_during" is 'Check circumlocution constraint for emar_detail_product_code_during';

-- No circumlocution constraint for emar_detail_restart_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during"
  add constraint emar_detail_restart_interval_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "restart_interval" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_restart_interval_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during" is 'Check circumlocution constraint for emar_detail_restart_interval_during';

-- No circumlocution constraint for emar_detail_administration_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during"
  add constraint emar_detail_administration_type_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "administration_type" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_administration_type_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during" is 'Check circumlocution constraint for emar_detail_administration_type_during';

-- No circumlocution constraint for emar_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during"
  add constraint emar_detail_subject_id_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during" is 'Check circumlocution constraint for emar_detail_subject_id_during';

-- No circumlocution constraint for emar_detail_product_amount_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during"
  add constraint emar_detail_product_amount_given_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "product_amount_given" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_product_amount_given_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during" is 'Check circumlocution constraint for emar_detail_product_amount_given_during';

-- No circumlocution constraint for emar_detail_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during"
  add constraint emar_detail_emar_seq_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "emar_seq" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_emar_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during" is 'Check circumlocution constraint for emar_detail_emar_seq_during';

-- No circumlocution constraint for emar_detail_infusion_complete_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during"
  add constraint emar_detail_infusion_complete_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "infusion_complete" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_infusion_complete_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during" is 'Check circumlocution constraint for emar_detail_infusion_complete_during';

-- No circumlocution constraint for emar_detail_prior_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during"
  add constraint emar_detail_prior_infusion_rate_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "prior_infusion_rate" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_prior_infusion_rate_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during" is 'Check circumlocution constraint for emar_detail_prior_infusion_rate_during';

-- No circumlocution constraint for emar_detail_continued_infusion_in_other_location_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during"
  add constraint emar_detail_continued_infusion_in_other_location_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "continued_infusion_in_other_location" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_continued_infusion_in_other_location_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during" is 'Check circumlocution constraint for emar_detail_continued_infusion_in_other_location_during';

-- No circumlocution constraint for emar_detail_dose_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during"
  add constraint emar_detail_dose_given_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "dose_given" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_dose_given_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during" is 'Check circumlocution constraint for emar_detail_dose_given_during';

-- No circumlocution constraint for emar_detail_route_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_route_during"
  add constraint emar_detail_route_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "route" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_route_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_route_during" is 'Check circumlocution constraint for emar_detail_route_during';

-- No circumlocution constraint for emar_detail_product_description_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during"
  add constraint emar_detail_product_description_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "product_description" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_product_description_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_product_description_during" is 'Check circumlocution constraint for emar_detail_product_description_during';

-- No circumlocution constraint for emar_detail_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during"
  add constraint emar_detail_infusion_rate_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "infusion_rate" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_infusion_rate_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during" is 'Check circumlocution constraint for emar_detail_infusion_rate_during';

-- No circumlocution constraint for emar_detail_infusion_rate_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during"
  add constraint emar_detail_infusion_rate_unit_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "infusion_rate_unit" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_infusion_rate_unit_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during" is 'Check circumlocution constraint for emar_detail_infusion_rate_unit_during';

-- No circumlocution constraint for emar_detail_completion_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during"
  add constraint emar_detail_completion_interval_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "completion_interval" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_completion_interval_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during" is 'Check circumlocution constraint for emar_detail_completion_interval_during';

-- No circumlocution constraint for emar_detail_product_description_other_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during"
  add constraint emar_detail_product_description_other_during_circumlocution
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH = , "product_description_other" WITH =,"during" WITH -|-);

 comment on constraint emar_detail_product_description_other_during_circumlocution on "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during" is 'Check circumlocution constraint for emar_detail_product_description_other_during';

-- No circumlocution constraint for poe_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during"
  add constraint poe_detail_subject_id_during_circumlocution
  exclude using gist("poe_id" WITH =, "field_name" WITH = , "subject_id" WITH =,"during" WITH -|-);

 comment on constraint poe_detail_subject_id_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during" is 'Check circumlocution constraint for poe_detail_subject_id_during';

-- No circumlocution constraint for poe_detail_field_value_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during"
  add constraint poe_detail_field_value_during_circumlocution
  exclude using gist("poe_id" WITH =, "field_name" WITH = , "field_value" WITH =,"during" WITH -|-);

 comment on constraint poe_detail_field_value_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_detail_field_value_during" is 'Check circumlocution constraint for poe_detail_field_value_during';

-- No circumlocution constraint for poe_detail_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_during"
  add constraint poe_detail_during_circumlocution
  exclude using gist("poe_id" WITH =, "field_name" WITH = ,"during" WITH -|-);

 comment on constraint poe_detail_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_detail_during" is 'Check circumlocution constraint for poe_detail_during';

-- No circumlocution constraint for poe_detail_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during"
  add constraint poe_detail_poe_seq_during_circumlocution
  exclude using gist("poe_id" WITH =, "field_name" WITH = , "poe_seq" WITH =,"during" WITH -|-);

 comment on constraint poe_detail_poe_seq_during_circumlocution on "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during" is 'Check circumlocution constraint for poe_detail_poe_seq_during';

-- No contradiction constraint for d_hcpcs_short_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during"
  add constraint d_hcpcs_short_description_during_contradiction
  exclude using gist("code" WITH =, "short_description" WITH <>, "during" WITH &&);

comment on constraint d_hcpcs_short_description_during_contradiction on "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_hcpcs_long_description_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during"
  add constraint d_hcpcs_long_description_during_contradiction
  exclude using gist("code" WITH =, "long_description" WITH <>, "during" WITH &&);

comment on constraint d_hcpcs_long_description_during_contradiction on "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_hcpcs_category_during
alter table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during"
  add constraint d_hcpcs_category_during_contradiction
  exclude using gist("code" WITH =, "category" WITH <>, "during" WITH &&);

comment on constraint d_hcpcs_category_during_contradiction on "mimiciv_hosp@V@UHF"."d_hcpcs_category_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_icd_diagnoses_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during"
  add constraint d_icd_diagnoses_long_title_during_contradiction
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "long_title" WITH <>, "during" WITH &&);

comment on constraint d_icd_diagnoses_long_title_during_contradiction on "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_icd_procedures_long_title_during
alter table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during"
  add constraint d_icd_procedures_long_title_during_contradiction
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "long_title" WITH <>, "during" WITH &&);

comment on constraint d_icd_procedures_long_title_during_contradiction on "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_labitems_label_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_label_during"
  add constraint d_labitems_label_during_contradiction
  exclude using gist("itemid" WITH =, "label" WITH <>, "during" WITH &&);

comment on constraint d_labitems_label_during_contradiction on "mimiciv_hosp@V@UHF"."d_labitems_label_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_labitems_fluid_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during"
  add constraint d_labitems_fluid_during_contradiction
  exclude using gist("itemid" WITH =, "fluid" WITH <>, "during" WITH &&);

comment on constraint d_labitems_fluid_during_contradiction on "mimiciv_hosp@V@UHF"."d_labitems_fluid_during" is 'Check contradiction constraint';

-- No contradiction constraint for d_labitems_category_during
alter table "mimiciv_hosp@V@UHF"."d_labitems_category_during"
  add constraint d_labitems_category_during_contradiction
  exclude using gist("itemid" WITH =, "category" WITH <>, "during" WITH &&);

comment on constraint d_labitems_category_during_contradiction on "mimiciv_hosp@V@UHF"."d_labitems_category_during" is 'Check contradiction constraint';

-- No contradiction constraint for omr_result_name_during
alter table "mimiciv_hosp@V@UHF"."omr_result_name_during"
  add constraint omr_result_name_during_contradiction
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH =, "result_name" WITH <>, "during" WITH &&);

comment on constraint omr_result_name_during_contradiction on "mimiciv_hosp@V@UHF"."omr_result_name_during" is 'Check contradiction constraint';

-- No contradiction constraint for omr_result_value_during
alter table "mimiciv_hosp@V@UHF"."omr_result_value_during"
  add constraint omr_result_value_during_contradiction
  exclude using gist("subject_id" WITH =, "chartdate" WITH =, "seq_num" WITH =, "result_value" WITH <>, "during" WITH &&);

comment on constraint omr_result_value_during_contradiction on "mimiciv_hosp@V@UHF"."omr_result_value_during" is 'Check contradiction constraint';

-- No contradiction constraint for patients_gender_during
alter table "mimiciv_hosp@V@UHF"."patients_gender_during"
  add constraint patients_gender_during_contradiction
  exclude using gist("subject_id" WITH =, "gender" WITH <>, "during" WITH &&);

comment on constraint patients_gender_during_contradiction on "mimiciv_hosp@V@UHF"."patients_gender_during" is 'Check contradiction constraint';

-- No contradiction constraint for patients_dod_during
alter table "mimiciv_hosp@V@UHF"."patients_dod_during"
  add constraint patients_dod_during_contradiction
  exclude using gist("subject_id" WITH =, "dod" WITH <>, "during" WITH &&);

comment on constraint patients_dod_during_contradiction on "mimiciv_hosp@V@UHF"."patients_dod_during" is 'Check contradiction constraint';

-- No contradiction constraint for patients_anchor_age_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_age_during"
  add constraint patients_anchor_age_during_contradiction
  exclude using gist("subject_id" WITH =, "anchor_age" WITH <>, "during" WITH &&);

comment on constraint patients_anchor_age_during_contradiction on "mimiciv_hosp@V@UHF"."patients_anchor_age_during" is 'Check contradiction constraint';

-- No contradiction constraint for patients_anchor_year_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_during"
  add constraint patients_anchor_year_during_contradiction
  exclude using gist("subject_id" WITH =, "anchor_year" WITH <>, "during" WITH &&);

comment on constraint patients_anchor_year_during_contradiction on "mimiciv_hosp@V@UHF"."patients_anchor_year_during" is 'Check contradiction constraint';

-- No contradiction constraint for patients_anchor_year_group_during
alter table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during"
  add constraint patients_anchor_year_group_during_contradiction
  exclude using gist("subject_id" WITH =, "anchor_year_group" WITH <>, "during" WITH &&);

comment on constraint patients_anchor_year_group_during_contradiction on "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_admit_provider_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during"
  add constraint admissions_admit_provider_id_during_contradiction
  exclude using gist("hadm_id" WITH =, "admit_provider_id" WITH <>, "during" WITH &&);

comment on constraint admissions_admit_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_admittime_during
alter table "mimiciv_hosp@V@UHF"."admissions_admittime_during"
  add constraint admissions_admittime_during_contradiction
  exclude using gist("hadm_id" WITH =, "admittime" WITH <>, "during" WITH &&);

comment on constraint admissions_admittime_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_admittime_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_dischtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_dischtime_during"
  add constraint admissions_dischtime_during_contradiction
  exclude using gist("hadm_id" WITH =, "dischtime" WITH <>, "during" WITH &&);

comment on constraint admissions_dischtime_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_dischtime_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_discharge_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during"
  add constraint admissions_discharge_location_during_contradiction
  exclude using gist("hadm_id" WITH =, "discharge_location" WITH <>, "during" WITH &&);

comment on constraint admissions_discharge_location_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_discharge_location_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_race_during
alter table "mimiciv_hosp@V@UHF"."admissions_race_during"
  add constraint admissions_race_during_contradiction
  exclude using gist("hadm_id" WITH =, "race" WITH <>, "during" WITH &&);

comment on constraint admissions_race_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_race_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."admissions_subject_id_during"
  add constraint admissions_subject_id_during_contradiction
  exclude using gist("hadm_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint admissions_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_admission_location_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_location_during"
  add constraint admissions_admission_location_during_contradiction
  exclude using gist("hadm_id" WITH =, "admission_location" WITH <>, "during" WITH &&);

comment on constraint admissions_admission_location_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_admission_location_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_hospital_expire_flag_during
alter table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during"
  add constraint admissions_hospital_expire_flag_during_contradiction
  exclude using gist("hadm_id" WITH =, "hospital_expire_flag" WITH <>, "during" WITH &&);

comment on constraint admissions_hospital_expire_flag_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_deathtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_deathtime_during"
  add constraint admissions_deathtime_during_contradiction
  exclude using gist("hadm_id" WITH =, "deathtime" WITH <>, "during" WITH &&);

comment on constraint admissions_deathtime_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_deathtime_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_edregtime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edregtime_during"
  add constraint admissions_edregtime_during_contradiction
  exclude using gist("hadm_id" WITH =, "edregtime" WITH <>, "during" WITH &&);

comment on constraint admissions_edregtime_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_edregtime_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_language_during
alter table "mimiciv_hosp@V@UHF"."admissions_language_during"
  add constraint admissions_language_during_contradiction
  exclude using gist("hadm_id" WITH =, "language" WITH <>, "during" WITH &&);

comment on constraint admissions_language_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_language_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_insurance_during
alter table "mimiciv_hosp@V@UHF"."admissions_insurance_during"
  add constraint admissions_insurance_during_contradiction
  exclude using gist("hadm_id" WITH =, "insurance" WITH <>, "during" WITH &&);

comment on constraint admissions_insurance_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_insurance_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_edouttime_during
alter table "mimiciv_hosp@V@UHF"."admissions_edouttime_during"
  add constraint admissions_edouttime_during_contradiction
  exclude using gist("hadm_id" WITH =, "edouttime" WITH <>, "during" WITH &&);

comment on constraint admissions_edouttime_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_edouttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_admission_type_during
alter table "mimiciv_hosp@V@UHF"."admissions_admission_type_during"
  add constraint admissions_admission_type_during_contradiction
  exclude using gist("hadm_id" WITH =, "admission_type" WITH <>, "during" WITH &&);

comment on constraint admissions_admission_type_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_admission_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for admissions_marital_status_during
alter table "mimiciv_hosp@V@UHF"."admissions_marital_status_during"
  add constraint admissions_marital_status_during_contradiction
  exclude using gist("hadm_id" WITH =, "marital_status" WITH <>, "during" WITH &&);

comment on constraint admissions_marital_status_during_contradiction on "mimiciv_hosp@V@UHF"."admissions_marital_status_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_itemid_during
alter table "mimiciv_hosp@V@UHF"."labevents_itemid_during"
  add constraint labevents_itemid_during_contradiction
  exclude using gist("labevent_id" WITH =, "itemid" WITH <>, "during" WITH &&);

comment on constraint labevents_itemid_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_itemid_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during"
  add constraint labevents_hadm_id_during_contradiction
  exclude using gist("labevent_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint labevents_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during"
  add constraint labevents_specimen_id_during_contradiction
  exclude using gist("labevent_id" WITH =, "specimen_id" WITH <>, "during" WITH &&);

comment on constraint labevents_specimen_id_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_specimen_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_comments_during
alter table "mimiciv_hosp@V@UHF"."labevents_comments_during"
  add constraint labevents_comments_during_contradiction
  exclude using gist("labevent_id" WITH =, "comments" WITH <>, "during" WITH &&);

comment on constraint labevents_comments_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_comments_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_ref_range_lower_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during"
  add constraint labevents_ref_range_lower_during_contradiction
  exclude using gist("labevent_id" WITH =, "ref_range_lower" WITH <>, "during" WITH &&);

comment on constraint labevents_ref_range_lower_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during"
  add constraint labevents_order_provider_id_during_contradiction
  exclude using gist("labevent_id" WITH =, "order_provider_id" WITH <>, "during" WITH &&);

comment on constraint labevents_order_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_ref_range_upper_during
alter table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during"
  add constraint labevents_ref_range_upper_during_contradiction
  exclude using gist("labevent_id" WITH =, "ref_range_upper" WITH <>, "during" WITH &&);

comment on constraint labevents_ref_range_upper_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."labevents_subject_id_during"
  add constraint labevents_subject_id_during_contradiction
  exclude using gist("labevent_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint labevents_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_valueuom_during
alter table "mimiciv_hosp@V@UHF"."labevents_valueuom_during"
  add constraint labevents_valueuom_during_contradiction
  exclude using gist("labevent_id" WITH =, "valueuom" WITH <>, "during" WITH &&);

comment on constraint labevents_valueuom_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_valueuom_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_flag_during
alter table "mimiciv_hosp@V@UHF"."labevents_flag_during"
  add constraint labevents_flag_during_contradiction
  exclude using gist("labevent_id" WITH =, "flag" WITH <>, "during" WITH &&);

comment on constraint labevents_flag_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_flag_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_valuenum_during
alter table "mimiciv_hosp@V@UHF"."labevents_valuenum_during"
  add constraint labevents_valuenum_during_contradiction
  exclude using gist("labevent_id" WITH =, "valuenum" WITH <>, "during" WITH &&);

comment on constraint labevents_valuenum_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_valuenum_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."labevents_charttime_during"
  add constraint labevents_charttime_during_contradiction
  exclude using gist("labevent_id" WITH =, "charttime" WITH <>, "during" WITH &&);

comment on constraint labevents_charttime_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_charttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_priority_during
alter table "mimiciv_hosp@V@UHF"."labevents_priority_during"
  add constraint labevents_priority_during_contradiction
  exclude using gist("labevent_id" WITH =, "priority" WITH <>, "during" WITH &&);

comment on constraint labevents_priority_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_priority_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."labevents_storetime_during"
  add constraint labevents_storetime_during_contradiction
  exclude using gist("labevent_id" WITH =, "storetime" WITH <>, "during" WITH &&);

comment on constraint labevents_storetime_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_storetime_during" is 'Check contradiction constraint';

-- No contradiction constraint for labevents_value_during
alter table "mimiciv_hosp@V@UHF"."labevents_value_during"
  add constraint labevents_value_during_contradiction
  exclude using gist("labevent_id" WITH =, "value" WITH <>, "during" WITH &&);

comment on constraint labevents_value_during_contradiction on "mimiciv_hosp@V@UHF"."labevents_value_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during"
  add constraint transfers_hadm_id_during_contradiction
  exclude using gist("transfer_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint transfers_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_subject_id_during
alter table "mimiciv_hosp@V@UHF"."transfers_subject_id_during"
  add constraint transfers_subject_id_during_contradiction
  exclude using gist("transfer_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint transfers_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_outtime_during
alter table "mimiciv_hosp@V@UHF"."transfers_outtime_during"
  add constraint transfers_outtime_during_contradiction
  exclude using gist("transfer_id" WITH =, "outtime" WITH <>, "during" WITH &&);

comment on constraint transfers_outtime_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_outtime_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_intime_during
alter table "mimiciv_hosp@V@UHF"."transfers_intime_during"
  add constraint transfers_intime_during_contradiction
  exclude using gist("transfer_id" WITH =, "intime" WITH <>, "during" WITH &&);

comment on constraint transfers_intime_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_intime_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_careunit_during
alter table "mimiciv_hosp@V@UHF"."transfers_careunit_during"
  add constraint transfers_careunit_during_contradiction
  exclude using gist("transfer_id" WITH =, "careunit" WITH <>, "during" WITH &&);

comment on constraint transfers_careunit_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_careunit_during" is 'Check contradiction constraint';

-- No contradiction constraint for transfers_eventtype_during
alter table "mimiciv_hosp@V@UHF"."transfers_eventtype_during"
  add constraint transfers_eventtype_during_contradiction
  exclude using gist("transfer_id" WITH =, "eventtype" WITH <>, "during" WITH &&);

comment on constraint transfers_eventtype_during_contradiction on "mimiciv_hosp@V@UHF"."transfers_eventtype_during" is 'Check contradiction constraint';

-- No contradiction constraint for diagnoses_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during"
  add constraint diagnoses_icd_subject_id_during_contradiction
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint diagnoses_icd_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for drgcodes_description_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_description_during"
  add constraint drgcodes_description_during_contradiction
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "description" WITH <>, "during" WITH &&);

comment on constraint drgcodes_description_during_contradiction on "mimiciv_hosp@V@UHF"."drgcodes_description_during" is 'Check contradiction constraint';

-- No contradiction constraint for drgcodes_drg_type_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during"
  add constraint drgcodes_drg_type_during_contradiction
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_type" WITH <>, "during" WITH &&);

comment on constraint drgcodes_drg_type_during_contradiction on "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for drgcodes_drg_severity_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during"
  add constraint drgcodes_drg_severity_during_contradiction
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_severity" WITH <>, "during" WITH &&);

comment on constraint drgcodes_drg_severity_during_contradiction on "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during" is 'Check contradiction constraint';

-- No contradiction constraint for drgcodes_drg_mortality_during
alter table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during"
  add constraint drgcodes_drg_mortality_during_contradiction
  exclude using gist("subject_id" WITH =, "hadm_id" WITH =, "drg_code" WITH =, "drg_mortality" WITH <>, "during" WITH &&);

comment on constraint drgcodes_drg_mortality_during_contradiction on "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_charttime_during
alter table "mimiciv_hosp@V@UHF"."emar_charttime_during"
  add constraint emar_charttime_during_contradiction
  exclude using gist("emar_id" WITH =, "charttime" WITH <>, "during" WITH &&);

comment on constraint emar_charttime_during_contradiction on "mimiciv_hosp@V@UHF"."emar_charttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_poe_id_during
alter table "mimiciv_hosp@V@UHF"."emar_poe_id_during"
  add constraint emar_poe_id_during_contradiction
  exclude using gist("emar_id" WITH =, "poe_id" WITH <>, "during" WITH &&);

comment on constraint emar_poe_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_poe_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_enter_provider_id_during
alter table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during"
  add constraint emar_enter_provider_id_during_contradiction
  exclude using gist("emar_id" WITH =, "enter_provider_id" WITH <>, "during" WITH &&);

comment on constraint emar_enter_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_medication_during
alter table "mimiciv_hosp@V@UHF"."emar_medication_during"
  add constraint emar_medication_during_contradiction
  exclude using gist("emar_id" WITH =, "medication" WITH <>, "during" WITH &&);

comment on constraint emar_medication_during_contradiction on "mimiciv_hosp@V@UHF"."emar_medication_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_scheduletime_during
alter table "mimiciv_hosp@V@UHF"."emar_scheduletime_during"
  add constraint emar_scheduletime_during_contradiction
  exclude using gist("emar_id" WITH =, "scheduletime" WITH <>, "during" WITH &&);

comment on constraint emar_scheduletime_during_contradiction on "mimiciv_hosp@V@UHF"."emar_scheduletime_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_storetime_during
alter table "mimiciv_hosp@V@UHF"."emar_storetime_during"
  add constraint emar_storetime_during_contradiction
  exclude using gist("emar_id" WITH =, "storetime" WITH <>, "during" WITH &&);

comment on constraint emar_storetime_during_contradiction on "mimiciv_hosp@V@UHF"."emar_storetime_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."emar_hadm_id_during"
  add constraint emar_hadm_id_during_contradiction
  exclude using gist("emar_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint emar_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_emar_seq_during"
  add constraint emar_emar_seq_during_contradiction
  exclude using gist("emar_id" WITH =, "emar_seq" WITH <>, "during" WITH &&);

comment on constraint emar_emar_seq_during_contradiction on "mimiciv_hosp@V@UHF"."emar_emar_seq_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during"
  add constraint emar_pharmacy_id_during_contradiction
  exclude using gist("emar_id" WITH =, "pharmacy_id" WITH <>, "during" WITH &&);

comment on constraint emar_pharmacy_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_event_txt_during
alter table "mimiciv_hosp@V@UHF"."emar_event_txt_during"
  add constraint emar_event_txt_during_contradiction
  exclude using gist("emar_id" WITH =, "event_txt" WITH <>, "during" WITH &&);

comment on constraint emar_event_txt_during_contradiction on "mimiciv_hosp@V@UHF"."emar_event_txt_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_subject_id_during"
  add constraint emar_subject_id_during_contradiction
  exclude using gist("emar_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint emar_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for hcpcsevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during"
  add constraint hcpcsevents_subject_id_during_contradiction
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint hcpcsevents_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for hcpcsevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during"
  add constraint hcpcsevents_chartdate_during_contradiction
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "chartdate" WITH <>, "during" WITH &&);

comment on constraint hcpcsevents_chartdate_during_contradiction on "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during" is 'Check contradiction constraint';

-- No contradiction constraint for hcpcsevents_short_description_during
alter table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during"
  add constraint hcpcsevents_short_description_during_contradiction
  exclude using gist("hcpcs_cd" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "short_description" WITH <>, "during" WITH &&);

comment on constraint hcpcsevents_short_description_during_contradiction on "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_quantity_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during"
  add constraint microbiologyevents_quantity_during_contradiction
  exclude using gist("microevent_id" WITH =, "quantity" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_quantity_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_micro_specimen_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during"
  add constraint microbiologyevents_micro_specimen_id_during_contradiction
  exclude using gist("microevent_id" WITH =, "micro_specimen_id" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_micro_specimen_id_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_storetime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during"
  add constraint microbiologyevents_storetime_during_contradiction
  exclude using gist("microevent_id" WITH =, "storetime" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_storetime_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_org_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during"
  add constraint microbiologyevents_org_name_during_contradiction
  exclude using gist("microevent_id" WITH =, "org_name" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_org_name_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during"
  add constraint microbiologyevents_order_provider_id_during_contradiction
  exclude using gist("microevent_id" WITH =, "order_provider_id" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_order_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_isolate_num_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during"
  add constraint microbiologyevents_isolate_num_during_contradiction
  exclude using gist("microevent_id" WITH =, "isolate_num" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_isolate_num_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_org_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during"
  add constraint microbiologyevents_org_itemid_during_contradiction
  exclude using gist("microevent_id" WITH =, "org_itemid" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_org_itemid_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_chartdate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during"
  add constraint microbiologyevents_chartdate_during_contradiction
  exclude using gist("microevent_id" WITH =, "chartdate" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_chartdate_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_spec_type_desc_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during"
  add constraint microbiologyevents_spec_type_desc_during_contradiction
  exclude using gist("microevent_id" WITH =, "spec_type_desc" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_spec_type_desc_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_dilution_value_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during"
  add constraint microbiologyevents_dilution_value_during_contradiction
  exclude using gist("microevent_id" WITH =, "dilution_value" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_dilution_value_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_interpretation_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during"
  add constraint microbiologyevents_interpretation_during_contradiction
  exclude using gist("microevent_id" WITH =, "interpretation" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_interpretation_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_storedate_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during"
  add constraint microbiologyevents_storedate_during_contradiction
  exclude using gist("microevent_id" WITH =, "storedate" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_storedate_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_ab_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during"
  add constraint microbiologyevents_ab_name_during_contradiction
  exclude using gist("microevent_id" WITH =, "ab_name" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_ab_name_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_dilution_text_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during"
  add constraint microbiologyevents_dilution_text_during_contradiction
  exclude using gist("microevent_id" WITH =, "dilution_text" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_dilution_text_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_ab_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during"
  add constraint microbiologyevents_ab_itemid_during_contradiction
  exclude using gist("microevent_id" WITH =, "ab_itemid" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_ab_itemid_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_test_seq_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during"
  add constraint microbiologyevents_test_seq_during_contradiction
  exclude using gist("microevent_id" WITH =, "test_seq" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_test_seq_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_dilution_comparison_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during"
  add constraint microbiologyevents_dilution_comparison_during_contradiction
  exclude using gist("microevent_id" WITH =, "dilution_comparison" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_dilution_comparison_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_test_name_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during"
  add constraint microbiologyevents_test_name_during_contradiction
  exclude using gist("microevent_id" WITH =, "test_name" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_test_name_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during"
  add constraint microbiologyevents_hadm_id_during_contradiction
  exclude using gist("microevent_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_comments_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during"
  add constraint microbiologyevents_comments_during_contradiction
  exclude using gist("microevent_id" WITH =, "comments" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_comments_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_spec_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during"
  add constraint microbiologyevents_spec_itemid_during_contradiction
  exclude using gist("microevent_id" WITH =, "spec_itemid" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_spec_itemid_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_charttime_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during"
  add constraint microbiologyevents_charttime_during_contradiction
  exclude using gist("microevent_id" WITH =, "charttime" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_charttime_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_subject_id_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during"
  add constraint microbiologyevents_subject_id_during_contradiction
  exclude using gist("microevent_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for microbiologyevents_test_itemid_during
alter table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during"
  add constraint microbiologyevents_test_itemid_during_contradiction
  exclude using gist("microevent_id" WITH =, "test_itemid" WITH <>, "during" WITH &&);

comment on constraint microbiologyevents_test_itemid_during_contradiction on "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_medication_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_medication_during"
  add constraint pharmacy_medication_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "medication" WITH <>, "during" WITH &&);

comment on constraint pharmacy_medication_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_medication_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_lockout_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during"
  add constraint pharmacy_lockout_interval_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "lockout_interval" WITH <>, "during" WITH &&);

comment on constraint pharmacy_lockout_interval_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_fill_quantity_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during"
  add constraint pharmacy_fill_quantity_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "fill_quantity" WITH <>, "during" WITH &&);

comment on constraint pharmacy_fill_quantity_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_sliding_scale_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during"
  add constraint pharmacy_sliding_scale_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "sliding_scale" WITH <>, "during" WITH &&);

comment on constraint pharmacy_sliding_scale_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_expiration_value_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during"
  add constraint pharmacy_expiration_value_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "expiration_value" WITH <>, "during" WITH &&);

comment on constraint pharmacy_expiration_value_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_duration_interval_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during"
  add constraint pharmacy_duration_interval_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "duration_interval" WITH <>, "during" WITH &&);

comment on constraint pharmacy_duration_interval_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_basal_rate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during"
  add constraint pharmacy_basal_rate_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "basal_rate" WITH <>, "during" WITH &&);

comment on constraint pharmacy_basal_rate_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_stoptime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during"
  add constraint pharmacy_stoptime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "stoptime" WITH <>, "during" WITH &&);

comment on constraint pharmacy_stoptime_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_subject_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during"
  add constraint pharmacy_subject_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint pharmacy_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_entertime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during"
  add constraint pharmacy_entertime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "entertime" WITH <>, "during" WITH &&);

comment on constraint pharmacy_entertime_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_entertime_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_poe_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during"
  add constraint pharmacy_poe_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "poe_id" WITH <>, "during" WITH &&);

comment on constraint pharmacy_poe_id_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_status_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_status_during"
  add constraint pharmacy_status_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "status" WITH <>, "during" WITH &&);

comment on constraint pharmacy_status_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_status_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_infusion_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during"
  add constraint pharmacy_infusion_type_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "infusion_type" WITH <>, "during" WITH &&);

comment on constraint pharmacy_infusion_type_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during"
  add constraint pharmacy_hadm_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint pharmacy_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_expiration_unit_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during"
  add constraint pharmacy_expiration_unit_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "expiration_unit" WITH <>, "during" WITH &&);

comment on constraint pharmacy_expiration_unit_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_verifiedtime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during"
  add constraint pharmacy_verifiedtime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "verifiedtime" WITH <>, "during" WITH &&);

comment on constraint pharmacy_verifiedtime_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_duration_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_duration_during"
  add constraint pharmacy_duration_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "duration" WITH <>, "during" WITH &&);

comment on constraint pharmacy_duration_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_duration_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_dispensation_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during"
  add constraint pharmacy_dispensation_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "dispensation" WITH <>, "during" WITH &&);

comment on constraint pharmacy_dispensation_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_route_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_route_during"
  add constraint pharmacy_route_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "route" WITH <>, "during" WITH &&);

comment on constraint pharmacy_route_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_route_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_expirationdate_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during"
  add constraint pharmacy_expirationdate_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "expirationdate" WITH <>, "during" WITH &&);

comment on constraint pharmacy_expirationdate_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during"
  add constraint pharmacy_doses_per_24_hrs_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "doses_per_24_hrs" WITH <>, "during" WITH &&);

comment on constraint pharmacy_doses_per_24_hrs_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_proc_type_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during"
  add constraint pharmacy_proc_type_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "proc_type" WITH <>, "during" WITH &&);

comment on constraint pharmacy_proc_type_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_frequency_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during"
  add constraint pharmacy_frequency_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "frequency" WITH <>, "during" WITH &&);

comment on constraint pharmacy_frequency_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_frequency_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_one_hr_max_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during"
  add constraint pharmacy_one_hr_max_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "one_hr_max" WITH <>, "during" WITH &&);

comment on constraint pharmacy_one_hr_max_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_starttime_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during"
  add constraint pharmacy_starttime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "starttime" WITH <>, "during" WITH &&);

comment on constraint pharmacy_starttime_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_starttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for pharmacy_disp_sched_during
alter table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during"
  add constraint pharmacy_disp_sched_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "disp_sched" WITH <>, "during" WITH &&);

comment on constraint pharmacy_disp_sched_during_contradiction on "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_poe_seq_during"
  add constraint poe_poe_seq_during_contradiction
  exclude using gist("poe_id" WITH =, "poe_seq" WITH <>, "during" WITH &&);

comment on constraint poe_poe_seq_during_contradiction on "mimiciv_hosp@V@UHF"."poe_poe_seq_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_discontinued_by_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during"
  add constraint poe_discontinued_by_poe_id_during_contradiction
  exclude using gist("poe_id" WITH =, "discontinued_by_poe_id" WITH <>, "during" WITH &&);

comment on constraint poe_discontinued_by_poe_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_ordertime_during
alter table "mimiciv_hosp@V@UHF"."poe_ordertime_during"
  add constraint poe_ordertime_during_contradiction
  exclude using gist("poe_id" WITH =, "ordertime" WITH <>, "during" WITH &&);

comment on constraint poe_ordertime_during_contradiction on "mimiciv_hosp@V@UHF"."poe_ordertime_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_order_subtype_during
alter table "mimiciv_hosp@V@UHF"."poe_order_subtype_during"
  add constraint poe_order_subtype_during_contradiction
  exclude using gist("poe_id" WITH =, "order_subtype" WITH <>, "during" WITH &&);

comment on constraint poe_order_subtype_during_contradiction on "mimiciv_hosp@V@UHF"."poe_order_subtype_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_order_status_during
alter table "mimiciv_hosp@V@UHF"."poe_order_status_during"
  add constraint poe_order_status_during_contradiction
  exclude using gist("poe_id" WITH =, "order_status" WITH <>, "during" WITH &&);

comment on constraint poe_order_status_during_contradiction on "mimiciv_hosp@V@UHF"."poe_order_status_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_discontinue_of_poe_id_during
alter table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during"
  add constraint poe_discontinue_of_poe_id_during_contradiction
  exclude using gist("poe_id" WITH =, "discontinue_of_poe_id" WITH <>, "during" WITH &&);

comment on constraint poe_discontinue_of_poe_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during"
  add constraint poe_order_provider_id_during_contradiction
  exclude using gist("poe_id" WITH =, "order_provider_id" WITH <>, "during" WITH &&);

comment on constraint poe_order_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_order_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_subject_id_during"
  add constraint poe_subject_id_during_contradiction
  exclude using gist("poe_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint poe_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_transaction_type_during
alter table "mimiciv_hosp@V@UHF"."poe_transaction_type_during"
  add constraint poe_transaction_type_during_contradiction
  exclude using gist("poe_id" WITH =, "transaction_type" WITH <>, "during" WITH &&);

comment on constraint poe_transaction_type_during_contradiction on "mimiciv_hosp@V@UHF"."poe_transaction_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."poe_hadm_id_during"
  add constraint poe_hadm_id_during_contradiction
  exclude using gist("poe_id" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint poe_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_order_type_during
alter table "mimiciv_hosp@V@UHF"."poe_order_type_during"
  add constraint poe_order_type_during_contradiction
  exclude using gist("poe_id" WITH =, "order_type" WITH <>, "during" WITH &&);

comment on constraint poe_order_type_during_contradiction on "mimiciv_hosp@V@UHF"."poe_order_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_formulary_drug_cd_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during"
  add constraint prescriptions_formulary_drug_cd_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "formulary_drug_cd" WITH <>, "during" WITH &&);

comment on constraint prescriptions_formulary_drug_cd_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_form_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during"
  add constraint prescriptions_form_rx_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_rx" WITH <>, "during" WITH &&);

comment on constraint prescriptions_form_rx_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_hadm_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during"
  add constraint prescriptions_hadm_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "hadm_id" WITH <>, "during" WITH &&);

comment on constraint prescriptions_hadm_id_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_subject_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during"
  add constraint prescriptions_subject_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint prescriptions_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_stoptime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during"
  add constraint prescriptions_stoptime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "stoptime" WITH <>, "during" WITH &&);

comment on constraint prescriptions_stoptime_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_dose_unit_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during"
  add constraint prescriptions_dose_unit_rx_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "dose_unit_rx" WITH <>, "during" WITH &&);

comment on constraint prescriptions_dose_unit_rx_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_poe_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during"
  add constraint prescriptions_poe_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "poe_id" WITH <>, "during" WITH &&);

comment on constraint prescriptions_poe_id_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_prod_strength_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during"
  add constraint prescriptions_prod_strength_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "prod_strength" WITH <>, "during" WITH &&);

comment on constraint prescriptions_prod_strength_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_form_unit_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during"
  add constraint prescriptions_form_unit_disp_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_unit_disp" WITH <>, "during" WITH &&);

comment on constraint prescriptions_form_unit_disp_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_dose_val_rx_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during"
  add constraint prescriptions_dose_val_rx_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "dose_val_rx" WITH <>, "during" WITH &&);

comment on constraint prescriptions_dose_val_rx_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during"
  add constraint prescriptions_poe_seq_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "poe_seq" WITH <>, "during" WITH &&);

comment on constraint prescriptions_poe_seq_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_order_provider_id_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during"
  add constraint prescriptions_order_provider_id_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "order_provider_id" WITH <>, "during" WITH &&);

comment on constraint prescriptions_order_provider_id_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_starttime_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during"
  add constraint prescriptions_starttime_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "starttime" WITH <>, "during" WITH &&);

comment on constraint prescriptions_starttime_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_starttime_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_form_val_disp_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during"
  add constraint prescriptions_form_val_disp_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "form_val_disp" WITH <>, "during" WITH &&);

comment on constraint prescriptions_form_val_disp_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_ndc_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during"
  add constraint prescriptions_ndc_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "ndc" WITH <>, "during" WITH &&);

comment on constraint prescriptions_ndc_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_ndc_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_gsn_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during"
  add constraint prescriptions_gsn_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "gsn" WITH <>, "during" WITH &&);

comment on constraint prescriptions_gsn_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_gsn_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_doses_per_24_hrs_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during"
  add constraint prescriptions_doses_per_24_hrs_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "doses_per_24_hrs" WITH <>, "during" WITH &&);

comment on constraint prescriptions_doses_per_24_hrs_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during" is 'Check contradiction constraint';

-- No contradiction constraint for prescriptions_route_during
alter table "mimiciv_hosp@V@UHF"."prescriptions_route_during"
  add constraint prescriptions_route_during_contradiction
  exclude using gist("pharmacy_id" WITH =, "drug_type" WITH =, "drug" WITH =, "route" WITH <>, "during" WITH &&);

comment on constraint prescriptions_route_during_contradiction on "mimiciv_hosp@V@UHF"."prescriptions_route_during" is 'Check contradiction constraint';

-- No contradiction constraint for procedures_icd_chartdate_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during"
  add constraint procedures_icd_chartdate_during_contradiction
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "chartdate" WITH <>, "during" WITH &&);

comment on constraint procedures_icd_chartdate_during_contradiction on "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during" is 'Check contradiction constraint';

-- No contradiction constraint for procedures_icd_subject_id_during
alter table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during"
  add constraint procedures_icd_subject_id_during_contradiction
  exclude using gist("icd_code" WITH =, "icd_version" WITH =, "hadm_id" WITH =, "seq_num" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint procedures_icd_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for services_prev_service_during
alter table "mimiciv_hosp@V@UHF"."services_prev_service_during"
  add constraint services_prev_service_during_contradiction
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH =, "prev_service" WITH <>, "during" WITH &&);

comment on constraint services_prev_service_during_contradiction on "mimiciv_hosp@V@UHF"."services_prev_service_during" is 'Check contradiction constraint';

-- No contradiction constraint for services_subject_id_during
alter table "mimiciv_hosp@V@UHF"."services_subject_id_during"
  add constraint services_subject_id_during_contradiction
  exclude using gist("curr_service" WITH =, "transfertime" WITH =, "hadm_id" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint services_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."services_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_pharmacy_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during"
  add constraint emar_detail_pharmacy_id_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "pharmacy_id" WITH <>, "during" WITH &&);

comment on constraint emar_detail_pharmacy_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_side_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_side_during"
  add constraint emar_detail_side_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "side" WITH <>, "during" WITH &&);

comment on constraint emar_detail_side_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_side_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_site_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_site_during"
  add constraint emar_detail_site_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "site" WITH <>, "during" WITH &&);

comment on constraint emar_detail_site_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_site_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_dose_due_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during"
  add constraint emar_detail_dose_due_unit_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_due_unit" WITH <>, "during" WITH &&);

comment on constraint emar_detail_dose_due_unit_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_barcode_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during"
  add constraint emar_detail_barcode_type_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "barcode_type" WITH <>, "during" WITH &&);

comment on constraint emar_detail_barcode_type_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_will_remainder_of_dose_be_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during"
  add constraint emar_detail_will_remainder_of_dose_be_given_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "will_remainder_of_dose_be_given" WITH <>, "during" WITH &&);

comment on constraint emar_detail_will_remainder_of_dose_be_given_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_dose_due_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during"
  add constraint emar_detail_dose_due_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_due" WITH <>, "during" WITH &&);

comment on constraint emar_detail_dose_due_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_reason_for_no_barcode_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during"
  add constraint emar_detail_reason_for_no_barcode_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "reason_for_no_barcode" WITH <>, "during" WITH &&);

comment on constraint emar_detail_reason_for_no_barcode_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_infusion_rate_adjustment_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during"
  add constraint emar_detail_infusion_rate_adjustment_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_adjustment" WITH <>, "during" WITH &&);

comment on constraint emar_detail_infusion_rate_adjustment_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_infusion_rate_adjustment_amount_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during"
  add constraint emar_detail_infusion_rate_adjustment_amount_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_adjustment_amount" WITH <>, "during" WITH &&);

comment on constraint emar_detail_infusion_rate_adjustment_amount_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_non_formulary_visual_verification_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during"
  add constraint emar_detail_non_formulary_visual_verification_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "non_formulary_visual_verification" WITH <>, "during" WITH &&);

comment on constraint emar_detail_non_formulary_visual_verification_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_dose_given_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during"
  add constraint emar_detail_dose_given_unit_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_given_unit" WITH <>, "during" WITH &&);

comment on constraint emar_detail_dose_given_unit_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_complete_dose_not_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during"
  add constraint emar_detail_complete_dose_not_given_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "complete_dose_not_given" WITH <>, "during" WITH &&);

comment on constraint emar_detail_complete_dose_not_given_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_new_iv_bag_hung_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during"
  add constraint emar_detail_new_iv_bag_hung_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "new_iv_bag_hung" WITH <>, "during" WITH &&);

comment on constraint emar_detail_new_iv_bag_hung_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_product_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during"
  add constraint emar_detail_product_unit_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_unit" WITH <>, "during" WITH &&);

comment on constraint emar_detail_product_unit_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_product_code_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during"
  add constraint emar_detail_product_code_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_code" WITH <>, "during" WITH &&);

comment on constraint emar_detail_product_code_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_product_code_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_restart_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during"
  add constraint emar_detail_restart_interval_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "restart_interval" WITH <>, "during" WITH &&);

comment on constraint emar_detail_restart_interval_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_administration_type_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during"
  add constraint emar_detail_administration_type_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "administration_type" WITH <>, "during" WITH &&);

comment on constraint emar_detail_administration_type_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during"
  add constraint emar_detail_subject_id_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint emar_detail_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_product_amount_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during"
  add constraint emar_detail_product_amount_given_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_amount_given" WITH <>, "during" WITH &&);

comment on constraint emar_detail_product_amount_given_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_emar_seq_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during"
  add constraint emar_detail_emar_seq_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "emar_seq" WITH <>, "during" WITH &&);

comment on constraint emar_detail_emar_seq_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_infusion_complete_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during"
  add constraint emar_detail_infusion_complete_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_complete" WITH <>, "during" WITH &&);

comment on constraint emar_detail_infusion_complete_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_prior_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during"
  add constraint emar_detail_prior_infusion_rate_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "prior_infusion_rate" WITH <>, "during" WITH &&);

comment on constraint emar_detail_prior_infusion_rate_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_continued_infusion_in_other_location_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during"
  add constraint emar_detail_continued_infusion_in_other_location_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "continued_infusion_in_other_location" WITH <>, "during" WITH &&);

comment on constraint emar_detail_continued_infusion_in_other_location_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_dose_given_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during"
  add constraint emar_detail_dose_given_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "dose_given" WITH <>, "during" WITH &&);

comment on constraint emar_detail_dose_given_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_route_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_route_during"
  add constraint emar_detail_route_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "route" WITH <>, "during" WITH &&);

comment on constraint emar_detail_route_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_route_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_product_description_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during"
  add constraint emar_detail_product_description_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_description" WITH <>, "during" WITH &&);

comment on constraint emar_detail_product_description_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_product_description_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_infusion_rate_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during"
  add constraint emar_detail_infusion_rate_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate" WITH <>, "during" WITH &&);

comment on constraint emar_detail_infusion_rate_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_infusion_rate_unit_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during"
  add constraint emar_detail_infusion_rate_unit_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "infusion_rate_unit" WITH <>, "during" WITH &&);

comment on constraint emar_detail_infusion_rate_unit_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_completion_interval_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during"
  add constraint emar_detail_completion_interval_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "completion_interval" WITH <>, "during" WITH &&);

comment on constraint emar_detail_completion_interval_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during" is 'Check contradiction constraint';

-- No contradiction constraint for emar_detail_product_description_other_during
alter table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during"
  add constraint emar_detail_product_description_other_during_contradiction
  exclude using gist("emar_id" WITH =, "parent_field_ordinal" WITH =, "product_description_other" WITH <>, "during" WITH &&);

comment on constraint emar_detail_product_description_other_during_contradiction on "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_detail_subject_id_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during"
  add constraint poe_detail_subject_id_during_contradiction
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "subject_id" WITH <>, "during" WITH &&);

comment on constraint poe_detail_subject_id_during_contradiction on "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_detail_field_value_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during"
  add constraint poe_detail_field_value_during_contradiction
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "field_value" WITH <>, "during" WITH &&);

comment on constraint poe_detail_field_value_during_contradiction on "mimiciv_hosp@V@UHF"."poe_detail_field_value_during" is 'Check contradiction constraint';

-- No contradiction constraint for poe_detail_poe_seq_during
alter table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during"
  add constraint poe_detail_poe_seq_during_contradiction
  exclude using gist("poe_id" WITH =, "field_name" WITH =, "poe_seq" WITH <>, "during" WITH &&);

comment on constraint poe_detail_poe_seq_during_contradiction on "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during" is 'Check contradiction constraint';

