/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create temporal constraints
-- =========================================================================== A
*/

-- No redundancy constraint for p_during
alter table "supplier_part@V@UHF"."p_during"
  add constraint p_during_redundancy
  exclude using gist("pno" WITH =,"during" WITH &&);

comment on constraint p_during_redundancy on "supplier_part@V@UHF"."p_during" is 'Check redundancy constraint for p_during';

-- No redundancy constraint for p_name_during
alter table "supplier_part@V@UHF"."p_name_during"
  add constraint p_name_during_redundancy
  exclude using gist("pno" WITH =, "name" WITH =,"during" WITH &&);

comment on constraint p_name_during_redundancy on "supplier_part@V@UHF"."p_name_during" is 'Check redundancy constraint for p_name_during';

-- No redundancy constraint for s_status_during
alter table "supplier_part@V@UHF"."s_status_during"
  add constraint s_status_during_redundancy
  exclude using gist("sno" WITH =, "status" WITH =,"during" WITH &&);

comment on constraint s_status_during_redundancy on "supplier_part@V@UHF"."s_status_during" is 'Check redundancy constraint for s_status_during';

-- No redundancy constraint for s_city_during
alter table "supplier_part@V@UHF"."s_city_during"
  add constraint s_city_during_redundancy
  exclude using gist("sno" WITH =, "city" WITH =,"during" WITH &&);

comment on constraint s_city_during_redundancy on "supplier_part@V@UHF"."s_city_during" is 'Check redundancy constraint for s_city_during';

-- No redundancy constraint for s_during
alter table "supplier_part@V@UHF"."s_during"
  add constraint s_during_redundancy
  exclude using gist("sno" WITH =,"during" WITH &&);

comment on constraint s_during_redundancy on "supplier_part@V@UHF"."s_during" is 'Check redundancy constraint for s_during';

-- No redundancy constraint for sp_during
alter table "supplier_part@V@UHF"."sp_during"
  add constraint sp_during_redundancy
  exclude using gist("pno" WITH =, "sno" WITH =,"during" WITH &&);

comment on constraint sp_during_redundancy on "supplier_part@V@UHF"."sp_during" is 'Check redundancy constraint for sp_during';

-- No redundancy constraint for sp_qty_during
alter table "supplier_part@V@UHF"."sp_qty_during"
  add constraint sp_qty_during_redundancy
  exclude using gist("pno" WITH =, "sno" WITH =, "qty" WITH =,"during" WITH &&);

comment on constraint sp_qty_during_redundancy on "supplier_part@V@UHF"."sp_qty_during" is 'Check redundancy constraint for sp_qty_during';

-- No circumlocution constraint for p_during
alter table "supplier_part@V@UHF"."p_during"
  add constraint p_during_circumlocution
  exclude using gist("pno" WITH = ,"during" WITH -|-);

 comment on constraint p_during_circumlocution on "supplier_part@V@UHF"."p_during" is 'Check circumlocution constraint for p_during';

-- No circumlocution constraint for p_name_during
alter table "supplier_part@V@UHF"."p_name_during"
  add constraint p_name_during_circumlocution
  exclude using gist("pno" WITH = , "name" WITH =,"during" WITH -|-);

 comment on constraint p_name_during_circumlocution on "supplier_part@V@UHF"."p_name_during" is 'Check circumlocution constraint for p_name_during';

-- No circumlocution constraint for s_status_during
alter table "supplier_part@V@UHF"."s_status_during"
  add constraint s_status_during_circumlocution
  exclude using gist("sno" WITH = , "status" WITH =,"during" WITH -|-);

 comment on constraint s_status_during_circumlocution on "supplier_part@V@UHF"."s_status_during" is 'Check circumlocution constraint for s_status_during';

-- No circumlocution constraint for s_city_during
alter table "supplier_part@V@UHF"."s_city_during"
  add constraint s_city_during_circumlocution
  exclude using gist("sno" WITH = , "city" WITH =,"during" WITH -|-);

 comment on constraint s_city_during_circumlocution on "supplier_part@V@UHF"."s_city_during" is 'Check circumlocution constraint for s_city_during';

-- No circumlocution constraint for s_during
alter table "supplier_part@V@UHF"."s_during"
  add constraint s_during_circumlocution
  exclude using gist("sno" WITH = ,"during" WITH -|-);

 comment on constraint s_during_circumlocution on "supplier_part@V@UHF"."s_during" is 'Check circumlocution constraint for s_during';

-- No circumlocution constraint for sp_during
alter table "supplier_part@V@UHF"."sp_during"
  add constraint sp_during_circumlocution
  exclude using gist("pno" WITH =, "sno" WITH = ,"during" WITH -|-);

 comment on constraint sp_during_circumlocution on "supplier_part@V@UHF"."sp_during" is 'Check circumlocution constraint for sp_during';

-- No circumlocution constraint for sp_qty_during
alter table "supplier_part@V@UHF"."sp_qty_during"
  add constraint sp_qty_during_circumlocution
  exclude using gist("pno" WITH =, "sno" WITH = , "qty" WITH =,"during" WITH -|-);

 comment on constraint sp_qty_during_circumlocution on "supplier_part@V@UHF"."sp_qty_during" is 'Check circumlocution constraint for sp_qty_during';

-- No contradiction constraint for p_name_during
alter table "supplier_part@V@UHF"."p_name_during"
  add constraint p_name_during_contradiction
  exclude using gist("pno" WITH =, "name" WITH <>, "during" WITH &&);

comment on constraint p_name_during_contradiction on "supplier_part@V@UHF"."p_name_during" is 'Check contradiction constraint';

-- No contradiction constraint for s_status_during
alter table "supplier_part@V@UHF"."s_status_during"
  add constraint s_status_during_contradiction
  exclude using gist("sno" WITH =, "status" WITH <>, "during" WITH &&);

comment on constraint s_status_during_contradiction on "supplier_part@V@UHF"."s_status_during" is 'Check contradiction constraint';

-- No contradiction constraint for s_city_during
alter table "supplier_part@V@UHF"."s_city_during"
  add constraint s_city_during_contradiction
  exclude using gist("sno" WITH =, "city" WITH <>, "during" WITH &&);

comment on constraint s_city_during_contradiction on "supplier_part@V@UHF"."s_city_during" is 'Check contradiction constraint';

-- No contradiction constraint for sp_qty_during
alter table "supplier_part@V@UHF"."sp_qty_during"
  add constraint sp_qty_during_contradiction
  exclude using gist("pno" WITH =, "sno" WITH =, "qty" WITH <>, "during" WITH &&);

comment on constraint sp_qty_during_contradiction on "supplier_part@V@UHF"."sp_qty_during" is 'Check contradiction constraint';

