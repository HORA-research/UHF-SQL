/*
============================================================================== A
UHF_Point.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Éléments associés au point utilisés par le Unified Historicization Framework (UHF).
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2024-03-29
Statut : en cours de vérification
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14 à 16
============================================================================== A
*/

--
-- Contrôle de la variante
--

create function "TRIP"
  (
  )
  returns Integer
  immutable strict parallel safe cost 1
return
  -- INT2 --  2;
  /* INT4 */  4;
  -- INT8 --  8;
comment on function "TRIP" () is 'Taille de la représentation interne du Point';

--
-- Point et propriétés du point
--

create domain "Point"

  -- INT2 -- int2
  /* INT4 */ int4
  -- INT8 -- int8
  not null;
comment on domain "Point" is 'UHF temporal point domain';

create function "min"
  (
  )
  returns "Point"
  immutable strict parallel safe cost 1
return
  -- INT2 --               (-32768)::"Point";
  /* INT4 */          (-1)::"Point";
  -- INT8 -- (-9223372036854775808)::"Point";

create function "max"
  (
  )
  returns "Point"
  immutable strict parallel safe cost 1
return
  -- la notation interne des range impose '[)' ; en conséquence la valeur
  -- maximale du type de base est perdue, d'où 32766, 2147483646, etc.
  -- INT2 --               32766::"Point";
  /* INT4 */          50::"Point";
  -- INT8 -- 9223372036854775806::"Point";

--
-- Constructeurs de points
--
-- Il sont tous implicitement hérités... pour le moment!

--
-- Opérateurs et fonctions du "Point"
--
-- Les opérateurs d'égalité (=) et d'inégalité (<>) sont implicitement hérités,
-- de même que les opérateurs de comparison (<, <=, >, >=).

create function "pred"
  (
    "p" "Point"
  )
  returns "Point"
  immutable strict parallel safe
return
  "p" - 1;

create function "succ"
  (
    "p" "Point"
  )
  returns "Point"
  immutable strict parallel safe
return
  "p" + 1;

/*
============================================================================== Z
UHF_Point.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
