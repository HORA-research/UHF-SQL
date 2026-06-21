/*
============================================================================== A
UHF_pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Définition du Unified Historicization Framework (UHF).
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2024-03-29
Statut : en cours de vérification
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14 à 16
============================================================================== A
*/

/*
============================================================================== B
Pour la présentation d’UHF voir UHF_SCL.adoc, UHF_ini.sql et UHF_pub.sql puis faire la synthèse
============================================================================== B
*/

/* Retiré, pour le moment
R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-

.NOTE 2022-03-19 (LL01) Utilité discutable des types "uhf_Vbx_Point" et "uhf_Vxe_Point".
  Des routines spécialisées retournant des valeurs du type général UHF.Point,
  telles que uhf_below, uhf_first, uhf_last, uhf_beyond, me semblent plus appropriées,
  car

    * en théorie, un Point est distinct d’un Interval ;

    * en pratique, il n’y aura pas de validation supplémentaire opérée par SQL
       avec les définitions proposées -- sans compter beaucoup de complications
       au niveau de la compatibilité des expressions, qui induiront un usage
       immodéré d’opérations CAST.

create domain "uhf_Point_Vbx" as "Point";
comment on domain "uhf_Point_Vbx" is 'UHF valid point undetermined in the future';

create domain "uhf_Point_Vxe" as "Point";
comment on domain "uhf_Point_Vxe" is 'UHF valid point undetermined in the past';

R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-R-
*/

--
-- "Point" functions and specialized "Interval" domain definitions
--

create domain "uhf_Interval_Vbe" as
  "Interval";
comment on domain "uhf_Interval_Vbe" is
  'UHF valid fully determined interval';

create function "uhf_below"
  (
  )
  returns "Point"
  immutable strict
  -- Get the "below" value according to current definition of "uhf_Interval" family (Vxe, Vbe, Vbx).
  -- Horizon definition may define a local "below".
  -- QUESTION 2021-02-09 (CK01) : changer le type de retour pour "uhf_Vxe_Point" ?
  --  2022-10-04 (LL01) : non, un "point" ne peut être un intervalle (même un Vxe).
return
  "UHF"."min"();

create domain "uhf_Interval_Vxe" as
  "Interval"
  check ("iBegin"(value) = "uhf_below"());
comment on domain "uhf_Interval_Vxe" is
  'UHF valid interval undetermined in the past';

create function "uhf_beyond"
  (
  )
  returns "Point"
  immutable strict
  -- Get the "beyond" value according to current definition of "uhf_Interval" family (Vxe, Vbe, Vbx).
  -- Horizon definition may define a local "beyond".
  -- QUESTION 2021-02-09 (CK01) : changer le type de retour pour "uhf_Vbx_Point" ?
  --  2022-10-04 (LL01) : non, un "point" ne peut être un intervalle (même un Vbx).
return
  "UHF"."max"();

create domain "uhf_Interval_Vbx" as
  "Interval"
  check ("iEnd"(value) = "uhf_beyond"());
comment on domain "uhf_Interval_Vbx" is
  'UHF valid interval undetermined in the future';

create function "uhf_first"
  (
  )
  returns "Point"
  immutable strict
  -- The first defined point.
  -- FIXED 2022-08-02 (LL01), 2022-02-09 (LL01) : ne pas faire coïncider first et below.
return
  "UHF"."succ"("uhf_below"());

create function "uhf_last"
  (
  )
  returns "Point"
  immutable strict
  -- The last defined point.
  -- FIXED 2022-08-02 (LL01), 2022-02-09 (LL01) : ne pas faire coïncider last et beyond.
return
  "UHF"."pred"("uhf_beyond"());

create function "uhf_pred"
  (
    "p" "Point"
  )
  returns "Point"
  immutable strict
return
  case
    when "uhf_first"() < "p" and "p" <= "uhf_last"() then
      "UHF"."pred"("p")
--  else « automatically »
--    raise exception
  end;

create function "uhf_succ"
  (
    "p" "Point"
  )
  returns "Point"
  immutable strict
return
  case
    when "uhf_first"() <= "p" and "p" < "uhf_last"() then
      "UHF"."succ"("p")
--  else « automatically »
--    raise exception
  end;

--
-- Interval functions - constructors
--

create function "uhf_interval"
  (
    b "Point", e "Point"
  )
  returns "Interval"
  immutable strict
return
  "UHF"."interval_cons"(b, e);
comment on function "uhf_interval"("Point", "Point") is
  'UHF closed interval constructor';

-- Intervalle «minimal» en regard de la relation d’ordre total
create function "uhf_interval_min"() returns "Interval"
  immutable strict parallel safe
