/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the schema
-- =========================================================================== A
*/

-- La base de données doit contenir les schémas mettant en oeuvre GRIIS_Base, GRIIS_Param et GRIIS_IMEX et UHF.
drop schema if exists "mimiciv_hosp@V@UHF" cascade ;
create schema "mimiciv_hosp@V@UHF";

comment on schema "mimiciv_hosp@V@UHF" is 'Schéma mimiciv_hosp@V@UHF créé le 20260619-1747';

