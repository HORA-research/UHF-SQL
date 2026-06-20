# UHF-SQL

UHF-SQL est un générateur de schémas relationnels historicisés en SQL.
Il permet de transformer automatiquement un schéma non historicisé en un schéma historicisé selon différents modèles temporels.

Le logiciel supporte trois modèles configurables :

* UHF (Unified-Historization Framework)

* BCDM (Bitemporal Conceptual Data Model)

* DDLM (Date Darwen Lorentzos temporal data Model)

Il prend en charge les catégories temporelles :

* Valid Time (V)

* Transaction Time (T)

* Bitemporal (VT)

## Environnement

UHF-SQL est développé en Java (compatible avec Java 17) avec des libraires externes:

* [PostgreSQL 14+](https://www.postgresql.org)
* [SchemaCrawler](https://www.schemacrawler.com)
* [JGraphT](https://jgrapht.org)
* [ANTLR](https://www.antlr.org)
* [jOOQ](https://www.jooq.org)
* [JUnit Jupiter](https://junit.org)
* [Testcontainers PostgreSQL](https://java.testcontainers.org/modules/databases/postgres)

### Entrées

L'application prend en entrée un fichier de configuration avec des paramètres
de connexion à la base de données et des paramètres d'historicisation :

* Les informations de connexion à une base de données.
* Le modèle temporel souhaité (UHF / BCDM / DDLM).
* La catégorie temporelle souhaitée du schéma historicisé (V / T / VT).
* La personne responsable du schéma généré.
* La version du schéma généré.
* La génération des partitions Vxx ou pas.
* L'exécution des scripts directement dans la base de données ou non.
* Le mode de mise en oeuvre du schéma historicisé (soit physique ou virtuel ou les deux) = (create table ou vue)
* Si virtuel, définir les dépendances fonctionnelles temporelles
* Répertoire de sortie des scripts générés.

### Sorties

L'application génère un ensemble de scripts pour le schéma historicisé :

* La création du schéma.
* la création des domaines .
* La création des tables.
* La création des contraintes liées aux anomalies temporelles.
* La création des vues historicisées à partir des partitions temporelles.
* La création des vues historicisées à partir des dépendances fonctionnelles temporelles.
* La création des vues associées aux anomalies temporelles.
* La création des fonctions de vérifications des anomalies temporelles.
* La suppression des domaines et des tables.

## Utilisation client

Les pré-requis:

* Une base de données sur PostgreSQL.
* Java 14+ installé.

Les étapes :

1. Télécharger l'exécutable.
2. Dans un terminal taper: java -jar uhf-sql-0.2.0.jar chemin-vers-fichier-config.

## Utilisation développeurs

Les pré-requis:

* IDE avec support java.
* Une base de données sur PostgreSQL contenant la librarie UHF-base.
* Java 14+ installé.

Les étapes :

1. Télécharger le zip ou cloner le dépôt.
2. Construire l'exécutable java avec gradle (build).
3. Modifier selon la configuration au besoin (src/test/resources/test-data/configuration/config.yaml).
4. Diriger vous dans le dossier build/libs.
5. Dans un terminal exécuter:
   `java -jar uhf-sql-0.2.0-SNAPSHOT.jar src/test/resources/test-data/configuration/config.yaml`


## Responsables et collaborateurs

Pour plus d'information contacter: <br>
Christina Khnaisser : Christina.Khnaisser@usherbrooke.ca <br>

Collaborateurs :
Luc Lavoie      : Luc.Lavoie@usherbrooke.ca <br>
Rémi Letourneau : Remi.Letourneau@usherbrooke.ca <br>
Maiva Schela Magnifouet Zefack : maiva.schela.magnifouet.zefack@usherbrooke.ca <br>
Sonia Rykiel Toukam : sonia.rykiel.toukam@usherbrooke.ca <br>
Zeineb Zaiet : Zeineb.Zaiet@usherbrooke.ca

## Références

Khnaisser, Christina, Hind Hamrouni, David B. Blumenthal, Anton Dignös, et Johann Gamper. « Querying
Temporal Anomalies
in Healthcare Information Systems and Beyond ». In Advances in Databases and Information Systems,
édité par Silvia
Chiusano, Tania Cerquitelli, et Robert Wrembel, 13389:209‑22. Lecture Notes in Computer Science.
Cham: Springer
International Publishing, (2022).
https://doi.org/10.1007/978-3-031-15740-0_16.

Khnaisser, Christina. « Construction de modèles de données relationnels temporalisés guidée par les
ontologies ».
Université de Paris cotutelle Université de Sherbrooke, (2019).
https://savoirs.usherbrooke.ca/handle/11143/16329.

Khnaisser, Christina, Luc Lavoie, Anita Burgun, et Jean-François Ethier. « Past Indeterminacy in
Data Warehouse Design
». In Database and Expert Systems Applications, 90‑100. Lecture Notes in Computer Science. Springer,
Cham, (2017).
https://doi.org/10.1007/978-3-319-64471-4_9.

Christina Khnaisser, Hind Hamrouni, David B. Blumenthal, Anton Dignös et Johann Gamper. « Efficiently Labeling and Retrieving Temporal Anomalies
in Relational Databases ». Information Systems Frontiers, 1-25.
https://doi.org/10.1007/s10796-024-10495-w

### Copyright et licenses

Copyright 2016-{localyear}, [GRIIS](https://griis.ca/en)
HORA (Interdisciplinary Research Group in Health Informatics)<br>
Faculté des sciences et Faculté de médecine et sciences de la santé <br>
Université de Sherbrooke (Québec) J1K 2R1 <br>
CANADA

La licence du code :
[LILIQ-R+ version 1.1](https://forge.gouv.qc.ca/licence/en/liliq-v1-1/#strong-reciprocity-liliq-r)

La licence de la documentation :
[Creative Common CC BY SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode)
