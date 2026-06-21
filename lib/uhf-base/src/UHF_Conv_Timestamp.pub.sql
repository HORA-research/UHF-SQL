/*
============================================================================== A
UHF_Conv_Timestamp.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Fonctions de conversion UHF : Point <--> Timestamp.
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

--
-- Timestamp
--

create function "gra_Timestamp"
  (
    g "Granularite"
  )
  returns Boolean
  immutable strict parallel safe
return
  case "UHF"."TRIP" ()
    when 2 then  false
    when 4 then  g in ('D')
    when 8 then  g in ('D', 'H', 'M', 'S', '1', '2', '3', '4', '5', '6')
  end ;

create function "conv_P2TS"
  (
    p "Point",
    a Date,
    g "Granularite"
  )
  returns Timestamp
  immutable strict parallel safe
  -- retourne le timestamp correspondant au point "p" de granularité "g" relativement
  -- à la date de référence "a".
language plpgsql as
$$
declare
  m numeric ;
  e numeric ;
  f numeric ;
begin
  -- PATCHED 2022-07-24 (LL01) Contournement de la fonction to_timestamp.
  --   PostgreSQL v 14
  --   La fonction to_timestamp est imprécise pour granularité < 10**-4 s.
  --   de sorte que la mise en oeuvre suivante est erronée :
  --     return to_timestamp (cast(p as numeric) / "UHF_CPS" (g)) ;
  --   La mise en oeuvre suivante permet de contourner ce problème :
  m := (extract(epoch from a)+cast(p as numeric)) / "nus_julien"(g);
  e := round(m, 0) ;
  f := m - e;
  return to_timestamp(e) + make_interval (secs => f) ;
end;
$$;

create function "conv_TS2P"
  (
    t Timestamp with time zone,
    a Date,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
  -- retourne le point (de granularité "g" relativement à la date de référence "a"")
  -- correspondant au timestamp "t".
return
  cast(round((extract(epoch from t)-extract(epoch from a)) * "nus_julien"(g)) as "Point") ;

create function "conv_P2TS"
  (
    p "Point",
    g "Granularite"
  )
  returns Timestamp
  immutable strict parallel safe
  -- retourne le timestamp correspondant au point "p" de granularité "g" relativement
  -- à la date de référence de PostgreSQL.
language plpgsql as
$$
declare
  m numeric ;
  e numeric ;
  f numeric ;
begin
  -- PATCHED 2022-07-24 (LL01) Contournement de la fonction to_timestamp.
  --   PostgreSQL v 14
  --   La fonction to_timestamp est imprécise pour granularité < 10**-4 s.
  --   de sorte que la mise en oeuvre suivante est erronée :
  --     return to_timestamp (cast(p as numeric) / "UHF_CPS" (g)) ;
  --   La mise en oeuvre suivante permet de contourner ce problème :
  m := cast(p as numeric) / "nus_julien"(g);
  e := round(m, 0) ;
  f := m - e;
  return to_timestamp(e) + make_interval (secs => f) ;
end;
$$;

create function "conv_TS2P"
  (
    t Timestamp with time zone,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
  -- retourne le point (de granularité "g" relativement à la date de référence de PostgreSQL)
  -- correspondant au timestamp "t".
return
  cast(round(extract(epoch from t) * "nus_julien"(g)) as "Point") ;

/*
============================================================================== Z
UHF_Conv_Timestamp.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences... : voir UHF.ini.sql
============================================================================== Z
*/
