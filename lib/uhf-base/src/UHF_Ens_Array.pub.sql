/*
============================================================================== A
UHF_Ens_Array.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Mise en oeuvre des ensembles d’intervalles - partie spécifique aux arrays
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

--
-- Fonctions utilitaires (internes?)
--

create function "identical"
  (_s1 "Interval"[], _s2 "Interval"[])
  returns Boolean
  immutable strict parallel safe
  -- En assumant que ce sont des ensembles et que les éléments sont dans le même ordre
  -- vérifier que les éléments sont identiques deux à deux

language plpgsql as
$$
declare
  _n1 Bigint := cardinality(_s1);
  _n2 Bigint := cardinality(_s2);
begin
  /*
  if  _s1 is null or _s2 is null then
    call "GRIIS_Base"."Manifest" ('Aie ! Intervalle annulable', true);
    return _s1 is null and _s2 is null ;
  end if;
  */
  if _n1 <> _n2 then
    return false ;
  else
    for i in 1 .. _n1
    loop
      if _s1[i] <> _s2[i] then
        return false;
      end if;
    end loop;
    return true;
  end if;
end
$$;

--
-- Fonctions d’agrégation (union, intersection, fold, unfold...)
--

-- ========================== Interval UNION
-- On retourne ici l’ensemble des intervalles maximaux résultant de l’union.
-- C’est donc la même chose que fold!
--

-- QUESTION 2022-08-06 (LL01) Que faut-il retourner quand _s est "vide" [union] ?
--  * un tableau vide
--    (ce qui me semble le moins inadéquat et qui est fait ici)
--  * un tableau contenant un élément, cet élément étant "intervalle0"() ?
--    (ce qui était fait dans la version précédente)
-- TOFIX 2021-??-?? (CK01) Empêcher la génération de null si le tableau contient des nulls !
--  * Est-ce avéré (LL) ?
--  * Test à faire (LL) !

create function "iUnion_func"
  (
    _s "UHF"."Interval"[]
  )
  returns "UHF"."Interval"[]
  immutable strict parallel safe
language plpgsql as
$$
declare
  _current "UHF"."Interval" := "UHF"."interval_min"();
  _next "UHF"."Interval" := "UHF"."interval_min"(); -- curieux qu’on doive le pré-déclarer, n’est pas le rôle du «for» ?
  _res "UHF"."Interval"[];
  _n Bigint := cardinality(_s);
  _first Boolean := true;
begin
  if _n <= 1 then
    -- _s est vide si _n = 0, _s est déjà la bonne réponse si _n = 1
    return _s ;
  else
    -- Il est inutile d’aller chercher la valeur minimale du tableau au cout
    -- d’un parcours préalable à la boucle qui, lors de son initialisation,
    -- fait le tri et place cette valeur minimale en position initiale.
    -- TOIMPROVE 2022-08-06 (LL01) : Étudier la possibilité de faire et de conserver
    --    le résultat du tri antérieurement à l’amorce de la boucle, un petit gain
    --    pourrait être obtenu (un test scalaire en moins par itération).
    for _next in select unnest(_s) as x order by x
    loop
      --raise notice 'union: _current0: %', _current;
      --raise notice 'union: _next0: %', _next;
      if _first then
        _current := _next ;
        _first := false ; -- c’est pas joli, mais moins couteux
      -- TODO 2024-03-26 (LL01) : quel est le cout de l'appel de fonction selon
      --    que la fonction utilise la variante A, G ou M ? Voir UHF_Allen.pub.sql.
      --    Quel est le cout induit par l'appel de fonction lui-même ?
      --    Voir UHF_Ens_Array_iUnion_old.pub.sql.
      elsif "UHF"."merges"(_current, _next) then
        _current := _current + _next;
        --raise notice 'union: _current+:%', _current;
      else
        _res := array_append(_res, _current);
        --raise notice 'union: _res:%', _res;
        _current := _next;
        --raise notice 'union: _current_reset:%', _current;
      end if;
    end loop;
    _res := array_append(_res, _current);
    --raise notice 'union: _current_result:%', _res;
    return _res;
  end if;
end
$$;

