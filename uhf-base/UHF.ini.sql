/*
////
============================================================================== A
UHF.ini.sql
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

////
== Unified Historicization Framework (UHF)

.Présentation de UHF

[.purple]
*!!! À compléter !!!*

.Organisation du module

Le module est divisé en trois parties principales :

* UHF_Base comprend tout ce qui appartient aux domaines des points et des intervalles,
  y compris l'algèbre d’Allen.
* UHF_Conv comprend tout ce qui a trait à l’interprétation des points et des intervalles
  en regard du temps, en particulier les fonctions de conversion vers des types temporels
  standards (Date, Time, Timestamp) ou particuliers (Timepoint).
* UHF_Spec comprend tout ce qui est spécifique au modèle UHF.

=== UHF_Base

La mise en oeuvre efficiente d’UHF impose le recours à des éléments variant
syntaxiquement ou sémantiquement d’un dialecte SQL à un autre. Le rôle du
module UHF_Base est de factoriser tous ces éléments de façon à rendre le
reste du code du module UHF aussi indépendant du dialecte que possible.

En raison des problèmes rencontrés lors de l’utilisation du constructeur de types
RANGE [1], nous avons reporté la généralisation amorcée dans nos travaux antérieurs
et avons développé différentes versions du module UHF_Base, chacune spécifique
à un des types discrets initialement envisagés sur la seule base des représentations
internes entières disponibles en PostgreSQL.

Le plan consiste à programmer ces versions spécifiques tout en limitant le plus
possible le code spécifique, en l’isolant et en maximisant le code commun
(ce sont les "variantes").

À terme, quatre variantes sont envisagées :

 * entier sur deux octets (int2, int2range, int2multirange),
 * entier sur quatre octets (int4, int4range, int4multirange),
 * entier sur huit octets (int8, int8range, int8multirange),
 * entier sur seize octets (intG, intGrange, intGmultirange) avec granularité,

.Exemples
  TODO 2022-07-31 (LL01) : Exemples d’utilisation d’UHF_Base
  À venir

.Limitations
Dans un premier temps, seules les variantes int4 et int8 ont été mises en oeuvre.

.Notes
. Notamment les restrictions relatives aux fonctions internes requises au
  moment de la définition du TYPE, telle la fonction _canonical_.

=== UHF_Conv

La présente mise en oeuvre d’UHF repose sur une base unique utilisant des
entiers de quatre ou huit octets comme représentation interne du point.
La flexibilité de représentation est obtenue en convertissant en entrée
les valeurs du type ciblé en "Point" et en sortie les valeurs de "Point"
en valeurs du type ciblé.

À terme, grâce à des fonctions de conversion, les types ciblés suivants sont
envisagés :

 * Time avec granularité dans {'H', 'M', 'S', '1', '2', '3', '4', '5', '6'}
 * Date avec granularité dans {'Y', 'D'}
 * Timestamp avec granularité dans l’une des granularités précédentes.
 * Timepoint avec granularité dans l’une des granularités précédentes ainsi que {'7', '8', '9'}.

Le type Timepoint correspond au temps universel non coordonné tel qu’utilisé
en astronomie. Les trois autres types sont les types prédéfinis de SQL.

Les granularités offertes dépendent cependant de la représentation interne.
Par exemple, lorsque UHF_Base utilise int4 pour le représentation interne,
le choix de granularité des Timestamp est limitée à {'Y', 'D'} et celui des
Timepoint à {'D', 'H', 'M', 'S'}.

En conclusion, à terme, il sera possible de générer un schéma "UHF" selon l’une des
quatre représentations internes disponibles, au sein desquelles il sera possible
d’interpréter les points (et donc les intervalles) selon l’un des quatre types
prévus, à une granularité applicable (selon le type et la représentation interne).

.Notes de mise en oeuvre
Lorsque l’heure est prise en compte dans un "Point" temporel, elle est toujours
exprimée en termes du méridien de référence et donc du fuseau horaire UTC (+0000).
Que ce soit pour les types SQL comme pour ceux définis par UHF.

Il appartient donc à l’utilisateur du module de transposer, s’il le désire, les
valeurs en fonction du fuseau horaire de son choix et de les conserver, au besoin,
dans les types SQL idoines («time with time zone» et «timestamp with time zone»).

=== UHF_Spec

[.purple]
*!!! À récrire !!!*

La partie spécifique est essentiellement regroupée dans la partie UHF.pub
Afin de bien marquer cette spécificité, les identificateurs associés aux
éléments spécifiques (types et routines) débutent par le préfixe «uhf_».

=== Structure du module

[cols="2,6"]
[.small]
|===
| nom actuel | commentaire

| UHF.ini.sql
| La documentation du module et la création du schéma qui lui est associé.

| UHF.pub.sql
| UHF_Spec.

| UHF_Point.pub.sql
| UHF_Base : les définitions associés au point.

| UHF_Interval.pub.sql
| UHF_Base : les définitions associés à l'intervalle.

| UHF_Allen.pub.sql
| UFH_Base : les définitions associées à l'algèbre d’Allen.

| UHF_Allen_doc.pub.sql
| UFH_Base : la documentation de l'algèbre d’Allen sous forme de tables exploitables.

| UHF_Ens_Array.pub.sql
| UFH_Base : mise en oeuvre de fonctions sur les ensembles d'intervalles à l'aide de «"Interval"[]».

| UHF_Ens_Multi.pub.sql
| UFH_Base : mise en oeuvre de fonctions sur les ensembles d'intervalles à l'aide de «multirange».

| UHF_Ens_Setof.pub.sql
| UFH_Base : mise en oeuvre de fonctions sur les ensembles d'intervalles à l'aide de «setof "Interval"».

| UHF_Ens_Table.pub.sql
| UFH_Base : mise en oeuvre à venir... si utile (en fonction des dialectes SQL).

| UHF_Conv_Timestamp.pub.sql
| UFH_Conv : conversion Point <--> Timepoint.

| UHF_Conv_Date.pub.sql
| UFH_Conv : conversion Point <--> Date.

| UHF_Conv_Timestamp.pub.sql
| UFH_Conv : conversion Point <--> Timestamp.

| UHF_Conv_Time.pub.sql
| UFH_Conv : conversion Point <--> Time _(à venir... si utile)_
|===

=== Notes de mise en oeuvre

[.purple]
*!!! Revoir cette section à la lumière du Rapport de recherche !!!*


* Il ne semble pas y avoir de spécification explicite permettant de distinguer
  les bornes infinies (+/- infinity) et non bornées (NULL?) même si les résultats
  suivants pourraient le laisser supposer.
  On y constate notamment que l'intervalle [NULL,NULL) comprend l'intervalle
  [-infinity,+infinity) !

//include::../test/PostgreSQL/PostgreSQL_intervalle_op_inf.sql[indent=2]
----
-- TIMESTAMP WITH TIME ZONE
SELECT tstzrange(NULL, NULL); -- (,)
SELECT tstzrange('-infinity','+infinity'); -- [-infinity,infinity)
SELECT tstzrange('-infinity','+infinity') =  tstzrange(NULL, NULL); -- false
SELECT tstzrange('-infinity','+infinity') && tstzrange(NULL, NULL); -- true
SELECT tstzrange('-infinity','+infinity') <@ tstzrange(NULL, NULL); -- true
SELECT tstzrange('-infinity','+infinity') @> tstzrange(NULL, NULL); -- false
SELECT tstzrange('-infinity','+infinity') -  tstzrange(NULL, NULL); -- empty
SELECT tstzrange(NULL, NULL) - tstzrange('-infinity','+infinity'); -- [22000]
  -- ERROR: result of range difference would not be contiguous

-- INT8
-- -infinity et +infinity ne sont pas des int8
SELECT int8range(NULL, NULL) ; -- (,)
SELECT int8range(-9223372036854775808,+9223372036854775807); -- [-9223372036854775808,9223372036854775807)
SELECT int8range(-9223372036854775808,+9223372036854775807) =  int8range(NULL, NULL); -- false
SELECT int8range(-9223372036854775808,+9223372036854775807) && int8range(NULL, NULL); -- true
SELECT int8range(-9223372036854775808,+9223372036854775807) <@ int8range(NULL, NULL); -- true
SELECT int8range(-9223372036854775808,+9223372036854775807) @> int8range(NULL, NULL); -- false
SELECT int8range(-9223372036854775808,+9223372036854775807) -  int8range(NULL, NULL); -- empty
SELECT int8range(NULL, NULL) - int8range(-9223372036854775808,+9223372036854775807); -- [22000] ERROR:
  -- result of range difference would not be contiguous

select 9223372036854775807 <@ int8range(-9223372036854775808,+9223372036854775807); -- false
select 9223372036854775807 <@ int8range(NULL, NULL); -- true
----

* En conséquence, il a été décidé de ne pas tirer parti de ces propriétés de
  la représentation proposée par PostgreSQL et de les définir indépendamment
  dans la mise en oeuvre d'UHF.

* Soit X le type associé au type Point et Y le type de la représentation choisie
  pour X, il a été décidé de ne pas
  utiliser de valeurs nulles ni de valeurs «infinies» (désormais considérées hors
  modèle — pour ne pas dire illégitimes) et de contraindre les valeurs légitimes
  à un suite finie de points contigus (compris entre «first» et «last» inclusivement).
  Il nous apparait toutefois prudent de réserver des représentations spécifiques
  pour les dépassements qui pourraient survenir en cours de calcul :
  - «en deça» (below) et
  - «au-delà» (beyond).

* Proposition 1
    - soient min et max, respectivement la plus petite et la plus grande valeur
      de la représentation utilisée pour le Point ;

    min(Y) ≤ below(X) < first(X) <                             last(X) < beyond(X) ≤ max(Y)
    min(Y) ≤ below(X) < first(X) < first(X)+1 … ≤ first(X)+k = last(X) < beyond(X) ≤ max(Y)

    - où k est le nombre de points distincts, minimalement 2 (first et last) ;
    - il faut cependant pouvoir dénoter les dépassements (below et beyond) ;
    - donc, minimalement, quatre valeurs below(X), first(X), last(X), beyond(X)
      forcément distinctes doivent pouvoir être représentées ;

* Soit le type INT2 associé aux entiers relatifs (Z) sur deux octets et
  le type CARD2 associé aux entiers naturels N~≥0~ sur deux octets

* Proposition 1, exemple avec k=2 :

    REPR  min(Y) ≤ below(X) < first(X) < first(X)+1 … ≤ first(X)+k = last(X) < beyond(X) ≤ max(Y)
    INT2  -32768 ≤ -3       < -2       < -1         … ≤ -1         = 1       < 2         ≤ 32767
    CARD2      0 ≤ 0        < 1        < 2          … ≤ 2          = 2       < 3         ≤ 65535

* Proposition 1, exemple avec k=65533

    REPR  min(Y) ≤ below(X) < first(X) < first(X)+1 … ≤ first(X)+k = last(X) < beyond(X) ≤ max(Y)
    INT2  -32768 ≤ -32768   < -32767   < -32766     … ≤ 32766      = 32766   < 32767     ≤ 32767
    CARD2      0 ≤      0   <      1   <      2     … ≤ 65534      = 65534   < 65535     ≤ 65535

* Proposition 2
    - le nombre minimal de points est porté à 3 afin d’ajouter une «origine»
      (first < origin < last) ;

    min(Y) ≤ below(X) < first(X) < first(X)+1 … ≤ first(X)+m = origine(X)
      < origine(X)+1 … ≤ origine(X)+n = last (X) < beyond(X) ≤ max(Y)

    - où m est le nombre de points précédant l'origine et n le nombre de point lui succédant ;
    - corolaire : m et n sont positifs (supérieurs ou égaux à 1) et k=m+n+1 ;
    - corolaire : les cinq valeurs below(x), first(X), origin(X), last(x),
      beyond(X) sont forcément distinctes.

* Lorsque les points seront utilisés pour définir les intervalles, il sera pratique
  de pouvoir dénoter *au niveau de la représentation* l'absence d'un point.
  Une des options possibles consiste à réserver une représentation pour cela.
  Nous proposons d'utiliser min(Y), ce qui nous emmène à la proposition 3.

* Proposition 3, exemple avec k=65532

    REPR  min(Y) = missing(Y) < below(X) < first(X) < … origine(X) … ≤  last(X) < beyond(X) = max(Y)
    INT2  -32768 =     -32768 <   -32767 <   -32766 < …          0 … <    32766 <     32767 = 32767
    CARD2      0 =          0 <        1 <        2 < …      32766 … <    65534 <     65535 = 65535

* Notons que
  - aucune fonction n'est définie sur missing, autre que le test de missing (is_missing).
  - pred n'est pas défini pour below, first et beyond ;
  - succ n'est pas définie pour below, last et beyond.

* Par ailleurs, en plus des espaces «au-delà» et «en deça», ne serait-il pas
  utile d’introduire les concepts «par là-bas dehors» et «par là-haut dedans»
  (si chers aux Dignois) ?
  _À méditer_. :-)

== Représentations internes et variantes

De façon à maintenir une source unique pour les trois types d’entiers de PostgreSQL
(int2, int4 et int8) ainsi que pour le représentation à granularité variable intG,
nous avons préfixé toutes les lignes qui dépendent de la représentation interne
par le commentaire codé idoine.

  -- INT2 -- instruction pour int2
  -- INT4 -- instruction pour int4
  -- INT8 -- instruction pour int8
  -- INTG -- instruction pour intG

Pour obtenir une version propre à une taille particulière, il suffit donc de
transformer le commentaire associé au type désiré de façon à rétablir
l’exécution de la suite de la ligne. Par exemple, pour activer la solution
utilisant les entiers de quatre octets :

  -- INT2 -- instruction pour int2
  /* INT4 */ instruction pour int4
  -- INT8 -- instruction pour int8
  -- INTG -- instruction pour intG

