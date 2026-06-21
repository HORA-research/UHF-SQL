/*
============================================================================== A
UHF_Allen_doc.pub.sql
------------------------------------------------------------------------------ A
Produit : UHF
Résumé : Allen's utility functions documentation
Projet : Metis_UHF_2022-2
Responsable : Christina.Khnaisser@USherbrooke.ca
Version : 2024-03-29
Statut : en cours de vérification
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 14 à 16
============================================================================== A
*/

--
-- Documentation
--

-- @formatter:off
-- drop table if exists "Allen_op_def" cascade;
create table "Allen_op_def" (
  "sym" Text not null,
  "val" Integer not null,
  "eq_ff" Text not null,
  "eq_fo" Text not null,
  "f" Text not null,
  constraint "Allen_op_def_cc0" primary key ("sym"),
  constraint "Allen_op_def_cc1" unique ("val"),
  constraint "Allen_op_def_cc2" unique ("eq_ff"),
  constraint "Allen_op_def_cc3" unique ("eq_fo"),
  constraint "Allen_op_def_cc4" unique ("f")
  );
insert into "Allen_op_def"
  ("sym", "val", "eq_ff",                       "eq_fo",                       "f"                       )
values
  ('<',       6, 'p.e+1<q.b',                   'p.t<q.b',                     'before'                  ),
  ('m',       5, 'p.e+1=q.b',                   'p.t=q.b',                     'meets_before'            ),
  ('o',       4, 'p.b<q.b ∧ p.e≥q.b ∧ p.e<q.e', 'p.b<q.b ∧ p.t>q.b ∧ p.t<q.t', 'overlaps_before'         ),
  ('s',       3, 'q.b=p.b ∧ p.e<q.e',           'q.b=p.b ∧ p.t<q.t',           'starts'                  ),
  ('d',       2, 'q.b<p.b ∧ p.e<q.e',           'q.b<p.b ∧ p.t<q.t',           'bi_strictly_includes'    ),
  ('f',       1, 'q.b<p.b ∧ p.e=q.e',           'q.b<p.b ∧ p.t=q.t',           'finishes'                ),
  ('=',       0, 'q.b=p.b ∧ p.e=q.e',           'q.b=p.b ∧ p.t=q.t',           'equals'                  ),
  ('fi',     -1, 'p.b<q.b ∧ q.e=p.e',           'p.b<q.b ∧ q.t=p.t',           'finishes_inv'            ),
  ('di',     -2, 'p.b<q.b ∧ q.e<p.e',           'p.b<q.b ∧ q.t<p.t',           'bi_strictly_includes_inv'),
  ('si',     -3, 'p.b=q.b ∧ q.e<p.e',           'p.b=q.b ∧ q.t<p.t',           'starts_inv'              ),
  ('oi',     -4, 'q.b<p.b ∧ q.e≥p.b ∧ q.e<b.e', 'q.b<p.b ∧ q.t>p.b ∧ q.t<p.t', 'overlaps_before_inv'     ),
  ('mi',     -5, 'p.b-1=q.e',                   'p.b=q.t',                     'meets_before_inv'        ),
  ('>',      -6, 'p.b-1>q.e',                   'p.b>q.t',                     'before_inv'              );

-- drop table if exists "Allen_op_doc" cascade;
create table "Allen_op_doc" (
  "sym" Text not null,
  "fig_g" Text not null,
  "fig_d" Text not null,
  "nom_fr" Text not null,
  "nom_fr_a" Text not null,
  "nom_en" Text not null,
  "nom_en_a" Text not null,
  constraint "Allen_op_doc_cc0" primary key ("sym"),
  constraint "Allen_op_doc_cc1" unique ("nom_fr"),
  constraint "Allen_op_doc_cc2" unique ("nom_en"),
  constraint "Allen_op_doc_cr0" foreign key ("sym") references "Allen_op_def"
  );
