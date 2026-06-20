/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create temporal domains
-- =========================================================================== A
*/

-- Domain VBX_POINT 
create domain "mimiciv_hosp@V@UHF"."VBX_POINT"
  as "UHF"."Point"
;

-- Domain VBE_INTERVAL 
create domain "mimiciv_hosp@V@UHF"."VBE_INTERVAL"
  as "UHF"."Interval"
;

-- Domain VXE_POINT 
create domain "mimiciv_hosp@V@UHF"."VXE_POINT"
  as "UHF"."Point"
;

