/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create tables
-- =========================================================================== A
*/

-- Table p_since
create table "supplier_part@V@UHF"."p_since"
(
  "pno" BPCHAR(3) not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint p_since_cc00 primary key ("pno"));

comment on table "supplier_part@V@UHF"."p_since" is '  RELPART p_sinceVbx
    {pno@N BPCHAR(3), sinceVbx VBX_POINT}
   KEY {pno} 
';

-- Table p_name_since
create table "supplier_part@V@UHF"."p_name_since"
(
  "pno" BPCHAR(3) not null, 
  "name" VARCHAR(30) not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint p_name_since_cc00 primary key ("pno"));

comment on table "supplier_part@V@UHF"."p_name_since" is '  RELPART p_name_sinceVbx
    {pno@N BPCHAR(3), name@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {pno} 
';

-- Table p_during
create table "supplier_part@V@UHF"."p_during"
(
  "pno" BPCHAR(3) not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint p_during_cc00 primary key ("pno", "during"));

comment on table "supplier_part@V@UHF"."p_during" is '  RELPART p_duringVbe
    {pno@N BPCHAR(3), duringVbe VBE_INTERVAL}
   KEY {pno, during} 
';

-- Table p_name_during
create table "supplier_part@V@UHF"."p_name_during"
(
  "pno" BPCHAR(3) not null, 
  "name" VARCHAR(30) not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint p_name_during_cc00 primary key ("pno", "during"));

comment on table "supplier_part@V@UHF"."p_name_during" is '  RELPART p_name_duringVbe
    {pno@N BPCHAR(3), name@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {pno, during} 
';

-- Table p_until
create table "supplier_part@V@UHF"."p_until"
(
  "pno" BPCHAR(3) not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint p_until_cc00 primary key ("pno"));

comment on table "supplier_part@V@UHF"."p_until" is '  RELPART p_untilVxe
    {pno@N BPCHAR(3), untilVxe VXE_POINT}
   KEY {pno} 
';

-- Table p_name_until
create table "supplier_part@V@UHF"."p_name_until"
(
  "pno" BPCHAR(3) not null, 
  "name" VARCHAR(30) not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint p_name_until_cc00 primary key ("pno"));

comment on table "supplier_part@V@UHF"."p_name_until" is '  RELPART p_name_untilVxe
    {pno@N BPCHAR(3), name@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {pno} 
';

-- Table s_since
create table "supplier_part@V@UHF"."s_since"
(
  "sno" BPCHAR(3) not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint s_since_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_since" is '  RELPART s_sinceVbx
    {sno@N BPCHAR(3), sinceVbx VBX_POINT}
   KEY {sno} 
';

-- Table s_status_since
create table "supplier_part@V@UHF"."s_status_since"
(
  "sno" BPCHAR(3) not null, 
  "status" INT4 not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint s_status_since_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_status_since" is '  RELPART s_status_sinceVbx
    {sno@N BPCHAR(3), status@N INT4, sinceVbx VBX_POINT}
   KEY {sno} 
';

-- Table s_city_since
create table "supplier_part@V@UHF"."s_city_since"
(
  "sno" BPCHAR(3) not null, 
  "city" VARCHAR(30) not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint s_city_since_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_city_since" is '  RELPART s_city_sinceVbx
    {sno@N BPCHAR(3), city@N VARCHAR(30), sinceVbx VBX_POINT}
   KEY {sno} 
';

-- Table s_during
create table "supplier_part@V@UHF"."s_during"
(
  "sno" BPCHAR(3) not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint s_during_cc00 primary key ("sno", "during"));

comment on table "supplier_part@V@UHF"."s_during" is '  RELPART s_duringVbe
    {sno@N BPCHAR(3), duringVbe VBE_INTERVAL}
   KEY {sno, during} 
';

-- Table s_status_during
create table "supplier_part@V@UHF"."s_status_during"
(
  "sno" BPCHAR(3) not null, 
  "status" INT4 not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint s_status_during_cc00 primary key ("sno", "during"));

comment on table "supplier_part@V@UHF"."s_status_during" is '  RELPART s_status_duringVbe
    {sno@N BPCHAR(3), status@N INT4, duringVbe VBE_INTERVAL}
   KEY {sno, during} 
';

-- Table s_city_during
create table "supplier_part@V@UHF"."s_city_during"
(
  "sno" BPCHAR(3) not null, 
  "city" VARCHAR(30) not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint s_city_during_cc00 primary key ("sno", "during"));

comment on table "supplier_part@V@UHF"."s_city_during" is '  RELPART s_city_duringVbe
    {sno@N BPCHAR(3), city@N VARCHAR(30), duringVbe VBE_INTERVAL}
   KEY {sno, during} 
';

-- Table s_until
create table "supplier_part@V@UHF"."s_until"
(
  "sno" BPCHAR(3) not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint s_until_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_until" is '  RELPART s_untilVxe
    {sno@N BPCHAR(3), untilVxe VXE_POINT}
   KEY {sno} 
';

-- Table s_status_until
create table "supplier_part@V@UHF"."s_status_until"
(
  "sno" BPCHAR(3) not null, 
  "status" INT4 not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint s_status_until_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_status_until" is '  RELPART s_status_untilVxe
    {sno@N BPCHAR(3), status@N INT4, untilVxe VXE_POINT}
   KEY {sno} 
';

-- Table s_city_until
create table "supplier_part@V@UHF"."s_city_until"
(
  "sno" BPCHAR(3) not null, 
  "city" VARCHAR(30) not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint s_city_until_cc00 primary key ("sno"));

comment on table "supplier_part@V@UHF"."s_city_until" is '  RELPART s_city_untilVxe
    {sno@N BPCHAR(3), city@N VARCHAR(30), untilVxe VXE_POINT}
   KEY {sno} 
';

-- Table sp_since
create table "supplier_part@V@UHF"."sp_since"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint sp_since_cc00 primary key ("sno", "pno"));

comment on table "supplier_part@V@UHF"."sp_since" is '  RELPART sp_sinceVbx
    {sno@N BPCHAR(3), pno@N BPCHAR(3), sinceVbx VBX_POINT}
   KEY {sno, pno} 
';

-- Table sp_qty_since
create table "supplier_part@V@UHF"."sp_qty_since"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "qty" INT4 not null, 
  "since" "supplier_part@V@UHF"."VBX_POINT",
  constraint sp_qty_since_cc00 primary key ("sno", "pno"));

comment on table "supplier_part@V@UHF"."sp_qty_since" is '  RELPART sp_qty_sinceVbx
    {sno@N BPCHAR(3), pno@N BPCHAR(3), qty@N INT4, sinceVbx VBX_POINT}
   KEY {sno, pno} 
';

-- Table sp_during
create table "supplier_part@V@UHF"."sp_during"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint sp_during_cc00 primary key ("sno", "pno", "during"));

comment on table "supplier_part@V@UHF"."sp_during" is '  RELPART sp_duringVbe
    {sno@N BPCHAR(3), pno@N BPCHAR(3), duringVbe VBE_INTERVAL}
   KEY {sno, pno, during} 
';

-- Table sp_qty_during
create table "supplier_part@V@UHF"."sp_qty_during"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "qty" INT4 not null, 
  "during" "supplier_part@V@UHF"."VBE_INTERVAL",
  constraint sp_qty_during_cc00 primary key ("sno", "pno", "during"));

comment on table "supplier_part@V@UHF"."sp_qty_during" is '  RELPART sp_qty_duringVbe
    {sno@N BPCHAR(3), pno@N BPCHAR(3), qty@N INT4, duringVbe VBE_INTERVAL}
   KEY {sno, pno, during} 
';

-- Table sp_until
create table "supplier_part@V@UHF"."sp_until"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint sp_until_cc00 primary key ("sno", "pno"));

comment on table "supplier_part@V@UHF"."sp_until" is '  RELPART sp_untilVxe
    {sno@N BPCHAR(3), pno@N BPCHAR(3), untilVxe VXE_POINT}
   KEY {sno, pno} 
';

-- Table sp_qty_until
create table "supplier_part@V@UHF"."sp_qty_until"
(
  "sno" BPCHAR(3) not null, 
  "pno" BPCHAR(3) not null, 
  "qty" INT4 not null, 
  "until" "supplier_part@V@UHF"."VXE_POINT",
  constraint sp_qty_until_cc00 primary key ("sno", "pno"));

comment on table "supplier_part@V@UHF"."sp_qty_until" is '  RELPART sp_qty_untilVxe
    {sno@N BPCHAR(3), pno@N BPCHAR(3), qty@N INT4, untilVxe VXE_POINT}
   KEY {sno, pno} 
';

