/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the labeling anomalies view..
  Assertion that cannot be defined directly using constraints
-- =========================================================================== A
*/

-- Temporal redundancy history view using pack et unpack for : p_history
create or replace view "supplier_part@V@UHF".UF_Rlab_p_history_history as
  with unpack as
    (
      select "pno", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_history
    ),
    anomalies as
    (
      select "pno", point, count(*) as count
      from unpack
      group by "pno", point
    )
  select "pno", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "pno", count;

-- Temporal contradiction history view using pack et unpack for : p_name_history
create or replace view "supplier_part@V@UHF".UF_Clab_p_name_history_history as
  with unpack as
    (
      select "pno", "name","UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
    ),
    anomalies as
    (
      select "pno", point, array_agg(distinct "name") as name_contradictions
      from unpack
      group by "pno", point
    )
  select distinct
      "pno",
      unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
      name_contradictions
  from anomalies
  group by "pno", name_contradictions;


 -- Temporal redundancy history view using pack et unpack for : p_name_history
create or replace view "supplier_part@V@UHF".UF_Rlab_p_name_history_history as
  with unpack as
    (
      select "pno", "name", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
    ),
    anomalies as
    (
      select "pno", "name", point, count(*) as count
      from unpack
      group by "pno", "name", point
    )
  select "pno", "name", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "pno", "name", count;

-- Temporal redundancy history view using pack et unpack for : s_history
create or replace view "supplier_part@V@UHF".UF_Rlab_s_history_history as
  with unpack as
    (
      select "sno", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_history
    ),
    anomalies as
    (
      select "sno", point, count(*) as count
      from unpack
      group by "sno", point
    )
  select "sno", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "sno", count;

-- Temporal contradiction history view using pack et unpack for : s_status_history
create or replace view "supplier_part@V@UHF".UF_Clab_s_status_history_history as
  with unpack as
    (
      select "sno", "status","UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
    ),
    anomalies as
    (
      select "sno", point, array_agg(distinct "status") as status_contradictions
      from unpack
      group by "sno", point
    )
  select distinct
      "sno",
      unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
      status_contradictions
  from anomalies
  group by "sno", status_contradictions;


 -- Temporal redundancy history view using pack et unpack for : s_status_history
create or replace view "supplier_part@V@UHF".UF_Rlab_s_status_history_history as
  with unpack as
    (
      select "sno", "status", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
    ),
    anomalies as
    (
      select "sno", "status", point, count(*) as count
      from unpack
      group by "sno", "status", point
    )
  select "sno", "status", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "sno", "status", count;

-- Temporal contradiction history view using pack et unpack for : s_city_history
create or replace view "supplier_part@V@UHF".UF_Clab_s_city_history_history as
  with unpack as
    (
      select "sno", "city","UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
    ),
    anomalies as
    (
      select "sno", point, array_agg(distinct "city") as city_contradictions
      from unpack
      group by "sno", point
    )
  select distinct
      "sno",
      unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
      city_contradictions
  from anomalies
  group by "sno", city_contradictions;


 -- Temporal redundancy history view using pack et unpack for : s_city_history
create or replace view "supplier_part@V@UHF".UF_Rlab_s_city_history_history as
  with unpack as
    (
      select "sno", "city", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
    ),
    anomalies as
    (
      select "sno", "city", point, count(*) as count
      from unpack
      group by "sno", "city", point
    )
  select "sno", "city", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "sno", "city", count;

-- Temporal redundancy history view using pack et unpack for : sp_history
create or replace view "supplier_part@V@UHF".UF_Rlab_sp_history_history as
  with unpack as
    (
      select "sno", "pno", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_history
    ),
    anomalies as
    (
      select "sno", "pno", point, count(*) as count
      from unpack
      group by "sno", "pno", point
    )
  select "sno", "pno", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "sno", "pno", count;

