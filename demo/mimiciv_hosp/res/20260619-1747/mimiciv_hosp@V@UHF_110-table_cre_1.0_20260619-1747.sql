/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create tables
-- =========================================================================== A
*/

-- Table d_hcpcs_since
create table "mimiciv_hosp@V@UHF"."d_hcpcs_since"
(
  "code" BPCHAR(5) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_hcpcs_since_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_since" is '  RELPART d_hcpcs_sinceVbx
    {code@N BPCHAR(5), sinceVbx VBX_POINT}
   KEY {code} 
';

-- Table d_hcpcs_category_since
create table "mimiciv_hosp@V@UHF"."d_hcpcs_category_since"
(
  "code" BPCHAR(5) not null, 
  "category" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_hcpcs_category_since_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_category_since" is '  RELPART d_hcpcs_category_sinceVbx
    {code@N BPCHAR(5), category@N INT2, sinceVbx VBX_POINT}
   KEY {code} 
';

-- Table d_hcpcs_long_description_since
create table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_since"
(
  "code" BPCHAR(5) not null, 
  "long_description" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_hcpcs_long_description_since_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_since" is '  RELPART d_hcpcs_long_description_sinceVbx
    {code@N BPCHAR(5), long_description@N TEXT, sinceVbx VBX_POINT}
   KEY {code} 
';

-- Table d_hcpcs_short_description_since
create table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_since"
(
  "code" BPCHAR(5) not null, 
  "short_description" VARCHAR(180), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_hcpcs_short_description_since_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_since" is '  RELPART d_hcpcs_short_description_sinceVbx
    {code@N BPCHAR(5), short_description@N VARCHAR(180), sinceVbx VBX_POINT}
   KEY {code} 
';

-- Table d_hcpcs_during
create table "mimiciv_hosp@V@UHF"."d_hcpcs_during"
(
  "code" BPCHAR(5) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_hcpcs_during_cc00 primary key ("code", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_during" is '  RELPART d_hcpcs_duringVbe
    {code@N BPCHAR(5), duringVbe VBE_INTERVAL}
   KEY {code, during} 
';

-- Table d_hcpcs_category_during
create table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during"
(
  "code" BPCHAR(5) not null, 
  "category" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_hcpcs_category_during_cc00 primary key ("code", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_category_during" is '  RELPART d_hcpcs_category_duringVbe
    {code@N BPCHAR(5), category@N INT2, duringVbe VBE_INTERVAL}
   KEY {code, during} 
';

-- Table d_hcpcs_long_description_during
create table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during"
(
  "code" BPCHAR(5) not null, 
  "long_description" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_hcpcs_long_description_during_cc00 primary key ("code", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_during" is '  RELPART d_hcpcs_long_description_duringVbe
    {code@N BPCHAR(5), long_description@N TEXT, duringVbe VBE_INTERVAL}
   KEY {code, during} 
';

-- Table d_hcpcs_short_description_during
create table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during"
(
  "code" BPCHAR(5) not null, 
  "short_description" VARCHAR(180), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_hcpcs_short_description_during_cc00 primary key ("code", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_during" is '  RELPART d_hcpcs_short_description_duringVbe
    {code@N BPCHAR(5), short_description@N VARCHAR(180), duringVbe VBE_INTERVAL}
   KEY {code, during} 
';

-- Table d_hcpcs_until
create table "mimiciv_hosp@V@UHF"."d_hcpcs_until"
(
  "code" BPCHAR(5) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_hcpcs_until_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_until" is '  RELPART d_hcpcs_untilVxe
    {code@N BPCHAR(5), untilVxe VXE_POINT}
   KEY {code} 
';

-- Table d_hcpcs_category_until
create table "mimiciv_hosp@V@UHF"."d_hcpcs_category_until"
(
  "code" BPCHAR(5) not null, 
  "category" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_hcpcs_category_until_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_category_until" is '  RELPART d_hcpcs_category_untilVxe
    {code@N BPCHAR(5), category@N INT2, untilVxe VXE_POINT}
   KEY {code} 
';

-- Table d_hcpcs_long_description_until
create table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_until"
(
  "code" BPCHAR(5) not null, 
  "long_description" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_hcpcs_long_description_until_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_long_description_until" is '  RELPART d_hcpcs_long_description_untilVxe
    {code@N BPCHAR(5), long_description@N TEXT, untilVxe VXE_POINT}
   KEY {code} 
';

-- Table d_hcpcs_short_description_until
create table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_until"
(
  "code" BPCHAR(5) not null, 
  "short_description" VARCHAR(180), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_hcpcs_short_description_until_cc00 primary key ("code"));

comment on table "mimiciv_hosp@V@UHF"."d_hcpcs_short_description_until" is '  RELPART d_hcpcs_short_description_untilVxe
    {code@N BPCHAR(5), short_description@N VARCHAR(180), untilVxe VXE_POINT}
   KEY {code} 
';

-- Table d_icd_diagnoses_since
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_since"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_icd_diagnoses_since_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_since" is '  RELPART d_icd_diagnoses_sinceVbx
    {icd_code@N BPCHAR(7), icd_version@N INT2, sinceVbx VBX_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_diagnoses_long_title_since
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_since"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_icd_diagnoses_long_title_since_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_since" is '  RELPART d_icd_diagnoses_long_title_sinceVbx
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_diagnoses_during
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_icd_diagnoses_during_cc00 primary key ("icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_during" is '  RELPART d_icd_diagnoses_duringVbe
    {icd_code@N BPCHAR(7), icd_version@N INT2, duringVbe VBE_INTERVAL}
   KEY {icd_code, icd_version, during} 
';

-- Table d_icd_diagnoses_long_title_during
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_icd_diagnoses_long_title_during_cc00 primary key ("icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_during" is '  RELPART d_icd_diagnoses_long_title_duringVbe
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {icd_code, icd_version, during} 
';

-- Table d_icd_diagnoses_until
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_until"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_icd_diagnoses_until_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_until" is '  RELPART d_icd_diagnoses_untilVxe
    {icd_code@N BPCHAR(7), icd_version@N INT2, untilVxe VXE_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_diagnoses_long_title_until
create table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_until"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_icd_diagnoses_long_title_until_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_diagnoses_long_title_until" is '  RELPART d_icd_diagnoses_long_title_untilVxe
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_procedures_since
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_since"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_icd_procedures_since_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_since" is '  RELPART d_icd_procedures_sinceVbx
    {icd_code@N BPCHAR(7), icd_version@N INT2, sinceVbx VBX_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_procedures_long_title_since
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_since"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(222), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_icd_procedures_long_title_since_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_since" is '  RELPART d_icd_procedures_long_title_sinceVbx
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(222), sinceVbx VBX_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_procedures_during
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_during"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_icd_procedures_during_cc00 primary key ("icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_during" is '  RELPART d_icd_procedures_duringVbe
    {icd_code@N BPCHAR(7), icd_version@N INT2, duringVbe VBE_INTERVAL}
   KEY {icd_code, icd_version, during} 
';

-- Table d_icd_procedures_long_title_during
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(222), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_icd_procedures_long_title_during_cc00 primary key ("icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_during" is '  RELPART d_icd_procedures_long_title_duringVbe
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(222), duringVbe VBE_INTERVAL}
   KEY {icd_code, icd_version, during} 
';

-- Table d_icd_procedures_until
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_until"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_icd_procedures_until_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_until" is '  RELPART d_icd_procedures_untilVxe
    {icd_code@N BPCHAR(7), icd_version@N INT2, untilVxe VXE_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_icd_procedures_long_title_until
create table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_until"
(
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "long_title" VARCHAR(222), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_icd_procedures_long_title_until_cc00 primary key ("icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."d_icd_procedures_long_title_until" is '  RELPART d_icd_procedures_long_title_untilVxe
    {icd_code@N BPCHAR(7), icd_version@N INT2, long_title@N VARCHAR(222), untilVxe VXE_POINT}
   KEY {icd_code, icd_version} 
';

-- Table d_labitems_since
create table "mimiciv_hosp@V@UHF"."d_labitems_since"
(
  "itemid" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_labitems_since_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_since" is '  RELPART d_labitems_sinceVbx
    {itemid@N INT4, sinceVbx VBX_POINT}
   KEY {itemid} 
';

-- Table d_labitems_label_since
create table "mimiciv_hosp@V@UHF"."d_labitems_label_since"
(
  "itemid" INT4 not null, 
  "label" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_labitems_label_since_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_label_since" is '  RELPART d_labitems_label_sinceVbx
    {itemid@N INT4, label@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {itemid} 
';

-- Table d_labitems_fluid_since
create table "mimiciv_hosp@V@UHF"."d_labitems_fluid_since"
(
  "itemid" INT4 not null, 
  "fluid" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_labitems_fluid_since_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_fluid_since" is '  RELPART d_labitems_fluid_sinceVbx
    {itemid@N INT4, fluid@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {itemid} 
';

-- Table d_labitems_category_since
create table "mimiciv_hosp@V@UHF"."d_labitems_category_since"
(
  "itemid" INT4 not null, 
  "category" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint d_labitems_category_since_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_category_since" is '  RELPART d_labitems_category_sinceVbx
    {itemid@N INT4, category@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {itemid} 
';

-- Table d_labitems_during
create table "mimiciv_hosp@V@UHF"."d_labitems_during"
(
  "itemid" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_labitems_during_cc00 primary key ("itemid", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_during" is '  RELPART d_labitems_duringVbe
    {itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {itemid, during} 
';

-- Table d_labitems_label_during
create table "mimiciv_hosp@V@UHF"."d_labitems_label_during"
(
  "itemid" INT4 not null, 
  "label" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_labitems_label_during_cc00 primary key ("itemid", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_label_during" is '  RELPART d_labitems_label_duringVbe
    {itemid@N INT4, label@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {itemid, during} 
';

-- Table d_labitems_fluid_during
create table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during"
(
  "itemid" INT4 not null, 
  "fluid" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_labitems_fluid_during_cc00 primary key ("itemid", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_fluid_during" is '  RELPART d_labitems_fluid_duringVbe
    {itemid@N INT4, fluid@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {itemid, during} 
';

-- Table d_labitems_category_during
create table "mimiciv_hosp@V@UHF"."d_labitems_category_during"
(
  "itemid" INT4 not null, 
  "category" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint d_labitems_category_during_cc00 primary key ("itemid", "during"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_category_during" is '  RELPART d_labitems_category_duringVbe
    {itemid@N INT4, category@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {itemid, during} 
';

-- Table d_labitems_until
create table "mimiciv_hosp@V@UHF"."d_labitems_until"
(
  "itemid" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_labitems_until_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_until" is '  RELPART d_labitems_untilVxe
    {itemid@N INT4, untilVxe VXE_POINT}
   KEY {itemid} 
';

-- Table d_labitems_label_until
create table "mimiciv_hosp@V@UHF"."d_labitems_label_until"
(
  "itemid" INT4 not null, 
  "label" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_labitems_label_until_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_label_until" is '  RELPART d_labitems_label_untilVxe
    {itemid@N INT4, label@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {itemid} 
';

-- Table d_labitems_fluid_until
create table "mimiciv_hosp@V@UHF"."d_labitems_fluid_until"
(
  "itemid" INT4 not null, 
  "fluid" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_labitems_fluid_until_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_fluid_until" is '  RELPART d_labitems_fluid_untilVxe
    {itemid@N INT4, fluid@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {itemid} 
';

-- Table d_labitems_category_until
create table "mimiciv_hosp@V@UHF"."d_labitems_category_until"
(
  "itemid" INT4 not null, 
  "category" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint d_labitems_category_until_cc00 primary key ("itemid"));

comment on table "mimiciv_hosp@V@UHF"."d_labitems_category_until" is '  RELPART d_labitems_category_untilVxe
    {itemid@N INT4, category@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {itemid} 
';

-- Table omr_since
create table "mimiciv_hosp@V@UHF"."omr_since"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint omr_since_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_since" is '  RELPART omr_sinceVbx
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, sinceVbx VBX_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table omr_result_name_since
create table "mimiciv_hosp@V@UHF"."omr_result_name_since"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_name" VARCHAR(100) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint omr_result_name_since_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_name_since" is '  RELPART omr_result_name_sinceVbx
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_name@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table omr_result_value_since
create table "mimiciv_hosp@V@UHF"."omr_result_value_since"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_value" TEXT not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint omr_result_value_since_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_value_since" is '  RELPART omr_result_value_sinceVbx
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_value@N TEXT, sinceVbx VBX_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table omr_during
create table "mimiciv_hosp@V@UHF"."omr_during"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint omr_during_cc00 primary key ("subject_id", "chartdate", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."omr_during" is '  RELPART omr_duringVbe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, duringVbe VBE_INTERVAL}
   KEY {subject_id, chartdate, seq_num, during} 
';

-- Table omr_result_name_during
create table "mimiciv_hosp@V@UHF"."omr_result_name_during"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_name" VARCHAR(100) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint omr_result_name_during_cc00 primary key ("subject_id", "chartdate", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_name_during" is '  RELPART omr_result_name_duringVbe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_name@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {subject_id, chartdate, seq_num, during} 
';

-- Table omr_result_value_during
create table "mimiciv_hosp@V@UHF"."omr_result_value_during"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_value" TEXT not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint omr_result_value_during_cc00 primary key ("subject_id", "chartdate", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_value_during" is '  RELPART omr_result_value_duringVbe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_value@N TEXT, duringVbe VBE_INTERVAL}
   KEY {subject_id, chartdate, seq_num, during} 
';

-- Table omr_until
create table "mimiciv_hosp@V@UHF"."omr_until"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint omr_until_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_until" is '  RELPART omr_untilVxe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, untilVxe VXE_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table omr_result_name_until
create table "mimiciv_hosp@V@UHF"."omr_result_name_until"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_name" VARCHAR(100) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint omr_result_name_until_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_name_until" is '  RELPART omr_result_name_untilVxe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_name@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table omr_result_value_until
create table "mimiciv_hosp@V@UHF"."omr_result_value_until"
(
  "subject_id" INT4 not null, 
  "chartdate" DATE not null, 
  "seq_num" INT4 not null, 
  "result_value" TEXT not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint omr_result_value_until_cc00 primary key ("subject_id", "chartdate", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."omr_result_value_until" is '  RELPART omr_result_value_untilVxe
    {subject_id@N INT4, chartdate@N DATE, seq_num@N INT4, result_value@N TEXT, untilVxe VXE_POINT}
   KEY {subject_id, chartdate, seq_num} 
';

-- Table patients_since
create table "mimiciv_hosp@V@UHF"."patients_since"
(
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_since" is '  RELPART patients_sinceVbx
    {subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_gender_since
create table "mimiciv_hosp@V@UHF"."patients_gender_since"
(
  "subject_id" INT4 not null, 
  "gender" BPCHAR(1) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_gender_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_gender_since" is '  RELPART patients_gender_sinceVbx
    {subject_id@N INT4, gender@N BPCHAR(1), sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_age_since
create table "mimiciv_hosp@V@UHF"."patients_anchor_age_since"
(
  "subject_id" INT4 not null, 
  "anchor_age" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_anchor_age_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_age_since" is '  RELPART patients_anchor_age_sinceVbx
    {subject_id@N INT4, anchor_age@N INT2, sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_year_since
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_since"
(
  "subject_id" INT4 not null, 
  "anchor_year" INT2 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_anchor_year_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_since" is '  RELPART patients_anchor_year_sinceVbx
    {subject_id@N INT4, anchor_year@N INT2, sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_year_group_since
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_since"
(
  "subject_id" INT4 not null, 
  "anchor_year_group" VARCHAR(20) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_anchor_year_group_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_since" is '  RELPART patients_anchor_year_group_sinceVbx
    {subject_id@N INT4, anchor_year_group@N VARCHAR(20), sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_dod_since
create table "mimiciv_hosp@V@UHF"."patients_dod_since"
(
  "subject_id" INT4 not null, 
  "dod" DATE, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint patients_dod_since_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_dod_since" is '  RELPART patients_dod_sinceVbx
    {subject_id@N INT4, dod@N DATE, sinceVbx VBX_POINT}
   KEY {subject_id} 
';

-- Table patients_during
create table "mimiciv_hosp@V@UHF"."patients_during"
(
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_during" is '  RELPART patients_duringVbe
    {subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_gender_during
create table "mimiciv_hosp@V@UHF"."patients_gender_during"
(
  "subject_id" INT4 not null, 
  "gender" BPCHAR(1) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_gender_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_gender_during" is '  RELPART patients_gender_duringVbe
    {subject_id@N INT4, gender@N BPCHAR(1), duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_anchor_age_during
create table "mimiciv_hosp@V@UHF"."patients_anchor_age_during"
(
  "subject_id" INT4 not null, 
  "anchor_age" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_anchor_age_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_age_during" is '  RELPART patients_anchor_age_duringVbe
    {subject_id@N INT4, anchor_age@N INT2, duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_anchor_year_during
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_during"
(
  "subject_id" INT4 not null, 
  "anchor_year" INT2 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_anchor_year_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_during" is '  RELPART patients_anchor_year_duringVbe
    {subject_id@N INT4, anchor_year@N INT2, duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_anchor_year_group_during
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during"
(
  "subject_id" INT4 not null, 
  "anchor_year_group" VARCHAR(20) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_anchor_year_group_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_during" is '  RELPART patients_anchor_year_group_duringVbe
    {subject_id@N INT4, anchor_year_group@N VARCHAR(20), duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_dod_during
create table "mimiciv_hosp@V@UHF"."patients_dod_during"
(
  "subject_id" INT4 not null, 
  "dod" DATE, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint patients_dod_during_cc00 primary key ("subject_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."patients_dod_during" is '  RELPART patients_dod_duringVbe
    {subject_id@N INT4, dod@N DATE, duringVbe VBE_INTERVAL}
   KEY {subject_id, during} 
';

-- Table patients_until
create table "mimiciv_hosp@V@UHF"."patients_until"
(
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_until" is '  RELPART patients_untilVxe
    {subject_id@N INT4, untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table patients_gender_until
create table "mimiciv_hosp@V@UHF"."patients_gender_until"
(
  "subject_id" INT4 not null, 
  "gender" BPCHAR(1) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_gender_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_gender_until" is '  RELPART patients_gender_untilVxe
    {subject_id@N INT4, gender@N BPCHAR(1), untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_age_until
create table "mimiciv_hosp@V@UHF"."patients_anchor_age_until"
(
  "subject_id" INT4 not null, 
  "anchor_age" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_anchor_age_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_age_until" is '  RELPART patients_anchor_age_untilVxe
    {subject_id@N INT4, anchor_age@N INT2, untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_year_until
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_until"
(
  "subject_id" INT4 not null, 
  "anchor_year" INT2 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_anchor_year_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_until" is '  RELPART patients_anchor_year_untilVxe
    {subject_id@N INT4, anchor_year@N INT2, untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table patients_anchor_year_group_until
create table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_until"
(
  "subject_id" INT4 not null, 
  "anchor_year_group" VARCHAR(20) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_anchor_year_group_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_anchor_year_group_until" is '  RELPART patients_anchor_year_group_untilVxe
    {subject_id@N INT4, anchor_year_group@N VARCHAR(20), untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table patients_dod_until
create table "mimiciv_hosp@V@UHF"."patients_dod_until"
(
  "subject_id" INT4 not null, 
  "dod" DATE, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint patients_dod_until_cc00 primary key ("subject_id"));

comment on table "mimiciv_hosp@V@UHF"."patients_dod_until" is '  RELPART patients_dod_untilVxe
    {subject_id@N INT4, dod@N DATE, untilVxe VXE_POINT}
   KEY {subject_id} 
';

-- Table provider_since
create table "mimiciv_hosp@V@UHF"."provider_since"
(
  "provider_id" VARCHAR(10) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint provider_since_cc00 primary key ("provider_id"));

comment on table "mimiciv_hosp@V@UHF"."provider_since" is '  RELPART provider_sinceVbx
    {provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {provider_id} 
';

-- Table provider_during
create table "mimiciv_hosp@V@UHF"."provider_during"
(
  "provider_id" VARCHAR(10) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint provider_during_cc00 primary key ("provider_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."provider_during" is '  RELPART provider_duringVbe
    {provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {provider_id, during} 
';

-- Table provider_until
create table "mimiciv_hosp@V@UHF"."provider_until"
(
  "provider_id" VARCHAR(10) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint provider_until_cc00 primary key ("provider_id"));

comment on table "mimiciv_hosp@V@UHF"."provider_until" is '  RELPART provider_untilVxe
    {provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {provider_id} 
';

-- Table admissions_since
create table "mimiciv_hosp@V@UHF"."admissions_since"
(
  "hadm_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_since" is '  RELPART admissions_sinceVbx
    {hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_subject_id_since
create table "mimiciv_hosp@V@UHF"."admissions_subject_id_since"
(
  "hadm_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_subject_id_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_subject_id_since" is '  RELPART admissions_subject_id_sinceVbx
    {hadm_id@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admittime_since
create table "mimiciv_hosp@V@UHF"."admissions_admittime_since"
(
  "hadm_id" INT4 not null, 
  "admittime" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_admittime_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admittime_since" is '  RELPART admissions_admittime_sinceVbx
    {hadm_id@N INT4, admittime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_dischtime_since
create table "mimiciv_hosp@V@UHF"."admissions_dischtime_since"
(
  "hadm_id" INT4 not null, 
  "dischtime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_dischtime_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_dischtime_since" is '  RELPART admissions_dischtime_sinceVbx
    {hadm_id@N INT4, dischtime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_deathtime_since
create table "mimiciv_hosp@V@UHF"."admissions_deathtime_since"
(
  "hadm_id" INT4 not null, 
  "deathtime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_deathtime_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_deathtime_since" is '  RELPART admissions_deathtime_sinceVbx
    {hadm_id@N INT4, deathtime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admission_type_since
create table "mimiciv_hosp@V@UHF"."admissions_admission_type_since"
(
  "hadm_id" INT4 not null, 
  "admission_type" VARCHAR(40) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_admission_type_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_type_since" is '  RELPART admissions_admission_type_sinceVbx
    {hadm_id@N INT4, admission_type@N VARCHAR(40), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admit_provider_id_since
create table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_since"
(
  "hadm_id" INT4 not null, 
  "admit_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_admit_provider_id_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_since" is '  RELPART admissions_admit_provider_id_sinceVbx
    {hadm_id@N INT4, admit_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admission_location_since
create table "mimiciv_hosp@V@UHF"."admissions_admission_location_since"
(
  "hadm_id" INT4 not null, 
  "admission_location" VARCHAR(60), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_admission_location_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_location_since" is '  RELPART admissions_admission_location_sinceVbx
    {hadm_id@N INT4, admission_location@N VARCHAR(60), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_discharge_location_since
create table "mimiciv_hosp@V@UHF"."admissions_discharge_location_since"
(
  "hadm_id" INT4 not null, 
  "discharge_location" VARCHAR(60), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_discharge_location_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_discharge_location_since" is '  RELPART admissions_discharge_location_sinceVbx
    {hadm_id@N INT4, discharge_location@N VARCHAR(60), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_insurance_since
create table "mimiciv_hosp@V@UHF"."admissions_insurance_since"
(
  "hadm_id" INT4 not null, 
  "insurance" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_insurance_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_insurance_since" is '  RELPART admissions_insurance_sinceVbx
    {hadm_id@N INT4, insurance@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_language_since
create table "mimiciv_hosp@V@UHF"."admissions_language_since"
(
  "hadm_id" INT4 not null, 
  "language" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_language_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_language_since" is '  RELPART admissions_language_sinceVbx
    {hadm_id@N INT4, language@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_marital_status_since
create table "mimiciv_hosp@V@UHF"."admissions_marital_status_since"
(
  "hadm_id" INT4 not null, 
  "marital_status" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_marital_status_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_marital_status_since" is '  RELPART admissions_marital_status_sinceVbx
    {hadm_id@N INT4, marital_status@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_race_since
create table "mimiciv_hosp@V@UHF"."admissions_race_since"
(
  "hadm_id" INT4 not null, 
  "race" VARCHAR(80), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_race_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_race_since" is '  RELPART admissions_race_sinceVbx
    {hadm_id@N INT4, race@N VARCHAR(80), sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_edregtime_since
create table "mimiciv_hosp@V@UHF"."admissions_edregtime_since"
(
  "hadm_id" INT4 not null, 
  "edregtime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_edregtime_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edregtime_since" is '  RELPART admissions_edregtime_sinceVbx
    {hadm_id@N INT4, edregtime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_edouttime_since
create table "mimiciv_hosp@V@UHF"."admissions_edouttime_since"
(
  "hadm_id" INT4 not null, 
  "edouttime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_edouttime_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edouttime_since" is '  RELPART admissions_edouttime_sinceVbx
    {hadm_id@N INT4, edouttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_hospital_expire_flag_since
create table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_since"
(
  "hadm_id" INT4 not null, 
  "hospital_expire_flag" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint admissions_hospital_expire_flag_since_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_since" is '  RELPART admissions_hospital_expire_flag_sinceVbx
    {hadm_id@N INT4, hospital_expire_flag@N INT2, sinceVbx VBX_POINT}
   KEY {hadm_id} 
';

-- Table admissions_during
create table "mimiciv_hosp@V@UHF"."admissions_during"
(
  "hadm_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_during" is '  RELPART admissions_duringVbe
    {hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_subject_id_during
create table "mimiciv_hosp@V@UHF"."admissions_subject_id_during"
(
  "hadm_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_subject_id_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_subject_id_during" is '  RELPART admissions_subject_id_duringVbe
    {hadm_id@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_admittime_during
create table "mimiciv_hosp@V@UHF"."admissions_admittime_during"
(
  "hadm_id" INT4 not null, 
  "admittime" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_admittime_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admittime_during" is '  RELPART admissions_admittime_duringVbe
    {hadm_id@N INT4, admittime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_dischtime_during
create table "mimiciv_hosp@V@UHF"."admissions_dischtime_during"
(
  "hadm_id" INT4 not null, 
  "dischtime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_dischtime_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_dischtime_during" is '  RELPART admissions_dischtime_duringVbe
    {hadm_id@N INT4, dischtime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_deathtime_during
create table "mimiciv_hosp@V@UHF"."admissions_deathtime_during"
(
  "hadm_id" INT4 not null, 
  "deathtime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_deathtime_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_deathtime_during" is '  RELPART admissions_deathtime_duringVbe
    {hadm_id@N INT4, deathtime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_admission_type_during
create table "mimiciv_hosp@V@UHF"."admissions_admission_type_during"
(
  "hadm_id" INT4 not null, 
  "admission_type" VARCHAR(40) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_admission_type_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_type_during" is '  RELPART admissions_admission_type_duringVbe
    {hadm_id@N INT4, admission_type@N VARCHAR(40), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_admit_provider_id_during
create table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during"
(
  "hadm_id" INT4 not null, 
  "admit_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_admit_provider_id_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_during" is '  RELPART admissions_admit_provider_id_duringVbe
    {hadm_id@N INT4, admit_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_admission_location_during
create table "mimiciv_hosp@V@UHF"."admissions_admission_location_during"
(
  "hadm_id" INT4 not null, 
  "admission_location" VARCHAR(60), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_admission_location_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_location_during" is '  RELPART admissions_admission_location_duringVbe
    {hadm_id@N INT4, admission_location@N VARCHAR(60), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_discharge_location_during
create table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during"
(
  "hadm_id" INT4 not null, 
  "discharge_location" VARCHAR(60), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_discharge_location_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_discharge_location_during" is '  RELPART admissions_discharge_location_duringVbe
    {hadm_id@N INT4, discharge_location@N VARCHAR(60), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_insurance_during
create table "mimiciv_hosp@V@UHF"."admissions_insurance_during"
(
  "hadm_id" INT4 not null, 
  "insurance" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_insurance_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_insurance_during" is '  RELPART admissions_insurance_duringVbe
    {hadm_id@N INT4, insurance@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_language_during
create table "mimiciv_hosp@V@UHF"."admissions_language_during"
(
  "hadm_id" INT4 not null, 
  "language" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_language_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_language_during" is '  RELPART admissions_language_duringVbe
    {hadm_id@N INT4, language@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_marital_status_during
create table "mimiciv_hosp@V@UHF"."admissions_marital_status_during"
(
  "hadm_id" INT4 not null, 
  "marital_status" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_marital_status_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_marital_status_during" is '  RELPART admissions_marital_status_duringVbe
    {hadm_id@N INT4, marital_status@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_race_during
create table "mimiciv_hosp@V@UHF"."admissions_race_during"
(
  "hadm_id" INT4 not null, 
  "race" VARCHAR(80), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_race_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_race_during" is '  RELPART admissions_race_duringVbe
    {hadm_id@N INT4, race@N VARCHAR(80), duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_edregtime_during
create table "mimiciv_hosp@V@UHF"."admissions_edregtime_during"
(
  "hadm_id" INT4 not null, 
  "edregtime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_edregtime_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edregtime_during" is '  RELPART admissions_edregtime_duringVbe
    {hadm_id@N INT4, edregtime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_edouttime_during
create table "mimiciv_hosp@V@UHF"."admissions_edouttime_during"
(
  "hadm_id" INT4 not null, 
  "edouttime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_edouttime_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edouttime_during" is '  RELPART admissions_edouttime_duringVbe
    {hadm_id@N INT4, edouttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_hospital_expire_flag_during
create table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during"
(
  "hadm_id" INT4 not null, 
  "hospital_expire_flag" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint admissions_hospital_expire_flag_during_cc00 primary key ("hadm_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_during" is '  RELPART admissions_hospital_expire_flag_duringVbe
    {hadm_id@N INT4, hospital_expire_flag@N INT2, duringVbe VBE_INTERVAL}
   KEY {hadm_id, during} 
';

-- Table admissions_until
create table "mimiciv_hosp@V@UHF"."admissions_until"
(
  "hadm_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_until" is '  RELPART admissions_untilVxe
    {hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_subject_id_until
create table "mimiciv_hosp@V@UHF"."admissions_subject_id_until"
(
  "hadm_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_subject_id_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_subject_id_until" is '  RELPART admissions_subject_id_untilVxe
    {hadm_id@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admittime_until
create table "mimiciv_hosp@V@UHF"."admissions_admittime_until"
(
  "hadm_id" INT4 not null, 
  "admittime" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_admittime_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admittime_until" is '  RELPART admissions_admittime_untilVxe
    {hadm_id@N INT4, admittime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_dischtime_until
create table "mimiciv_hosp@V@UHF"."admissions_dischtime_until"
(
  "hadm_id" INT4 not null, 
  "dischtime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_dischtime_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_dischtime_until" is '  RELPART admissions_dischtime_untilVxe
    {hadm_id@N INT4, dischtime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_deathtime_until
create table "mimiciv_hosp@V@UHF"."admissions_deathtime_until"
(
  "hadm_id" INT4 not null, 
  "deathtime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_deathtime_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_deathtime_until" is '  RELPART admissions_deathtime_untilVxe
    {hadm_id@N INT4, deathtime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admission_type_until
create table "mimiciv_hosp@V@UHF"."admissions_admission_type_until"
(
  "hadm_id" INT4 not null, 
  "admission_type" VARCHAR(40) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_admission_type_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_type_until" is '  RELPART admissions_admission_type_untilVxe
    {hadm_id@N INT4, admission_type@N VARCHAR(40), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admit_provider_id_until
create table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_until"
(
  "hadm_id" INT4 not null, 
  "admit_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_admit_provider_id_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admit_provider_id_until" is '  RELPART admissions_admit_provider_id_untilVxe
    {hadm_id@N INT4, admit_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_admission_location_until
create table "mimiciv_hosp@V@UHF"."admissions_admission_location_until"
(
  "hadm_id" INT4 not null, 
  "admission_location" VARCHAR(60), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_admission_location_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_admission_location_until" is '  RELPART admissions_admission_location_untilVxe
    {hadm_id@N INT4, admission_location@N VARCHAR(60), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_discharge_location_until
create table "mimiciv_hosp@V@UHF"."admissions_discharge_location_until"
(
  "hadm_id" INT4 not null, 
  "discharge_location" VARCHAR(60), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_discharge_location_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_discharge_location_until" is '  RELPART admissions_discharge_location_untilVxe
    {hadm_id@N INT4, discharge_location@N VARCHAR(60), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_insurance_until
create table "mimiciv_hosp@V@UHF"."admissions_insurance_until"
(
  "hadm_id" INT4 not null, 
  "insurance" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_insurance_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_insurance_until" is '  RELPART admissions_insurance_untilVxe
    {hadm_id@N INT4, insurance@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_language_until
create table "mimiciv_hosp@V@UHF"."admissions_language_until"
(
  "hadm_id" INT4 not null, 
  "language" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_language_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_language_until" is '  RELPART admissions_language_untilVxe
    {hadm_id@N INT4, language@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_marital_status_until
create table "mimiciv_hosp@V@UHF"."admissions_marital_status_until"
(
  "hadm_id" INT4 not null, 
  "marital_status" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_marital_status_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_marital_status_until" is '  RELPART admissions_marital_status_untilVxe
    {hadm_id@N INT4, marital_status@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_race_until
create table "mimiciv_hosp@V@UHF"."admissions_race_until"
(
  "hadm_id" INT4 not null, 
  "race" VARCHAR(80), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_race_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_race_until" is '  RELPART admissions_race_untilVxe
    {hadm_id@N INT4, race@N VARCHAR(80), untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_edregtime_until
create table "mimiciv_hosp@V@UHF"."admissions_edregtime_until"
(
  "hadm_id" INT4 not null, 
  "edregtime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_edregtime_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edregtime_until" is '  RELPART admissions_edregtime_untilVxe
    {hadm_id@N INT4, edregtime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_edouttime_until
create table "mimiciv_hosp@V@UHF"."admissions_edouttime_until"
(
  "hadm_id" INT4 not null, 
  "edouttime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_edouttime_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_edouttime_until" is '  RELPART admissions_edouttime_untilVxe
    {hadm_id@N INT4, edouttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table admissions_hospital_expire_flag_until
create table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_until"
(
  "hadm_id" INT4 not null, 
  "hospital_expire_flag" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint admissions_hospital_expire_flag_until_cc00 primary key ("hadm_id"));

comment on table "mimiciv_hosp@V@UHF"."admissions_hospital_expire_flag_until" is '  RELPART admissions_hospital_expire_flag_untilVxe
    {hadm_id@N INT4, hospital_expire_flag@N INT2, untilVxe VXE_POINT}
   KEY {hadm_id} 
';

-- Table labevents_since
create table "mimiciv_hosp@V@UHF"."labevents_since"
(
  "labevent_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_since" is '  RELPART labevents_sinceVbx
    {labevent_id@N INT4, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_subject_id_since
create table "mimiciv_hosp@V@UHF"."labevents_subject_id_since"
(
  "labevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_subject_id_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_subject_id_since" is '  RELPART labevents_subject_id_sinceVbx
    {labevent_id@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_hadm_id_since
create table "mimiciv_hosp@V@UHF"."labevents_hadm_id_since"
(
  "labevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_hadm_id_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_hadm_id_since" is '  RELPART labevents_hadm_id_sinceVbx
    {labevent_id@N INT4, hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_specimen_id_since
create table "mimiciv_hosp@V@UHF"."labevents_specimen_id_since"
(
  "labevent_id" INT4 not null, 
  "specimen_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_specimen_id_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_specimen_id_since" is '  RELPART labevents_specimen_id_sinceVbx
    {labevent_id@N INT4, specimen_id@N INT4, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_itemid_since
create table "mimiciv_hosp@V@UHF"."labevents_itemid_since"
(
  "labevent_id" INT4 not null, 
  "itemid" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_itemid_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_itemid_since" is '  RELPART labevents_itemid_sinceVbx
    {labevent_id@N INT4, itemid@N INT4, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_order_provider_id_since
create table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_since"
(
  "labevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_order_provider_id_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_since" is '  RELPART labevents_order_provider_id_sinceVbx
    {labevent_id@N INT4, order_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_charttime_since
create table "mimiciv_hosp@V@UHF"."labevents_charttime_since"
(
  "labevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_charttime_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_charttime_since" is '  RELPART labevents_charttime_sinceVbx
    {labevent_id@N INT4, charttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_storetime_since
create table "mimiciv_hosp@V@UHF"."labevents_storetime_since"
(
  "labevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_storetime_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_storetime_since" is '  RELPART labevents_storetime_sinceVbx
    {labevent_id@N INT4, storetime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_value_since
create table "mimiciv_hosp@V@UHF"."labevents_value_since"
(
  "labevent_id" INT4 not null, 
  "value" VARCHAR(200), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_value_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_value_since" is '  RELPART labevents_value_sinceVbx
    {labevent_id@N INT4, value@N VARCHAR(200), sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_valuenum_since
create table "mimiciv_hosp@V@UHF"."labevents_valuenum_since"
(
  "labevent_id" INT4 not null, 
  "valuenum" FLOAT8, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_valuenum_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valuenum_since" is '  RELPART labevents_valuenum_sinceVbx
    {labevent_id@N INT4, valuenum@N FLOAT8, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_valueuom_since
create table "mimiciv_hosp@V@UHF"."labevents_valueuom_since"
(
  "labevent_id" INT4 not null, 
  "valueuom" VARCHAR(20), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_valueuom_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valueuom_since" is '  RELPART labevents_valueuom_sinceVbx
    {labevent_id@N INT4, valueuom@N VARCHAR(20), sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_ref_range_lower_since
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_since"
(
  "labevent_id" INT4 not null, 
  "ref_range_lower" FLOAT8, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_ref_range_lower_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_since" is '  RELPART labevents_ref_range_lower_sinceVbx
    {labevent_id@N INT4, ref_range_lower@N FLOAT8, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_ref_range_upper_since
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_since"
(
  "labevent_id" INT4 not null, 
  "ref_range_upper" FLOAT8, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_ref_range_upper_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_since" is '  RELPART labevents_ref_range_upper_sinceVbx
    {labevent_id@N INT4, ref_range_upper@N FLOAT8, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_flag_since
create table "mimiciv_hosp@V@UHF"."labevents_flag_since"
(
  "labevent_id" INT4 not null, 
  "flag" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_flag_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_flag_since" is '  RELPART labevents_flag_sinceVbx
    {labevent_id@N INT4, flag@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_priority_since
create table "mimiciv_hosp@V@UHF"."labevents_priority_since"
(
  "labevent_id" INT4 not null, 
  "priority" VARCHAR(7), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_priority_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_priority_since" is '  RELPART labevents_priority_sinceVbx
    {labevent_id@N INT4, priority@N VARCHAR(7), sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_comments_since
create table "mimiciv_hosp@V@UHF"."labevents_comments_since"
(
  "labevent_id" INT4 not null, 
  "comments" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint labevents_comments_since_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_comments_since" is '  RELPART labevents_comments_sinceVbx
    {labevent_id@N INT4, comments@N TEXT, sinceVbx VBX_POINT}
   KEY {labevent_id} 
';

-- Table labevents_during
create table "mimiciv_hosp@V@UHF"."labevents_during"
(
  "labevent_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_during" is '  RELPART labevents_duringVbe
    {labevent_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_subject_id_during
create table "mimiciv_hosp@V@UHF"."labevents_subject_id_during"
(
  "labevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_subject_id_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_subject_id_during" is '  RELPART labevents_subject_id_duringVbe
    {labevent_id@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_hadm_id_during
create table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during"
(
  "labevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_hadm_id_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_hadm_id_during" is '  RELPART labevents_hadm_id_duringVbe
    {labevent_id@N INT4, hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_specimen_id_during
create table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during"
(
  "labevent_id" INT4 not null, 
  "specimen_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_specimen_id_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_specimen_id_during" is '  RELPART labevents_specimen_id_duringVbe
    {labevent_id@N INT4, specimen_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_itemid_during
create table "mimiciv_hosp@V@UHF"."labevents_itemid_during"
(
  "labevent_id" INT4 not null, 
  "itemid" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_itemid_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_itemid_during" is '  RELPART labevents_itemid_duringVbe
    {labevent_id@N INT4, itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_order_provider_id_during
create table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during"
(
  "labevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_order_provider_id_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_during" is '  RELPART labevents_order_provider_id_duringVbe
    {labevent_id@N INT4, order_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_charttime_during
create table "mimiciv_hosp@V@UHF"."labevents_charttime_during"
(
  "labevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_charttime_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_charttime_during" is '  RELPART labevents_charttime_duringVbe
    {labevent_id@N INT4, charttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_storetime_during
create table "mimiciv_hosp@V@UHF"."labevents_storetime_during"
(
  "labevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_storetime_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_storetime_during" is '  RELPART labevents_storetime_duringVbe
    {labevent_id@N INT4, storetime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_value_during
create table "mimiciv_hosp@V@UHF"."labevents_value_during"
(
  "labevent_id" INT4 not null, 
  "value" VARCHAR(200), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_value_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_value_during" is '  RELPART labevents_value_duringVbe
    {labevent_id@N INT4, value@N VARCHAR(200), duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_valuenum_during
create table "mimiciv_hosp@V@UHF"."labevents_valuenum_during"
(
  "labevent_id" INT4 not null, 
  "valuenum" FLOAT8, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_valuenum_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valuenum_during" is '  RELPART labevents_valuenum_duringVbe
    {labevent_id@N INT4, valuenum@N FLOAT8, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_valueuom_during
create table "mimiciv_hosp@V@UHF"."labevents_valueuom_during"
(
  "labevent_id" INT4 not null, 
  "valueuom" VARCHAR(20), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_valueuom_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valueuom_during" is '  RELPART labevents_valueuom_duringVbe
    {labevent_id@N INT4, valueuom@N VARCHAR(20), duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_ref_range_lower_during
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during"
(
  "labevent_id" INT4 not null, 
  "ref_range_lower" FLOAT8, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_ref_range_lower_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_during" is '  RELPART labevents_ref_range_lower_duringVbe
    {labevent_id@N INT4, ref_range_lower@N FLOAT8, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_ref_range_upper_during
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during"
(
  "labevent_id" INT4 not null, 
  "ref_range_upper" FLOAT8, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_ref_range_upper_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_during" is '  RELPART labevents_ref_range_upper_duringVbe
    {labevent_id@N INT4, ref_range_upper@N FLOAT8, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_flag_during
create table "mimiciv_hosp@V@UHF"."labevents_flag_during"
(
  "labevent_id" INT4 not null, 
  "flag" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_flag_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_flag_during" is '  RELPART labevents_flag_duringVbe
    {labevent_id@N INT4, flag@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_priority_during
create table "mimiciv_hosp@V@UHF"."labevents_priority_during"
(
  "labevent_id" INT4 not null, 
  "priority" VARCHAR(7), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_priority_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_priority_during" is '  RELPART labevents_priority_duringVbe
    {labevent_id@N INT4, priority@N VARCHAR(7), duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_comments_during
create table "mimiciv_hosp@V@UHF"."labevents_comments_during"
(
  "labevent_id" INT4 not null, 
  "comments" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint labevents_comments_during_cc00 primary key ("labevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."labevents_comments_during" is '  RELPART labevents_comments_duringVbe
    {labevent_id@N INT4, comments@N TEXT, duringVbe VBE_INTERVAL}
   KEY {labevent_id, during} 
';

-- Table labevents_until
create table "mimiciv_hosp@V@UHF"."labevents_until"
(
  "labevent_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_until" is '  RELPART labevents_untilVxe
    {labevent_id@N INT4, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_subject_id_until
create table "mimiciv_hosp@V@UHF"."labevents_subject_id_until"
(
  "labevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_subject_id_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_subject_id_until" is '  RELPART labevents_subject_id_untilVxe
    {labevent_id@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_hadm_id_until
create table "mimiciv_hosp@V@UHF"."labevents_hadm_id_until"
(
  "labevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_hadm_id_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_hadm_id_until" is '  RELPART labevents_hadm_id_untilVxe
    {labevent_id@N INT4, hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_specimen_id_until
create table "mimiciv_hosp@V@UHF"."labevents_specimen_id_until"
(
  "labevent_id" INT4 not null, 
  "specimen_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_specimen_id_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_specimen_id_until" is '  RELPART labevents_specimen_id_untilVxe
    {labevent_id@N INT4, specimen_id@N INT4, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_itemid_until
create table "mimiciv_hosp@V@UHF"."labevents_itemid_until"
(
  "labevent_id" INT4 not null, 
  "itemid" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_itemid_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_itemid_until" is '  RELPART labevents_itemid_untilVxe
    {labevent_id@N INT4, itemid@N INT4, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_order_provider_id_until
create table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_until"
(
  "labevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_order_provider_id_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_order_provider_id_until" is '  RELPART labevents_order_provider_id_untilVxe
    {labevent_id@N INT4, order_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_charttime_until
create table "mimiciv_hosp@V@UHF"."labevents_charttime_until"
(
  "labevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_charttime_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_charttime_until" is '  RELPART labevents_charttime_untilVxe
    {labevent_id@N INT4, charttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_storetime_until
create table "mimiciv_hosp@V@UHF"."labevents_storetime_until"
(
  "labevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_storetime_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_storetime_until" is '  RELPART labevents_storetime_untilVxe
    {labevent_id@N INT4, storetime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_value_until
create table "mimiciv_hosp@V@UHF"."labevents_value_until"
(
  "labevent_id" INT4 not null, 
  "value" VARCHAR(200), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_value_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_value_until" is '  RELPART labevents_value_untilVxe
    {labevent_id@N INT4, value@N VARCHAR(200), untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_valuenum_until
create table "mimiciv_hosp@V@UHF"."labevents_valuenum_until"
(
  "labevent_id" INT4 not null, 
  "valuenum" FLOAT8, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_valuenum_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valuenum_until" is '  RELPART labevents_valuenum_untilVxe
    {labevent_id@N INT4, valuenum@N FLOAT8, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_valueuom_until
create table "mimiciv_hosp@V@UHF"."labevents_valueuom_until"
(
  "labevent_id" INT4 not null, 
  "valueuom" VARCHAR(20), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_valueuom_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_valueuom_until" is '  RELPART labevents_valueuom_untilVxe
    {labevent_id@N INT4, valueuom@N VARCHAR(20), untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_ref_range_lower_until
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_until"
(
  "labevent_id" INT4 not null, 
  "ref_range_lower" FLOAT8, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_ref_range_lower_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_lower_until" is '  RELPART labevents_ref_range_lower_untilVxe
    {labevent_id@N INT4, ref_range_lower@N FLOAT8, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_ref_range_upper_until
create table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_until"
(
  "labevent_id" INT4 not null, 
  "ref_range_upper" FLOAT8, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_ref_range_upper_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_ref_range_upper_until" is '  RELPART labevents_ref_range_upper_untilVxe
    {labevent_id@N INT4, ref_range_upper@N FLOAT8, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_flag_until
create table "mimiciv_hosp@V@UHF"."labevents_flag_until"
(
  "labevent_id" INT4 not null, 
  "flag" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_flag_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_flag_until" is '  RELPART labevents_flag_untilVxe
    {labevent_id@N INT4, flag@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_priority_until
create table "mimiciv_hosp@V@UHF"."labevents_priority_until"
(
  "labevent_id" INT4 not null, 
  "priority" VARCHAR(7), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_priority_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_priority_until" is '  RELPART labevents_priority_untilVxe
    {labevent_id@N INT4, priority@N VARCHAR(7), untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table labevents_comments_until
create table "mimiciv_hosp@V@UHF"."labevents_comments_until"
(
  "labevent_id" INT4 not null, 
  "comments" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint labevents_comments_until_cc00 primary key ("labevent_id"));

comment on table "mimiciv_hosp@V@UHF"."labevents_comments_until" is '  RELPART labevents_comments_untilVxe
    {labevent_id@N INT4, comments@N TEXT, untilVxe VXE_POINT}
   KEY {labevent_id} 
';

-- Table transfers_since
create table "mimiciv_hosp@V@UHF"."transfers_since"
(
  "transfer_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_since" is '  RELPART transfers_sinceVbx
    {transfer_id@N INT4, sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_subject_id_since
create table "mimiciv_hosp@V@UHF"."transfers_subject_id_since"
(
  "transfer_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_subject_id_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_subject_id_since" is '  RELPART transfers_subject_id_sinceVbx
    {transfer_id@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_hadm_id_since
create table "mimiciv_hosp@V@UHF"."transfers_hadm_id_since"
(
  "transfer_id" INT4 not null, 
  "hadm_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_hadm_id_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_hadm_id_since" is '  RELPART transfers_hadm_id_sinceVbx
    {transfer_id@N INT4, hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_eventtype_since
create table "mimiciv_hosp@V@UHF"."transfers_eventtype_since"
(
  "transfer_id" INT4 not null, 
  "eventtype" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_eventtype_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_eventtype_since" is '  RELPART transfers_eventtype_sinceVbx
    {transfer_id@N INT4, eventtype@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_careunit_since
create table "mimiciv_hosp@V@UHF"."transfers_careunit_since"
(
  "transfer_id" INT4 not null, 
  "careunit" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_careunit_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_careunit_since" is '  RELPART transfers_careunit_sinceVbx
    {transfer_id@N INT4, careunit@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_intime_since
create table "mimiciv_hosp@V@UHF"."transfers_intime_since"
(
  "transfer_id" INT4 not null, 
  "intime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_intime_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_intime_since" is '  RELPART transfers_intime_sinceVbx
    {transfer_id@N INT4, intime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_outtime_since
create table "mimiciv_hosp@V@UHF"."transfers_outtime_since"
(
  "transfer_id" INT4 not null, 
  "outtime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint transfers_outtime_since_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_outtime_since" is '  RELPART transfers_outtime_sinceVbx
    {transfer_id@N INT4, outtime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {transfer_id} 
';

-- Table transfers_during
create table "mimiciv_hosp@V@UHF"."transfers_during"
(
  "transfer_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_during" is '  RELPART transfers_duringVbe
    {transfer_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_subject_id_during
create table "mimiciv_hosp@V@UHF"."transfers_subject_id_during"
(
  "transfer_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_subject_id_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_subject_id_during" is '  RELPART transfers_subject_id_duringVbe
    {transfer_id@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_hadm_id_during
create table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during"
(
  "transfer_id" INT4 not null, 
  "hadm_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_hadm_id_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_hadm_id_during" is '  RELPART transfers_hadm_id_duringVbe
    {transfer_id@N INT4, hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_eventtype_during
create table "mimiciv_hosp@V@UHF"."transfers_eventtype_during"
(
  "transfer_id" INT4 not null, 
  "eventtype" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_eventtype_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_eventtype_during" is '  RELPART transfers_eventtype_duringVbe
    {transfer_id@N INT4, eventtype@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_careunit_during
create table "mimiciv_hosp@V@UHF"."transfers_careunit_during"
(
  "transfer_id" INT4 not null, 
  "careunit" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_careunit_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_careunit_during" is '  RELPART transfers_careunit_duringVbe
    {transfer_id@N INT4, careunit@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_intime_during
create table "mimiciv_hosp@V@UHF"."transfers_intime_during"
(
  "transfer_id" INT4 not null, 
  "intime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_intime_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_intime_during" is '  RELPART transfers_intime_duringVbe
    {transfer_id@N INT4, intime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_outtime_during
create table "mimiciv_hosp@V@UHF"."transfers_outtime_during"
(
  "transfer_id" INT4 not null, 
  "outtime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint transfers_outtime_during_cc00 primary key ("transfer_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."transfers_outtime_during" is '  RELPART transfers_outtime_duringVbe
    {transfer_id@N INT4, outtime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {transfer_id, during} 
';

-- Table transfers_until
create table "mimiciv_hosp@V@UHF"."transfers_until"
(
  "transfer_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_until" is '  RELPART transfers_untilVxe
    {transfer_id@N INT4, untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_subject_id_until
create table "mimiciv_hosp@V@UHF"."transfers_subject_id_until"
(
  "transfer_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_subject_id_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_subject_id_until" is '  RELPART transfers_subject_id_untilVxe
    {transfer_id@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_hadm_id_until
create table "mimiciv_hosp@V@UHF"."transfers_hadm_id_until"
(
  "transfer_id" INT4 not null, 
  "hadm_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_hadm_id_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_hadm_id_until" is '  RELPART transfers_hadm_id_untilVxe
    {transfer_id@N INT4, hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_eventtype_until
create table "mimiciv_hosp@V@UHF"."transfers_eventtype_until"
(
  "transfer_id" INT4 not null, 
  "eventtype" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_eventtype_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_eventtype_until" is '  RELPART transfers_eventtype_untilVxe
    {transfer_id@N INT4, eventtype@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_careunit_until
create table "mimiciv_hosp@V@UHF"."transfers_careunit_until"
(
  "transfer_id" INT4 not null, 
  "careunit" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_careunit_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_careunit_until" is '  RELPART transfers_careunit_untilVxe
    {transfer_id@N INT4, careunit@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_intime_until
create table "mimiciv_hosp@V@UHF"."transfers_intime_until"
(
  "transfer_id" INT4 not null, 
  "intime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_intime_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_intime_until" is '  RELPART transfers_intime_untilVxe
    {transfer_id@N INT4, intime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table transfers_outtime_until
create table "mimiciv_hosp@V@UHF"."transfers_outtime_until"
(
  "transfer_id" INT4 not null, 
  "outtime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint transfers_outtime_until_cc00 primary key ("transfer_id"));

comment on table "mimiciv_hosp@V@UHF"."transfers_outtime_until" is '  RELPART transfers_outtime_untilVxe
    {transfer_id@N INT4, outtime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {transfer_id} 
';

-- Table diagnoses_icd_since
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_since"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint diagnoses_icd_since_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_since" is '  RELPART diagnoses_icd_sinceVbx
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, sinceVbx VBX_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table diagnoses_icd_subject_id_since
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_since"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint diagnoses_icd_subject_id_since_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_since" is '  RELPART diagnoses_icd_subject_id_sinceVbx
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table diagnoses_icd_during
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_during"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint diagnoses_icd_during_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_during" is '  RELPART diagnoses_icd_duringVbe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, duringVbe VBE_INTERVAL}
   KEY {hadm_id, seq_num, icd_code, icd_version, during} 
';

-- Table diagnoses_icd_subject_id_during
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint diagnoses_icd_subject_id_during_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_during" is '  RELPART diagnoses_icd_subject_id_duringVbe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, seq_num, icd_code, icd_version, during} 
';

-- Table diagnoses_icd_until
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_until"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint diagnoses_icd_until_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_until" is '  RELPART diagnoses_icd_untilVxe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, untilVxe VXE_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table diagnoses_icd_subject_id_until
create table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_until"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" BPCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint diagnoses_icd_subject_id_until_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."diagnoses_icd_subject_id_until" is '  RELPART diagnoses_icd_subject_id_untilVxe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N BPCHAR(7), icd_version@N INT2, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table drgcodes_since
create table "mimiciv_hosp@V@UHF"."drgcodes_since"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint drgcodes_since_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_since" is '  RELPART drgcodes_sinceVbx
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_type_since
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_since"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_type" VARCHAR(4), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint drgcodes_drg_type_since_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_since" is '  RELPART drgcodes_drg_type_sinceVbx
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_type@N VARCHAR(4), sinceVbx VBX_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_description_since
create table "mimiciv_hosp@V@UHF"."drgcodes_description_since"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "description" VARCHAR(195), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint drgcodes_description_since_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_description_since" is '  RELPART drgcodes_description_sinceVbx
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), description@N VARCHAR(195), sinceVbx VBX_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_severity_since
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_since"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_severity" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint drgcodes_drg_severity_since_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_since" is '  RELPART drgcodes_drg_severity_sinceVbx
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_severity@N INT2, sinceVbx VBX_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_mortality_since
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_since"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_mortality" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint drgcodes_drg_mortality_since_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_since" is '  RELPART drgcodes_drg_mortality_sinceVbx
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_mortality@N INT2, sinceVbx VBX_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_during
create table "mimiciv_hosp@V@UHF"."drgcodes_during"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint drgcodes_during_cc00 primary key ("subject_id", "hadm_id", "drg_code", "during"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_during" is '  RELPART drgcodes_duringVbe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {subject_id, hadm_id, drg_code, during} 
';

-- Table drgcodes_drg_type_during
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_type" VARCHAR(4), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint drgcodes_drg_type_during_cc00 primary key ("subject_id", "hadm_id", "drg_code", "during"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_during" is '  RELPART drgcodes_drg_type_duringVbe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_type@N VARCHAR(4), duringVbe VBE_INTERVAL}
   KEY {subject_id, hadm_id, drg_code, during} 
';

-- Table drgcodes_description_during
create table "mimiciv_hosp@V@UHF"."drgcodes_description_during"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "description" VARCHAR(195), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint drgcodes_description_during_cc00 primary key ("subject_id", "hadm_id", "drg_code", "during"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_description_during" is '  RELPART drgcodes_description_duringVbe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), description@N VARCHAR(195), duringVbe VBE_INTERVAL}
   KEY {subject_id, hadm_id, drg_code, during} 
';

-- Table drgcodes_drg_severity_during
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_severity" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint drgcodes_drg_severity_during_cc00 primary key ("subject_id", "hadm_id", "drg_code", "during"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_during" is '  RELPART drgcodes_drg_severity_duringVbe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_severity@N INT2, duringVbe VBE_INTERVAL}
   KEY {subject_id, hadm_id, drg_code, during} 
';

-- Table drgcodes_drg_mortality_during
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_mortality" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint drgcodes_drg_mortality_during_cc00 primary key ("subject_id", "hadm_id", "drg_code", "during"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_during" is '  RELPART drgcodes_drg_mortality_duringVbe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_mortality@N INT2, duringVbe VBE_INTERVAL}
   KEY {subject_id, hadm_id, drg_code, during} 
';

-- Table drgcodes_until
create table "mimiciv_hosp@V@UHF"."drgcodes_until"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint drgcodes_until_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_until" is '  RELPART drgcodes_untilVxe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_type_until
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_until"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_type" VARCHAR(4), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint drgcodes_drg_type_until_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_type_until" is '  RELPART drgcodes_drg_type_untilVxe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_type@N VARCHAR(4), untilVxe VXE_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_description_until
create table "mimiciv_hosp@V@UHF"."drgcodes_description_until"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "description" VARCHAR(195), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint drgcodes_description_until_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_description_until" is '  RELPART drgcodes_description_untilVxe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), description@N VARCHAR(195), untilVxe VXE_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_severity_until
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_until"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_severity" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint drgcodes_drg_severity_until_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_severity_until" is '  RELPART drgcodes_drg_severity_untilVxe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_severity@N INT2, untilVxe VXE_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table drgcodes_drg_mortality_until
create table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_until"
(
  "subject_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "drg_code" VARCHAR(10) not null, 
  "drg_mortality" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint drgcodes_drg_mortality_until_cc00 primary key ("subject_id", "hadm_id", "drg_code"));

comment on table "mimiciv_hosp@V@UHF"."drgcodes_drg_mortality_until" is '  RELPART drgcodes_drg_mortality_untilVxe
    {subject_id@N INT4, hadm_id@N INT4, drg_code@N VARCHAR(10), drg_mortality@N INT2, untilVxe VXE_POINT}
   KEY {subject_id, hadm_id, drg_code} 
';

-- Table emar_since
create table "mimiciv_hosp@V@UHF"."emar_since"
(
  "emar_id" VARCHAR(25) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_since" is '  RELPART emar_sinceVbx
    {emar_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_subject_id_since
create table "mimiciv_hosp@V@UHF"."emar_subject_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_subject_id_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_subject_id_since" is '  RELPART emar_subject_id_sinceVbx
    {emar_id@N VARCHAR(25), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_hadm_id_since
create table "mimiciv_hosp@V@UHF"."emar_hadm_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_hadm_id_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_hadm_id_since" is '  RELPART emar_hadm_id_sinceVbx
    {emar_id@N VARCHAR(25), hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_emar_seq_since
create table "mimiciv_hosp@V@UHF"."emar_emar_seq_since"
(
  "emar_id" VARCHAR(25) not null, 
  "emar_seq" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_emar_seq_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_emar_seq_since" is '  RELPART emar_emar_seq_sinceVbx
    {emar_id@N VARCHAR(25), emar_seq@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_poe_id_since
create table "mimiciv_hosp@V@UHF"."emar_poe_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "poe_id" VARCHAR(25) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_poe_id_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_poe_id_since" is '  RELPART emar_poe_id_sinceVbx
    {emar_id@N VARCHAR(25), poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_pharmacy_id_since
create table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "pharmacy_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_pharmacy_id_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_since" is '  RELPART emar_pharmacy_id_sinceVbx
    {emar_id@N VARCHAR(25), pharmacy_id@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_enter_provider_id_since
create table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "enter_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_enter_provider_id_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_since" is '  RELPART emar_enter_provider_id_sinceVbx
    {emar_id@N VARCHAR(25), enter_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_charttime_since
create table "mimiciv_hosp@V@UHF"."emar_charttime_since"
(
  "emar_id" VARCHAR(25) not null, 
  "charttime" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_charttime_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_charttime_since" is '  RELPART emar_charttime_sinceVbx
    {emar_id@N VARCHAR(25), charttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_medication_since
create table "mimiciv_hosp@V@UHF"."emar_medication_since"
(
  "emar_id" VARCHAR(25) not null, 
  "medication" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_medication_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_medication_since" is '  RELPART emar_medication_sinceVbx
    {emar_id@N VARCHAR(25), medication@N TEXT, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_event_txt_since
create table "mimiciv_hosp@V@UHF"."emar_event_txt_since"
(
  "emar_id" VARCHAR(25) not null, 
  "event_txt" VARCHAR(100), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_event_txt_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_event_txt_since" is '  RELPART emar_event_txt_sinceVbx
    {emar_id@N VARCHAR(25), event_txt@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_scheduletime_since
create table "mimiciv_hosp@V@UHF"."emar_scheduletime_since"
(
  "emar_id" VARCHAR(25) not null, 
  "scheduletime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_scheduletime_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_scheduletime_since" is '  RELPART emar_scheduletime_sinceVbx
    {emar_id@N VARCHAR(25), scheduletime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_storetime_since
create table "mimiciv_hosp@V@UHF"."emar_storetime_since"
(
  "emar_id" VARCHAR(25) not null, 
  "storetime" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_storetime_since_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_storetime_since" is '  RELPART emar_storetime_sinceVbx
    {emar_id@N VARCHAR(25), storetime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {emar_id} 
';

-- Table emar_during
create table "mimiciv_hosp@V@UHF"."emar_during"
(
  "emar_id" VARCHAR(25) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_during" is '  RELPART emar_duringVbe
    {emar_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_subject_id_during
create table "mimiciv_hosp@V@UHF"."emar_subject_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_subject_id_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_subject_id_during" is '  RELPART emar_subject_id_duringVbe
    {emar_id@N VARCHAR(25), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_hadm_id_during
create table "mimiciv_hosp@V@UHF"."emar_hadm_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_hadm_id_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_hadm_id_during" is '  RELPART emar_hadm_id_duringVbe
    {emar_id@N VARCHAR(25), hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_emar_seq_during
create table "mimiciv_hosp@V@UHF"."emar_emar_seq_during"
(
  "emar_id" VARCHAR(25) not null, 
  "emar_seq" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_emar_seq_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_emar_seq_during" is '  RELPART emar_emar_seq_duringVbe
    {emar_id@N VARCHAR(25), emar_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_poe_id_during
create table "mimiciv_hosp@V@UHF"."emar_poe_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "poe_id" VARCHAR(25) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_poe_id_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_poe_id_during" is '  RELPART emar_poe_id_duringVbe
    {emar_id@N VARCHAR(25), poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_pharmacy_id_during
create table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "pharmacy_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_pharmacy_id_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_during" is '  RELPART emar_pharmacy_id_duringVbe
    {emar_id@N VARCHAR(25), pharmacy_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_enter_provider_id_during
create table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "enter_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_enter_provider_id_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_during" is '  RELPART emar_enter_provider_id_duringVbe
    {emar_id@N VARCHAR(25), enter_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_charttime_during
create table "mimiciv_hosp@V@UHF"."emar_charttime_during"
(
  "emar_id" VARCHAR(25) not null, 
  "charttime" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_charttime_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_charttime_during" is '  RELPART emar_charttime_duringVbe
    {emar_id@N VARCHAR(25), charttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_medication_during
create table "mimiciv_hosp@V@UHF"."emar_medication_during"
(
  "emar_id" VARCHAR(25) not null, 
  "medication" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_medication_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_medication_during" is '  RELPART emar_medication_duringVbe
    {emar_id@N VARCHAR(25), medication@N TEXT, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_event_txt_during
create table "mimiciv_hosp@V@UHF"."emar_event_txt_during"
(
  "emar_id" VARCHAR(25) not null, 
  "event_txt" VARCHAR(100), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_event_txt_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_event_txt_during" is '  RELPART emar_event_txt_duringVbe
    {emar_id@N VARCHAR(25), event_txt@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_scheduletime_during
create table "mimiciv_hosp@V@UHF"."emar_scheduletime_during"
(
  "emar_id" VARCHAR(25) not null, 
  "scheduletime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_scheduletime_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_scheduletime_during" is '  RELPART emar_scheduletime_duringVbe
    {emar_id@N VARCHAR(25), scheduletime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_storetime_during
create table "mimiciv_hosp@V@UHF"."emar_storetime_during"
(
  "emar_id" VARCHAR(25) not null, 
  "storetime" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_storetime_during_cc00 primary key ("emar_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_storetime_during" is '  RELPART emar_storetime_duringVbe
    {emar_id@N VARCHAR(25), storetime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {emar_id, during} 
';

-- Table emar_until
create table "mimiciv_hosp@V@UHF"."emar_until"
(
  "emar_id" VARCHAR(25) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_until" is '  RELPART emar_untilVxe
    {emar_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_subject_id_until
create table "mimiciv_hosp@V@UHF"."emar_subject_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_subject_id_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_subject_id_until" is '  RELPART emar_subject_id_untilVxe
    {emar_id@N VARCHAR(25), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_hadm_id_until
create table "mimiciv_hosp@V@UHF"."emar_hadm_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_hadm_id_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_hadm_id_until" is '  RELPART emar_hadm_id_untilVxe
    {emar_id@N VARCHAR(25), hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_emar_seq_until
create table "mimiciv_hosp@V@UHF"."emar_emar_seq_until"
(
  "emar_id" VARCHAR(25) not null, 
  "emar_seq" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_emar_seq_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_emar_seq_until" is '  RELPART emar_emar_seq_untilVxe
    {emar_id@N VARCHAR(25), emar_seq@N INT4, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_poe_id_until
create table "mimiciv_hosp@V@UHF"."emar_poe_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "poe_id" VARCHAR(25) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_poe_id_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_poe_id_until" is '  RELPART emar_poe_id_untilVxe
    {emar_id@N VARCHAR(25), poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_pharmacy_id_until
create table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "pharmacy_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_pharmacy_id_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_pharmacy_id_until" is '  RELPART emar_pharmacy_id_untilVxe
    {emar_id@N VARCHAR(25), pharmacy_id@N INT4, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_enter_provider_id_until
create table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "enter_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_enter_provider_id_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_enter_provider_id_until" is '  RELPART emar_enter_provider_id_untilVxe
    {emar_id@N VARCHAR(25), enter_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_charttime_until
create table "mimiciv_hosp@V@UHF"."emar_charttime_until"
(
  "emar_id" VARCHAR(25) not null, 
  "charttime" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_charttime_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_charttime_until" is '  RELPART emar_charttime_untilVxe
    {emar_id@N VARCHAR(25), charttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_medication_until
create table "mimiciv_hosp@V@UHF"."emar_medication_until"
(
  "emar_id" VARCHAR(25) not null, 
  "medication" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_medication_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_medication_until" is '  RELPART emar_medication_untilVxe
    {emar_id@N VARCHAR(25), medication@N TEXT, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_event_txt_until
create table "mimiciv_hosp@V@UHF"."emar_event_txt_until"
(
  "emar_id" VARCHAR(25) not null, 
  "event_txt" VARCHAR(100), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_event_txt_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_event_txt_until" is '  RELPART emar_event_txt_untilVxe
    {emar_id@N VARCHAR(25), event_txt@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_scheduletime_until
create table "mimiciv_hosp@V@UHF"."emar_scheduletime_until"
(
  "emar_id" VARCHAR(25) not null, 
  "scheduletime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_scheduletime_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_scheduletime_until" is '  RELPART emar_scheduletime_untilVxe
    {emar_id@N VARCHAR(25), scheduletime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table emar_storetime_until
create table "mimiciv_hosp@V@UHF"."emar_storetime_until"
(
  "emar_id" VARCHAR(25) not null, 
  "storetime" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_storetime_until_cc00 primary key ("emar_id"));

comment on table "mimiciv_hosp@V@UHF"."emar_storetime_until" is '  RELPART emar_storetime_untilVxe
    {emar_id@N VARCHAR(25), storetime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {emar_id} 
';

-- Table hcpcsevents_since
create table "mimiciv_hosp@V@UHF"."hcpcsevents_since"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint hcpcsevents_since_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_since" is '  RELPART hcpcsevents_sinceVbx
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_subject_id_since
create table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_since"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint hcpcsevents_subject_id_since_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_since" is '  RELPART hcpcsevents_subject_id_sinceVbx
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_chartdate_since
create table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_since"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "chartdate" DATE, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint hcpcsevents_chartdate_since_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_since" is '  RELPART hcpcsevents_chartdate_sinceVbx
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, chartdate@N DATE, sinceVbx VBX_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_short_description_since
create table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_since"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "short_description" VARCHAR(180), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint hcpcsevents_short_description_since_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_since" is '  RELPART hcpcsevents_short_description_sinceVbx
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, short_description@N VARCHAR(180), sinceVbx VBX_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_during
create table "mimiciv_hosp@V@UHF"."hcpcsevents_during"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint hcpcsevents_during_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_during" is '  RELPART hcpcsevents_duringVbe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, hcpcs_cd, seq_num, during} 
';

-- Table hcpcsevents_subject_id_during
create table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint hcpcsevents_subject_id_during_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_during" is '  RELPART hcpcsevents_subject_id_duringVbe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, hcpcs_cd, seq_num, during} 
';

-- Table hcpcsevents_chartdate_during
create table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "chartdate" DATE, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint hcpcsevents_chartdate_during_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_during" is '  RELPART hcpcsevents_chartdate_duringVbe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, chartdate@N DATE, duringVbe VBE_INTERVAL}
   KEY {hadm_id, hcpcs_cd, seq_num, during} 
';

-- Table hcpcsevents_short_description_during
create table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "short_description" VARCHAR(180), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint hcpcsevents_short_description_during_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num", "during"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_during" is '  RELPART hcpcsevents_short_description_duringVbe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, short_description@N VARCHAR(180), duringVbe VBE_INTERVAL}
   KEY {hadm_id, hcpcs_cd, seq_num, during} 
';

-- Table hcpcsevents_until
create table "mimiciv_hosp@V@UHF"."hcpcsevents_until"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint hcpcsevents_until_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_until" is '  RELPART hcpcsevents_untilVxe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_subject_id_until
create table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_until"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint hcpcsevents_subject_id_until_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_subject_id_until" is '  RELPART hcpcsevents_subject_id_untilVxe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_chartdate_until
create table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_until"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "chartdate" DATE, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint hcpcsevents_chartdate_until_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_chartdate_until" is '  RELPART hcpcsevents_chartdate_untilVxe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, chartdate@N DATE, untilVxe VXE_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table hcpcsevents_short_description_until
create table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_until"
(
  "hadm_id" INT4 not null, 
  "hcpcs_cd" BPCHAR(5) not null, 
  "seq_num" INT4 not null, 
  "short_description" VARCHAR(180), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint hcpcsevents_short_description_until_cc00 primary key ("hadm_id", "hcpcs_cd", "seq_num"));

comment on table "mimiciv_hosp@V@UHF"."hcpcsevents_short_description_until" is '  RELPART hcpcsevents_short_description_untilVxe
    {hadm_id@N INT4, hcpcs_cd@N BPCHAR(5), seq_num@N INT4, short_description@N VARCHAR(180), untilVxe VXE_POINT}
   KEY {hadm_id, hcpcs_cd, seq_num} 
';

-- Table microbiologyevents_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_since"
(
  "microevent_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_since" is '  RELPART microbiologyevents_sinceVbx
    {microevent_id@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_subject_id_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_since"
(
  "microevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_subject_id_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_since" is '  RELPART microbiologyevents_subject_id_sinceVbx
    {microevent_id@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_hadm_id_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_since"
(
  "microevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_hadm_id_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_since" is '  RELPART microbiologyevents_hadm_id_sinceVbx
    {microevent_id@N INT4, hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_micro_specimen_id_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_since"
(
  "microevent_id" INT4 not null, 
  "micro_specimen_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_micro_specimen_id_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_since" is '  RELPART microbiologyevents_micro_specimen_id_sinceVbx
    {microevent_id@N INT4, micro_specimen_id@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_order_provider_id_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_since"
(
  "microevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_order_provider_id_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_since" is '  RELPART microbiologyevents_order_provider_id_sinceVbx
    {microevent_id@N INT4, order_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_chartdate_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_since"
(
  "microevent_id" INT4 not null, 
  "chartdate" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_chartdate_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_since" is '  RELPART microbiologyevents_chartdate_sinceVbx
    {microevent_id@N INT4, chartdate@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_charttime_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_since"
(
  "microevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_charttime_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_since" is '  RELPART microbiologyevents_charttime_sinceVbx
    {microevent_id@N INT4, charttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_spec_itemid_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_since"
(
  "microevent_id" INT4 not null, 
  "spec_itemid" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_spec_itemid_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_since" is '  RELPART microbiologyevents_spec_itemid_sinceVbx
    {microevent_id@N INT4, spec_itemid@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_spec_type_desc_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_since"
(
  "microevent_id" INT4 not null, 
  "spec_type_desc" VARCHAR(100) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_spec_type_desc_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_since" is '  RELPART microbiologyevents_spec_type_desc_sinceVbx
    {microevent_id@N INT4, spec_type_desc@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_seq_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_since"
(
  "microevent_id" INT4 not null, 
  "test_seq" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_test_seq_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_since" is '  RELPART microbiologyevents_test_seq_sinceVbx
    {microevent_id@N INT4, test_seq@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_storedate_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_since"
(
  "microevent_id" INT4 not null, 
  "storedate" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_storedate_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_since" is '  RELPART microbiologyevents_storedate_sinceVbx
    {microevent_id@N INT4, storedate@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_storetime_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_since"
(
  "microevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_storetime_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_since" is '  RELPART microbiologyevents_storetime_sinceVbx
    {microevent_id@N INT4, storetime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_itemid_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_since"
(
  "microevent_id" INT4 not null, 
  "test_itemid" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_test_itemid_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_since" is '  RELPART microbiologyevents_test_itemid_sinceVbx
    {microevent_id@N INT4, test_itemid@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_name_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_since"
(
  "microevent_id" INT4 not null, 
  "test_name" VARCHAR(100), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_test_name_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_since" is '  RELPART microbiologyevents_test_name_sinceVbx
    {microevent_id@N INT4, test_name@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_org_itemid_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_since"
(
  "microevent_id" INT4 not null, 
  "org_itemid" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_org_itemid_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_since" is '  RELPART microbiologyevents_org_itemid_sinceVbx
    {microevent_id@N INT4, org_itemid@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_org_name_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_since"
(
  "microevent_id" INT4 not null, 
  "org_name" VARCHAR(100), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_org_name_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_since" is '  RELPART microbiologyevents_org_name_sinceVbx
    {microevent_id@N INT4, org_name@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_isolate_num_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_since"
(
  "microevent_id" INT4 not null, 
  "isolate_num" INT2, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_isolate_num_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_since" is '  RELPART microbiologyevents_isolate_num_sinceVbx
    {microevent_id@N INT4, isolate_num@N INT2, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_quantity_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_since"
(
  "microevent_id" INT4 not null, 
  "quantity" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_quantity_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_since" is '  RELPART microbiologyevents_quantity_sinceVbx
    {microevent_id@N INT4, quantity@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_ab_itemid_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_since"
(
  "microevent_id" INT4 not null, 
  "ab_itemid" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_ab_itemid_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_since" is '  RELPART microbiologyevents_ab_itemid_sinceVbx
    {microevent_id@N INT4, ab_itemid@N INT4, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_ab_name_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_since"
(
  "microevent_id" INT4 not null, 
  "ab_name" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_ab_name_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_since" is '  RELPART microbiologyevents_ab_name_sinceVbx
    {microevent_id@N INT4, ab_name@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_text_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_since"
(
  "microevent_id" INT4 not null, 
  "dilution_text" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_dilution_text_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_since" is '  RELPART microbiologyevents_dilution_text_sinceVbx
    {microevent_id@N INT4, dilution_text@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_comparison_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_since"
(
  "microevent_id" INT4 not null, 
  "dilution_comparison" VARCHAR(20), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_dilution_comparison_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_since" is '  RELPART microbiologyevents_dilution_comparison_sinceVbx
    {microevent_id@N INT4, dilution_comparison@N VARCHAR(20), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_value_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_since"
(
  "microevent_id" INT4 not null, 
  "dilution_value" FLOAT8, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_dilution_value_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_since" is '  RELPART microbiologyevents_dilution_value_sinceVbx
    {microevent_id@N INT4, dilution_value@N FLOAT8, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_interpretation_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_since"
(
  "microevent_id" INT4 not null, 
  "interpretation" VARCHAR(5), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_interpretation_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_since" is '  RELPART microbiologyevents_interpretation_sinceVbx
    {microevent_id@N INT4, interpretation@N VARCHAR(5), sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_comments_since
create table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_since"
(
  "microevent_id" INT4 not null, 
  "comments" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint microbiologyevents_comments_since_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_since" is '  RELPART microbiologyevents_comments_sinceVbx
    {microevent_id@N INT4, comments@N TEXT, sinceVbx VBX_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_during"
(
  "microevent_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_during" is '  RELPART microbiologyevents_duringVbe
    {microevent_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_subject_id_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during"
(
  "microevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_subject_id_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_during" is '  RELPART microbiologyevents_subject_id_duringVbe
    {microevent_id@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_hadm_id_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during"
(
  "microevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_hadm_id_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_during" is '  RELPART microbiologyevents_hadm_id_duringVbe
    {microevent_id@N INT4, hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_micro_specimen_id_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during"
(
  "microevent_id" INT4 not null, 
  "micro_specimen_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_micro_specimen_id_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_during" is '  RELPART microbiologyevents_micro_specimen_id_duringVbe
    {microevent_id@N INT4, micro_specimen_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_order_provider_id_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during"
(
  "microevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_order_provider_id_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_during" is '  RELPART microbiologyevents_order_provider_id_duringVbe
    {microevent_id@N INT4, order_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_chartdate_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during"
(
  "microevent_id" INT4 not null, 
  "chartdate" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_chartdate_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_during" is '  RELPART microbiologyevents_chartdate_duringVbe
    {microevent_id@N INT4, chartdate@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_charttime_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during"
(
  "microevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_charttime_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_during" is '  RELPART microbiologyevents_charttime_duringVbe
    {microevent_id@N INT4, charttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_spec_itemid_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during"
(
  "microevent_id" INT4 not null, 
  "spec_itemid" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_spec_itemid_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_during" is '  RELPART microbiologyevents_spec_itemid_duringVbe
    {microevent_id@N INT4, spec_itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_spec_type_desc_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during"
(
  "microevent_id" INT4 not null, 
  "spec_type_desc" VARCHAR(100) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_spec_type_desc_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_during" is '  RELPART microbiologyevents_spec_type_desc_duringVbe
    {microevent_id@N INT4, spec_type_desc@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_test_seq_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during"
(
  "microevent_id" INT4 not null, 
  "test_seq" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_test_seq_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_during" is '  RELPART microbiologyevents_test_seq_duringVbe
    {microevent_id@N INT4, test_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_storedate_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during"
(
  "microevent_id" INT4 not null, 
  "storedate" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_storedate_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_during" is '  RELPART microbiologyevents_storedate_duringVbe
    {microevent_id@N INT4, storedate@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_storetime_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during"
(
  "microevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_storetime_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_during" is '  RELPART microbiologyevents_storetime_duringVbe
    {microevent_id@N INT4, storetime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_test_itemid_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during"
(
  "microevent_id" INT4 not null, 
  "test_itemid" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_test_itemid_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_during" is '  RELPART microbiologyevents_test_itemid_duringVbe
    {microevent_id@N INT4, test_itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_test_name_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during"
(
  "microevent_id" INT4 not null, 
  "test_name" VARCHAR(100), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_test_name_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_during" is '  RELPART microbiologyevents_test_name_duringVbe
    {microevent_id@N INT4, test_name@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_org_itemid_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during"
(
  "microevent_id" INT4 not null, 
  "org_itemid" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_org_itemid_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_during" is '  RELPART microbiologyevents_org_itemid_duringVbe
    {microevent_id@N INT4, org_itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_org_name_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during"
(
  "microevent_id" INT4 not null, 
  "org_name" VARCHAR(100), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_org_name_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_during" is '  RELPART microbiologyevents_org_name_duringVbe
    {microevent_id@N INT4, org_name@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_isolate_num_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during"
(
  "microevent_id" INT4 not null, 
  "isolate_num" INT2, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_isolate_num_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_during" is '  RELPART microbiologyevents_isolate_num_duringVbe
    {microevent_id@N INT4, isolate_num@N INT2, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_quantity_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during"
(
  "microevent_id" INT4 not null, 
  "quantity" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_quantity_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_during" is '  RELPART microbiologyevents_quantity_duringVbe
    {microevent_id@N INT4, quantity@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_ab_itemid_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during"
(
  "microevent_id" INT4 not null, 
  "ab_itemid" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_ab_itemid_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_during" is '  RELPART microbiologyevents_ab_itemid_duringVbe
    {microevent_id@N INT4, ab_itemid@N INT4, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_ab_name_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during"
(
  "microevent_id" INT4 not null, 
  "ab_name" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_ab_name_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_during" is '  RELPART microbiologyevents_ab_name_duringVbe
    {microevent_id@N INT4, ab_name@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_dilution_text_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during"
(
  "microevent_id" INT4 not null, 
  "dilution_text" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_dilution_text_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_during" is '  RELPART microbiologyevents_dilution_text_duringVbe
    {microevent_id@N INT4, dilution_text@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_dilution_comparison_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during"
(
  "microevent_id" INT4 not null, 
  "dilution_comparison" VARCHAR(20), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_dilution_comparison_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_during" is '  RELPART microbiologyevents_dilution_comparison_duringVbe
    {microevent_id@N INT4, dilution_comparison@N VARCHAR(20), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_dilution_value_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during"
(
  "microevent_id" INT4 not null, 
  "dilution_value" FLOAT8, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_dilution_value_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_during" is '  RELPART microbiologyevents_dilution_value_duringVbe
    {microevent_id@N INT4, dilution_value@N FLOAT8, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_interpretation_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during"
(
  "microevent_id" INT4 not null, 
  "interpretation" VARCHAR(5), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_interpretation_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_during" is '  RELPART microbiologyevents_interpretation_duringVbe
    {microevent_id@N INT4, interpretation@N VARCHAR(5), duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_comments_during
create table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during"
(
  "microevent_id" INT4 not null, 
  "comments" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint microbiologyevents_comments_during_cc00 primary key ("microevent_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_during" is '  RELPART microbiologyevents_comments_duringVbe
    {microevent_id@N INT4, comments@N TEXT, duringVbe VBE_INTERVAL}
   KEY {microevent_id, during} 
';

-- Table microbiologyevents_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_until"
(
  "microevent_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_until" is '  RELPART microbiologyevents_untilVxe
    {microevent_id@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_subject_id_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_until"
(
  "microevent_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_subject_id_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_subject_id_until" is '  RELPART microbiologyevents_subject_id_untilVxe
    {microevent_id@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_hadm_id_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_until"
(
  "microevent_id" INT4 not null, 
  "hadm_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_hadm_id_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_hadm_id_until" is '  RELPART microbiologyevents_hadm_id_untilVxe
    {microevent_id@N INT4, hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_micro_specimen_id_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_until"
(
  "microevent_id" INT4 not null, 
  "micro_specimen_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_micro_specimen_id_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_micro_specimen_id_until" is '  RELPART microbiologyevents_micro_specimen_id_untilVxe
    {microevent_id@N INT4, micro_specimen_id@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_order_provider_id_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_until"
(
  "microevent_id" INT4 not null, 
  "order_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_order_provider_id_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_order_provider_id_until" is '  RELPART microbiologyevents_order_provider_id_untilVxe
    {microevent_id@N INT4, order_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_chartdate_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_until"
(
  "microevent_id" INT4 not null, 
  "chartdate" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_chartdate_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_chartdate_until" is '  RELPART microbiologyevents_chartdate_untilVxe
    {microevent_id@N INT4, chartdate@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_charttime_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_until"
(
  "microevent_id" INT4 not null, 
  "charttime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_charttime_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_charttime_until" is '  RELPART microbiologyevents_charttime_untilVxe
    {microevent_id@N INT4, charttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_spec_itemid_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_until"
(
  "microevent_id" INT4 not null, 
  "spec_itemid" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_spec_itemid_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_itemid_until" is '  RELPART microbiologyevents_spec_itemid_untilVxe
    {microevent_id@N INT4, spec_itemid@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_spec_type_desc_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_until"
(
  "microevent_id" INT4 not null, 
  "spec_type_desc" VARCHAR(100) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_spec_type_desc_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_spec_type_desc_until" is '  RELPART microbiologyevents_spec_type_desc_untilVxe
    {microevent_id@N INT4, spec_type_desc@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_seq_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_until"
(
  "microevent_id" INT4 not null, 
  "test_seq" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_test_seq_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_seq_until" is '  RELPART microbiologyevents_test_seq_untilVxe
    {microevent_id@N INT4, test_seq@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_storedate_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_until"
(
  "microevent_id" INT4 not null, 
  "storedate" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_storedate_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storedate_until" is '  RELPART microbiologyevents_storedate_untilVxe
    {microevent_id@N INT4, storedate@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_storetime_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_until"
(
  "microevent_id" INT4 not null, 
  "storetime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_storetime_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_storetime_until" is '  RELPART microbiologyevents_storetime_untilVxe
    {microevent_id@N INT4, storetime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_itemid_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_until"
(
  "microevent_id" INT4 not null, 
  "test_itemid" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_test_itemid_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_itemid_until" is '  RELPART microbiologyevents_test_itemid_untilVxe
    {microevent_id@N INT4, test_itemid@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_test_name_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_until"
(
  "microevent_id" INT4 not null, 
  "test_name" VARCHAR(100), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_test_name_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_test_name_until" is '  RELPART microbiologyevents_test_name_untilVxe
    {microevent_id@N INT4, test_name@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_org_itemid_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_until"
(
  "microevent_id" INT4 not null, 
  "org_itemid" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_org_itemid_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_itemid_until" is '  RELPART microbiologyevents_org_itemid_untilVxe
    {microevent_id@N INT4, org_itemid@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_org_name_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_until"
(
  "microevent_id" INT4 not null, 
  "org_name" VARCHAR(100), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_org_name_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_org_name_until" is '  RELPART microbiologyevents_org_name_untilVxe
    {microevent_id@N INT4, org_name@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_isolate_num_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_until"
(
  "microevent_id" INT4 not null, 
  "isolate_num" INT2, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_isolate_num_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_isolate_num_until" is '  RELPART microbiologyevents_isolate_num_untilVxe
    {microevent_id@N INT4, isolate_num@N INT2, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_quantity_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_until"
(
  "microevent_id" INT4 not null, 
  "quantity" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_quantity_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_quantity_until" is '  RELPART microbiologyevents_quantity_untilVxe
    {microevent_id@N INT4, quantity@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_ab_itemid_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_until"
(
  "microevent_id" INT4 not null, 
  "ab_itemid" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_ab_itemid_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_itemid_until" is '  RELPART microbiologyevents_ab_itemid_untilVxe
    {microevent_id@N INT4, ab_itemid@N INT4, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_ab_name_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_until"
(
  "microevent_id" INT4 not null, 
  "ab_name" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_ab_name_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_ab_name_until" is '  RELPART microbiologyevents_ab_name_untilVxe
    {microevent_id@N INT4, ab_name@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_text_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_until"
(
  "microevent_id" INT4 not null, 
  "dilution_text" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_dilution_text_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_text_until" is '  RELPART microbiologyevents_dilution_text_untilVxe
    {microevent_id@N INT4, dilution_text@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_comparison_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_until"
(
  "microevent_id" INT4 not null, 
  "dilution_comparison" VARCHAR(20), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_dilution_comparison_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_comparison_until" is '  RELPART microbiologyevents_dilution_comparison_untilVxe
    {microevent_id@N INT4, dilution_comparison@N VARCHAR(20), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_dilution_value_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_until"
(
  "microevent_id" INT4 not null, 
  "dilution_value" FLOAT8, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_dilution_value_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_dilution_value_until" is '  RELPART microbiologyevents_dilution_value_untilVxe
    {microevent_id@N INT4, dilution_value@N FLOAT8, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_interpretation_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_until"
(
  "microevent_id" INT4 not null, 
  "interpretation" VARCHAR(5), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_interpretation_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_interpretation_until" is '  RELPART microbiologyevents_interpretation_untilVxe
    {microevent_id@N INT4, interpretation@N VARCHAR(5), untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table microbiologyevents_comments_until
create table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_until"
(
  "microevent_id" INT4 not null, 
  "comments" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint microbiologyevents_comments_until_cc00 primary key ("microevent_id"));

comment on table "mimiciv_hosp@V@UHF"."microbiologyevents_comments_until" is '  RELPART microbiologyevents_comments_untilVxe
    {microevent_id@N INT4, comments@N TEXT, untilVxe VXE_POINT}
   KEY {microevent_id} 
';

-- Table pharmacy_since
create table "mimiciv_hosp@V@UHF"."pharmacy_since"
(
  "pharmacy_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_since" is '  RELPART pharmacy_sinceVbx
    {pharmacy_id@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_subject_id_since
create table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_since"
(
  "pharmacy_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_subject_id_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_since" is '  RELPART pharmacy_subject_id_sinceVbx
    {pharmacy_id@N INT4, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_hadm_id_since
create table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_since"
(
  "pharmacy_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_hadm_id_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_since" is '  RELPART pharmacy_hadm_id_sinceVbx
    {pharmacy_id@N INT4, hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_poe_id_since
create table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_since"
(
  "pharmacy_id" INT4 not null, 
  "poe_id" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_poe_id_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_since" is '  RELPART pharmacy_poe_id_sinceVbx
    {pharmacy_id@N INT4, poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_starttime_since
create table "mimiciv_hosp@V@UHF"."pharmacy_starttime_since"
(
  "pharmacy_id" INT4 not null, 
  "starttime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_starttime_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_starttime_since" is '  RELPART pharmacy_starttime_sinceVbx
    {pharmacy_id@N INT4, starttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_stoptime_since
create table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_since"
(
  "pharmacy_id" INT4 not null, 
  "stoptime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_stoptime_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_since" is '  RELPART pharmacy_stoptime_sinceVbx
    {pharmacy_id@N INT4, stoptime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_medication_since
create table "mimiciv_hosp@V@UHF"."pharmacy_medication_since"
(
  "pharmacy_id" INT4 not null, 
  "medication" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_medication_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_medication_since" is '  RELPART pharmacy_medication_sinceVbx
    {pharmacy_id@N INT4, medication@N TEXT, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_proc_type_since
create table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_since"
(
  "pharmacy_id" INT4 not null, 
  "proc_type" VARCHAR(50) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_proc_type_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_since" is '  RELPART pharmacy_proc_type_sinceVbx
    {pharmacy_id@N INT4, proc_type@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_status_since
create table "mimiciv_hosp@V@UHF"."pharmacy_status_since"
(
  "pharmacy_id" INT4 not null, 
  "status" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_status_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_status_since" is '  RELPART pharmacy_status_sinceVbx
    {pharmacy_id@N INT4, status@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_entertime_since
create table "mimiciv_hosp@V@UHF"."pharmacy_entertime_since"
(
  "pharmacy_id" INT4 not null, 
  "entertime" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_entertime_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_entertime_since" is '  RELPART pharmacy_entertime_sinceVbx
    {pharmacy_id@N INT4, entertime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_verifiedtime_since
create table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_since"
(
  "pharmacy_id" INT4 not null, 
  "verifiedtime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_verifiedtime_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_since" is '  RELPART pharmacy_verifiedtime_sinceVbx
    {pharmacy_id@N INT4, verifiedtime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_route_since
create table "mimiciv_hosp@V@UHF"."pharmacy_route_since"
(
  "pharmacy_id" INT4 not null, 
  "route" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_route_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_route_since" is '  RELPART pharmacy_route_sinceVbx
    {pharmacy_id@N INT4, route@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_frequency_since
create table "mimiciv_hosp@V@UHF"."pharmacy_frequency_since"
(
  "pharmacy_id" INT4 not null, 
  "frequency" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_frequency_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_frequency_since" is '  RELPART pharmacy_frequency_sinceVbx
    {pharmacy_id@N INT4, frequency@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_disp_sched_since
create table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_since"
(
  "pharmacy_id" INT4 not null, 
  "disp_sched" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_disp_sched_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_since" is '  RELPART pharmacy_disp_sched_sinceVbx
    {pharmacy_id@N INT4, disp_sched@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_infusion_type_since
create table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_since"
(
  "pharmacy_id" INT4 not null, 
  "infusion_type" VARCHAR(15), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_infusion_type_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_since" is '  RELPART pharmacy_infusion_type_sinceVbx
    {pharmacy_id@N INT4, infusion_type@N VARCHAR(15), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_sliding_scale_since
create table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_since"
(
  "pharmacy_id" INT4 not null, 
  "sliding_scale" VARCHAR(1), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_sliding_scale_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_since" is '  RELPART pharmacy_sliding_scale_sinceVbx
    {pharmacy_id@N INT4, sliding_scale@N VARCHAR(1), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_lockout_interval_since
create table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_since"
(
  "pharmacy_id" INT4 not null, 
  "lockout_interval" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_lockout_interval_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_since" is '  RELPART pharmacy_lockout_interval_sinceVbx
    {pharmacy_id@N INT4, lockout_interval@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_basal_rate_since
create table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_since"
(
  "pharmacy_id" INT4 not null, 
  "basal_rate" FLOAT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_basal_rate_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_since" is '  RELPART pharmacy_basal_rate_sinceVbx
    {pharmacy_id@N INT4, basal_rate@N FLOAT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_one_hr_max_since
create table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_since"
(
  "pharmacy_id" INT4 not null, 
  "one_hr_max" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_one_hr_max_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_since" is '  RELPART pharmacy_one_hr_max_sinceVbx
    {pharmacy_id@N INT4, one_hr_max@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_doses_per_24_hrs_since
create table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_since"
(
  "pharmacy_id" INT4 not null, 
  "doses_per_24_hrs" FLOAT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_doses_per_24_hrs_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_since" is '  RELPART pharmacy_doses_per_24_hrs_sinceVbx
    {pharmacy_id@N INT4, doses_per_24_hrs@N FLOAT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_duration_since
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_since"
(
  "pharmacy_id" INT4 not null, 
  "duration" FLOAT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_duration_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_since" is '  RELPART pharmacy_duration_sinceVbx
    {pharmacy_id@N INT4, duration@N FLOAT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_duration_interval_since
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_since"
(
  "pharmacy_id" INT4 not null, 
  "duration_interval" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_duration_interval_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_since" is '  RELPART pharmacy_duration_interval_sinceVbx
    {pharmacy_id@N INT4, duration_interval@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expiration_value_since
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_since"
(
  "pharmacy_id" INT4 not null, 
  "expiration_value" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_expiration_value_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_since" is '  RELPART pharmacy_expiration_value_sinceVbx
    {pharmacy_id@N INT4, expiration_value@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expiration_unit_since
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_since"
(
  "pharmacy_id" INT4 not null, 
  "expiration_unit" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_expiration_unit_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_since" is '  RELPART pharmacy_expiration_unit_sinceVbx
    {pharmacy_id@N INT4, expiration_unit@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expirationdate_since
create table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_since"
(
  "pharmacy_id" INT4 not null, 
  "expirationdate" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_expirationdate_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_since" is '  RELPART pharmacy_expirationdate_sinceVbx
    {pharmacy_id@N INT4, expirationdate@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_dispensation_since
create table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_since"
(
  "pharmacy_id" INT4 not null, 
  "dispensation" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_dispensation_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_since" is '  RELPART pharmacy_dispensation_sinceVbx
    {pharmacy_id@N INT4, dispensation@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_fill_quantity_since
create table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_since"
(
  "pharmacy_id" INT4 not null, 
  "fill_quantity" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint pharmacy_fill_quantity_since_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_since" is '  RELPART pharmacy_fill_quantity_sinceVbx
    {pharmacy_id@N INT4, fill_quantity@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_during
create table "mimiciv_hosp@V@UHF"."pharmacy_during"
(
  "pharmacy_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_during" is '  RELPART pharmacy_duringVbe
    {pharmacy_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_subject_id_during
create table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during"
(
  "pharmacy_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_subject_id_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_during" is '  RELPART pharmacy_subject_id_duringVbe
    {pharmacy_id@N INT4, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_hadm_id_during
create table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during"
(
  "pharmacy_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_hadm_id_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_during" is '  RELPART pharmacy_hadm_id_duringVbe
    {pharmacy_id@N INT4, hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_poe_id_during
create table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during"
(
  "pharmacy_id" INT4 not null, 
  "poe_id" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_poe_id_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_during" is '  RELPART pharmacy_poe_id_duringVbe
    {pharmacy_id@N INT4, poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_starttime_during
create table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during"
(
  "pharmacy_id" INT4 not null, 
  "starttime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_starttime_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_starttime_during" is '  RELPART pharmacy_starttime_duringVbe
    {pharmacy_id@N INT4, starttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_stoptime_during
create table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during"
(
  "pharmacy_id" INT4 not null, 
  "stoptime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_stoptime_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_during" is '  RELPART pharmacy_stoptime_duringVbe
    {pharmacy_id@N INT4, stoptime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_medication_during
create table "mimiciv_hosp@V@UHF"."pharmacy_medication_during"
(
  "pharmacy_id" INT4 not null, 
  "medication" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_medication_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_medication_during" is '  RELPART pharmacy_medication_duringVbe
    {pharmacy_id@N INT4, medication@N TEXT, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_proc_type_during
create table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during"
(
  "pharmacy_id" INT4 not null, 
  "proc_type" VARCHAR(50) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_proc_type_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_during" is '  RELPART pharmacy_proc_type_duringVbe
    {pharmacy_id@N INT4, proc_type@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_status_during
create table "mimiciv_hosp@V@UHF"."pharmacy_status_during"
(
  "pharmacy_id" INT4 not null, 
  "status" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_status_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_status_during" is '  RELPART pharmacy_status_duringVbe
    {pharmacy_id@N INT4, status@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_entertime_during
create table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during"
(
  "pharmacy_id" INT4 not null, 
  "entertime" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_entertime_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_entertime_during" is '  RELPART pharmacy_entertime_duringVbe
    {pharmacy_id@N INT4, entertime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_verifiedtime_during
create table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during"
(
  "pharmacy_id" INT4 not null, 
  "verifiedtime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_verifiedtime_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_during" is '  RELPART pharmacy_verifiedtime_duringVbe
    {pharmacy_id@N INT4, verifiedtime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_route_during
create table "mimiciv_hosp@V@UHF"."pharmacy_route_during"
(
  "pharmacy_id" INT4 not null, 
  "route" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_route_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_route_during" is '  RELPART pharmacy_route_duringVbe
    {pharmacy_id@N INT4, route@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_frequency_during
create table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during"
(
  "pharmacy_id" INT4 not null, 
  "frequency" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_frequency_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_frequency_during" is '  RELPART pharmacy_frequency_duringVbe
    {pharmacy_id@N INT4, frequency@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_disp_sched_during
create table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during"
(
  "pharmacy_id" INT4 not null, 
  "disp_sched" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_disp_sched_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_during" is '  RELPART pharmacy_disp_sched_duringVbe
    {pharmacy_id@N INT4, disp_sched@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_infusion_type_during
create table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during"
(
  "pharmacy_id" INT4 not null, 
  "infusion_type" VARCHAR(15), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_infusion_type_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_during" is '  RELPART pharmacy_infusion_type_duringVbe
    {pharmacy_id@N INT4, infusion_type@N VARCHAR(15), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_sliding_scale_during
create table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during"
(
  "pharmacy_id" INT4 not null, 
  "sliding_scale" VARCHAR(1), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_sliding_scale_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_during" is '  RELPART pharmacy_sliding_scale_duringVbe
    {pharmacy_id@N INT4, sliding_scale@N VARCHAR(1), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_lockout_interval_during
create table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during"
(
  "pharmacy_id" INT4 not null, 
  "lockout_interval" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_lockout_interval_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_during" is '  RELPART pharmacy_lockout_interval_duringVbe
    {pharmacy_id@N INT4, lockout_interval@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_basal_rate_during
create table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during"
(
  "pharmacy_id" INT4 not null, 
  "basal_rate" FLOAT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_basal_rate_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_during" is '  RELPART pharmacy_basal_rate_duringVbe
    {pharmacy_id@N INT4, basal_rate@N FLOAT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_one_hr_max_during
create table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during"
(
  "pharmacy_id" INT4 not null, 
  "one_hr_max" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_one_hr_max_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_during" is '  RELPART pharmacy_one_hr_max_duringVbe
    {pharmacy_id@N INT4, one_hr_max@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_doses_per_24_hrs_during
create table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during"
(
  "pharmacy_id" INT4 not null, 
  "doses_per_24_hrs" FLOAT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_doses_per_24_hrs_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_during" is '  RELPART pharmacy_doses_per_24_hrs_duringVbe
    {pharmacy_id@N INT4, doses_per_24_hrs@N FLOAT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_duration_during
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_during"
(
  "pharmacy_id" INT4 not null, 
  "duration" FLOAT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_duration_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_during" is '  RELPART pharmacy_duration_duringVbe
    {pharmacy_id@N INT4, duration@N FLOAT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_duration_interval_during
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during"
(
  "pharmacy_id" INT4 not null, 
  "duration_interval" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_duration_interval_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_during" is '  RELPART pharmacy_duration_interval_duringVbe
    {pharmacy_id@N INT4, duration_interval@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_expiration_value_during
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during"
(
  "pharmacy_id" INT4 not null, 
  "expiration_value" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_expiration_value_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_during" is '  RELPART pharmacy_expiration_value_duringVbe
    {pharmacy_id@N INT4, expiration_value@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_expiration_unit_during
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during"
(
  "pharmacy_id" INT4 not null, 
  "expiration_unit" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_expiration_unit_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_during" is '  RELPART pharmacy_expiration_unit_duringVbe
    {pharmacy_id@N INT4, expiration_unit@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_expirationdate_during
create table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during"
(
  "pharmacy_id" INT4 not null, 
  "expirationdate" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_expirationdate_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_during" is '  RELPART pharmacy_expirationdate_duringVbe
    {pharmacy_id@N INT4, expirationdate@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_dispensation_during
create table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during"
(
  "pharmacy_id" INT4 not null, 
  "dispensation" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_dispensation_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_during" is '  RELPART pharmacy_dispensation_duringVbe
    {pharmacy_id@N INT4, dispensation@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_fill_quantity_during
create table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during"
(
  "pharmacy_id" INT4 not null, 
  "fill_quantity" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint pharmacy_fill_quantity_during_cc00 primary key ("pharmacy_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_during" is '  RELPART pharmacy_fill_quantity_duringVbe
    {pharmacy_id@N INT4, fill_quantity@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, during} 
';

-- Table pharmacy_until
create table "mimiciv_hosp@V@UHF"."pharmacy_until"
(
  "pharmacy_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_until" is '  RELPART pharmacy_untilVxe
    {pharmacy_id@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_subject_id_until
create table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_until"
(
  "pharmacy_id" INT4 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_subject_id_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_subject_id_until" is '  RELPART pharmacy_subject_id_untilVxe
    {pharmacy_id@N INT4, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_hadm_id_until
create table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_until"
(
  "pharmacy_id" INT4 not null, 
  "hadm_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_hadm_id_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_hadm_id_until" is '  RELPART pharmacy_hadm_id_untilVxe
    {pharmacy_id@N INT4, hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_poe_id_until
create table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_until"
(
  "pharmacy_id" INT4 not null, 
  "poe_id" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_poe_id_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_poe_id_until" is '  RELPART pharmacy_poe_id_untilVxe
    {pharmacy_id@N INT4, poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_starttime_until
create table "mimiciv_hosp@V@UHF"."pharmacy_starttime_until"
(
  "pharmacy_id" INT4 not null, 
  "starttime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_starttime_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_starttime_until" is '  RELPART pharmacy_starttime_untilVxe
    {pharmacy_id@N INT4, starttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_stoptime_until
create table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_until"
(
  "pharmacy_id" INT4 not null, 
  "stoptime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_stoptime_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_stoptime_until" is '  RELPART pharmacy_stoptime_untilVxe
    {pharmacy_id@N INT4, stoptime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_medication_until
create table "mimiciv_hosp@V@UHF"."pharmacy_medication_until"
(
  "pharmacy_id" INT4 not null, 
  "medication" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_medication_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_medication_until" is '  RELPART pharmacy_medication_untilVxe
    {pharmacy_id@N INT4, medication@N TEXT, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_proc_type_until
create table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_until"
(
  "pharmacy_id" INT4 not null, 
  "proc_type" VARCHAR(50) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_proc_type_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_proc_type_until" is '  RELPART pharmacy_proc_type_untilVxe
    {pharmacy_id@N INT4, proc_type@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_status_until
create table "mimiciv_hosp@V@UHF"."pharmacy_status_until"
(
  "pharmacy_id" INT4 not null, 
  "status" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_status_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_status_until" is '  RELPART pharmacy_status_untilVxe
    {pharmacy_id@N INT4, status@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_entertime_until
create table "mimiciv_hosp@V@UHF"."pharmacy_entertime_until"
(
  "pharmacy_id" INT4 not null, 
  "entertime" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_entertime_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_entertime_until" is '  RELPART pharmacy_entertime_untilVxe
    {pharmacy_id@N INT4, entertime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_verifiedtime_until
create table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_until"
(
  "pharmacy_id" INT4 not null, 
  "verifiedtime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_verifiedtime_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_verifiedtime_until" is '  RELPART pharmacy_verifiedtime_untilVxe
    {pharmacy_id@N INT4, verifiedtime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_route_until
create table "mimiciv_hosp@V@UHF"."pharmacy_route_until"
(
  "pharmacy_id" INT4 not null, 
  "route" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_route_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_route_until" is '  RELPART pharmacy_route_untilVxe
    {pharmacy_id@N INT4, route@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_frequency_until
create table "mimiciv_hosp@V@UHF"."pharmacy_frequency_until"
(
  "pharmacy_id" INT4 not null, 
  "frequency" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_frequency_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_frequency_until" is '  RELPART pharmacy_frequency_untilVxe
    {pharmacy_id@N INT4, frequency@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_disp_sched_until
create table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_until"
(
  "pharmacy_id" INT4 not null, 
  "disp_sched" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_disp_sched_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_disp_sched_until" is '  RELPART pharmacy_disp_sched_untilVxe
    {pharmacy_id@N INT4, disp_sched@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_infusion_type_until
create table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_until"
(
  "pharmacy_id" INT4 not null, 
  "infusion_type" VARCHAR(15), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_infusion_type_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_infusion_type_until" is '  RELPART pharmacy_infusion_type_untilVxe
    {pharmacy_id@N INT4, infusion_type@N VARCHAR(15), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_sliding_scale_until
create table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_until"
(
  "pharmacy_id" INT4 not null, 
  "sliding_scale" VARCHAR(1), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_sliding_scale_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_sliding_scale_until" is '  RELPART pharmacy_sliding_scale_untilVxe
    {pharmacy_id@N INT4, sliding_scale@N VARCHAR(1), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_lockout_interval_until
create table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_until"
(
  "pharmacy_id" INT4 not null, 
  "lockout_interval" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_lockout_interval_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_lockout_interval_until" is '  RELPART pharmacy_lockout_interval_untilVxe
    {pharmacy_id@N INT4, lockout_interval@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_basal_rate_until
create table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_until"
(
  "pharmacy_id" INT4 not null, 
  "basal_rate" FLOAT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_basal_rate_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_basal_rate_until" is '  RELPART pharmacy_basal_rate_untilVxe
    {pharmacy_id@N INT4, basal_rate@N FLOAT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_one_hr_max_until
create table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_until"
(
  "pharmacy_id" INT4 not null, 
  "one_hr_max" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_one_hr_max_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_one_hr_max_until" is '  RELPART pharmacy_one_hr_max_untilVxe
    {pharmacy_id@N INT4, one_hr_max@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_doses_per_24_hrs_until
create table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_until"
(
  "pharmacy_id" INT4 not null, 
  "doses_per_24_hrs" FLOAT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_doses_per_24_hrs_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_doses_per_24_hrs_until" is '  RELPART pharmacy_doses_per_24_hrs_untilVxe
    {pharmacy_id@N INT4, doses_per_24_hrs@N FLOAT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_duration_until
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_until"
(
  "pharmacy_id" INT4 not null, 
  "duration" FLOAT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_duration_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_until" is '  RELPART pharmacy_duration_untilVxe
    {pharmacy_id@N INT4, duration@N FLOAT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_duration_interval_until
create table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_until"
(
  "pharmacy_id" INT4 not null, 
  "duration_interval" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_duration_interval_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_duration_interval_until" is '  RELPART pharmacy_duration_interval_untilVxe
    {pharmacy_id@N INT4, duration_interval@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expiration_value_until
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_until"
(
  "pharmacy_id" INT4 not null, 
  "expiration_value" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_expiration_value_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_value_until" is '  RELPART pharmacy_expiration_value_untilVxe
    {pharmacy_id@N INT4, expiration_value@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expiration_unit_until
create table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_until"
(
  "pharmacy_id" INT4 not null, 
  "expiration_unit" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_expiration_unit_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expiration_unit_until" is '  RELPART pharmacy_expiration_unit_untilVxe
    {pharmacy_id@N INT4, expiration_unit@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_expirationdate_until
create table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_until"
(
  "pharmacy_id" INT4 not null, 
  "expirationdate" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_expirationdate_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_expirationdate_until" is '  RELPART pharmacy_expirationdate_untilVxe
    {pharmacy_id@N INT4, expirationdate@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_dispensation_until
create table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_until"
(
  "pharmacy_id" INT4 not null, 
  "dispensation" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_dispensation_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_dispensation_until" is '  RELPART pharmacy_dispensation_untilVxe
    {pharmacy_id@N INT4, dispensation@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table pharmacy_fill_quantity_until
create table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_until"
(
  "pharmacy_id" INT4 not null, 
  "fill_quantity" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint pharmacy_fill_quantity_until_cc00 primary key ("pharmacy_id"));

comment on table "mimiciv_hosp@V@UHF"."pharmacy_fill_quantity_until" is '  RELPART pharmacy_fill_quantity_untilVxe
    {pharmacy_id@N INT4, fill_quantity@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id} 
';

-- Table poe_since
create table "mimiciv_hosp@V@UHF"."poe_since"
(
  "poe_id" VARCHAR(25) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_since" is '  RELPART poe_sinceVbx
    {poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_poe_seq_since
create table "mimiciv_hosp@V@UHF"."poe_poe_seq_since"
(
  "poe_id" VARCHAR(25) not null, 
  "poe_seq" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_poe_seq_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_poe_seq_since" is '  RELPART poe_poe_seq_sinceVbx
    {poe_id@N VARCHAR(25), poe_seq@N INT4, sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_subject_id_since
create table "mimiciv_hosp@V@UHF"."poe_subject_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_subject_id_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_subject_id_since" is '  RELPART poe_subject_id_sinceVbx
    {poe_id@N VARCHAR(25), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_hadm_id_since
create table "mimiciv_hosp@V@UHF"."poe_hadm_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_hadm_id_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_hadm_id_since" is '  RELPART poe_hadm_id_sinceVbx
    {poe_id@N VARCHAR(25), hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_ordertime_since
create table "mimiciv_hosp@V@UHF"."poe_ordertime_since"
(
  "poe_id" VARCHAR(25) not null, 
  "ordertime" TIMESTAMP not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_ordertime_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_ordertime_since" is '  RELPART poe_ordertime_sinceVbx
    {poe_id@N VARCHAR(25), ordertime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_order_type_since
create table "mimiciv_hosp@V@UHF"."poe_order_type_since"
(
  "poe_id" VARCHAR(25) not null, 
  "order_type" VARCHAR(25) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_order_type_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_type_since" is '  RELPART poe_order_type_sinceVbx
    {poe_id@N VARCHAR(25), order_type@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_order_subtype_since
create table "mimiciv_hosp@V@UHF"."poe_order_subtype_since"
(
  "poe_id" VARCHAR(25) not null, 
  "order_subtype" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_order_subtype_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_subtype_since" is '  RELPART poe_order_subtype_sinceVbx
    {poe_id@N VARCHAR(25), order_subtype@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_transaction_type_since
create table "mimiciv_hosp@V@UHF"."poe_transaction_type_since"
(
  "poe_id" VARCHAR(25) not null, 
  "transaction_type" VARCHAR(15), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_transaction_type_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_transaction_type_since" is '  RELPART poe_transaction_type_sinceVbx
    {poe_id@N VARCHAR(25), transaction_type@N VARCHAR(15), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_discontinue_of_poe_id_since
create table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinue_of_poe_id" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_discontinue_of_poe_id_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_since" is '  RELPART poe_discontinue_of_poe_id_sinceVbx
    {poe_id@N VARCHAR(25), discontinue_of_poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_discontinued_by_poe_id_since
create table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinued_by_poe_id" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_discontinued_by_poe_id_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_since" is '  RELPART poe_discontinued_by_poe_id_sinceVbx
    {poe_id@N VARCHAR(25), discontinued_by_poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_order_provider_id_since
create table "mimiciv_hosp@V@UHF"."poe_order_provider_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "order_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_order_provider_id_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_provider_id_since" is '  RELPART poe_order_provider_id_sinceVbx
    {poe_id@N VARCHAR(25), order_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_order_status_since
create table "mimiciv_hosp@V@UHF"."poe_order_status_since"
(
  "poe_id" VARCHAR(25) not null, 
  "order_status" VARCHAR(15), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_order_status_since_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_status_since" is '  RELPART poe_order_status_sinceVbx
    {poe_id@N VARCHAR(25), order_status@N VARCHAR(15), sinceVbx VBX_POINT}
   KEY {poe_id} 
';

-- Table poe_during
create table "mimiciv_hosp@V@UHF"."poe_during"
(
  "poe_id" VARCHAR(25) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_during" is '  RELPART poe_duringVbe
    {poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_poe_seq_during
create table "mimiciv_hosp@V@UHF"."poe_poe_seq_during"
(
  "poe_id" VARCHAR(25) not null, 
  "poe_seq" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_poe_seq_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_poe_seq_during" is '  RELPART poe_poe_seq_duringVbe
    {poe_id@N VARCHAR(25), poe_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_subject_id_during
create table "mimiciv_hosp@V@UHF"."poe_subject_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_subject_id_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_subject_id_during" is '  RELPART poe_subject_id_duringVbe
    {poe_id@N VARCHAR(25), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_hadm_id_during
create table "mimiciv_hosp@V@UHF"."poe_hadm_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_hadm_id_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_hadm_id_during" is '  RELPART poe_hadm_id_duringVbe
    {poe_id@N VARCHAR(25), hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_ordertime_during
create table "mimiciv_hosp@V@UHF"."poe_ordertime_during"
(
  "poe_id" VARCHAR(25) not null, 
  "ordertime" TIMESTAMP not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_ordertime_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_ordertime_during" is '  RELPART poe_ordertime_duringVbe
    {poe_id@N VARCHAR(25), ordertime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_order_type_during
create table "mimiciv_hosp@V@UHF"."poe_order_type_during"
(
  "poe_id" VARCHAR(25) not null, 
  "order_type" VARCHAR(25) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_order_type_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_type_during" is '  RELPART poe_order_type_duringVbe
    {poe_id@N VARCHAR(25), order_type@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_order_subtype_during
create table "mimiciv_hosp@V@UHF"."poe_order_subtype_during"
(
  "poe_id" VARCHAR(25) not null, 
  "order_subtype" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_order_subtype_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_subtype_during" is '  RELPART poe_order_subtype_duringVbe
    {poe_id@N VARCHAR(25), order_subtype@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_transaction_type_during
create table "mimiciv_hosp@V@UHF"."poe_transaction_type_during"
(
  "poe_id" VARCHAR(25) not null, 
  "transaction_type" VARCHAR(15), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_transaction_type_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_transaction_type_during" is '  RELPART poe_transaction_type_duringVbe
    {poe_id@N VARCHAR(25), transaction_type@N VARCHAR(15), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_discontinue_of_poe_id_during
create table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinue_of_poe_id" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_discontinue_of_poe_id_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_during" is '  RELPART poe_discontinue_of_poe_id_duringVbe
    {poe_id@N VARCHAR(25), discontinue_of_poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_discontinued_by_poe_id_during
create table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinued_by_poe_id" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_discontinued_by_poe_id_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_during" is '  RELPART poe_discontinued_by_poe_id_duringVbe
    {poe_id@N VARCHAR(25), discontinued_by_poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_order_provider_id_during
create table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "order_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_order_provider_id_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_provider_id_during" is '  RELPART poe_order_provider_id_duringVbe
    {poe_id@N VARCHAR(25), order_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_order_status_during
create table "mimiciv_hosp@V@UHF"."poe_order_status_during"
(
  "poe_id" VARCHAR(25) not null, 
  "order_status" VARCHAR(15), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_order_status_during_cc00 primary key ("poe_id", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_status_during" is '  RELPART poe_order_status_duringVbe
    {poe_id@N VARCHAR(25), order_status@N VARCHAR(15), duringVbe VBE_INTERVAL}
   KEY {poe_id, during} 
';

-- Table poe_until
create table "mimiciv_hosp@V@UHF"."poe_until"
(
  "poe_id" VARCHAR(25) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_until" is '  RELPART poe_untilVxe
    {poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_poe_seq_until
create table "mimiciv_hosp@V@UHF"."poe_poe_seq_until"
(
  "poe_id" VARCHAR(25) not null, 
  "poe_seq" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_poe_seq_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_poe_seq_until" is '  RELPART poe_poe_seq_untilVxe
    {poe_id@N VARCHAR(25), poe_seq@N INT4, untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_subject_id_until
create table "mimiciv_hosp@V@UHF"."poe_subject_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_subject_id_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_subject_id_until" is '  RELPART poe_subject_id_untilVxe
    {poe_id@N VARCHAR(25), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_hadm_id_until
create table "mimiciv_hosp@V@UHF"."poe_hadm_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "hadm_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_hadm_id_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_hadm_id_until" is '  RELPART poe_hadm_id_untilVxe
    {poe_id@N VARCHAR(25), hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_ordertime_until
create table "mimiciv_hosp@V@UHF"."poe_ordertime_until"
(
  "poe_id" VARCHAR(25) not null, 
  "ordertime" TIMESTAMP not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_ordertime_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_ordertime_until" is '  RELPART poe_ordertime_untilVxe
    {poe_id@N VARCHAR(25), ordertime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_order_type_until
create table "mimiciv_hosp@V@UHF"."poe_order_type_until"
(
  "poe_id" VARCHAR(25) not null, 
  "order_type" VARCHAR(25) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_order_type_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_type_until" is '  RELPART poe_order_type_untilVxe
    {poe_id@N VARCHAR(25), order_type@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_order_subtype_until
create table "mimiciv_hosp@V@UHF"."poe_order_subtype_until"
(
  "poe_id" VARCHAR(25) not null, 
  "order_subtype" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_order_subtype_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_subtype_until" is '  RELPART poe_order_subtype_untilVxe
    {poe_id@N VARCHAR(25), order_subtype@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_transaction_type_until
create table "mimiciv_hosp@V@UHF"."poe_transaction_type_until"
(
  "poe_id" VARCHAR(25) not null, 
  "transaction_type" VARCHAR(15), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_transaction_type_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_transaction_type_until" is '  RELPART poe_transaction_type_untilVxe
    {poe_id@N VARCHAR(25), transaction_type@N VARCHAR(15), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_discontinue_of_poe_id_until
create table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinue_of_poe_id" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_discontinue_of_poe_id_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinue_of_poe_id_until" is '  RELPART poe_discontinue_of_poe_id_untilVxe
    {poe_id@N VARCHAR(25), discontinue_of_poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_discontinued_by_poe_id_until
create table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "discontinued_by_poe_id" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_discontinued_by_poe_id_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_discontinued_by_poe_id_until" is '  RELPART poe_discontinued_by_poe_id_untilVxe
    {poe_id@N VARCHAR(25), discontinued_by_poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_order_provider_id_until
create table "mimiciv_hosp@V@UHF"."poe_order_provider_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "order_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_order_provider_id_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_provider_id_until" is '  RELPART poe_order_provider_id_untilVxe
    {poe_id@N VARCHAR(25), order_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table poe_order_status_until
create table "mimiciv_hosp@V@UHF"."poe_order_status_until"
(
  "poe_id" VARCHAR(25) not null, 
  "order_status" VARCHAR(15), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_order_status_until_cc00 primary key ("poe_id"));

comment on table "mimiciv_hosp@V@UHF"."poe_order_status_until" is '  RELPART poe_order_status_untilVxe
    {poe_id@N VARCHAR(25), order_status@N VARCHAR(15), untilVxe VXE_POINT}
   KEY {poe_id} 
';

-- Table prescriptions_since
create table "mimiciv_hosp@V@UHF"."prescriptions_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_since" is '  RELPART prescriptions_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_subject_id_since
create table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_subject_id_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_since" is '  RELPART prescriptions_subject_id_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_hadm_id_since
create table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "hadm_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_hadm_id_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_since" is '  RELPART prescriptions_hadm_id_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), hadm_id@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_poe_id_since
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_id" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_poe_id_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_since" is '  RELPART prescriptions_poe_id_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_id@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_poe_seq_since
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_seq" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_poe_seq_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_since" is '  RELPART prescriptions_poe_seq_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_seq@N INT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_order_provider_id_since
create table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "order_provider_id" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_order_provider_id_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_since" is '  RELPART prescriptions_order_provider_id_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), order_provider_id@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_starttime_since
create table "mimiciv_hosp@V@UHF"."prescriptions_starttime_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "starttime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_starttime_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_starttime_since" is '  RELPART prescriptions_starttime_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), starttime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_stoptime_since
create table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "stoptime" TIMESTAMP, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_stoptime_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_since" is '  RELPART prescriptions_stoptime_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), stoptime@N TIMESTAMP, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_formulary_drug_cd_since
create table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "formulary_drug_cd" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_formulary_drug_cd_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_since" is '  RELPART prescriptions_formulary_drug_cd_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), formulary_drug_cd@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_gsn_since
create table "mimiciv_hosp@V@UHF"."prescriptions_gsn_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "gsn" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_gsn_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_gsn_since" is '  RELPART prescriptions_gsn_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), gsn@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_ndc_since
create table "mimiciv_hosp@V@UHF"."prescriptions_ndc_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "ndc" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_ndc_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_ndc_since" is '  RELPART prescriptions_ndc_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), ndc@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_prod_strength_since
create table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "prod_strength" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_prod_strength_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_since" is '  RELPART prescriptions_prod_strength_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), prod_strength@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_rx_since
create table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_rx" VARCHAR(25), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_form_rx_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_since" is '  RELPART prescriptions_form_rx_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_rx@N VARCHAR(25), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_dose_val_rx_since
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_val_rx" VARCHAR(100), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_dose_val_rx_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_since" is '  RELPART prescriptions_dose_val_rx_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_val_rx@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_dose_unit_rx_since
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_unit_rx" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_dose_unit_rx_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_since" is '  RELPART prescriptions_dose_unit_rx_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_unit_rx@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_val_disp_since
create table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_val_disp" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_form_val_disp_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_since" is '  RELPART prescriptions_form_val_disp_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_val_disp@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_unit_disp_since
create table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_unit_disp" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_form_unit_disp_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_since" is '  RELPART prescriptions_form_unit_disp_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_unit_disp@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_doses_per_24_hrs_since
create table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "doses_per_24_hrs" FLOAT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_doses_per_24_hrs_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_since" is '  RELPART prescriptions_doses_per_24_hrs_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), doses_per_24_hrs@N FLOAT4, sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_route_since
create table "mimiciv_hosp@V@UHF"."prescriptions_route_since"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "route" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint prescriptions_route_since_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_route_since" is '  RELPART prescriptions_route_sinceVbx
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), route@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_during
create table "mimiciv_hosp@V@UHF"."prescriptions_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_during" is '  RELPART prescriptions_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_subject_id_during
create table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_subject_id_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_during" is '  RELPART prescriptions_subject_id_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_hadm_id_during
create table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "hadm_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_hadm_id_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_during" is '  RELPART prescriptions_hadm_id_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), hadm_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_poe_id_during
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_id" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_poe_id_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_during" is '  RELPART prescriptions_poe_id_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_id@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_poe_seq_during
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_seq" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_poe_seq_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_during" is '  RELPART prescriptions_poe_seq_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_order_provider_id_during
create table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "order_provider_id" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_order_provider_id_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_during" is '  RELPART prescriptions_order_provider_id_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), order_provider_id@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_starttime_during
create table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "starttime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_starttime_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_starttime_during" is '  RELPART prescriptions_starttime_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), starttime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_stoptime_during
create table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "stoptime" TIMESTAMP, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_stoptime_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_during" is '  RELPART prescriptions_stoptime_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), stoptime@N TIMESTAMP, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_formulary_drug_cd_during
create table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "formulary_drug_cd" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_formulary_drug_cd_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_during" is '  RELPART prescriptions_formulary_drug_cd_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), formulary_drug_cd@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_gsn_during
create table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "gsn" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_gsn_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_gsn_during" is '  RELPART prescriptions_gsn_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), gsn@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_ndc_during
create table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "ndc" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_ndc_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_ndc_during" is '  RELPART prescriptions_ndc_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), ndc@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_prod_strength_during
create table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "prod_strength" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_prod_strength_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_during" is '  RELPART prescriptions_prod_strength_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), prod_strength@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_form_rx_during
create table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_rx" VARCHAR(25), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_form_rx_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_during" is '  RELPART prescriptions_form_rx_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_rx@N VARCHAR(25), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_dose_val_rx_during
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_val_rx" VARCHAR(100), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_dose_val_rx_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_during" is '  RELPART prescriptions_dose_val_rx_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_val_rx@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_dose_unit_rx_during
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_unit_rx" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_dose_unit_rx_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_during" is '  RELPART prescriptions_dose_unit_rx_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_unit_rx@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_form_val_disp_during
create table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_val_disp" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_form_val_disp_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_during" is '  RELPART prescriptions_form_val_disp_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_val_disp@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_form_unit_disp_during
create table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_unit_disp" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_form_unit_disp_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_during" is '  RELPART prescriptions_form_unit_disp_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_unit_disp@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_doses_per_24_hrs_during
create table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "doses_per_24_hrs" FLOAT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_doses_per_24_hrs_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_during" is '  RELPART prescriptions_doses_per_24_hrs_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), doses_per_24_hrs@N FLOAT4, duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_route_during
create table "mimiciv_hosp@V@UHF"."prescriptions_route_during"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "route" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint prescriptions_route_during_cc00 primary key ("pharmacy_id", "drug_type", "drug", "during"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_route_during" is '  RELPART prescriptions_route_duringVbe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), route@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {pharmacy_id, drug_type, drug, during} 
';

-- Table prescriptions_until
create table "mimiciv_hosp@V@UHF"."prescriptions_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_until" is '  RELPART prescriptions_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_subject_id_until
create table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_subject_id_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_subject_id_until" is '  RELPART prescriptions_subject_id_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_hadm_id_until
create table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "hadm_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_hadm_id_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_hadm_id_until" is '  RELPART prescriptions_hadm_id_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), hadm_id@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_poe_id_until
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_id" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_poe_id_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_id_until" is '  RELPART prescriptions_poe_id_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_id@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_poe_seq_until
create table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "poe_seq" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_poe_seq_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_poe_seq_until" is '  RELPART prescriptions_poe_seq_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), poe_seq@N INT4, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_order_provider_id_until
create table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "order_provider_id" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_order_provider_id_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_order_provider_id_until" is '  RELPART prescriptions_order_provider_id_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), order_provider_id@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_starttime_until
create table "mimiciv_hosp@V@UHF"."prescriptions_starttime_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "starttime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_starttime_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_starttime_until" is '  RELPART prescriptions_starttime_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), starttime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_stoptime_until
create table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "stoptime" TIMESTAMP, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_stoptime_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_stoptime_until" is '  RELPART prescriptions_stoptime_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), stoptime@N TIMESTAMP, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_formulary_drug_cd_until
create table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "formulary_drug_cd" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_formulary_drug_cd_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_formulary_drug_cd_until" is '  RELPART prescriptions_formulary_drug_cd_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), formulary_drug_cd@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_gsn_until
create table "mimiciv_hosp@V@UHF"."prescriptions_gsn_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "gsn" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_gsn_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_gsn_until" is '  RELPART prescriptions_gsn_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), gsn@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_ndc_until
create table "mimiciv_hosp@V@UHF"."prescriptions_ndc_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "ndc" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_ndc_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_ndc_until" is '  RELPART prescriptions_ndc_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), ndc@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_prod_strength_until
create table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "prod_strength" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_prod_strength_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_prod_strength_until" is '  RELPART prescriptions_prod_strength_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), prod_strength@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_rx_until
create table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_rx" VARCHAR(25), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_form_rx_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_rx_until" is '  RELPART prescriptions_form_rx_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_rx@N VARCHAR(25), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_dose_val_rx_until
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_val_rx" VARCHAR(100), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_dose_val_rx_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_val_rx_until" is '  RELPART prescriptions_dose_val_rx_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_val_rx@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_dose_unit_rx_until
create table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "dose_unit_rx" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_dose_unit_rx_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_dose_unit_rx_until" is '  RELPART prescriptions_dose_unit_rx_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), dose_unit_rx@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_val_disp_until
create table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_val_disp" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_form_val_disp_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_val_disp_until" is '  RELPART prescriptions_form_val_disp_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_val_disp@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_form_unit_disp_until
create table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "form_unit_disp" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_form_unit_disp_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_form_unit_disp_until" is '  RELPART prescriptions_form_unit_disp_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), form_unit_disp@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_doses_per_24_hrs_until
create table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "doses_per_24_hrs" FLOAT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_doses_per_24_hrs_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_doses_per_24_hrs_until" is '  RELPART prescriptions_doses_per_24_hrs_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), doses_per_24_hrs@N FLOAT4, untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table prescriptions_route_until
create table "mimiciv_hosp@V@UHF"."prescriptions_route_until"
(
  "pharmacy_id" INT4 not null, 
  "drug_type" VARCHAR(20) not null, 
  "drug" VARCHAR(255) not null, 
  "route" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint prescriptions_route_until_cc00 primary key ("pharmacy_id", "drug_type", "drug"));

comment on table "mimiciv_hosp@V@UHF"."prescriptions_route_until" is '  RELPART prescriptions_route_untilVxe
    {pharmacy_id@N INT4, drug_type@N VARCHAR(20), drug@N VARCHAR(255), route@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {pharmacy_id, drug_type, drug} 
';

-- Table procedures_icd_since
create table "mimiciv_hosp@V@UHF"."procedures_icd_since"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint procedures_icd_since_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_since" is '  RELPART procedures_icd_sinceVbx
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, sinceVbx VBX_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table procedures_icd_subject_id_since
create table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_since"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint procedures_icd_subject_id_since_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_since" is '  RELPART procedures_icd_subject_id_sinceVbx
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table procedures_icd_chartdate_since
create table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_since"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "chartdate" DATE not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint procedures_icd_chartdate_since_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_since" is '  RELPART procedures_icd_chartdate_sinceVbx
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, chartdate@N DATE, sinceVbx VBX_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table procedures_icd_during
create table "mimiciv_hosp@V@UHF"."procedures_icd_during"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint procedures_icd_during_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_during" is '  RELPART procedures_icd_duringVbe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, duringVbe VBE_INTERVAL}
   KEY {hadm_id, seq_num, icd_code, icd_version, during} 
';

-- Table procedures_icd_subject_id_during
create table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint procedures_icd_subject_id_during_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_during" is '  RELPART procedures_icd_subject_id_duringVbe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, seq_num, icd_code, icd_version, during} 
';

-- Table procedures_icd_chartdate_during
create table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "chartdate" DATE not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint procedures_icd_chartdate_during_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version", "during"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_during" is '  RELPART procedures_icd_chartdate_duringVbe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, chartdate@N DATE, duringVbe VBE_INTERVAL}
   KEY {hadm_id, seq_num, icd_code, icd_version, during} 
';

-- Table procedures_icd_until
create table "mimiciv_hosp@V@UHF"."procedures_icd_until"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint procedures_icd_until_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_until" is '  RELPART procedures_icd_untilVxe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, untilVxe VXE_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table procedures_icd_subject_id_until
create table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_until"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint procedures_icd_subject_id_until_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_subject_id_until" is '  RELPART procedures_icd_subject_id_untilVxe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, subject_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table procedures_icd_chartdate_until
create table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_until"
(
  "hadm_id" INT4 not null, 
  "seq_num" INT4 not null, 
  "icd_code" VARCHAR(7) not null, 
  "icd_version" INT2 not null, 
  "chartdate" DATE not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint procedures_icd_chartdate_until_cc00 primary key ("hadm_id", "seq_num", "icd_code", "icd_version"));

comment on table "mimiciv_hosp@V@UHF"."procedures_icd_chartdate_until" is '  RELPART procedures_icd_chartdate_untilVxe
    {hadm_id@N INT4, seq_num@N INT4, icd_code@N VARCHAR(7), icd_version@N INT2, chartdate@N DATE, untilVxe VXE_POINT}
   KEY {hadm_id, seq_num, icd_code, icd_version} 
';

-- Table services_since
create table "mimiciv_hosp@V@UHF"."services_since"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint services_since_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_since" is '  RELPART services_sinceVbx
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table services_subject_id_since
create table "mimiciv_hosp@V@UHF"."services_subject_id_since"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint services_subject_id_since_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_subject_id_since" is '  RELPART services_subject_id_sinceVbx
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table services_prev_service_since
create table "mimiciv_hosp@V@UHF"."services_prev_service_since"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "prev_service" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint services_prev_service_since_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_prev_service_since" is '  RELPART services_prev_service_sinceVbx
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), prev_service@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table services_during
create table "mimiciv_hosp@V@UHF"."services_during"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint services_during_cc00 primary key ("hadm_id", "transfertime", "curr_service", "during"));

comment on table "mimiciv_hosp@V@UHF"."services_during" is '  RELPART services_duringVbe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {hadm_id, transfertime, curr_service, during} 
';

-- Table services_subject_id_during
create table "mimiciv_hosp@V@UHF"."services_subject_id_during"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint services_subject_id_during_cc00 primary key ("hadm_id", "transfertime", "curr_service", "during"));

comment on table "mimiciv_hosp@V@UHF"."services_subject_id_during" is '  RELPART services_subject_id_duringVbe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {hadm_id, transfertime, curr_service, during} 
';

-- Table services_prev_service_during
create table "mimiciv_hosp@V@UHF"."services_prev_service_during"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "prev_service" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint services_prev_service_during_cc00 primary key ("hadm_id", "transfertime", "curr_service", "during"));

comment on table "mimiciv_hosp@V@UHF"."services_prev_service_during" is '  RELPART services_prev_service_duringVbe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), prev_service@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {hadm_id, transfertime, curr_service, during} 
';

-- Table services_until
create table "mimiciv_hosp@V@UHF"."services_until"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint services_until_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_until" is '  RELPART services_untilVxe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table services_subject_id_until
create table "mimiciv_hosp@V@UHF"."services_subject_id_until"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint services_subject_id_until_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_subject_id_until" is '  RELPART services_subject_id_untilVxe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table services_prev_service_until
create table "mimiciv_hosp@V@UHF"."services_prev_service_until"
(
  "hadm_id" INT4 not null, 
  "transfertime" TIMESTAMP not null, 
  "curr_service" VARCHAR(10) not null, 
  "prev_service" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint services_prev_service_until_cc00 primary key ("hadm_id", "transfertime", "curr_service"));

comment on table "mimiciv_hosp@V@UHF"."services_prev_service_until" is '  RELPART services_prev_service_untilVxe
    {hadm_id@N INT4, transfertime@N TIMESTAMP, curr_service@N VARCHAR(10), prev_service@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {hadm_id, transfertime, curr_service} 
';

-- Table emar_detail_since
create table "mimiciv_hosp@V@UHF"."emar_detail_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_since" is '  RELPART emar_detail_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_subject_id_since
create table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_subject_id_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_since" is '  RELPART emar_detail_subject_id_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_emar_seq_since
create table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "emar_seq" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_emar_seq_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_since" is '  RELPART emar_detail_emar_seq_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), emar_seq@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_administration_type_since
create table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "administration_type" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_administration_type_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_since" is '  RELPART emar_detail_administration_type_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), administration_type@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_pharmacy_id_since
create table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "pharmacy_id" INT4, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_pharmacy_id_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_since" is '  RELPART emar_detail_pharmacy_id_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), pharmacy_id@N INT4, sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_barcode_type_since
create table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "barcode_type" VARCHAR(4), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_barcode_type_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_since" is '  RELPART emar_detail_barcode_type_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), barcode_type@N VARCHAR(4), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_reason_for_no_barcode_since
create table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "reason_for_no_barcode" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_reason_for_no_barcode_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_since" is '  RELPART emar_detail_reason_for_no_barcode_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), reason_for_no_barcode@N TEXT, sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_complete_dose_not_given_since
create table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "complete_dose_not_given" VARCHAR(5), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_complete_dose_not_given_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_since" is '  RELPART emar_detail_complete_dose_not_given_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), complete_dose_not_given@N VARCHAR(5), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_due_since
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due" VARCHAR(100), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_dose_due_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_since" is '  RELPART emar_detail_dose_due_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due@N VARCHAR(100), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_due_unit_since
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due_unit" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_dose_due_unit_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_since" is '  RELPART emar_detail_dose_due_unit_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due_unit@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_given_since
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_dose_given_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_since" is '  RELPART emar_detail_dose_given_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_given_unit_since
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given_unit" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_dose_given_unit_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_since" is '  RELPART emar_detail_dose_given_unit_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given_unit@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_will_remainder_of_dose_be_given_since
create table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "will_remainder_of_dose_be_given" VARCHAR(5), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_will_remainder_of_dose_be_given_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_since" is '  RELPART emar_detail_will_remainder_of_dose_be_given_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), will_remainder_of_dose_be_given@N VARCHAR(5), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_amount_given_since
create table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_amount_given" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_product_amount_given_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_since" is '  RELPART emar_detail_product_amount_given_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_amount_given@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_unit_since
create table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_unit" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_product_unit_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_since" is '  RELPART emar_detail_product_unit_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_unit@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_code_since
create table "mimiciv_hosp@V@UHF"."emar_detail_product_code_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_code" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_product_code_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_code_since" is '  RELPART emar_detail_product_code_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_code@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_description_since
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_product_description_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_since" is '  RELPART emar_detail_product_description_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_description_other_since
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description_other" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_product_description_other_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_since" is '  RELPART emar_detail_product_description_other_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description_other@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_prior_infusion_rate_since
create table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "prior_infusion_rate" VARCHAR(40), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_prior_infusion_rate_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_since" is '  RELPART emar_detail_prior_infusion_rate_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), prior_infusion_rate@N VARCHAR(40), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_since
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate" VARCHAR(40), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_infusion_rate_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_since" is '  RELPART emar_detail_infusion_rate_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate@N VARCHAR(40), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_adjustment_since
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_infusion_rate_adjustment_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_since" is '  RELPART emar_detail_infusion_rate_adjustment_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_adjustment_amount_since
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment_amount" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_infusion_rate_adjustment_amount_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_since" is '  RELPART emar_detail_infusion_rate_adjustment_amount_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment_amount@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_unit_since
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_unit" VARCHAR(30), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_infusion_rate_unit_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_since" is '  RELPART emar_detail_infusion_rate_unit_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_unit@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_route_since
create table "mimiciv_hosp@V@UHF"."emar_detail_route_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "route" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_route_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_route_since" is '  RELPART emar_detail_route_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), route@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_complete_since
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_complete" VARCHAR(1), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_infusion_complete_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_since" is '  RELPART emar_detail_infusion_complete_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_complete@N VARCHAR(1), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_completion_interval_since
create table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "completion_interval" VARCHAR(50), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_completion_interval_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_since" is '  RELPART emar_detail_completion_interval_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), completion_interval@N VARCHAR(50), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_new_iv_bag_hung_since
create table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "new_iv_bag_hung" VARCHAR(1), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_new_iv_bag_hung_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_since" is '  RELPART emar_detail_new_iv_bag_hung_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), new_iv_bag_hung@N VARCHAR(1), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_continued_infusion_in_other_location_since
create table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "continued_infusion_in_other_location" VARCHAR(1), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_continued_infusion_in_other_location_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_since" is '  RELPART emar_detail_continued_infusion_in_other_location_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), continued_infusion_in_other_location@N VARCHAR(1), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_restart_interval_since
create table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "restart_interval" VARCHAR(2305), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_restart_interval_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_since" is '  RELPART emar_detail_restart_interval_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), restart_interval@N VARCHAR(2305), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_side_since
create table "mimiciv_hosp@V@UHF"."emar_detail_side_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "side" VARCHAR(10), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_side_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_side_since" is '  RELPART emar_detail_side_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), side@N VARCHAR(10), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_site_since
create table "mimiciv_hosp@V@UHF"."emar_detail_site_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "site" VARCHAR(255), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_site_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_site_since" is '  RELPART emar_detail_site_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), site@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_non_formulary_visual_verification_since
create table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_since"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "non_formulary_visual_verification" VARCHAR(1), 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint emar_detail_non_formulary_visual_verification_since_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_since" is '  RELPART emar_detail_non_formulary_visual_verification_sinceVbx
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), non_formulary_visual_verification@N VARCHAR(1), sinceVbx VBX_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_during
create table "mimiciv_hosp@V@UHF"."emar_detail_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_during" is '  RELPART emar_detail_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_subject_id_during
create table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_subject_id_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_during" is '  RELPART emar_detail_subject_id_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_emar_seq_during
create table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "emar_seq" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_emar_seq_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_during" is '  RELPART emar_detail_emar_seq_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), emar_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_administration_type_during
create table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "administration_type" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_administration_type_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_during" is '  RELPART emar_detail_administration_type_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), administration_type@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_pharmacy_id_during
create table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "pharmacy_id" INT4, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_pharmacy_id_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_during" is '  RELPART emar_detail_pharmacy_id_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), pharmacy_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_barcode_type_during
create table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "barcode_type" VARCHAR(4), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_barcode_type_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_during" is '  RELPART emar_detail_barcode_type_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), barcode_type@N VARCHAR(4), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_reason_for_no_barcode_during
create table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "reason_for_no_barcode" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_reason_for_no_barcode_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_during" is '  RELPART emar_detail_reason_for_no_barcode_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), reason_for_no_barcode@N TEXT, duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_complete_dose_not_given_during
create table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "complete_dose_not_given" VARCHAR(5), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_complete_dose_not_given_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_during" is '  RELPART emar_detail_complete_dose_not_given_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), complete_dose_not_given@N VARCHAR(5), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_dose_due_during
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due" VARCHAR(100), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_dose_due_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_during" is '  RELPART emar_detail_dose_due_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due@N VARCHAR(100), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_dose_due_unit_during
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due_unit" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_dose_due_unit_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_during" is '  RELPART emar_detail_dose_due_unit_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due_unit@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_dose_given_during
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_dose_given_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_during" is '  RELPART emar_detail_dose_given_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_dose_given_unit_during
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given_unit" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_dose_given_unit_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_during" is '  RELPART emar_detail_dose_given_unit_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given_unit@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_will_remainder_of_dose_be_given_during
create table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "will_remainder_of_dose_be_given" VARCHAR(5), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_will_remainder_of_dose_be_given_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_during" is '  RELPART emar_detail_will_remainder_of_dose_be_given_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), will_remainder_of_dose_be_given@N VARCHAR(5), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_product_amount_given_during
create table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_amount_given" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_product_amount_given_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_during" is '  RELPART emar_detail_product_amount_given_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_amount_given@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_product_unit_during
create table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_unit" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_product_unit_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_during" is '  RELPART emar_detail_product_unit_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_unit@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_product_code_during
create table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_code" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_product_code_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_code_during" is '  RELPART emar_detail_product_code_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_code@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_product_description_during
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_product_description_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_during" is '  RELPART emar_detail_product_description_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_product_description_other_during
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description_other" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_product_description_other_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_during" is '  RELPART emar_detail_product_description_other_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description_other@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_prior_infusion_rate_during
create table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "prior_infusion_rate" VARCHAR(40), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_prior_infusion_rate_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_during" is '  RELPART emar_detail_prior_infusion_rate_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), prior_infusion_rate@N VARCHAR(40), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_infusion_rate_during
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate" VARCHAR(40), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_infusion_rate_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_during" is '  RELPART emar_detail_infusion_rate_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate@N VARCHAR(40), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_infusion_rate_adjustment_during
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_infusion_rate_adjustment_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_during" is '  RELPART emar_detail_infusion_rate_adjustment_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_infusion_rate_adjustment_amount_during
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment_amount" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_infusion_rate_adjustment_amount_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_during" is '  RELPART emar_detail_infusion_rate_adjustment_amount_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment_amount@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_infusion_rate_unit_during
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_unit" VARCHAR(30), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_infusion_rate_unit_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_during" is '  RELPART emar_detail_infusion_rate_unit_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_unit@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_route_during
create table "mimiciv_hosp@V@UHF"."emar_detail_route_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "route" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_route_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_route_during" is '  RELPART emar_detail_route_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), route@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_infusion_complete_during
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_complete" VARCHAR(1), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_infusion_complete_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_during" is '  RELPART emar_detail_infusion_complete_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_complete@N VARCHAR(1), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_completion_interval_during
create table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "completion_interval" VARCHAR(50), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_completion_interval_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_during" is '  RELPART emar_detail_completion_interval_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), completion_interval@N VARCHAR(50), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_new_iv_bag_hung_during
create table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "new_iv_bag_hung" VARCHAR(1), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_new_iv_bag_hung_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_during" is '  RELPART emar_detail_new_iv_bag_hung_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), new_iv_bag_hung@N VARCHAR(1), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_continued_infusion_in_other_location_during
create table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "continued_infusion_in_other_location" VARCHAR(1), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_continued_infusion_in_other_location_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_during" is '  RELPART emar_detail_continued_infusion_in_other_location_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), continued_infusion_in_other_location@N VARCHAR(1), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_restart_interval_during
create table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "restart_interval" VARCHAR(2305), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_restart_interval_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_during" is '  RELPART emar_detail_restart_interval_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), restart_interval@N VARCHAR(2305), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_side_during
create table "mimiciv_hosp@V@UHF"."emar_detail_side_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "side" VARCHAR(10), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_side_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_side_during" is '  RELPART emar_detail_side_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), side@N VARCHAR(10), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_site_during
create table "mimiciv_hosp@V@UHF"."emar_detail_site_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "site" VARCHAR(255), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_site_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_site_during" is '  RELPART emar_detail_site_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), site@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_non_formulary_visual_verification_during
create table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "non_formulary_visual_verification" VARCHAR(1), 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint emar_detail_non_formulary_visual_verification_during_cc00 primary key ("emar_id", "parent_field_ordinal", "during"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_during" is '  RELPART emar_detail_non_formulary_visual_verification_duringVbe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), non_formulary_visual_verification@N VARCHAR(1), duringVbe VBE_INTERVAL}
   KEY {emar_id, parent_field_ordinal, during} 
';

-- Table emar_detail_until
create table "mimiciv_hosp@V@UHF"."emar_detail_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_until" is '  RELPART emar_detail_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_subject_id_until
create table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_subject_id_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_subject_id_until" is '  RELPART emar_detail_subject_id_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_emar_seq_until
create table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "emar_seq" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_emar_seq_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_emar_seq_until" is '  RELPART emar_detail_emar_seq_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), emar_seq@N INT4, untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_administration_type_until
create table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "administration_type" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_administration_type_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_administration_type_until" is '  RELPART emar_detail_administration_type_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), administration_type@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_pharmacy_id_until
create table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "pharmacy_id" INT4, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_pharmacy_id_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_pharmacy_id_until" is '  RELPART emar_detail_pharmacy_id_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), pharmacy_id@N INT4, untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_barcode_type_until
create table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "barcode_type" VARCHAR(4), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_barcode_type_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_barcode_type_until" is '  RELPART emar_detail_barcode_type_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), barcode_type@N VARCHAR(4), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_reason_for_no_barcode_until
create table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "reason_for_no_barcode" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_reason_for_no_barcode_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_reason_for_no_barcode_until" is '  RELPART emar_detail_reason_for_no_barcode_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), reason_for_no_barcode@N TEXT, untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_complete_dose_not_given_until
create table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "complete_dose_not_given" VARCHAR(5), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_complete_dose_not_given_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_complete_dose_not_given_until" is '  RELPART emar_detail_complete_dose_not_given_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), complete_dose_not_given@N VARCHAR(5), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_due_until
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due" VARCHAR(100), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_dose_due_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_until" is '  RELPART emar_detail_dose_due_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due@N VARCHAR(100), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_due_unit_until
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_due_unit" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_dose_due_unit_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_due_unit_until" is '  RELPART emar_detail_dose_due_unit_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_due_unit@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_given_until
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_dose_given_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_until" is '  RELPART emar_detail_dose_given_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_dose_given_unit_until
create table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "dose_given_unit" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_dose_given_unit_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_dose_given_unit_until" is '  RELPART emar_detail_dose_given_unit_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), dose_given_unit@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_will_remainder_of_dose_be_given_until
create table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "will_remainder_of_dose_be_given" VARCHAR(5), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_will_remainder_of_dose_be_given_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_will_remainder_of_dose_be_given_until" is '  RELPART emar_detail_will_remainder_of_dose_be_given_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), will_remainder_of_dose_be_given@N VARCHAR(5), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_amount_given_until
create table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_amount_given" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_product_amount_given_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_amount_given_until" is '  RELPART emar_detail_product_amount_given_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_amount_given@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_unit_until
create table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_unit" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_product_unit_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_unit_until" is '  RELPART emar_detail_product_unit_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_unit@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_code_until
create table "mimiciv_hosp@V@UHF"."emar_detail_product_code_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_code" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_product_code_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_code_until" is '  RELPART emar_detail_product_code_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_code@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_description_until
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_product_description_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_until" is '  RELPART emar_detail_product_description_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_product_description_other_until
create table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "product_description_other" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_product_description_other_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_product_description_other_until" is '  RELPART emar_detail_product_description_other_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), product_description_other@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_prior_infusion_rate_until
create table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "prior_infusion_rate" VARCHAR(40), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_prior_infusion_rate_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_prior_infusion_rate_until" is '  RELPART emar_detail_prior_infusion_rate_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), prior_infusion_rate@N VARCHAR(40), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_until
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate" VARCHAR(40), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_infusion_rate_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_until" is '  RELPART emar_detail_infusion_rate_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate@N VARCHAR(40), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_adjustment_until
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_infusion_rate_adjustment_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_until" is '  RELPART emar_detail_infusion_rate_adjustment_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_adjustment_amount_until
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_adjustment_amount" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_infusion_rate_adjustment_amount_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_adjustment_amount_until" is '  RELPART emar_detail_infusion_rate_adjustment_amount_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_adjustment_amount@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_rate_unit_until
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_rate_unit" VARCHAR(30), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_infusion_rate_unit_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_rate_unit_until" is '  RELPART emar_detail_infusion_rate_unit_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_rate_unit@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_route_until
create table "mimiciv_hosp@V@UHF"."emar_detail_route_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "route" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_route_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_route_until" is '  RELPART emar_detail_route_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), route@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_infusion_complete_until
create table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "infusion_complete" VARCHAR(1), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_infusion_complete_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_infusion_complete_until" is '  RELPART emar_detail_infusion_complete_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), infusion_complete@N VARCHAR(1), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_completion_interval_until
create table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "completion_interval" VARCHAR(50), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_completion_interval_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_completion_interval_until" is '  RELPART emar_detail_completion_interval_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), completion_interval@N VARCHAR(50), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_new_iv_bag_hung_until
create table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "new_iv_bag_hung" VARCHAR(1), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_new_iv_bag_hung_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_new_iv_bag_hung_until" is '  RELPART emar_detail_new_iv_bag_hung_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), new_iv_bag_hung@N VARCHAR(1), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_continued_infusion_in_other_location_until
create table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "continued_infusion_in_other_location" VARCHAR(1), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_continued_infusion_in_other_location_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_continued_infusion_in_other_location_until" is '  RELPART emar_detail_continued_infusion_in_other_location_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), continued_infusion_in_other_location@N VARCHAR(1), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_restart_interval_until
create table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "restart_interval" VARCHAR(2305), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_restart_interval_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_restart_interval_until" is '  RELPART emar_detail_restart_interval_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), restart_interval@N VARCHAR(2305), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_side_until
create table "mimiciv_hosp@V@UHF"."emar_detail_side_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "side" VARCHAR(10), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_side_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_side_until" is '  RELPART emar_detail_side_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), side@N VARCHAR(10), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_site_until
create table "mimiciv_hosp@V@UHF"."emar_detail_site_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "site" VARCHAR(255), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_site_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_site_until" is '  RELPART emar_detail_site_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), site@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table emar_detail_non_formulary_visual_verification_until
create table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_until"
(
  "emar_id" VARCHAR(25) not null, 
  "parent_field_ordinal" VARCHAR(10) not null, 
  "non_formulary_visual_verification" VARCHAR(1), 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint emar_detail_non_formulary_visual_verification_until_cc00 primary key ("emar_id", "parent_field_ordinal"));

comment on table "mimiciv_hosp@V@UHF"."emar_detail_non_formulary_visual_verification_until" is '  RELPART emar_detail_non_formulary_visual_verification_untilVxe
    {emar_id@N VARCHAR(25), parent_field_ordinal@N VARCHAR(10), non_formulary_visual_verification@N VARCHAR(1), untilVxe VXE_POINT}
   KEY {emar_id, parent_field_ordinal} 
';

-- Table poe_detail_since
create table "mimiciv_hosp@V@UHF"."poe_detail_since"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_detail_since_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_since" is '  RELPART poe_detail_sinceVbx
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), sinceVbx VBX_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_poe_seq_since
create table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_since"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "poe_seq" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_detail_poe_seq_since_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_since" is '  RELPART poe_detail_poe_seq_sinceVbx
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), poe_seq@N INT4, sinceVbx VBX_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_subject_id_since
create table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_since"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_detail_subject_id_since_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_since" is '  RELPART poe_detail_subject_id_sinceVbx
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), subject_id@N INT4, sinceVbx VBX_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_field_value_since
create table "mimiciv_hosp@V@UHF"."poe_detail_field_value_since"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "field_value" TEXT, 
  "since" "mimiciv_hosp@V@UHF"."VBX_POINT",
  constraint poe_detail_field_value_since_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_field_value_since" is '  RELPART poe_detail_field_value_sinceVbx
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), field_value@N TEXT, sinceVbx VBX_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_during
create table "mimiciv_hosp@V@UHF"."poe_detail_during"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_detail_during_cc00 primary key ("poe_id", "field_name", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_during" is '  RELPART poe_detail_duringVbe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), duringVbe VBE_INTERVAL}
   KEY {poe_id, field_name, during} 
';

-- Table poe_detail_poe_seq_during
create table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "poe_seq" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_detail_poe_seq_during_cc00 primary key ("poe_id", "field_name", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_during" is '  RELPART poe_detail_poe_seq_duringVbe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), poe_seq@N INT4, duringVbe VBE_INTERVAL}
   KEY {poe_id, field_name, during} 
';

-- Table poe_detail_subject_id_during
create table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_detail_subject_id_during_cc00 primary key ("poe_id", "field_name", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_during" is '  RELPART poe_detail_subject_id_duringVbe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), subject_id@N INT4, duringVbe VBE_INTERVAL}
   KEY {poe_id, field_name, during} 
';

-- Table poe_detail_field_value_during
create table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "field_value" TEXT, 
  "during" "mimiciv_hosp@V@UHF"."VBE_INTERVAL",
  constraint poe_detail_field_value_during_cc00 primary key ("poe_id", "field_name", "during"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_field_value_during" is '  RELPART poe_detail_field_value_duringVbe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), field_value@N TEXT, duringVbe VBE_INTERVAL}
   KEY {poe_id, field_name, during} 
';

-- Table poe_detail_until
create table "mimiciv_hosp@V@UHF"."poe_detail_until"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_detail_until_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_until" is '  RELPART poe_detail_untilVxe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), untilVxe VXE_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_poe_seq_until
create table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_until"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "poe_seq" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_detail_poe_seq_until_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_poe_seq_until" is '  RELPART poe_detail_poe_seq_untilVxe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), poe_seq@N INT4, untilVxe VXE_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_subject_id_until
create table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_until"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "subject_id" INT4 not null, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_detail_subject_id_until_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_subject_id_until" is '  RELPART poe_detail_subject_id_untilVxe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), subject_id@N INT4, untilVxe VXE_POINT}
   KEY {poe_id, field_name} 
';

-- Table poe_detail_field_value_until
create table "mimiciv_hosp@V@UHF"."poe_detail_field_value_until"
(
  "poe_id" VARCHAR(25) not null, 
  "field_name" VARCHAR(255) not null, 
  "field_value" TEXT, 
  "until" "mimiciv_hosp@V@UHF"."VXE_POINT",
  constraint poe_detail_field_value_until_cc00 primary key ("poe_id", "field_name"));

comment on table "mimiciv_hosp@V@UHF"."poe_detail_field_value_until" is '  RELPART poe_detail_field_value_untilVxe
    {poe_id@N VARCHAR(25), field_name@N VARCHAR(255), field_value@N TEXT, untilVxe VXE_POINT}
   KEY {poe_id, field_name} 
';

