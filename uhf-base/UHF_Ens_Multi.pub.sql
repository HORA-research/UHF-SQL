/*
============================================================================== A
UHF_Ens_Multi.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Mise en oeuvre des ensembles d'intervalles utilisant les types prédéfinis MultiRange
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

/*
x-x-x-x-x-x-x-x-

Ce segment demeure cependant dépendant du dialecte PostgreSQL en raison de l’utilisation
des opérateurs associés aux types prédéfinis « multirange » du générateur de type « range ».

Comme les « multirange » sont des variantes du constructeur de type « array »,
et sont donc assimilables à des « "Interval"[] », il serait intéressant de voir
dans quelle mesure il n'est pas possible de les fusionner aux « array » et,
ainsi, réduire la dépendance aux spécificités de PostgreSQL.

x-x-x-x-x-x-x-x-
*/

--
-- Type "Set_of_Interval"
--

create domain "Set_of_Interval"
  -- INT2 -- int2multirange
  /* INT4 */ int4multirange
  -- INT8 -- int8multirange
  not null;
comment on domain "Set_of_Interval" is 'UHF domain (type) for set of temporal intervals (ranges)';

--
-- "Set_of_Interval" returning functions
--

create function "difference"
  (
    "i1" "Set_of_Interval", "i2" "Set_of_Interval"
  )
  returns "Set_of_Interval"
  immutable strict parallel safe
return
  "i1" - "i2";

create function "union"
  (
   "i1" "Set_of_Interval", "i2" "Set_of_Interval"
  )
  returns "Set_of_Interval"
  immutable strict parallel safe
return
  "i1" + "i2";

create function "intersection"
  (
   "i1" "Set_of_Interval", "i2" "Set_of_Interval"
  )
  returns "Set_of_Interval"
  immutable strict parallel safe
return
  "i1" * "i2";

create function "iGap"
  (
   "i1" "Set_of_Interval", "i2" "Set_of_Interval"
  )
  returns "Set_of_Interval"
  immutable strict parallel safe
return
  ("i1" + "i2") - ("i1" * "i2");

/*
============================================================================== Z
UHF_Ens_Multi.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