-- Temporal contradiction history view using pack et unpack for : sp_qty_history
create or replace view "supplier_part@V@UHF".UF_Clab_sp_qty_history_history as
  with unpack as
    (
      select "sno", "pno", "qty","UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
    ),
    anomalies as
    (
      select "sno", "pno", point, array_agg(distinct "qty") as qty_contradictions
      from unpack
      group by "sno", "pno", point
    )
  select distinct
      "sno", "pno",
      unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
      qty_contradictions
  from anomalies
  group by "sno", "pno", qty_contradictions;


 -- Temporal redundancy history view using pack et unpack for : sp_qty_history
create or replace view "supplier_part@V@UHF".UF_Rlab_sp_qty_history_history as
  with unpack as
    (
      select "sno", "pno", "qty", "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
    ),
    anomalies as
    (
      select "sno", "pno", "qty", point, count(*) as count
      from unpack
      group by "sno", "pno", "qty", point
    )
  select "sno", "pno", "qty", unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancy, count
  from anomalies
  group by "sno", "pno", "qty", count;

-- Temporal redundancy history view for : p_history
create or replace view "supplier_part@V@UHF".p_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, pno) as (
    select
      1,
      0,
      lower("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_history
  ),
  T2 (Crt_Total_ts, ts, pno) as (
    select
      sum(Start_ts) over (partition by "pno" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "pno" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "pno"
    from T1
  )
  select
    "pno",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "pno",
      int4range(ts, lead(ts) over (partition by "pno" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for : p_name_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".p_name_history_contr_lab_wf as
  with T1 (Start_ts, End_ts, ts, pno) as (
    select
      1,
      0,
      lower("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_name_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "pno"
    from "supplier_part@V@UHF".p_name_history
  ),
  T2 (Crt_Total_ts, ts, pno) as (
    select
      sum(Start_ts) over (
        partition by "pno"
        order by ts, End_ts
        rows unbounded preceding
      )
      - sum(End_ts) over (
        partition by "pno"
        order by ts, End_ts
        rows unbounded preceding
      ) as Crt_Total_ts,
      ts,
      "pno"
    from T1
  )
  select
    r."pno",
    array_agg(distinct s."name") as name_contradictions,
    r.contradictions
  from "supplier_part@V@UHF".p_name_history as s
  inner join (
    select
      "pno",
      contradictions
    from (
      select
        Crt_Total_ts,
        "pno",
        int4range(ts, lead(ts) over (
          partition by "pno"
          order by ts
        )) as contradictions
      from T2
    ) tt
    where Crt_Total_ts > 0
      and contradictions <> 'empty'
      and upper(contradictions) is not null
  ) r
  on (
    s."pno" = r."pno"
    and r.contradictions <@ s."validTime"
  )
  group by r."pno", r.contradictions;

-- Temporal denseness view for p_name_history <-> p_history
/* QUERYNAME=DensenesWindowFunction */
create or replace view "supplier_part@V@UHF".wf_dlab_p_name_history_p_history as
  with T1 (Start_ts, End_ts, ts, pno, "validTime", source) as (
    select
      1,
      0,
      lower("validTime"),
      "pno",
      "validTime",
      'p_name_history' as source
    from "supplier_part@V@UHF".p_name_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "pno",
      "validTime",
      'p_name_history' as source
    from "supplier_part@V@UHF".p_name_history
    union all
    select
      1,
      0,
      lower("validTime"),
      "pno",
      "validTime",
      'p_history' as source
    from "supplier_part@V@UHF".p_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "pno",
      "validTime",
      'p_history' as source
    from "supplier_part@V@UHF".p_history
  ),
  T2 as (
    select distinct
      "pno",
      "validTime",
      source,
      int4range(ts, lead(ts) over (
        partition by "pno"
        order by ts
      )) as T
    from T1
    window w as (partition by "pno" order by ts)
  ),
  anomalies as (
    select
      t21."pno",
      t22.source,
      t21.t,
      t22."validTime"
    from T2 as t21
    join T2 as t22 using ("pno")
    where
      t21.t <@ t22."validTime"
      and t21.t <> 'empty'
  )
  select
    "pno",
    T,
    array_agg(distinct source) as sources
  from anomalies
  group by "pno", T;

-- Temporal denseness view for p_name_history <-> p_history
/* QUERYNAME=DensenessUnfoldFold */
create or replace view "supplier_part@V@UHF".uf_dlab_p_name_history_p_history as
  with unpacked as (
    select
      "pno",
      "UHF".unfold("validTime") as point,
      'p_name_history' as source
    from "supplier_part@V@UHF".p_name_history
    union
    select
      "pno",
      "UHF".unfold("validTime") as point,
      'p_history' as source
    from "supplier_part@V@UHF".p_history
  ),
  anomalies as (
    select
      "pno",
      point,
      array_agg(distinct source) as sources
    from unpacked
    group by "pno", point
  )
  select distinct
    "pno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
    sources
  from anomalies
  group by "pno", sources;

-- Temporal redundancy history view for : p_name_history
create or replace view "supplier_part@V@UHF".p_name_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, pno, name) as (
    select
      1,
      0,
      lower("validTime"),
      "pno", "name"
    from "supplier_part@V@UHF".p_name_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "pno", "name"
    from "supplier_part@V@UHF".p_name_history
  ),
  T2 (Crt_Total_ts, ts, pno, name) as (
    select
      sum(Start_ts) over (partition by "pno", "name" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "pno", "name" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "pno", "name"
    from T1
  )
  select
    "pno", "name",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "pno", "name",
      int4range(ts, lead(ts) over (partition by "pno", "name" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal redundancy history view for : s_history
create or replace view "supplier_part@V@UHF".s_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, sno) as (
    select
      1,
      0,
      lower("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_history
  ),
  T2 (Crt_Total_ts, ts, sno) as (
    select
      sum(Start_ts) over (partition by "sno" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "sno" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "sno"
    from T1
  )
  select
    "sno",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "sno",
      int4range(ts, lead(ts) over (partition by "sno" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for : s_status_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".s_status_history_contr_lab_wf as
  with T1 (Start_ts, End_ts, ts, sno) as (
    select
      1,
      0,
      lower("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_status_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_status_history
  ),
  T2 (Crt_Total_ts, ts, sno) as (
    select
      sum(Start_ts) over (
        partition by "sno"
        order by ts, End_ts
        rows unbounded preceding
      )
      - sum(End_ts) over (
        partition by "sno"
        order by ts, End_ts
        rows unbounded preceding
      ) as Crt_Total_ts,
      ts,
      "sno"
    from T1
  )
  select
    r."sno",
    array_agg(distinct s."status") as status_contradictions,
    r.contradictions
  from "supplier_part@V@UHF".s_status_history as s
  inner join (
    select
      "sno",
      contradictions
    from (
      select
        Crt_Total_ts,
        "sno",
        int4range(ts, lead(ts) over (
          partition by "sno"
          order by ts
        )) as contradictions
      from T2
    ) tt
    where Crt_Total_ts > 0
      and contradictions <> 'empty'
      and upper(contradictions) is not null
  ) r
  on (
    s."sno" = r."sno"
    and r.contradictions <@ s."validTime"
  )
  group by r."sno", r.contradictions;

-- Temporal denseness view for s_status_history <-> s_history
/* QUERYNAME=DensenesWindowFunction */
create or replace view "supplier_part@V@UHF".wf_dlab_s_status_history_s_history as
  with T1 (Start_ts, End_ts, ts, sno, "validTime", source) as (
    select
      1,
      0,
      lower("validTime"),
      "sno",
      "validTime",
      's_status_history' as source
    from "supplier_part@V@UHF".s_status_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno",
      "validTime",
      's_status_history' as source
    from "supplier_part@V@UHF".s_status_history
    union all
    select
      1,
      0,
      lower("validTime"),
      "sno",
      "validTime",
      's_history' as source
    from "supplier_part@V@UHF".s_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno",
      "validTime",
      's_history' as source
    from "supplier_part@V@UHF".s_history
  ),
  T2 as (
    select distinct
      "sno",
      "validTime",
      source,
      int4range(ts, lead(ts) over (
        partition by "sno"
        order by ts
      )) as T
    from T1
    window w as (partition by "sno" order by ts)
  ),
  anomalies as (
    select
      t21."sno",
      t22.source,
      t21.t,
      t22."validTime"
    from T2 as t21
    join T2 as t22 using ("sno")
    where
      t21.t <@ t22."validTime"
      and t21.t <> 'empty'
  )
  select
    "sno",
    T,
    array_agg(distinct source) as sources
  from anomalies
  group by "sno", T;

-- Temporal denseness view for s_status_history <-> s_history
/* QUERYNAME=DensenessUnfoldFold */
create or replace view "supplier_part@V@UHF".uf_dlab_s_status_history_s_history as
  with unpacked as (
    select
      "sno",
      "UHF".unfold("validTime") as point,
      's_status_history' as source
    from "supplier_part@V@UHF".s_status_history
    union
    select
      "sno",
      "UHF".unfold("validTime") as point,
      's_history' as source
    from "supplier_part@V@UHF".s_history
  ),
  anomalies as (
    select
      "sno",
      point,
      array_agg(distinct source) as sources
    from unpacked
    group by "sno", point
  )
  select distinct
    "sno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
    sources
  from anomalies
  group by "sno", sources;

-- Temporal redundancy history view for : s_status_history
create or replace view "supplier_part@V@UHF".s_status_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, sno, status) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "status"
    from "supplier_part@V@UHF".s_status_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "status"
    from "supplier_part@V@UHF".s_status_history
  ),
  T2 (Crt_Total_ts, ts, sno, status) as (
    select
      sum(Start_ts) over (partition by "sno", "status" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "sno", "status" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "sno", "status"
    from T1
  )
  select
    "sno", "status",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "sno", "status",
      int4range(ts, lead(ts) over (partition by "sno", "status" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for : s_city_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".s_city_history_contr_lab_wf as
  with T1 (Start_ts, End_ts, ts, sno) as (
    select
      1,
      0,
      lower("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_city_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno"
    from "supplier_part@V@UHF".s_city_history
  ),
  T2 (Crt_Total_ts, ts, sno) as (
    select
      sum(Start_ts) over (
        partition by "sno"
        order by ts, End_ts
        rows unbounded preceding
      )
      - sum(End_ts) over (
        partition by "sno"
        order by ts, End_ts
        rows unbounded preceding
      ) as Crt_Total_ts,
      ts,
      "sno"
    from T1
  )
  select
    r."sno",
    array_agg(distinct s."city") as city_contradictions,
    r.contradictions
  from "supplier_part@V@UHF".s_city_history as s
  inner join (
    select
      "sno",
      contradictions
    from (
      select
        Crt_Total_ts,
        "sno",
        int4range(ts, lead(ts) over (
          partition by "sno"
          order by ts
        )) as contradictions
      from T2
    ) tt
    where Crt_Total_ts > 0
      and contradictions <> 'empty'
      and upper(contradictions) is not null
  ) r
  on (
    s."sno" = r."sno"
    and r.contradictions <@ s."validTime"
  )
  group by r."sno", r.contradictions;

-- Temporal denseness view for s_city_history <-> s_history
/* QUERYNAME=DensenesWindowFunction */
create or replace view "supplier_part@V@UHF".wf_dlab_s_city_history_s_history as
  with T1 (Start_ts, End_ts, ts, sno, "validTime", source) as (
    select
      1,
      0,
      lower("validTime"),
      "sno",
      "validTime",
      's_city_history' as source
    from "supplier_part@V@UHF".s_city_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno",
      "validTime",
      's_city_history' as source
    from "supplier_part@V@UHF".s_city_history
    union all
    select
      1,
      0,
      lower("validTime"),
      "sno",
      "validTime",
      's_history' as source
    from "supplier_part@V@UHF".s_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno",
      "validTime",
      's_history' as source
    from "supplier_part@V@UHF".s_history
  ),
  T2 as (
    select distinct
      "sno",
      "validTime",
      source,
      int4range(ts, lead(ts) over (
        partition by "sno"
        order by ts
      )) as T
    from T1
    window w as (partition by "sno" order by ts)
  ),
  anomalies as (
    select
      t21."sno",
      t22.source,
      t21.t,
      t22."validTime"
    from T2 as t21
    join T2 as t22 using ("sno")
    where
      t21.t <@ t22."validTime"
      and t21.t <> 'empty'
  )
  select
    "sno",
    T,
    array_agg(distinct source) as sources
  from anomalies
  group by "sno", T;

-- Temporal denseness view for s_city_history <-> s_history
/* QUERYNAME=DensenessUnfoldFold */
create or replace view "supplier_part@V@UHF".uf_dlab_s_city_history_s_history as
  with unpacked as (
    select
      "sno",
      "UHF".unfold("validTime") as point,
      's_city_history' as source
    from "supplier_part@V@UHF".s_city_history
    union
    select
      "sno",
      "UHF".unfold("validTime") as point,
      's_history' as source
    from "supplier_part@V@UHF".s_history
  ),
  anomalies as (
    select
      "sno",
      point,
      array_agg(distinct source) as sources
    from unpacked
    group by "sno", point
  )
  select distinct
    "sno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
    sources
  from anomalies
  group by "sno", sources;

-- Temporal redundancy history view for : s_city_history
create or replace view "supplier_part@V@UHF".s_city_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, sno, city) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "city"
    from "supplier_part@V@UHF".s_city_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "city"
    from "supplier_part@V@UHF".s_city_history
  ),
  T2 (Crt_Total_ts, ts, sno, city) as (
    select
      sum(Start_ts) over (partition by "sno", "city" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "sno", "city" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "sno", "city"
    from T1
  )
  select
    "sno", "city",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "sno", "city",
      int4range(ts, lead(ts) over (partition by "sno", "city" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal redundancy history view for : sp_history
create or replace view "supplier_part@V@UHF".sp_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, sno, pno) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_history
  ),
  T2 (Crt_Total_ts, ts, sno, pno) as (
    select
      sum(Start_ts) over (partition by "sno", "pno" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "sno", "pno" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "sno", "pno"
    from T1
  )
  select
    "sno", "pno",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "sno", "pno",
      int4range(ts, lead(ts) over (partition by "sno", "pno" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for : sp_qty_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".sp_qty_history_contr_lab_wf as
  with T1 (Start_ts, End_ts, ts, sno, pno) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_qty_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "pno"
    from "supplier_part@V@UHF".sp_qty_history
  ),
  T2 (Crt_Total_ts, ts, sno, pno) as (
    select
      sum(Start_ts) over (
        partition by "sno", "pno"
        order by ts, End_ts
        rows unbounded preceding
      )
      - sum(End_ts) over (
        partition by "sno", "pno"
        order by ts, End_ts
        rows unbounded preceding
      ) as Crt_Total_ts,
      ts,
      "sno", "pno"
    from T1
  )
  select
    r."sno", r."pno",
    array_agg(distinct s."qty") as qty_contradictions,
    r.contradictions
  from "supplier_part@V@UHF".sp_qty_history as s
  inner join (
    select
      "sno", "pno",
      contradictions
    from (
      select
        Crt_Total_ts,
        "sno", "pno",
        int4range(ts, lead(ts) over (
          partition by "sno", "pno"
          order by ts
        )) as contradictions
      from T2
    ) tt
    where Crt_Total_ts > 0
      and contradictions <> 'empty'
      and upper(contradictions) is not null
  ) r
  on (
    s."sno" = r."sno"
        and s."pno" = r."pno"
    and r.contradictions <@ s."validTime"
  )
  group by r."sno", r."pno", r.contradictions;

-- Temporal denseness view for sp_qty_history <-> sp_history
/* QUERYNAME=DensenesWindowFunction */
create or replace view "supplier_part@V@UHF".wf_dlab_sp_qty_history_sp_history as
  with T1 (Start_ts, End_ts, ts, sno, pno, "validTime", source) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "pno",
      "validTime",
      'sp_qty_history' as source
    from "supplier_part@V@UHF".sp_qty_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "pno",
      "validTime",
      'sp_qty_history' as source
    from "supplier_part@V@UHF".sp_qty_history
    union all
    select
      1,
      0,
      lower("validTime"),
      "sno", "pno",
      "validTime",
      'sp_history' as source
    from "supplier_part@V@UHF".sp_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "pno",
      "validTime",
      'sp_history' as source
    from "supplier_part@V@UHF".sp_history
  ),
  T2 as (
    select distinct
      "sno", "pno",
      "validTime",
      source,
      int4range(ts, lead(ts) over (
        partition by "sno", "pno"
        order by ts
      )) as T
    from T1
    window w as (partition by "sno", "pno" order by ts)
  ),
  anomalies as (
    select
      t21."sno", t21."pno",
      t22.source,
      t21.t,
      t22."validTime"
    from T2 as t21
    join T2 as t22 using ("sno", "pno")
    where
      t21.t <@ t22."validTime"
      and t21.t <> 'empty'
  )
  select
    "sno", "pno",
    T,
    array_agg(distinct source) as sources
  from anomalies
  group by "sno", "pno", T;

-- Temporal denseness view for sp_qty_history <-> sp_history
/* QUERYNAME=DensenessUnfoldFold */
create or replace view "supplier_part@V@UHF".uf_dlab_sp_qty_history_sp_history as
  with unpacked as (
    select
      "sno", "pno",
      "UHF".unfold("validTime") as point,
      'sp_qty_history' as source
    from "supplier_part@V@UHF".sp_qty_history
    union
    select
      "sno", "pno",
      "UHF".unfold("validTime") as point,
      'sp_history' as source
    from "supplier_part@V@UHF".sp_history
  ),
  anomalies as (
    select
      "sno", "pno",
      point,
      array_agg(distinct source) as sources
    from unpacked
    group by "sno", "pno", point
  )
  select distinct
    "sno", "pno",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as during,
    sources
  from anomalies
  group by "sno", "pno", sources;

-- Temporal redundancy history view for : sp_qty_history
create or replace view "supplier_part@V@UHF".sp_qty_history_wf_hist_red_lab as
  with T1 (Start_ts, End_ts, ts, sno, pno, qty) as (
    select
      1,
      0,
      lower("validTime"),
      "sno", "pno", "qty"
    from "supplier_part@V@UHF".sp_qty_history
    union all
    select
      0,
      1,
      upper("validTime"),
      "sno", "pno", "qty"
    from "supplier_part@V@UHF".sp_qty_history
  ),
  T2 (Crt_Total_ts, ts, sno, pno, qty) as (
    select
      sum(Start_ts) over (partition by "sno", "pno", "qty" order by ts, End_ts rows unbounded preceding)
      - sum(End_ts) over (partition by "sno", "pno", "qty" order by ts, End_ts rows unbounded preceding) as Crt_Total_ts,
      ts,
      "sno", "pno", "qty"
    from T1
  )
  select
    "sno", "pno", "qty",
    redundancies,
    Crt_Total_ts
  from
  (
    select
      Crt_Total_ts,
      "sno", "pno", "qty",
      int4range(ts, lead(ts) over (partition by "sno", "pno", "qty" order by ts )) as redundancies
    from T2
  ) tt
  where redundancies <> 'empty' and upper(redundancies) is not null;

