/*
============================================================================== A
UHF_Allen.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Allen's utility functions
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

/*
.Notes de mise en oeuvre
* All functions are based on "UHF"."Interval".
* All PostgreSQL functions (and operators) used to implement Allen's functions
  assume that the internal representation model is [closed-open).
* All UHF functions (and operators)
  assume that the internal representation model is [closed-closed].

.Rappels

   |--------------------------------------------------------------|
   | s  | Allen      | UFH                       | alias          |
   |----+------------+---------------------------+----------------|
   | <  | before     | before                    |                |
   | m  | meets      | meets_before              |                |
   | o  | overlaps   | overlaps_before           |                |
   | s  | starts     | starts                    |                |
   | d  | during     | bi_strictly_includes      | during ?       |
   | f  | finishes   | finishes                  |                |
   | =  | equals     | equals                    |                |
   | fi | finishes-1 | finishes_inv              |                |
   | di | during-1   | bi_strictly_includes_inv  | during_inv ?   |
   | si | starts-1   | starts_inv                |                |
   | oi | overlaps-1 | overlaps_before_inv       | overlaps_after |
   | mi | meets-1    | meets_before_inv          | meets_after    |
   | >  | before-1   | before_inv                | after          |
   | -------------------------------------------------------------|

   |----------------------------------------------------------------|
   | s     | Allen's equivalent             | UHF                   |
   |-------+--------------------------------+-----------------------|
   | p=q   |             =                  | p = p                 |
   | p≠q   | < m o s d f   fi di si oi mi > | p <> q                |
   | p⊆q   |       s d f =                  | includes              |
   | p⊇q   |             = fi di si         | includes_inv          |
   | p⊂q   |       s d f                    | strictly_includes     |
   | p⊃q   |               fi di si         | strictly_includes_inv |
   | p∩q≠∅ |     o s d f = fi di si oi      | overlaps              |
   | p∩q=∅ | < m                       mi > | not overlaps          |
   |       |   m                       mi   | meets                 | *??* meets_sym
   |       |   m o s d f = fi di si oi mi   | merges                |
   |       |     o                  oi      | strictly_overlaps     | *??* overlaps_sym
   |-------+--------------------------------+-----------------------|----------------------|
   |       | < m o s d                      | strictly_ends_before  | last(p) < last(q)    |
   |       | < m o s d f =                  | ends_before           | last(p) <= last(q)   |
   |       |                  di si oi mi > | strictly_begins_after | first(p) > first(q)  |
   |       |             = fi di si oi mi > | begins_after          | first(p) >= first(q) |
   |----------------------------------------------------------------|----------------------|

  Pour l'ordre total, on définit
    inf(p,q)    == (first(p)<first(q)) or (first(p)=first(q) and last(p)<last(q))
  et corolairement
    inf_eq(p,q) == inf(p,q) or (p=q)
    sup(p,q)    == not inf_eq(p,q)
    sup_eq(p,q) == not inf(p,q)

.References
  Allen, James F. (1983)
  "Maintaining Knowledge About Temporal Intervals".
  Commun. ACM 26, nᵒ 11, pp 832‑843. https://doi.org/10.1145/182.358434.

.A faire
  * PATCHED 2022-08-08 (LL01) Corriger pour prendre en compte la représentation «[]» ?
    - LL01 : Impraticable - tant que la représentation interne est celle de
      PostgreSQL et que cette dernière est «[)». À revoir quand on définira
      nos propres types avec RANGE.

  * TODO 2022-08-08 (LL01) Utiliser les opérateurs d'intervalle pour profiter des index GiST ?
    - CK01 : en partie le 2022-09-05.
    - LL01 : à completer; faire les trois variantes (A, G, M) pour tous les opérateurs.

  * TODO 2022-08-08 (LL01) Changer les identificateurs de variables d'intervalles
    - (p, q) -> (i1, i2) ; mettre entre délimiteurs.

  * TODO 2024-03-26 (LL01) La plupart de ces fonctions ne sont-elles par « leakproof » ?
    - Ne faudrait-il pas l'indiquer explicitement ?
    - Voir la discussion « Row Level Security − leakproof-ness and performance implications »
      amorcée par Pierre Ducroquet :
      *** https://www.postgresql.org/message-id/2811772.0XtDgEdalL@peanuts2
    - Pour l'ensemble d'UHF, adopter la politique stricte énoncé par Tom xxx
      (leakproof est réservé aux seules fonctions ne pouvant en aucun cas
      détourner une information, ce qui exclus donc toute fonction qui pourrait
      lancer une exception («signgaleur une erreur») directement ou indirectement.

*/

-- Identification de la variante de mise en oeuvre
create function "VFI"
  (
  )
  returns Text
  immutable strict parallel safe
