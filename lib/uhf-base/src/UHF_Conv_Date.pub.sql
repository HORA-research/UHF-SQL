/*
============================================================================== A
UHF_Conv_Date.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Fonctions de conversion UHF : Point <--> Date.
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2022-09-05
Statut : en cours de développement
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14
============================================================================== A
*/

--
-- Date
--

create function "gra_Date"
  (
    g "Granularite"
  )
  returns Boolean
  immutable strict parallel safe
return
  g in ('Y', 'D');

create function "conv_P2D"
  (
    "p" "Point",
    "a" Date,
    "g" "Granularite"
  )
  returns Date
  -- Retourne la date correspondant au point "p" de granularité "g" relativement
  -- à la date de référence "a"
  immutable strict parallel safe
return
  case "g"
    when 'D' then "a" + "p"::Integer
    when 'Y' then make_date(extract (year from "a")::Integer, 1, 1) + "p"::Integer
  end;

create function "conv_D2P"
  (
    d Date,
    a Date,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
  -- Retourne le point (de granularité "g" relativement à la date de référence "a")
  -- correspondant la date "d"
return
  case "g"
    when 'D' then "d" - "a"
    when 'Y' then extract(year from "d") - extract(year from "a")
  end;

create function "conv_P2D"
  (
    p "Point",
    g "Granularite"
  )
  returns Date
  immutable strict parallel safe
  -- retourne la date correspondant au point "p" de granularité "g" relativement
  -- à la date de référence de PostgreSQL ('4713-01-01 BC').
return
  "conv_P2D"(p, Date '4713-01-01 BC', g) ;
  --  case "g"
  --    when 'D' then "p"::Date -- ne fonctionne pas, car il n'y a pas de cast d'entier vers date !!!
  --    when 'Y' then make_date("p"::Integer, 1, 1)
  --  end;

create function "conv_D2P"
  (
    d Date,
    g "Granularite"
  )
  returns "Point"
  immutable strict parallel safe
  -- retourne le point (de granularité "g" relativement à la date de référence de PostgreSQL ('4713-01-01 BC'))
  -- correspondant la date "d"
return
  "conv_D2P"(d, Date '4713-01-01 BC', g) ;
  --  case "g"
  --    when 'D' then "d"::"Point" -- ne fonctionne pas, car il n'y a pas de cast de date vers entier !!!
  --    when 'Y' then extract(year from "d")
  --  end;

/*
============================================================================== Z
UHF_Conv_Date.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences... : voir UHF.ini.sql
============================================================================== Z
*/
