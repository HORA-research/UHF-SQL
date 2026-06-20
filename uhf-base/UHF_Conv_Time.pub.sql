/*
============================================================================== A
UHF_Conv_Time.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Fonctions de conversion UHF : Point <--> Time.
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

--
-- Time
--

create function "gra_Time"
  (
    g "Granularite"
  )
  returns Boolean
  immutable strict parallel safe
return
  case "UHF"."TRIP" ()
    when 2 then  g in ('H', 'M')
    when 4 then  g in ('H', 'M', 'S', '1', '2', '3', '4')
    when 8 then  g in ('H', 'M', 'S', '1', '2', '3', '4', '5', '6')
  end ;

create function "conv_P2T"
  (
    p "Point",
    g "Granularite"
  )
  returns Time
  immutable strict parallel safe
return
  -- DONE 2022-09-16 (RL01) : conv_P2T
  case "g"
    when 'S' then '00:00' + "p"::Integer * INTERVAL '1 seconds'::TIME
    when 'M' then '00:00' + "p"::Integer * INTERVAL '1 minutes'::TIME
    when 'H' then '00:00' + "p"::Integer * INTERVAL '1 hours'::TIME
  -- TODO 2022-09-18 (LL01) : traiter aussi les granularités inférieures à la seconde, voir gra_Time
  end;


create function "conv_T2P"
  (
    t Time,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
return
  -- DONE 2022-09-16 (RL01) : conv_T2P
 case "g"
    when 'S' then (extract(hours from t) * 3600 ) + extract(minutes from t) * 60 + extract(seconds from t)
    when 'M' then (extract(hours from t) * 60 ) + extract(minutes from t)
    when 'H' then extract(hours from t)
-- TODO 2022-09-18 (LL01) : traiter aussi les granularité inférieur à la seconde, voir gra_Time
 end;

/*
============================================================================== Z
UHF_Conv_Timepoint.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