return
  /* FORA */  'A : Arithmétique entière';
  -- FORG --  'G : Fonctions GiST';
  -- FORM --  'M : Macros GiST';
comment on function "VFI" () is
  'Variante de la mise en oeuvre des fonctions d’Allen';

--
-- Allen's base
--

-- <
create function "before"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.t < q.b
  /* FORA */ return upper("p") < lower("q");
  -- FORG -- return "p" << "q" ;
  -- FORM -- language sql as 'select "p" << "q";';

-- m
create function "meets_before"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.t = q.b
return
  upper("p") = lower("q");

-- o
create function "overlaps_before"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b<q.b AND p.t>q.b AND p.t<q.t
return
  lower("p") < lower("q") and upper("p") > lower("q") and upper("p") < upper("q");

-- s
create function "starts"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b=p.b AND p.t<q.t
return
  lower("p") = lower("q") and upper("p") < upper("q");

-- d
create function "bi_strictly_includes"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b<p.b AND p.t<q.t
return
  lower("q") < lower("p") and upper("p") < upper("q");

create function "during"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- alias bi_strictly_includes
return
  "bi_strictly_includes"("p","q");

-- f
create function "finishes"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b<p.b AND p.t=q.t
return
  lower("q") < lower("p") and upper("p") = upper("q");

-- =
create function "equals"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b=p.b AND p.t=q.t

  /* FORA */ return lower("q") = lower("p") and upper("p") = upper("q");
  -- FORG -- return "p" = "q" ;
  -- FORM -- language sql as 'select "p" = "q";';

create function "non_equals"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  /* FORA */ return lower("q") <> lower("p") or upper("p") <> upper("q");
  -- FORG -- return "p" <> "q" ;
  -- FORM -- language sql as 'select "p" <> "q";' ;

-- fi
create function "finishes_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b<q.b AND q.t=p.t
return
  lower("p") < lower("q") and upper("p") = upper("q");

-- di
create function "bi_strictly_includes_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b<q.b AND q.t<p.t
return
  lower("p") < lower("q") and upper("q") < upper("p");

create function "during_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- alias bi_strictly_includes_inv
return
  "bi_strictly_includes_inv"("p","q");

-- si
create function "starts_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b=q.b AND q.t<p.t
return
  lower("p") = lower("q") and upper("q") < upper("p");

-- oi
create function "overlaps_before_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b<p.b AND q.t>p.b AND q.t<b.t
return
  lower("p") < lower("q") and upper("q") > lower("p") and upper("q") < upper("p");

create function "overlaps_after"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- alias overlaps_before_inv
return
  "overlaps_before_inv"("p", "q");

-- mi
create function "meets_before_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b = q.t
return
  lower("p") = upper("q");

create function "meets_after"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- alias meets_before_inv
return
  "meets_before_inv"("p", "q");

-- >
create function "before_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b > q.t
  /* FORA */ return lower("p") > upper("q");
  -- FORG -- return "p" >> "q" ;
  -- FORM -- language sql as 'select "p" >> "q";';

create function "after"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- alias before_inv
return
  "before_inv"("p", "q");

--
-- Set base
--

-- appartenance
-- p ∊ i
create function "in"(
  "p" "Point", "i" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  /* FORA */ return lower("i") <= "p" and "p" <= upper("i");
  -- PATCHED 2022-08-08 (LL01) La coercition de type est requise pour une raison inexpliquée
  --   Bien que le type "p" (Point) soit équivalent à int4 (resp. int8),
  --   il n'est pas compatible le type des bornes de int4range (resp. int8range)
  --   Or le mécanisme de variation ne considère qu'une seule variable à la fois
  --   dans ce cas-ci, soit INT, soit FOR. Par ailleurs, il faut remarquer
  --   la compatibilité est assurée, pour le même opérateur, entre deux points...
  --   alors l'opérateur n’est défini que pour int4 et int8... par pour Point ;
  --   -- voir également la fonction "includes" ci-après.
  --   ;-)
  --   Il faut donc corriger manuellement la ligne suivante selon la représentation utilisée
  --
  -- FORG -- return "p"::int8 <@ "i" ;
  -- FORM -- language sql as 'select "p"::int8 <@ "i";' ;

-- p⊆q
-- s d f =
create function "includes"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- q.b≤p.b ∧ p.e≤q.e
  /* FORA */ return lower("q") <= lower("p") and upper("p") <= upper("q");
  -- FORG -- return "p" <@ "q" ;
  -- FORM -- language sql as 'select "p" <@ "q";' ;

