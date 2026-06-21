/*
============================================================================== A
UHF_Conv_Timepoint.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Fonctions de conversion UHF : Point <--> TimePoint.
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

--
-- Timepoint
--

create domain "Granularite" as
  Char
  check (value in ('Y', 'D', 'H', 'M', 'S', '1', '2', '3', '4', '5', '6'));

/* inutile
create function "nus" (g "Granularite") returns bigint
  -- nombre d’unité de temps (du SI) par seconde
  immutable strict parallel safe
return
  case g
    when 'S' then       1::bigint
    when '1' then      10::bigint
    when '2' then     100::bigint
    when '3' then    1000::bigint
    when '4' then   10000::bigint
    when '5' then  100000::bigint
    when '6' then 1000000::bigint
  end ;
*/

create function "nus_julien" (g "Granularite") returns Numeric
  -- nombre d’unités (du calendrier julien) par seconde
  immutable strict parallel safe
return
  case g
    when 'Y' then       1::Numeric / (60::Numeric * 60::Numeric * 24::Numeric * 365.25::Numeric)
    when 'D' then       1::Numeric / (60::Numeric * 60::Numeric * 24::Numeric)
    when 'H' then       1::Numeric / (60::Numeric * 60::Numeric)
    when 'M' then       1::Numeric / (60::Numeric)
    when 'S' then       1::Numeric
    when '1' then      10::Numeric
    when '2' then     100::Numeric
    when '3' then    1000::Numeric
    when '4' then   10000::Numeric
    when '5' then  100000::Numeric
    when '6' then 1000000::Numeric
  end ;

--
-- Timepoint
--

create domain "Timepoint" as
  -- à raffiner
  Text;

create function "conv_TP2Text"
  (
    p "Timepoint",
    g "Granularite"
  )
  returns Text
  immutable strict parallel safe
return
  -- TODO conv_TP2Text
  '1970-01-01 00:00:00';

create function "conv_Text2TP"
  (
    p Text,
    g "Granularite"
  )
  returns "Timepoint"
  immutable strict parallel safe
return
  -- TODO conv_Text2TP
  '1970-01-01 00:00:00';

create function "gra_Timepoint"
  (
    g "Granularite"
  )
  returns Boolean
  immutable strict parallel safe
return
  case "UHF"."TRIP" ()
    when 2 then  false
    when 4 then  g in ('D', 'H', 'M', 'S', '1', '2', '3')
    when 8 then  g in ('D', 'H', 'M', 'S', '1', '2', '3', '4', '5', '6')
  end ;

create function "conv_P2TP"
  (
    p "Point",
    a Timestamp,
    g "Granularite"
  )
  returns "Timepoint"
  immutable strict parallel safe
return
  -- TODO conv_P2TP
  '1970-01-01';

create function "conv_TP2P"
  (
    t "Timepoint",
    a Timestamp,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
return
  -- TODO conv_TP2P
  0;

create function "conv_P2TP"
  (
    p "Point",
    g "Granularite"
  )
  returns "Timepoint"
  immutable strict parallel safe
return
  "conv_P2TP" (p, Timestamp '1970-01-01 12:00:00', g);

create function "conv_TP2P"
  (
    t "Timepoint",
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
return
  "conv_TP2P" (t, Timestamp '1970-01-01 12:00:00', g);

/*
============================================================================== Z
UHF_Conv_Timepoint.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