drop aggregate if exists "iUnion_agg" ("UHF"."Interval") cascade  ;
create aggregate "iUnion_agg" ("UHF"."Interval") (
  stype = "UHF"."Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = "iUnion_func"
  );

-- ========================== Interval DIFFERENCE
--
-- La différence n’étant ni commutative ni association, l’ordre d’évaluation
-- est déterminant et il est peu vraisemblable que des fonctions d’agréation
-- soient utiles.

-- ========================== Interval INTERSECTION
-- The interval intersection is the set of all elements that belong to all intervals.
--

-- QUESTION 2022-08-06 (LL01) Que faut-il retourner quand _s est "vide" [intersection] ?
--  * un tableau vide
--    (ce qui me semble le moins inadéquat et qui est fait ici)
--  * un tableau contenant un élément, cet élément étant "interval_min"() ?
--    (ce qui était fait dans la version précédente)
create function "iIntersection_func"
  (
    _s "UHF"."Interval"[]
  )
  returns "UHF"."Interval"[]
  immutable strict parallel safe
language plpgsql as
$$
declare
  _current "UHF"."Interval" := "UHF"."interval_min"();
  _next "UHF"."Interval" := "UHF"."interval_min"(); -- curieux qu’on doive le pré-déclarer, n’est pas le rôle du «for» ?
  _n Bigint := cardinality(_s);
  _first Boolean := true;
begin
  if _n <= 1 then
    return _s ; -- _s est vide si _n = 0, _s est déjà la bonne réponse si _n = 1
  else
    -- Il est inutile d’aller chercher la valeur minimale du tableau au cout d’un tri O(_n log(_n)).
    -- Il est préférable de traiter l’initialisation au sein de la boucle à un cout O(n).
    -- TOIMPROVE 2022-08-06 (LL01) : Étudier s’il est possible de conserver le résultat tri
    --  * antérieurement à l’amorce de la boucle, un petit gain pourrait être obtenu
    --    (un test scalaire en moins par itération)
    for _next in select unnest(_s) as x order by x
    loop
      --raise notice 'inter: _current0: %', _current;
      --raise notice 'inter: _next0: %', _next;
      if _first then
        _current := _next ;
        _first := false ; -- c’est pas joli, mais bien moins couteux qu’un tri
      elsif "UHF"."overlaps"(_current, _next) then
        _current := _current * _next;
        --raise notice 'inter: _current+:%', _current;
      else -- Exit
        -- raise notice 'inter: Exit - intersection empty';
        return ARRAY[]::"UHF"."Interval"[];
      end if;
    end loop;
    --raise notice 'inter: _result: %', _current::"Interval"[];
    return ARRAY[_current]::"UHF"."Interval"[];
  end if;
end;
$$;

drop aggregate if exists "iIntersection_agg" ("UHF"."Interval") cascade  ;
create aggregate "iIntersection_agg" ("UHF"."Interval") (
  stype = "UHF"."Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = "iIntersection_func"
  );

-- ========================== Interval MIN (iMin)
-- On retourne ici le plus petit interval
--

create function "iMin_func"
  (
    _current "UHF"."Interval", _next "UHF"."Interval"
  )
  returns "UHF"."Interval"
  immutable strict parallel safe
return
  case
    when "sup" (_current, _next)
      then _next
      else _current
  end ;

drop aggregate if exists "iMin_agg" ("UHF"."Interval") cascade;
create aggregate "iMin_agg" ("UHF"."Interval") (
            stype = "UHF"."Interval",
  --INTG--  initcond = "UHF"."interval_max"(),
  --INT2--  initcond = '[32766,32767)',
  /*INT4*/  initcond = '[2147483646,2147483647)',
  --INT8--  initcond = '[9223372036854775806,9223372036854775807)',
            sfunc = "iMin_func"
          --finalfunc = aucune
  );

-- ========================== Interval MAX (iMax)
-- On retourne ici le plus grand interval
--

create function "iMax_func"
  (
    _current "UHF"."Interval", _next "UHF"."Interval"
  )
  returns "UHF"."Interval"
  immutable strict parallel safe
return
  case
    when "inf" (_current, _next)
      then _next
      else _current
  end ;

