---------------------------
---------------------------
-- Creating Primary Keys --
---------------------------
---------------------------

----------
-- hosp --
----------

-- admissions

ALTER TABLE mimiciv_hosp.admissions DROP CONSTRAINT IF EXISTS admissions_pk CASCADE;
ALTER TABLE mimiciv_hosp.admissions
ADD CONSTRAINT admissions_pk
  PRIMARY KEY (hadm_id);

-- d_hcpcs

ALTER TABLE mimiciv_hosp.d_hcpcs DROP CONSTRAINT IF EXISTS d_hcpcs_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_hcpcs
ADD CONSTRAINT d_hcpcs_pk
  PRIMARY KEY (code);

-- diagnoses_icd

ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_pk CASCADE;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- d_icd_diagnoses

ALTER TABLE mimiciv_hosp.d_icd_diagnoses DROP CONSTRAINT IF EXISTS d_icd_diagnoses_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_icd_diagnoses
ADD CONSTRAINT d_icd_diagnoses_pk
  PRIMARY KEY (icd_code, icd_version);

-- d_icd_procedures

ALTER TABLE mimiciv_hosp.d_icd_procedures DROP CONSTRAINT IF EXISTS d_icd_procedures_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_icd_procedures
ADD CONSTRAINT d_icd_procedures_pk
  PRIMARY KEY (icd_code, icd_version);

-- d_labitems

ALTER TABLE mimiciv_hosp.d_labitems DROP CONSTRAINT IF EXISTS d_labitems_pk CASCADE;
ALTER TABLE mimiciv_hosp.d_labitems
ADD CONSTRAINT d_labitems_pk
  PRIMARY KEY (itemid);


-- emar_detail
ALTER TABLE mimiciv_hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_pk;
ALTER TABLE mimiciv_hosp.emar_detail
ADD CONSTRAINT emar_detail_pk
 PRIMARY KEY (emar_id, parent_field_ordinal);


-- drgcodes
ALTER TABLE mimiciv_hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_pk CASCADE;
ALTER TABLE mimiciv_hosp.drgcodes
ADD CONSTRAINT drgcodes_pk
    PRIMARY KEY (subject_id, hadm_id, drg_code);

-- omr
ALTER TABLE mimiciv_hosp.omr DROP CONSTRAINT IF EXISTS omr_pk CASCADE;
ALTER TABLE mimiciv_hosp.omr
ADD CONSTRAINT omr_pk
    PRIMARY KEY (subject_id, chartdate, seq_num);

-- provider
ALTER TABLE mimiciv_hosp.provider DROP CONSTRAINT IF EXISTS provider_pk CASCADE;
ALTER TABLE mimiciv_hosp.provider
ADD CONSTRAINT provider_pk
    PRIMARY KEY (provider_id);

-- emar

ALTER TABLE mimiciv_hosp.emar DROP CONSTRAINT IF EXISTS emar_pk CASCADE;
ALTER TABLE mimiciv_hosp.emar
ADD CONSTRAINT emar_pk
  PRIMARY KEY (emar_id);

-- hcpcsevents

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_pk CASCADE;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_pk
  PRIMARY KEY (hadm_id, hcpcs_cd, seq_num);

-- labevents

ALTER TABLE mimiciv_hosp.labevents DROP CONSTRAINT IF EXISTS labevents_pk CASCADE;
ALTER TABLE mimiciv_hosp.labevents
ADD CONSTRAINT labevents_pk
  PRIMARY KEY (labevent_id);

-- microbiologyevents

ALTER TABLE mimiciv_hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_pk CASCADE;
ALTER TABLE mimiciv_hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_pk
  PRIMARY KEY (microevent_id);

-- patients

ALTER TABLE mimiciv_hosp.patients DROP CONSTRAINT IF EXISTS patients_pk CASCADE;
ALTER TABLE mimiciv_hosp.patients
ADD CONSTRAINT patients_pk
  PRIMARY KEY (subject_id);

-- pharmacy

ALTER TABLE mimiciv_hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_pk CASCADE;
ALTER TABLE mimiciv_hosp.pharmacy
ADD CONSTRAINT pharmacy_pk
  PRIMARY KEY (pharmacy_id);

-- poe_detail

ALTER TABLE mimiciv_hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_pk CASCADE;
ALTER TABLE mimiciv_hosp.poe_detail
ADD CONSTRAINT poe_detail_pk
  PRIMARY KEY (poe_id, field_name);

-- poe

ALTER TABLE mimiciv_hosp.poe DROP CONSTRAINT IF EXISTS poe_pk CASCADE;
ALTER TABLE mimiciv_hosp.poe
ADD CONSTRAINT poe_pk
  PRIMARY KEY (poe_id);

-- prescriptions

ALTER TABLE mimiciv_hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_pk CASCADE;
ALTER TABLE mimiciv_hosp.prescriptions
ADD CONSTRAINT prescriptions_pk
  PRIMARY KEY (pharmacy_id, drug_type, drug);

-- procedures_icd

ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_pk CASCADE;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- services

ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_pk CASCADE;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_pk
  PRIMARY KEY (hadm_id, transfertime, curr_service);

