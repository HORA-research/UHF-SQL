/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create temporal domains
-- =========================================================================== A
*/

-- Domain VBX_POINT 
create domain "supplier_part@V@UHF"."VBX_POINT"
  as "UHF"."Point"
;

-- Domain VBE_INTERVAL 
create domain "supplier_part@V@UHF"."VBE_INTERVAL"
  as "UHF"."Interval"
;

-- Domain VXE_POINT 
create domain "supplier_part@V@UHF"."VXE_POINT"
  as "UHF"."Point"
;