.TODO 2022-03-21 (LL01) : Trouver le moyen de définir de nouveaux types RANGE.
  * à vérifier dans la version 16
////
*/

/*
============================================================================== Y
////
.TODO
                               À REVISER
             Set_of_Interval, Interval[] ou Setof Interval

.QUESTION 2022-03-28 (LL01) : Quand doit-on utiliser «Setof "Point"» et «Setof "Interval"» ?
  * Ce n’est pas la même chose, mais parfois les deux peuvent être utilisés
    (quand on est certain que les "Interval" sont des singletons).
    Par ailleurs, je ne connais pas l’incidence sur la performance.
    Merci d’en clarifier l’usage.
  * Idem entre «Setof "Interval"», «Array "Interval"» et «"Set_of_Interval"»
  * La mise en oeuvre de «"Set_of_Interval"» par un multirange de PostgreSQL
    est trompeuse, car le multirange est une liste, pas un ensemble, voir
    https://www.postgresql.org/docs/current/rangetypes.html
      - «A multirange is an ordered list of non-contiguous, non-empty, non-null ranges.»
      - Ce qui explique sans doute pourquoi l’opération d’égalité n’est pas définie…

.QUESTION 2022-08-01 (CK01) : Pourquoi dis-tu que l’égalité n’est pas définie ?
  * Réponse 2022-08-02 (LL01) :
    Parce que l’ordre est significatif dans une liste et qu’il n’y a pas d’ordre
    total naturel dans les intervalles (aucun des opérateurs d’Allen n’est
    un ordre total). En relisant la section, je constate cependant que PostgreSQL
    a inventé un ordre total, voir https://www.postgresql.org/docs/current/functions-range.html
    - «The comparison operators order first by the range lower bounds, and only if
       those are equal do they compare the upper bounds. The multirange operators
       compare each range until one is unequal. This does not usually result in
       a useful overall ordering, but the operators are provided to allow unique
       indexes to be constructed on ranges.»
    - Les opérateurs de comparaison usuels seraient donc définis, et l’égalité aussi.
      Cela augmente grandement l’utilité des multirange. Super !!!
  * Réponse 2024-07-17 (LL01)
    Après consultation de la documentation de la version 16, le flou persiste quant à savoir
    si l’opérateur d’égalité est défini pour les multirange, voir
    - section 8.17 (https://www.postgresql.org/docs/current/rangetypes.html)
      «Every range type has a corresponding multirange type.
       A multirange is an ordered list of non-contiguous, non-empty, non-null ranges.
       Most range operators also work on multiranges, and they have a few functions of their own.»
    - section 9.2, après le tableau 9.1 (https://www.postgresql.org/docs/current/functions-comparison.html)
      «These comparison operators are available for all built-in data types that
       have a natural ordering, including numeric, string, and date/time types.
       In addition, arrays, composite types, and ranges can be compared if their
       component data types are comparable.»
       Le type multirange n’est pas inclus explicitement (alors que range l’est).
       De plus, sa fonction d’ordonnancement étant décrite comme «not usually result in
       a useful overall ordering» est-elle considérée comme «naturelle» ?
    - section 9.20 (https://www.postgresql.org/docs/current/functions-range.html)
      Most range operators also work on multiranges, and they have a few functions of their own.

.QUESTION 2022-08-02 (LL01) : Pourquoi, quand et comment ?
  1. Est-ce vraiment nécessaire ? Une de ces représentations ne sort-elle vraiment
     pas du lot ? Laquelle est la plus performante ?
  2. Aucune de ces représentations n’est totalement transportable vers un autre
     dialecte ? Laquelle l’est le plus ?
  3. Si nous devons en maintenir plus d’une, comment prévoyons-nous gérer les
     conversions entre les représentations ? Ne seront-elles pas couteuses ?

.ANALYSE
  * La question 1 est une question interne à PostgreSQL, elle peut se résoudre
    par l’expérimentation en utilisant le mécanisme des variantes que nous
    avons utilisé pour les représentations internes. Nous pourrons ainsi
    déterminer, entre autres, si une des représentations est plus avantageuse.
    Par laquelle commente-t-on ?
  * On remarque que la question des variantes sera un peu plus complexe, car
    la variation ne peut s’encapsuler dans un type dans le cas du Setof et du
    tableau []. Il faut néanmoins approfondir la question, une façon de faire
    m’a peut-être échappée (après tout, je n’ai pas trop suivi l’évolution du
    dialecte de ce côté).
  * La question 2 devra se résoudre par une implantation différente de
    UHF_Base pour un langage différent (ce qui veut donc dire qu’il faut virer
    ces fonctions, du moins certaines d’entre elles dans UHF_Base). Encore
    une fois la non-encapsulation des variations dans un type nous compliquera
    la vie.
  * Cette question d’encapsulation par le type nous pousse fortement à utiliser
    les multirange pour une première version.

.TODO 2022-08-02 (LL01) Mettre en oeuvre une première version des fonctions de
                        gestion des ensembles d’intervalles.
  [x] Préserver déjà le code existant dans des fichiers (variantes) distincts
      selon chacune des trois représentations.
  [ ] Dégager l’interface désirée (la liste des fonctions que chacune des trois
      variations devra mettre en oeuvre).
  [ ] Choisir une première représentation.
  [ ] Transposer et adapter le code existant.
  [ ] Tester la validité ET les performances.
////
============================================================================== Y
*/

