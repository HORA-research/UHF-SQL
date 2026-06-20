/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the schema
-- =========================================================================== A
*/

-- La base de données doit contenir les schémas mettant en oeuvre GRIIS_Base, GRIIS_Param et GRIIS_IMEX et UHF.
drop schema if exists "supplier_part@V@UHF" cascade ;
create schema "supplier_part@V@UHF";

comment on schema "supplier_part@V@UHF" is 'Schéma supplier_part@V@UHF créé le 20260619-1752';

