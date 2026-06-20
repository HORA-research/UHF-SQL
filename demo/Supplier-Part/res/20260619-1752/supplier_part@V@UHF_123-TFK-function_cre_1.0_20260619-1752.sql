/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the referential key constraint functions
-- =========================================================================== A
*/

-- Temporal foreign key constraint : sp_history -> p_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "supplier_part@V@UHF".Twf_sp_history_p_history()
returns table (
    sno BPCHAR(3),
    pno BPCHAR(3),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, pno) as (
    select
      lower("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
    union all
    select
      upper("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
  ),
  T1_dest (ts, sno, pno) as (
    select
      lower("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
    union all
    select
      upper("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
  ),
  t3 as (
    select * from (
      select distinct
        "pno",
        int4range(ts, lead(ts) over (
          partition by "pno"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 as (
    select * from (
      select distinct
        "sno", "pno",
        int4range(ts, lead(ts) over (
          partition by "sno", "pno"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."sno", t7."pno",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."pno" = t3."pno"
      and t7.during <@ t3.during
  )
  where t3."pno" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : sp_history -> p_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "supplier_part@V@UHF".check_fk_new_sp_history_p_history_wf(
    p_pno BPCHAR(3),
    p_validTime int4range
)
returns table (
    pno BPCHAR(3),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, pno) as (
    select
      lower("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
    union all
    select
      upper("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
  ),
  t3 as (
    select * from (
      select distinct
        "pno",
        int4range(ts, lead(ts) over (
          partition by "pno"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (pno, during) as (
    select
      p_pno,
      p_validTime
  )
  select
    t7."pno",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."pno" = t3."pno"
    and t7.during <@ t3.during
  )
  where t3."pno" is null;
$$ language sql;

-- Temporal foreign key constraint : sp_history -> p_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "supplier_part@V@UHF".Tuf_sp_history_p_history()
returns table (
    sno BPCHAR(3),
    pno BPCHAR(3),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "pno",
      "UHF".unfold("validTime") as point
    from "supplier_part@V@UHF".p_history
  ),
  T1_dest as (
    select
      "sno", "pno",
      "UHF".unfold("validTime") as point
    from "supplier_part@V@UHF".sp_history
  ),
  violations as (
    select
      d."sno", d."pno",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."pno" = s."pno"
      and d.point = s.point
    )
    where s."pno" is null
  )
  select
    "sno", "pno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "sno", "pno";
$$ language sql;

-- Temporal foreign key constraint : sp_history -> s_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "supplier_part@V@UHF".Twf_sp_history_s_history()
returns table (
    sno BPCHAR(3),
    pno BPCHAR(3),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, sno) as (
    select
      lower("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
    union all
    select
      upper("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
  ),
  T1_dest (ts, sno, pno) as (
    select
      lower("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
    union all
    select
      upper("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
  ),
  t3 as (
    select * from (
      select distinct
        "sno",
        int4range(ts, lead(ts) over (
          partition by "sno"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 as (
    select * from (
      select distinct
        "sno", "pno",
        int4range(ts, lead(ts) over (
          partition by "sno", "pno"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."sno", t7."pno",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."sno" = t3."sno"
      and t7.during <@ t3.during
  )
  where t3."sno" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : sp_history -> s_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "supplier_part@V@UHF".check_fk_new_sp_history_s_history_wf(
    p_sno BPCHAR(3),
    p_validTime int4range
)
returns table (
    sno BPCHAR(3),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, sno) as (
    select
      lower("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
    union all
    select
      upper("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
  ),
  t3 as (
    select * from (
      select distinct
        "sno",
        int4range(ts, lead(ts) over (
          partition by "sno"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (sno, during) as (
    select
      p_sno,
      p_validTime
  )
  select
    t7."sno",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."sno" = t3."sno"
    and t7.during <@ t3.during
  )
  where t3."sno" is null;
$$ language sql;

-- Temporal foreign key constraint : sp_history -> s_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "supplier_part@V@UHF".Tuf_sp_history_s_history()
returns table (
    sno BPCHAR(3),
    pno BPCHAR(3),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "sno",
      "UHF".unfold("validTime") as point
    from "supplier_part@V@UHF".s_history
  ),
  T1_dest as (
    select
      "sno", "pno",
      "UHF".unfold("validTime") as point
    from "supplier_part@V@UHF".sp_history
  ),
  violations as (
    select
      d."sno", d."pno",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."sno" = s."sno"
      and d.point = s.point
    )
    where s."sno" is null
  )
  select
    "sno", "pno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "sno", "pno";
$$ language sql;

