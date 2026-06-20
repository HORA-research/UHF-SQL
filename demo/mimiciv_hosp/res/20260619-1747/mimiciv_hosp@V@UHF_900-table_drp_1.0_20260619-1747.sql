/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Drop tables
-- =========================================================================== A
*/

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_category_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_category_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_label_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_fluid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_category_since" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_label_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_category_during" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_label_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_fluid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."d_labitems_category_until" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_since" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_name_since" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_value_since" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_during" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_name_during" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_value_during" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_until" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_name_until" cascade;

drop table "mimiciv_hosp@V@UHF"."omr_result_value_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_gender_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_age_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_dod_since" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_gender_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_age_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_dod_during" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_gender_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_age_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_until" cascade;

drop table "mimiciv_hosp@V@UHF"."patients_dod_until" cascade;

drop table "mimiciv_hosp@V@UHF"."provider_since" cascade;

drop table "mimiciv_hosp@V@UHF"."provider_during" cascade;

drop table "mimiciv_hosp@V@UHF"."provider_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admittime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_dischtime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_deathtime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_location_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_discharge_location_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_insurance_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_language_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_marital_status_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_race_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edregtime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edouttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_since" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admittime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_dischtime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_deathtime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_location_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_insurance_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_language_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_marital_status_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_race_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edregtime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edouttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admittime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_dischtime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_deathtime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_admission_location_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_discharge_location_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_insurance_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_language_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_marital_status_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_race_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edregtime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_edouttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_specimen_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_itemid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_charttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_storetime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_value_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valuenum_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valueuom_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_flag_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_priority_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_comments_since" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_itemid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_charttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_storetime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_value_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valuenum_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valueuom_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_flag_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_priority_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_comments_during" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_specimen_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_itemid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_charttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_storetime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_value_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valuenum_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_valueuom_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_flag_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_priority_until" cascade;

drop table "mimiciv_hosp@V@UHF"."labevents_comments_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_eventtype_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_careunit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_intime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_outtime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_eventtype_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_careunit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_intime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_outtime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_eventtype_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_careunit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_intime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."transfers_outtime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_since" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_during" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_until" cascade;

drop table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_since" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_description_since" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_since" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_since" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_during" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_description_during" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_until" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_description_until" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_until" cascade;

drop table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_emar_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_poe_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_charttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_medication_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_event_txt_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_scheduletime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_storetime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_emar_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_poe_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_charttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_medication_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_event_txt_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_scheduletime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_storetime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_emar_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_poe_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_charttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_medication_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_event_txt_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_scheduletime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_storetime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_since" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_since" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_during" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_until" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_since" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_until" cascade;

drop table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_starttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_medication_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_status_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_entertime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_route_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_frequency_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_since" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_medication_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_status_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_route_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_starttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_medication_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_status_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_entertime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_route_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_frequency_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_until" cascade;

drop table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_poe_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_ordertime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_subtype_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_transaction_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_status_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_poe_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_ordertime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_subtype_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_transaction_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_status_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_poe_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_ordertime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_subtype_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_transaction_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_order_status_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_starttime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_gsn_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_ndc_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_route_since" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_route_during" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_starttime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_gsn_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_ndc_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_until" cascade;

drop table "mimiciv_hosp@V@UHF"."prescriptions_route_until" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_since" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_during" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_until" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."services_since" cascade;

drop table "mimiciv_hosp@V@UHF"."services_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."services_prev_service_since" cascade;

drop table "mimiciv_hosp@V@UHF"."services_during" cascade;

drop table "mimiciv_hosp@V@UHF"."services_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."services_prev_service_during" cascade;

drop table "mimiciv_hosp@V@UHF"."services_until" cascade;

drop table "mimiciv_hosp@V@UHF"."services_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."services_prev_service_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_code_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_route_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_side_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_site_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_since" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_route_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_side_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_site_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_code_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_route_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_side_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_site_until" cascade;

drop table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_field_value_since" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_until" cascade;

drop table "mimiciv_hosp@V@UHF"."poe_detail_field_value_until" cascade;

