#!/bin/zsh
# ============================================================================ A
# UHF-base_build.sh
# ---------------------------------------------------------------------------- A
# Produit : UHF
# Fonction du script : Ajouter le schéma mettant en oeuvre UHF à une base de données ciblée.
# Version : 2026-06-21
# Statut : préliminaire
# Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
# Plateforme : PostgreSQL 14 à 16
# Projet : Metis_UHF_2024-1
# Responsable : Christina.Khnaisser@USherbrooke.ca
# ============================================================================ A
# 
# ========= Paramètres 
hote="localhost"
port=5432
bdc=uhf
schema=uhf
rep_source=lib/uhf-base/src
#
while getopts "a:b:c:h:p:r:s:t:v:" opt;
do
  case "${opt}" in
    b) bdc=${OPTARG};;
    h) hote=${OPTARG};;
    p) port=${OPTARG};;
    *) echo "usage: $0 -b -h -p" >&2
       echo "-b bdc "${bdc}" : nom de la base de données ciblée (BDC) - doit préexister" >&2
       echo "-h hote "${hote}": adresse (url) du serveur ciblé (hostname)" >&2
       echo "-p port "${port}" : numéro du port desservi par le SGBD" >&2
       exit 1 ;;
  esac
done
#  --------- Création de la BD
echo "*** Création de la BD ($(date +"%Y-%m-%d %H:%M:%S"))"
psql -h "${hote}" -p "${port}" -d "${bdc}" -v m="${rep_source}" <<EOF
\conninfo
\i :m/UHF-db-user_cre.sql
EOF
#  --------- Définition du module
echo "*** DÉBUT de la définition du module ($(date +"%Y-%m-%d %H:%M:%S"))"
psql -h "${hote}" -p "${port}" -d "uhf" -v s="${schema}" -v m="${rep_source}" <<EOF
set schema :'s' ;
\conninfo
\i :m/UHF.ini.sql
\i :m/UHF_Point.pub.sql
\i :m/UHF_Interval.pub.sql
\i :m/UHF_Allen.pub.sql
\i :m/UHF_Allen_doc.pub.sql
\i :m/UHF_Conv_Timepoint.pub.sql
\i :m/UHF_Conv_Timestamp.pub.sql
\i :m/UHF_Conv_Date.pub.sql
\i :m/UHF_Conv_Time.pub.sql
\i :m/UHF_Ens_Multi.pub.sql
\i :m/UHF_Ens_Setof.pub.sql
\i :m/UHF_Ens_Array.pub.sql
\i :m/UHF.pub.sql
\i :m/UHF_Configuration.sql
EOF
echo "*** FIN de la définition du module ($(date +"%Y-%m-%d %H:%M:%S"))"
echo " "
# ============================================================================ Z
# UHF-base_build.sh
# ---------------------------------------------------------------------------- Z
# Contributeurs, droits, copyright, licences... : README.adoc
# ============================================================================ Z