-- Création du schéma associé
drop schema if exists "UHF" cascade;
create schema "UHF";
comment on schema "UHF" is $$
Définition du Unified Historicization Framework (UHF).
$$;

-- Établissement du schéma de référence
set schema 'UHF' ;

-- Ajout l’extension GiST à la BD courante
create extension if not exists "btree_gist";

/*
============================================================================== Z
UHF.ini.sql
------------------------------------------------------------------------------ Z
Contributeurs
  (CK01) Christina.Khnaisser@USherbrooke.ca
  (LL01) Luc.Lavoie@USherbrooke.ca

Droits, licences et adresses
  Copyright 2020-...,
  Le code est sous licence
    LILIQ-R 1.1 (https://forge.gouv.qc.ca/licence/liliq-v1-1/).
  La documentation est sous licence
    CC-BY 4.0 (https://creativecommons.org/licenses/by/4.0/).

  Μῆτις (Groupe Metis)
  Faculté des sciences
  http://info.usherbrooke.ca/llavoie/

  Université de Sherbrooke
  Sherbrooke (Québec)  J1K 2R1
  Canada

////
== Carnet de commandes

.TODO 2022-10-05 (CK01) TU : cas limites null à ajouter
  * TU : Cas limites null à traiter
    (utiliser _strict_ pour systématiser et lever l'exception?)
.TODO 2022-10-05 (CK01) fold : agrégation de points
  * fold : agrégation de points

== Tâches projetées

.TODO 2022-08-15 (LL01) Revoir la dénomination des fonctions
  * le polymorphisme ne fonctionne pas toujours, notamment en regard du résultat
  * établir une politique uniforme à cet égard et l'appliquer

.TODO 2022-08-02 (LL01) : Définir et utiliser des types Naturel et Cardinal non null
  * Pour s'assurer qu'une fonction lance une exception en cas d'indéfinition,
    il suffit, le type de la valeur de retour étant déclarer non nul, de retourner
    justement un null. Cet artifice est abondamment utilisé dans UHF, par contre
    nous avons fréquemment utiliser les types entiers prédéfinis qui n'ont pas
    cette propriété. Un petit ménage s'impose.

.QUESTION 2022-07-26 (LL01) : L’ajout d'une extension se fait dans le schéma courant.
  * Est-ce normal ?
  * Le cas échéant, faudra-t-il l’ajouter dans tous les schémas utilisant UHF ?
  * CK01 : Oui !
    - L'extension est crée dans le schéma courant.
    - Tous les modules qui gère la temporalité doivent passer par UHF_Base.
  * LL01 : Aie !
    - S'il y a 12 schémas dans la BD utilisant UHF, l'extension sera-t-elle
      importée 12 fois et le code présent en 12 exemplaires ?
    - Je dois aller relire la description des extensions ;
      je croyais que c'était une propriété de la BD et non du schéma.

.QUESTION 2022-08-01 (LL01) Quelle dénomination pour les analogues ?.
  * Les fonctions du module UHF_Base ont, par la force des choses, un analogue
    dans le module UHF. Parfois les analogues portent le même nom (succ, resp. uhf_succ) et
    parfois non (interval_cons resp. Interval). Cela suscite de la confusion.
    D'autant plus que certaines fonctions proches (mais pas analogues) ont
    volontairement des noms différents (min et uhf_first).
  * Ne vaudrait-il pas mieux dénommer identiquement tous les analogues ?

.QUESTION 2022-03-20 (LL01) : Non-fiabilité de «create or replace aggregate» (CRA)
  * Lorsqu’exécutées individuellement, les commandes CRA ont l’effet désiré.
    Lorsqu’elles font partie d’une séquence de plusieurs commandes, elles sont
    ignorées. Pourquoi?

.QUESTION 2022-03-20 (LL01) : Où sont les types range dans le catalogue?
  * Les types définis comme des range (et leur multirange correspondant) ne semblent
    pas apparaitre dans le catalogue de la BD, ni dans celui du schéma — du moins
    si on se fie à DataGrip. Où sont-ils? Une conséquence est le fait qu’il ne soit
    pas possible de les détruire (drop). Sont-ils seulement modifiables (alter)?

.QUESTION 2022-03-20 (LL01) : Setof RANGE et multirange.
  * Pourquoi PostgresSQL a-t-il introduit un nouveau générateur de type (multirange)
    en lieu et place du pseudo-générateur Setof appliqué à un type range? Probablement
    parce que Setof ne permet pas de définir de nouveaux types (c'est en quoi il est
    un pseudo-générateur). Dès lors, la compatibilité, la conversion et la double
    banque d'opérateurs nous complique grandement la vie. Que fait-oon ?

.NOTE 2022-10-04 (LL01) : les intervalles UHF sont temporels et définis en vue de l’historicisation.
  Ils sont représentés à l’aide intervalles d’entiers définis par "Point" et "Intervalle".
  Ainsi les trois intervalles de la famille UHF (Vxe, Vbe, Vbx) sont définis "à l’intérieur"
  d’un "Interval" en utilisant la convention suivante ;
    min = below < first < ... < last < beyond = max
  D’autres membres de la famille pourraient être ajoutés (en particulier Vxx).

.QUESTION 2022-10-04 (LL01) : Pourquoi "V" ?
  * Les "V" sont associés au temps (à l’axe, au référentiel) de validité.
    Or les domaines et types que nous définissions ici sont tout autant utilisables
    pour les temps de transaction, de domaine (utilisateur), etc. En conséquence,
    je crois qu’il ne faut utiliser aucune des lettres V, T, D (ou U).
    P doit aussi être évité (malheureusement) à cause de l’association avec Point.
  * Trois choix me semblent plausibles :
    - I, pour intervalle (malheureusement pas de connotation temporelle)
    - C, pour créneau (avec connotation temporelle, mais sans de correspondance facile en anglais)
    - L, pour lapse (avec connotation temporelle, mais peu usitée et sans correspondance facile en français)
  * !!! Le choix I !!!

.QUESTION 2022-10-04 (LL01) : Devrait-on abréger et normaliser les noms des domaines :
  * Solutions possible :
    * "uhf_Interval_Vxe" -> "uhf_Ixe"
    * "uhf_Interval_Vbe" -> "uhf_Ibe"
    * "uhf_Interval_Vbx" -> "uhf_Ibx"
  * !!! TODO !!!

.QUESTION 2022-10-04 (LL01) : Le cas échéant, comment harmoniser les noms des constructeurs ?
  * Solutions possible :
    - "uhf_interval_xe" -> uhf_[cons_]Ixe
    - "uhf_interval"    -> uhf_cons_Ibe
    - "uhf_interval_bx" -> uhf_cons_Ibx
    - "uhf_interval_min" -> uhf_cons_Imin
    - "uhf_interval_max" -> uhf_cons_Imax
  * ??? à éclaircir et tester ???

.QUESTION 2022-10-04 (LL01) : Devrait-on utiliser des représentations numériques non annulables ?
  * Afin de simplifier le traitement de nos routines et de permettre la levée automatique d’exception
    dans de nombreuses situations d’erreur grâce à l’instruction CASE (par exemple),
    ne devrait-on pas définir deux types numériques non annulables
    (et ce sans utiliser plpgsql ni les  macros) ?
  * Voir "GRIIS_Base".Entier et GRIIS_Base".Cardinal -- je mettrais cependant des définitions locales
    UHF afin de les moduler, ou pas, selon les variantes.
  * ??? oui, sous forme de variante par défaut ???

.QUESTION 2022-20-04 (LL01) : Ne pourrait-on avoir une définition de fold ici ?
  * Il faudrait qu'elle s'appuie sur une définition de fold présente dans le fichier
    UHF_Ens_Setof.pub (via des _window functions_ et retournant de Setof "Interval" ?)
  * !!! OK !!!

.QUESTION 2022-20-04 (LL01) : Plus généralement, comment dénoter les fonctions provenant des UHF_Ens_xxx.pub ?
  * Ce sont autant de variantes des mêmes fonctions qu'il faut distinguer.
    - Parfois le polymorphisme suffit (mais est-ce prudent ?).
    - Parfois pas (distinction uniquement par le type du résultat de la fonction).
    - Lesquelles intégrer dans UHF.pub ?
  * !!! suffixation soit T dans {Point : P, Intervalle : I}, T[] : _AT, setof T : _ST, multirange : _MR !!!

== Tâches réalisées

.DONE 2022-10-03 (LL01), 2022-08-02 (LL01) Les types d'intervalle Vzz pourraient cependant utiles.
  * Ils ont été ré-introduits.

.DONE 2022-10-03 (RL01) Revue complète
  * Ajout de certains tests unitaires.
  * Documentation des tests unitaires à compléter ou à ajouter.
  * Correction de coquilles diverses.

.DONE 2022-08-17 (COLL), 2022-02-09 (LL01) : passer à la syntaxe standard pour les fonctions
  * Ne plus mettre le code SQL dans un chaine de caractères.
  * Avantages :
    - le comportement ne sera pas celui d'une macro avec les risques de confusions
      contextuelles pouvant découler des search_path et des définitions locales ;
    - la syntaxe se rapproche de celle établie par le standard ISO, le code serait
      donc potentiellement plus transportables.
  * Inconvénients :
    - les macros permettraient certaines optimisations par substitution («inlining»)
      non encore prises en charge par les fonctions.
  Notes :
    * seules certaines routines plpgsql sont encore sous cette forme

.DONE 2022-08-02 (LL01), 2022-03-19 (LL01) : Dénomination.
  * Pour éviter tout conflit, tous les types et les routines de ce module ne
    devraient-ils pas être préfixés par «uhf_» (donc, donc en pratique, pour
    Interval, ça donne "UHF"."uhs_Interval")?
  * Présentement certains le sont, d’autres pas, ce qui engendre de la confusion.
    Faut-il plutôt privilégier la préfixation systématique par le nom du schéma
    ("UFH"."Interval")?
  * Pour le moment, au fur et à mesure que j'adapte le code, je préfixe les
    identifiants publics par «uhf_», ça sera très facile à retirer le cas échéant.

.DONE 2022-08-02 (LL01), 2022-08-01 (LL01) : Vocabulaire.
  * Lorsque nous parlons de points et d’intervalles, notre
    vocabulaire doit être neutre. Quand les points ne sont pas temporels, les
    appellations saw et ufn sont donc inappropriées. Je propose de les remplacer
    par below (saw) et beyond (ufn). Donc dans le présent module.
    Les points et les intervalles ne deviennent temporels qu’au travers des
    fonctions de conversion et donc dans le modèle effectif utilisant UHF. :-)

.NOTE 2022-08-02 (LL01), 2021-12-31 (CK01): Granularity (1).
  * The module depends on granularity=1 with a higher granularity, the following
    operators must be revisited:
      - set operators,
      - fold and unfold.
  * The support of other types then Integer or granularity<>1 will be handled
    with conversion functions.

.DONE 2022-08-01 (LL01), 2022-02-11 (LL01) : Granularity (2).
  * I suggest that other granularities should be handled with conversion functions
    when needed for the present time.
  * This solution was retained and implemented.

.DONE 2022-07-27 (LL01) : Redécoupage et standardisation.
  * phase 1.

.DONE 2021-01-15 (CK01) : Création initiale.
  * RAS.

[glossary]
== Références

  [Allen1983]
  James F. Allen (1983) ;
  "Maintaining Knowledge About Temporal Intervals" ;
  Commun. ACM 26, nᵒ 11, pp 832‑843. https://doi.org/10.1145/182.358434.

  [Lorentzos1997]
  Nikos A. Lorentzos and Yannis G. Mitsopoulos (1997) ;
  "SQL Extension for Interval Data" ;
  IEEE Transactions on knowledge and data engineering, vol. 9, no. 3, May/June 1997.

  [Date2014]
  Chris J. Date, Hugh Darwen, Nikos A. Lorentzos (2014) ;
  "Time and Relational Theory: Temporal Databases in the Relational Model and SQL" ;
  Morgan Kaufman Publishers, ISBN 978-0-12-8000631-3.

  [Khnaisser2016]
  C. Khnaisser (2016) ;
  "Méthode de construction d’entrepôt de données temporalisé pour un système informationnel de santé" ;
  Faculté des sciences, Université de Sherbrooke, Québec, Canada.

  [Khnaisser2017]
  C. Khnaisser, L. Lavoie, A. Burgun, J.-F. Ethier (2017) ;
  "Past Indeterminacy in Data Warehouse Design" ;
  Database and Expert Systems Applications, pp. 90–100 Springer, Cham.

  [Khnaisser2019]
  C. Khnaisser (2019) ;
  "Construction de modèles de données relationnels temporalisés guidée par les ontologies" ;
  Université de Paris cotutelle Université de Sherbrooke.

  [Khnaisser2022]
  C. Khnaisser, H. Hamrouni, D. Blumenthal, A. Dignös, J. Gamper (2022) ;
  "Querying Temporal Anomalies in Healthcare Information Systems and Beyond" ;
  Advances in Databases and Information Systems ;
  Proceedings of the 26th European Conference ADBIS September 5-8, 2022, Turino, Italy.
////
============================================================================== Z
*/