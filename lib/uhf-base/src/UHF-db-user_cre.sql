/*
-- =========================================================================== A
Encodage : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateform : PostgreSQL 9.6+
Version : 1.0.0a
Statut : stable
Objet : Création de la BD et de l'utilisateur
-- =========================================================================== A
*/
--
-- Création utilisateur
create user uhf with password 'uhf';
comment on role uhf is 'Utilisateur pour tester UHF';
--

-- Création de la base de données
create database uhf owner uhf;
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK)  Christina.Khnaisser@USherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2026-02-06 (CK) : 2026-02-25

-- -----------------------------------------------------------------------------
-- Fin de UHF-db-user_cre.sql
-- =========================================================================== Z
*/
