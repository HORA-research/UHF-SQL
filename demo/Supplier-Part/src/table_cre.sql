/*
-- =========================================================================== A
Exemple : Supplier-Part
Encodage : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateform : PostgreSQL 9.6+
Version : 1.0.0a
Statut : stable
Objet : Création du schéma et des tables pour l'exemple Supplier-Part
-- =========================================================================== A
*/
--
create schema "supplier_part";
--
set schema 'supplier_part';
--
create table "supplier_part".S
(
  sno    char(3)     not null,
  status int         not null,
  city   varchar(30) not null,
  constraint s_ck0 primary key (sno)
);

create table "supplier_part".P
(
  pno char(3) not null,
  name varchar (30) not null,
  constraint p_ck0 primary key (pno)
);

create table "supplier_part".SP
(
  sno char(3) not null,
  pno char(3) not null,
  qty int     not null,
  constraint sp_ck0 primary key (sno, pno),
  constraint sp_fk0 foreign key (sno) references "supplier_part".S (sno),
  constraint sp_fk1 foreign key (pno) references "supplier_part".P (pno)
);
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK)  Christina.Khnaisser@USherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2026-02-06 (CK) : 2020-03-11

Références :
  Date, Chris J., Hugh Darwen, et Nikos A. Lorentzos.
  Time and Relational Theory: Temporal Databases in the Relational Model and SQL.
  Morgan Kaufmann, 2014.
-- -----------------------------------------------------------------------------
-- Fin de table_cre.sql
-- =========================================================================== Z
*/