-- p⊇q
-- = fi di si
create function "includes_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b≤q.b ∧ q.t≤p.t
  /* FORA */ return lower("p") <= lower("q") and upper("q") <= upper("p");
  -- FORG -- return "p" @> "q" ;
  -- FORM -- language sql as 'select "p" @> "q";' ;

-- p⊂q
-- s d f
create function "strictly_includes"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- (q.b≤p.b ∧ p.t<q.t) ∨ (q.b<p.b ∧ p.t≤q.t)
return
      (lower("q") <= lower("p") and upper("p") < upper("q"))
  or  (lower("q") < lower("p") and upper("p") <= upper("q"));

-- p⊃q
-- si di fi
create function "strictly_includes_inv"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- (p.b≤q.b ∧ q.t<p.t) ∨ (p.b<q.b ∧ q.t≤p.t)
return
      (lower("p") <= lower("q") and upper("q") < upper("p"))
  or  (lower("p") < lower("q") and upper("q") <= upper("p"));

--
-- Combined operators
--

-- p overlaps q
-- o s d f = fi di si oi
create function "overlaps"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b<q.t ∧ q.b<p.t
  /* FORA */ return lower("p") < upper("q") and lower("q") < upper("p");
  -- FORG -- return "p" && "q" ;
  -- FORM -- language sql as 'select "p" && "q";' ;

-- p non_overlaps q
-- < m mi >
create function "non_overlaps"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b>=q.t ∨ q.b>=p.t
return
  lower("p") >= upper("q") or lower("q") >= upper("p");

-- p meets q
-- m mi
create function "meets"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b<q.t ∧ q.b<p.t
  /* FORA */ return (lower("p") = upper("q")) or (lower("q") = upper("p"));
  -- FORG -- return "p" -|- "q" ;
  -- FORM -- language sql as 'select "p" -|- "q";' ;

-- p merges q
-- m o s d f = fi di si oi mi
create function "merges"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- meets or overlaps
  /* FORA */ return     (lower("p") < upper("q") and lower("q") < upper("p"))
  /* FORA */         or (lower("p") = upper("q")) or (lower("q") = upper("p"));
  -- FORG -- return  "p" -|- "q" or "p" && "q";
  -- FORM -- language sql as 'select "p" -|- "q" or "p" && "q"; ';

-- p strictly_overlaps q
-- o oi
create function "strictly_overlaps"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- overlaps_before or overlaps_before_inv
return
      lower("p") < lower("q")
  and upper("p") < upper("q")
  and (upper("p") > lower("q") or upper("q") > lower("p"));

--
-- Autres opérateurs (?)
-- TODO 2022-07-29 (LL01) Faire d'autres combinaisons remarquables des opérateurs d'Allen
--

-- <, m
create function "before_or_meet"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.t < q.b
  /* FORA */ return upper("p") <= lower("q");
  -- FORG -- return "p" << "q";
  -- FORM -- language sql as 'select "p" << "q";' ;

-- >, mi
create function "after_or_meet"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  -- p.b >= q.t
  /* FORA */ return lower("p") >= upper("q");
  -- FORG -- return "p" >> "q" ;
  -- FORM -- language sql as 'select "p" >> "q";' ;

-- < m o s d f =
-- p ne termine pas après q
-- p ends not after q, p not extends to the right of q
create function "ends_not_after"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  /* FORA */ return upper("p") <= upper("q");
  -- FORG -- return "p" &< "q" ;
  -- FORM -- language sql as 'select "p" &< "q";' ;

-- =  fi di si oi mi >
-- p ne débute pas avant q
-- p begins not before q, p not extends to the left of q,
create function "begins_not_before"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
  /* FORA */ return upper("p") >= upper("q");
  -- FORG -- return "p" &> "q" ;
  -- FORM -- language sql as 'select  "p" &> "q";' ;

--
-- Ordre total
--

create function "inf"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
return
      (lower("p") < lower("q"))
  or  (lower("p") = lower("q") and upper("p") < upper("q")) ;

create function "inf_eq"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
return
      (lower("p") < lower("q"))
  or  (lower("p") = lower("q") and upper("p") <= upper("q")) ;

create function "sup"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
return
  not "inf_eq"(p,q) ;

create function "sup_eq"(
  "p" "Interval", "q" "Interval"
)
  returns Boolean
  immutable strict parallel safe
return
   not "inf"(p,q) ;

-- Intervalle «minimal» en regard de la relation d'ordre total définie antérieurement
create function "interval_min"() returns "Interval"
  immutable strict parallel safe
return
  "interval_cons"("min"(), "min"());

-- Intervalle «maximal» en regard de la relation d'ordre total définie antérieurement
create function "interval_max"() returns "Interval"
  immutable strict parallel safe
return
  "interval_cons"("max"(), "max"());

/*
============================================================================== Z
UHF_Allen.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
