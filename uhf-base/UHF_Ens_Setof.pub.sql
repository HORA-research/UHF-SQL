/*
============================================================================== A
UHF_Ens_Setof.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF_Base
Résumé : Mise en oeuvre des ensembles d'intervalles utilisant le constructeur Setof
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

Chacune des fonctions du présent segment dépend de la fonction
  "UHF"."unfold" ("Point", "Point").
Tout changement à cette fonction se répercutera donc à celles du présent segment.

Ce segment demeure cependant dépendant du dialecte PostgreSQL en raison de l’utilisation
du constructeur de type (modifier) « setof ».

Lors d’un portage, on pourra envisager d’utiliser plutôt le mécanisme standard
« return table… ».

On remarquera par ailleurs que les « setof "Point" » du présent segment sont, en
fait, souvent utilisés pour représenter des ensembles d’intervalles dont tous les
intervalles sont des singletons — d’où leur inclusion dans le présent segment.

TODO 2022-08-15 (LL01) Revoir la dénomination des fonctions
  * le polymorphisme ne fonctionne pas toujours, notamment en regard du résultat
  * établir une politique uniforme à cet égard et l'appliquer
x-x-x-x-x-x-x-x-
*/

--
-- Set of points returning functions
--

create function "unfold"
  (
    a "Point", b "Point"
  )
  returns Setof "Point"
  immutable strict
begin atomic
  select s.p::"Point" from generate_series(a, b, 1) as s(p);
end;

create function "unfold"
  (
    "i" "Interval"
  )
  returns Setof "Point"
  immutable strict
return
  "unfold"("iBegin"("i"), "iEnd"("i"));

create function "unfold_si"
  (
    a "Point", b "Point"
  )
  returns Setof "Interval"
  immutable strict
begin atomic
  select interval_cons(s.p::"Point", s.p::"Point") from generate_series(a, b, 1) as s(p);
end;

create function "unfold_si"
  (
    "i" "Interval"
  )
  returns Setof "Interval"
  immutable strict
return
  "unfold_si"("iBegin"("i"), "iEnd"("i"));

/*
============================================================================== Z
UHF_Ens_Setof.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