drop aggregate if exists "iMax_agg" ("UHF"."Interval") cascade  ;
create aggregate "iMax_agg" ("UHF"."Interval") (
            stype = "UHF"."Interval",
  --INTG--  initcond = "UHF"."interval_min"(),
  --INT2--  initcond = '[-32768,-32767)',
  /*INT4*/  initcond = '[-2147483648,-2147483647)',
  --INT8--  initcond = '[-9223372036854775808,-9223372036854775807)',
            sfunc = "iMax_func"
          --finalfunc = aucune
  );

--
-- Fonctions utilitaires utilisant les précédentes
--

-- equals
create function "equals"
  (_s1 "Interval"[], _s2 "Interval"[])
  returns Boolean
  -- En assumant rien du tout, déterminer si les deux ensembles contiennent les mêmes point
  -- Attention, une fonction d’agrégation peut retourner un null !
  immutable strict parallel safe
return "identical" (
  -- Les coalesce ne sont plus nécessaires !
  -- (select coalesce (iUnion_agg(x), ARRAY[]::"Interval"[]) from unnest(_s1) as S(x)),
  -- (select coalesce (iUnion_agg(x), ARRAY[]::"Interval"[]) from unnest(_s2) as S(x))
  (select "iUnion_agg"(x) from unnest(_s1) as S(x)),
  (select "iUnion_agg"(x) from unnest(_s2) as S(x))
  );

--  fold
-- TODO 2022-08-07 (CK01) fold a small portion of the intervals fold_since, fold_until, fold_during ?
-- TODO 2022-08-07 (CK01) handle folding on multiple granularity ?
create function "fold_func"
  (
    _s "Interval"[]
  )
  returns "Interval"[]
  immutable strict parallel safe
return
  "iUnion_func"(_s) ;

drop aggregate if exists "fold" ("Interval")  ;
create aggregate "fold" ("Interval") (
  stype = "Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = "fold_func"
  );

/*
x0x0x0x0x0x0x0x0x0

--
-- Extension to Allen’s functions : iGAP
-- QUESTION 2022-08-05 (LL01) iGAP : Qu’est-ce que c’est supposé calculer au juste ?
-- ANSWER 2022-08-06 (CK01) récupère les intervals manquants pour obtenir la compacité.
--  Soit i1 = [4,6] et i2 = [2,8], iGap retourne : [2,3] et [7,8].
create function "iGap"(i1 "Interval", i2 "Interval")
  returns "Interval"[]
  immutable strict parallel safe
return
  case
    when "before"(i1, i2) or "after"(i1, i2) or "meets"(i1, i2) or "meets_before"(i1, i2)
     then array [i2]
    when "starts"(i1, i2) or "starts_inv"(i1, i2)
     then array ["interval_cons"(least("iEnd"(i1), "iEnd"(i2)), greatest("iEnd"(i1), "iEnd"(i2)))]
    when "finishes"(i1, i2) or "finishes_inv"(i1, i2) or "overlaps_after"(i1, i2)
     then array ["interval_cons"("least"("iBegin"(i1), "iBegin"(i2)), "pred"(greatest("iBegin"(i1), "iBegin"(i2))))]
    when "bi_strictly_includes"(i1, i2) or "bi_strictly_includes_inv"(i1, i2)
     then array ["interval_cons"("least"("iBegin"(i1), "iBegin"(i2)), "pred"(greatest("iBegin"(i1), "iBegin"(i2))))
                ,"interval_cons"("succ"(least("iEnd"(i1), "iEnd"(i2))), greatest("iEnd"(i1), "iEnd"(i2)))]
    when "overlaps_before"(i1, i2)
     then array ["interval_cons"("succ"(least("iEnd"(i1), "iEnd"(i2))), greatest("iEnd"(i1), "iEnd"(i2)))]
  end;

create function igap_func(
  "Interval"[]
)
  returns "Interval"[]
  language plpgsql
  immutable strict parallel safe
as
$$
declare
  _i       int;
  _current "Interval" := "interval_min"();
  _next    "Interval" := "interval_min"();
  _gap     "Interval"[];
  _gap_inv "Interval"[];
  _temp    "Interval"[];
  _res     "Interval"[];
begin
  -- raise notice 'range[]: %', $1;
  _temp = $1;
  -- Get first element of the array
  _current := (select x from unnest($1) x limit 1);
  -- Get array cardinality
  _i := cardinality($1);
  while _i > 1
    loop
      --raise notice '_current: %', _current;
      _temp := array_remove(_temp, _current);
      foreach _next in array _temp
        loop
          --raise notice '_next: %', _next;
          _gap := igap(_next, _current);
          --raise notice 'gap(next, current): %', _gap;
          _res := array_cat(_res, _gap);
          _gap_inv := igap(_current, _next);
          --raise notice 'gap(current, next): %', _gap_inv;
          if not _gap = _gap_inv then
            _res := array_cat(_res, _gap_inv);
          end if;
          --raise notice '_res: %', _res;
        end loop;
      _current := _next;
      _i := _i - 1;
    end loop;
  return _res;
end
$$;
-- Get the "total" difference between multiple intervals
create aggregate igap_agg ("Interval") (
  stype = "Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = igap_func
  );

x0x0x0x0x0x0x0x0x0
*/