comment on table "Allen_op_doc" is $$
Documentation de l’opérateur "sym" comprenant la figure gauche ("fig_g") et la droite ("fig_d"),
le nom français ("nom_fr") et l’anglais ("nom_en").
Des alias peuvent être fournis grâce à ("nom_fr_a") et ("nom_en_a") ;
un texte de longueur zéro indique l’absence d’alias.
$$;
insert into "Allen_op_doc"
  ("sym", "fig_g",
          "fig_d",      "nom_fr",                           "nom_fr_a",                        "nom_en",     "nom_en_a"      )
values
  ('<',  '|---|oooooo',
         'oooooo|---|', 'antériorité stricte',              '',                                'before',     'is before'     ),
  ('m',  'o|---|ooooo',
         'oooooo|---|', 'adjacence antérieure',             '',                                'meets',      'meets before'  ),
  ('o',  'oo|---|oooo',
         'ooooo|---|o', 'chevauchement antérieur strict',   '',                                'overlaps',   'overlaps before'),
  ('s',  'ooo|--|oooo',
         'ooo|---|ooo', 'commencement strict',              '',                                'starts',     ''              ),
  ('d',  'oooo|-|oooo',
         'ooo|---|ooo', 'inclusion bi-stricte',             '',                                'during',     ''              ),
  ('f',  'oooo|--|ooo',
         'ooo|---|ooo', 'achèvement strict',                '',                                'finishes',   ''              ),
  ('=',  'ooo|---|ooo',
         'ooo|---|ooo', 'égalité',                          '',                                'equals',     ''              ),
  ('fi', 'ooo|---|ooo',
         'oooo|--|ooo', 'achèvement strict-1',              '',                                'finishes-1', ''              ),
  ('di', 'ooo|---|ooo',
         'oooo|-|oooo', 'inclusion bi-stricte-1',           'compréhension bi-stricte',        'during-1',   ''              ),
  ('si', 'ooo|---|ooo',
         'ooo|--|oooo', 'commencement strict-1',            '',                                'starts-1',   ''              ),
  ('oi', 'ooooo|---|o',
         'oo|---|oooo', 'chevauchement antérieur strict-1', 'chevauchement postérieur strict', 'overlaps-1', 'overlaps after'),
  ('mi', 'oooooo|---|',
         'o|---|ooooo', 'adjacence antérieure-1',           'adjacence postérieure',           'meets-1',    'meets after'   ),
  ('>',  'oooooo|---|',
         '|---|oooooo', 'antériorité stricte-1',            'postériorité stricte',            'before-1',   'is after'      );
-- @formatter:on

create function "allen_symbol"("p" "Interval", "q" "Interval")
  returns Text
  immutable strict parallel safe
  -- TOIMPROVE 2022-08-08 (LL01) en faisant l'arbre des tests, cela sera beaucoup plus rapide !
return
  case
    when "before"("p", "q") then '<'
    when "meets_before"("p", "q") then 'm'
    when "overlaps_before"("p", "q") then 'o'
    when "starts"("p", "q") then 's'
    when "bi_strictly_includes"("p", "q") then 'd'
    when "finishes"("p", "q") then 'f'
    when "equals"("p", "q") then '='
    when "finishes_inv"("p", "q") then 'fi'
    when "bi_strictly_includes_inv"("p", "q") then 'di'
    when "starts_inv"("p", "q") then 'si'
    when "overlaps_before_inv"("p", "q") then 'oi'
    when "meets_before_inv"("p", "q") then 'mi'
    when "before_inv"("p", "q") then '>'
  end;

create function "allen_inv"("s" Text)
  returns Text
  stable strict parallel safe
return (
  select "sym"
  from "Allen_op_def"
  where "val" = - (
    select "val"
    from "Allen_op_def"
    where "sym" = "s"
    )
  );

/*
============================================================================== Z
UHF_Allen_doc.pub.sql
------------------------------------------------------------------------------ Z
Contributeurs, droits, licences… : voir UHF.ini.sql
============================================================================== Z
*/
