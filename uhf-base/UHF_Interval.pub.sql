/*
============================================================================== A
UHF_Interval.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Base commune de représentation des intervalles.
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2024-03-29
Statut : en cours de vérification
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14 à 16
============================================================================== A
*/

/*
== Dépendances non relatives à la représentation interne

Attendu la définition préalable du type Point et de ses opérateurs primitifs
(voir fichier `UHF_Point.sql`), le présent fichier définit le type Interval et
ses propres opérateurs primitifs en tenant compte
  * du choix du type entier de la représentation interne ;
  * des différences dialectales (par exemple, des fonctions propres au dialecte
    telle que upper, lower, upper_inc et lower_inc en PostgreSQL).

Advenant qu’une représentation interne n’ait plus ces propriétés communes,
il faudrait déplacer les définitions ci-après dans chacune des variantes et
les y spécialiser.

Selon les auteurs, la dénomination des fonctions prédécesseur (pred, ante) et
successeur (succ, post) varie. Si on respecte l'étymologie, il faut choisir
entre la paire "pred et succ" et la paire "ante et post", mais ne pas mélanger
les paires. Nous avons choisi "ante et post".

.NOTE 2022-09-07 (LL01) La fonction upper_inc(i) ne peut être avérée que si le type du point est discret.
  * Ce qui est le cas lorsque la représentation interne est entière.
    Lorsque la représentation interne est psuedo-continue, par exemple un
    nombre flottant (float4 ou float8), upper_inc(i) est toujours faux.
    https://www.postgresql.org/message-id/CAKFQuwai8tKghXz87ctxx9WFEwMqpbH4_j2vWnhXudmYx-y2hw%40mail.gmail.com

.NOTE 2022-09-07 (LL01) Prise en compte de l'inclusion des bornes... ou pas.
  * La représentation interne des «range» autorise, en théorie, l'inclusion des
    bornes ou pas. En pratique, il semble que la représentation soit toujours
    normalisée selon la forme fermé-ouvert (c'est-à-dire borne inférieur incluse,
    borne supérieure exclue «[min,max+1)»). Jusqu'àa la version du 2022-09-05,
    la mise en oeuvre de "card" tirait partie de cette hypothèse, mais pas celles
    de "iBegin", "iEnd", "ante" et "post". Par soucis d'évolutivité, depuis la
    version 2022-09-07, nous ne tirons plus partie de cette hypothèse et la mise
    en oeuvre de "card" a été modifiée. En conséquence, l'ordre de définition des
    fonctions a aussi été changé.

.TOIMPROVE 2022-09-07 (LL01)
  * La généralisation effectuée ce jour (voir note précédente) a un cout.
    Il serait vraisemblablement opportun de valider que la normalisation est
    systématique (fonction «canonical» ?) et le cas échéant en tirer parti
    dans l'ensemble du module et en particulier dans les cinq fonctions
    "iBegin", "iEnd", "card", "ante" et "post".
*/

--
-- Contrôle de la variante
--

create function "TRII"
  (
  )
  returns Integer
  immutable strict parallel safe cost 1
return
  -- INT2 --  2;
  /* INT4 */  4;
  -- INT8 --  8;
comment on function "TRII" () is 'Taille de la représentation interne du Point de Interval';

--
-- Type "Interval"
--

create domain "Interval"
  -- INT2 -- int2range
  /* INT4 */ int4range
  -- INT8 -- int8range
  not null;
comment on domain "Interval" is 'UHF temporal interval domain';

--
-- Constructeurs d'intervalles
--

create function "interval_cons"
  (
    b "Point", e "Point"
  )
  returns "Interval"
  immutable strict parallel safe
return
  -- INT2 -- int2range(b, e, '[]')::"Interval";
  /* INT4 */ int4range(b, e, '[]')::"Interval";
  -- INT8 -- int8range(b, e, '[]')::"Interval";

--
-- Opérateurs et fonctions du type "Interval"
--

create function "iBegin"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict parallel safe
  -- Interval bounds can be null.
  -- TOFIX 2022-02-11 (LL01) : pourquoi le prendre en considération ici, mais pour pred et succ ?
  --  * null == -infinity ?
  --  * réponse à venir après le travail sur horizon
return
  case
    when lower_inc(i) then
      lower(i)::"Point"
    else
      "succ"(lower(i)::"Point")
  end;

create function "iEnd"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict parallel safe
  -- Interval bounds can be null.
  -- TOFIX 2022-02-11 (LL01) : pourquoi cette asymétrie avec BEGIN ?
  --  * null == infinity ?
  --  * réponse à venir après le travail sur horizon
return
  case
    when upper_inc(i) then
      upper(i)::"Point"
    else
      "pred"(upper(i)::"Point")
  end;

create function "card"
  (
    i "Interval"
  )
  returns Bigint
  immutable strict parallel safe
return
  ("iEnd"(i)::Bigint - "iBegin"(i)::Bigint + 1);

create function "ante"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict parallel safe
return
  case
    when lower_inc(i) then
      "pred"(lower(i)::"Point")
    else
      lower(i)::"Point"
  end;

create function "post"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict parallel safe
return
  case
    when upper_inc(i) then
      "succ"(upper(i)::"Point")
    else
      upper(i)::"Point"
  end;

--
-- Opérations algébriques du type "Interval"
--

create function "difference"
  (
    "i1" "Interval", "i2" "Interval"
  )
  returns "Interval"
  immutable strict parallel safe
return
  "i1" - "i2";

create function "union"
  (
    "i1" "Interval", "i2" "Interval"
  )
  returns "Interval"
  immutable strict parallel safe
return
  "i1" + "i2";

create function "intersection"
  (
    "i1" "Interval", "i2" "Interval"
  )
  returns "Interval"
  immutable strict parallel safe
return
  "i1" * "i2";

create function "iGap "
  (
    "i1" "Interval", "i2" "Interval"
  )
  returns "Interval"
  immutable strict parallel safe
return
  ("i1" + "i2") - ("i1" * "i2");

/*
============================================================================== Z
UHF_Interval.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences... : voir UHF.ini.sql
============================================================================== Z
*/
