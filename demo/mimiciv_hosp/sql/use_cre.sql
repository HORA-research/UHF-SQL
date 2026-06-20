/*
-- =========================================================================== A
Encodage : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateform : PostgreSQL 9.6+
Version : 1.0.0a
Statut : stable
Objet : Création de l'utilisateur BD pour l'exemple mimiciv_hosp
-- =========================================================================== A
*/
--

create user uhf with password 'uhf';
comment on role uhf is 'Utilisateur pour tester UHF';
GRANT USAGE, CREATE ON SCHEMA "UHF" TO uhf;

CREATE DATABASE uhf OWNER uhf;
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK)  Christina.Khnaisser@USherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2026-02-06 (CK) : 2026-02-25

Références :
-- -----------------------------------------------------------------------------
-- Fin de user_cre.sql
-- =========================================================================== Z
*/