---------------------------
---------------------------
-- Creating Foreign Keys --
---------------------------
---------------------------

----------
-- hosp --
----------

-- admissions

ALTER TABLE mimiciv_hosp.admissions DROP CONSTRAINT IF EXISTS admissions_patients_fk;
ALTER TABLE mimiciv_hosp.admissions
ADD CONSTRAINT admissions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

-- diagnoses_icd

ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_patients_fk;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_admissions_fk;
ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- drgcodes

ALTER TABLE mimiciv_hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_patients_fk;
ALTER TABLE mimiciv_hosp.drgcodes
ADD CONSTRAINT drgcodes_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_admissions_fk;
ALTER TABLE mimiciv_hosp.drgcodes
ADD CONSTRAINT drgcodes_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- emar_detail

ALTER TABLE mimiciv_hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_patients_fk;
ALTER TABLE mimiciv_hosp.emar_detail
ADD CONSTRAINT emar_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_emar_fk;
ALTER TABLE mimiciv_hosp.emar_detail
ADD CONSTRAINT emar_detail_emar_fk
  FOREIGN KEY (emar_id)
  REFERENCES mimiciv_hosp.emar (emar_id);

-- emar

ALTER TABLE mimiciv_hosp.emar DROP CONSTRAINT IF EXISTS emar_patients_fk;
ALTER TABLE mimiciv_hosp.emar
ADD CONSTRAINT emar_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.emar DROP CONSTRAINT IF EXISTS emar_admissions_fk;
ALTER TABLE mimiciv_hosp.emar
ADD CONSTRAINT emar_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- hcpcsevents

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_patients_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_admissions_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

ALTER TABLE mimiciv_hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_d_hcpcs_fk;
ALTER TABLE mimiciv_hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_d_hcpcs_fk
  FOREIGN KEY (hcpcs_cd)
  REFERENCES mimiciv_hosp.d_hcpcs (code);

-- labevents

ALTER TABLE mimiciv_hosp.labevents DROP CONSTRAINT IF EXISTS labevents_patients_fk;
ALTER TABLE mimiciv_hosp.labevents
ADD CONSTRAINT labevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.labevents DROP CONSTRAINT IF EXISTS labevents_d_labitems_fk;
ALTER TABLE mimiciv_hosp.labevents
ADD CONSTRAINT labevents_d_labitems_fk
  FOREIGN KEY (itemid)
  REFERENCES mimiciv_hosp.d_labitems (itemid);

-- microbiologyevents

ALTER TABLE mimiciv_hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_patients_fk;
ALTER TABLE mimiciv_hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_admissions_fk;
ALTER TABLE mimiciv_hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- pharmacy

ALTER TABLE mimiciv_hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_patients_fk;
ALTER TABLE mimiciv_hosp.pharmacy
ADD CONSTRAINT pharmacy_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_admissions_fk;
ALTER TABLE mimiciv_hosp.pharmacy
ADD CONSTRAINT pharmacy_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- poe_detail

ALTER TABLE mimiciv_hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_patients_fk;
ALTER TABLE mimiciv_hosp.poe_detail
ADD CONSTRAINT poe_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_poe_fk;
ALTER TABLE mimiciv_hosp.poe_detail
ADD CONSTRAINT poe_detail_poe_fk
  FOREIGN KEY (poe_id)
  REFERENCES mimiciv_hosp.poe (poe_id);

-- poe

ALTER TABLE mimiciv_hosp.poe DROP CONSTRAINT IF EXISTS poe_patients_fk;
ALTER TABLE mimiciv_hosp.poe
ADD CONSTRAINT poe_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.poe DROP CONSTRAINT IF EXISTS poe_admissions_fk;
ALTER TABLE mimiciv_hosp.poe
ADD CONSTRAINT poe_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- prescriptions

ALTER TABLE mimiciv_hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_patients_fk;
ALTER TABLE mimiciv_hosp.prescriptions
ADD CONSTRAINT prescriptions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_admissions_fk;
ALTER TABLE mimiciv_hosp.prescriptions
ADD CONSTRAINT prescriptions_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- procedures_icd

ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_patients_fk;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_admissions_fk;
ALTER TABLE mimiciv_hosp.procedures_icd
ADD CONSTRAINT procedures_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- services

ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_patients_fk;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);

ALTER TABLE mimiciv_hosp.services DROP CONSTRAINT IF EXISTS services_admissions_fk;
ALTER TABLE mimiciv_hosp.services
ADD CONSTRAINT services_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES mimiciv_hosp.admissions (hadm_id);

-- transfers

ALTER TABLE mimiciv_hosp.transfers DROP CONSTRAINT IF EXISTS transfers_pk CASCADE;
ALTER TABLE mimiciv_hosp.transfers
ADD CONSTRAINT transfers_pk
  PRIMARY KEY (transfer_id);

-- transfers

ALTER TABLE mimiciv_hosp.transfers DROP CONSTRAINT IF EXISTS transfers_patients_fk;
ALTER TABLE mimiciv_hosp.transfers
ADD CONSTRAINT transfers_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES mimiciv_hosp.patients (subject_id);
