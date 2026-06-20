/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create history views
-- =========================================================================== A
*/

create or replace view "supplier_part@V@UHF".p_history AS
  with grouping as
    (
      select "pno" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."p_since"
      union
      select "pno" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."p_during"
      union
      select "pno" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."p_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".p_name_history AS
  with grouping as
    (
      select "pno" , 
             "name" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."p_name_since"
      union
      select "pno" , 
             "name" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."p_name_during"
      union
      select "pno" , 
             "name" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."p_name_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".s_history AS
  with grouping as
    (
      select "sno" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."s_since"
      union
      select "sno" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."s_during"
      union
      select "sno" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."s_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".s_status_history AS
  with grouping as
    (
      select "sno" , 
             "status" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."s_status_since"
      union
      select "sno" , 
             "status" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."s_status_during"
      union
      select "sno" , 
             "status" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."s_status_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".s_city_history AS
  with grouping as
    (
      select "sno" , 
             "city" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."s_city_since"
      union
      select "sno" , 
             "city" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."s_city_during"
      union
      select "sno" , 
             "city" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."s_city_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".sp_history AS
  with grouping as
    (
      select "sno" , 
             "pno" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."sp_since"
      union
      select "sno" , 
             "pno" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."sp_during"
      union
      select "sno" , 
             "pno" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."sp_until"
    )
  select *
  from grouping;

create or replace view "supplier_part@V@UHF".sp_qty_history AS
  with grouping as
    (
      select "sno" , 
             "pno" , 
             "qty" , 
             "UHF".uhf_interval_bx("since")  as "validTime"
      from "supplier_part@V@UHF"."sp_qty_since"
      union
      select "sno" , 
             "pno" , 
             "qty" , 
             "during"  as "validTime"
      from "supplier_part@V@UHF"."sp_qty_during"
      union
      select "sno" , 
             "pno" , 
             "qty" , 
             "UHF".uhf_interval_xe("until")  as "validTime"
      from "supplier_part@V@UHF"."sp_qty_until"
    )
  select *
  from grouping;

