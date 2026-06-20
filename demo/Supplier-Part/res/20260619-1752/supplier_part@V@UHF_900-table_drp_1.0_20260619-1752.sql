/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Drop tables
-- =========================================================================== A
*/

drop table "supplier_part@V@UHF"."p_since" cascade;

drop table "supplier_part@V@UHF"."p_name_since" cascade;

drop table "supplier_part@V@UHF"."p_during" cascade;

drop table "supplier_part@V@UHF"."p_name_during" cascade;

drop table "supplier_part@V@UHF"."p_until" cascade;

drop table "supplier_part@V@UHF"."p_name_until" cascade;

drop table "supplier_part@V@UHF"."s_since" cascade;

drop table "supplier_part@V@UHF"."s_status_since" cascade;

drop table "supplier_part@V@UHF"."s_city_since" cascade;

drop table "supplier_part@V@UHF"."s_during" cascade;

drop table "supplier_part@V@UHF"."s_status_during" cascade;

drop table "supplier_part@V@UHF"."s_city_during" cascade;

drop table "supplier_part@V@UHF"."s_until" cascade;

drop table "supplier_part@V@UHF"."s_status_until" cascade;

drop table "supplier_part@V@UHF"."s_city_until" cascade;

drop table "supplier_part@V@UHF"."sp_since" cascade;

drop table "supplier_part@V@UHF"."sp_qty_since" cascade;

drop table "supplier_part@V@UHF"."sp_during" cascade;

drop table "supplier_part@V@UHF"."sp_qty_during" cascade;

drop table "supplier_part@V@UHF"."sp_until" cascade;

drop table "supplier_part@V@UHF"."sp_qty_until" cascade;