return
  "UHF"."interval_cons"("uhf_first"(), "uhf_first"());

-- Intervalle «maximal» en regard de la relation d’ordre total
create function "uhf_interval_max"() returns "Interval"
  immutable strict parallel safe
return
  "UHF"."interval_cons"("uhf_last"(), "uhf_last"());

create function "uhf_interval_bx"
-- TOPROMOTE 2022-03-27 (LL01) : en lieu et place de Interval("uhf_Vbx_Point")
  (
    b "Point"
  )
  returns "Interval"
  immutable strict
return
  "UHF"."interval_cons"(b, "uhf_beyond"());
comment on function "uhf_interval_bx"("Point") is
  'UHF open end interval constructor';

create function "uhf_interval_xe"
-- TOPROMOTE 2022-03-27 (LL01) : en lieu et place de Interval("uhf_Vxe_Point")
  (
    e "Point"
  )
  returns "Interval"
  immutable strict
return
  "UHF"."interval_cons"("uhf_below"(), e);
comment on function "uhf_interval_xe"("Point") is
  'UHF open begin interval constructor';

--
-- Other interval constructors
--

create function "uhf_interval_ts"
(
    b timestamp , e timestamp
)
    returns TSRANGE
    immutable strict
return
    TSRANGE(b, e);
comment on function "uhf_interval_ts"(b timestamp , e timestamp) is
    'UHF closed timestamp contructor';

create function "uhf_interval_date"
(
    b DATE , e DATE
)
    returns daterange
    immutable strict
return
    daterange(b, e);
comment on function "uhf_interval_date"(b DATE , e DATE) is
    'UHF closed date contructor';

--
-- "Interval" functions - properties
--

create function "uhf_begin"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict
return
  "UHF"."iBegin"("i");

create function "uhf_end"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict
return
  "UHF"."iEnd"("i");

create function "uhf_card"
  (
    i "Interval"
  )
  returns bigint
  immutable strict
return
  case
    when not ("uhf_begin"("i")<="uhf_below"() or "uhf_end"("i")>="uhf_beyond"()) then
      "UHF"."card" ("i")
    -- else null, donc exception si on utilise Cardinal plutôt que Bigint :-)
  end;

create function "uhf_ante"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict
  -- DONE 2020-02-16 : raise error if ante is undefined of if the result is < first();
  --  * [23502] ERROR: domain "Point" does not allow null values
return
  "uhf_pred"("uhf_begin"("i"));

create function "uhf_post"
  (
    i "Interval"
  )
  returns "Point"
  immutable strict
  -- DONE 2020-02-16 : raise error if post is undefined or if the result is > last();
  --  * [23502] ERROR: domain "Point" does not allow null values
return
  "uhf_succ"("uhf_end"("i"));

--
-- Fonctions «set of "Point"» provenant du segment UHF_Base_Ens-Setof
--

create function "uhf_unfold"
  (
    "a" "Point", b "Point"
  )
  returns setof "Point"
  immutable strict
return
  "UHF"."unfold" ("a", "b");

create function "uhf_unfold"
  (
    "i" "Interval"
  )
  returns setof "Point"
  immutable strict
return
  "UHF"."unfold"("i");

-- Special case for Vbx point.
create function "uhf_unfold_bx"
  (
    "a" "Point"
  )
  returns setof "Point"
  immutable strict
return
  "UHF"."unfold"("a"::"Point", "uhf_last"());

-- Special case for Vxe point.
create function "uhf_unfold_xe"
  (
    "a" "Point"
  )
  returns setof "Point"
  immutable strict
return
  "UHF"."unfold"("uhf_first"(), "a"::"Point");

--
-- Fonctions «set of "Interval"» provenant du segment UHF_Base_Ens-Setof
--

create function "uhf_unfold_si"
  (
    "a" "Point", b "Point"
  )
  returns setof "Interval"
  immutable strict
return
  "UHF"."unfold_si" ("a", "b");

create function "uhf_unfold_si"
  (
    "i" "Interval"
  )
  returns setof "Interval"
  immutable strict
return
  "UHF"."unfold_si"("i");

-- Special case for Vbx point.
create function "uhf_unfold_bx_si"
  (
    "a" "Point"
  )
  returns setof "Interval"
  immutable strict
return
  "UHF"."unfold_si"("a"::"Point", "uhf_last"());

-- Special case for Vxe point.
create function "uhf_unfold_xe_si"
  (
    "a" "Point"
  )
  returns setof "Interval"
  immutable strict
return
  "UHF"."unfold_si"("uhf_first"(), "a"::"Point");

/*
============================================================================== Z
UHF.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