/*
La fonction "equals" telle qu’elle avait été programmée initialement, à savoir
ainsi :

create function "equals_old"
  (_s1 "Interval"[], _s2 "Interval"[])
  returns Boolean
  -- En assumant rien du tout, déterminer si les deux ensembles contiennent les mêmes point
  immutable strict parallel safe
return "identical" (
    (select iUnion_agg(x) from unnest(_s1) as S(x)),
    (select iUnion_agg(x) from unnest(_s2) as S(x))
    );

ne fonctionne pas si on compare des tableaux vides, car les fonctions d’agrégation
retourne null au lieu d’un tableau vide dans certaines circonstances alors que,
pourtant, leur type de retour prescrit explicitement que la valeur null ne peut
être retournée.

Le test suivant permet d’illustrer cela :

.Test
====
create function test_isnull (ir "Interval"[]) returns Boolean
return ir is null ;

create function test_card (ir "Interval"[]) returns BigInt
return cardinality (ir) ;

create function test_agg (ir "Interval"[]) returns "Interval"[]
  return (select iUnion_agg(x) from unnest(ir) as S(x)) ;

with TQ (v) as (
  values
    (ARRAY[]::"Interval"[]),
    (null::"Interval"[]),
    (test_agg(ARRAY[]::"Interval"[])),
    (coalesce(test_agg(ARRAY[]::"Interval"[]), ARRAY[]::"Interval"[]))
    )
select v, cardinality(v) , test_card(v), v is null, test_isnull(v)
from TQ;
====

Maudit null, il faut qu’ils en mettent partant! À bas les null! :-)

La solution temporaire est donc la suivante :

.Solution
====
create function "equals"
  (_s1 "Interval"[], _s2 "Interval"[])
  returns Boolean
  -- En assumant rien du tout, déterminer si les deux ensembles contiennent les mêmes point
  -- Attention, une fonction d’agrégation peut retourner un null !
  immutable strict parallel safe
return "identical" (
  (select coalesce (iUnion_agg(x), ARRAY[]::"Interval"[]) from unnest(_s1) as S(x)),
  (select coalesce (iUnion_agg(x), ARRAY[]::"Interval"[]) from unnest(_s2) as S(x))
  );
====

-- FIXED 2022-08-06 (LL01), 2022-08-06 (LL01) Modifier les fonctions d’agrégation pour qu’elles ne retournent pas de null
    Exposé
    * C’est à la fonction de le faire, sinon il faut le faire à chaque appel !!!
    * Une voie de solution pourrait être de fournir une fonction sfunc adaptée
      (il se pourrait que le problème provienne de array_append qui retournerait
       incorrectement null dans certaines circonstances).
    * Il se peut aussi que ce soit l’initialisation de l’agrégation elle-même qui
      soit à null plutôt qu’à ARRAY[].
    Solution
    * lors de la définition de l’agrégat, initialiser la variable d’état ainsi :
      -   initcond = '{}',

.Autres considérations
* Afin de détecter ce genre d’erreur au plus tôt, il est très important de munir
  les types d’UHF de la contrainte «not null» et de contraindre les fonctions
  immuables par «immutable strict».
*/

/*
============================================================================== Z
UHF_Ens_Array.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF_def.sql
============================================================================== Z
*/
