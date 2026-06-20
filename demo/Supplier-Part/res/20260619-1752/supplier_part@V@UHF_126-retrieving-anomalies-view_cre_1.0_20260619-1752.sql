/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the retrieving temporal anomalies views.
  Assertion that cannot be defined directly using constraints
-- =========================================================================== A
*/

-- Temporal redundancy view for : p_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".p_history_red_ret as
  with unpack as
    (
      select "pno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_history
    ),
    anomalies as
      (
        select "pno"
             , point
             , count(*) as count
        from unpack
        group by "pno", point
        having count(*) > 1
      )
  select "pno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "pno", count;

-- Temporal redundancy view for : p_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".p_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for p_name_history
/* QUERYNAME=ContradictionUnfoldfold */
create or replace view "supplier_part@V@UHF".rctr_p_name_history as
  with unpack as
    (
      select "pno"
        , "name"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
    ),
    anomalies as
      (
        select "pno"
             , point
             , array_agg(distinct "name") as contradictions
        from unpack
        group by "pno", point
        having count("name") > 1
      )
  select "pno"
       , contradictions
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
  from anomalies
  where array_length(contradictions, 1) > 1
  group by "pno", contradictions;

-- Temporal contradiction view for : p_name_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".wf_rctr_p_name_history as
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
  group by r."pno", r.contradictions
  having count(distinct s."name") > 1;

-- Temporal denseness view for p_name_history <-> p_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".dert_p_name_history_p_history as
  with unpack as
    (
      select "pno"
           , "UHF".unfold("validTime") as point
           , 'p_name_history' as source
      from "supplier_part@V@UHF".p_name_history
      union
      select "pno"
           , "UHF".unfold("validTime") as point
           , 'p_history' as source
      from "supplier_part@V@UHF".p_history
    ),
    anomalies as
    (
      select "pno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pno", point
    )
  select "pno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
       , sources
  from anomalies
  where array_length(sources, 1) < 2
  group by "pno", sources;

-- Temporal denseness view for p_name_history <-> p_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".wf_p_name_history_p_history as
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
  group by "pno", T
  having array_length(array_agg(distinct source), 1) = 1;

-- Temporal redundancy view for : p_name_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".p_name_history_red_ret as
  with unpack as
    (
      select "pno", "name"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
    ),
    anomalies as
      (
        select "pno", "name"
             , point
             , count(*) as count
        from unpack
        group by "pno", "name", point
        having count(*) > 1
      )
  select "pno", "name"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "pno", "name", count;

-- Temporal redundancy view for : p_name_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".p_name_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal redundancy view for : s_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".s_history_red_ret as
  with unpack as
    (
      select "sno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_history
    ),
    anomalies as
      (
        select "sno"
             , point
             , count(*) as count
        from unpack
        group by "sno", point
        having count(*) > 1
      )
  select "sno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "sno", count;

-- Temporal redundancy view for : s_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".s_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for s_status_history
/* QUERYNAME=ContradictionUnfoldfold */
create or replace view "supplier_part@V@UHF".rctr_s_status_history as
  with unpack as
    (
      select "sno"
        , "status"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
    ),
    anomalies as
      (
        select "sno"
             , point
             , array_agg(distinct "status") as contradictions
        from unpack
        group by "sno", point
        having count("status") > 1
      )
  select "sno"
       , contradictions
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
  from anomalies
  where array_length(contradictions, 1) > 1
  group by "sno", contradictions;

-- Temporal contradiction view for : s_status_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".wf_rctr_s_status_history as
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
  group by r."sno", r.contradictions
  having count(distinct s."status") > 1;

-- Temporal denseness view for s_status_history <-> s_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".dert_s_status_history_s_history as
  with unpack as
    (
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_status_history' as source
      from "supplier_part@V@UHF".s_status_history
      union
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_history' as source
      from "supplier_part@V@UHF".s_history
    ),
    anomalies as
    (
      select "sno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", point
    )
  select "sno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
       , sources
  from anomalies
  where array_length(sources, 1) < 2
  group by "sno", sources;

-- Temporal denseness view for s_status_history <-> s_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".wf_s_status_history_s_history as
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
  group by "sno", T
  having array_length(array_agg(distinct source), 1) = 1;

-- Temporal redundancy view for : s_status_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".s_status_history_red_ret as
  with unpack as
    (
      select "sno", "status"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
    ),
    anomalies as
      (
        select "sno", "status"
             , point
             , count(*) as count
        from unpack
        group by "sno", "status", point
        having count(*) > 1
      )
  select "sno", "status"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "sno", "status", count;

-- Temporal redundancy view for : s_status_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".s_status_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for s_city_history
/* QUERYNAME=ContradictionUnfoldfold */
create or replace view "supplier_part@V@UHF".rctr_s_city_history as
  with unpack as
    (
      select "sno"
        , "city"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
    ),
    anomalies as
      (
        select "sno"
             , point
             , array_agg(distinct "city") as contradictions
        from unpack
        group by "sno", point
        having count("city") > 1
      )
  select "sno"
       , contradictions
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
  from anomalies
  where array_length(contradictions, 1) > 1
  group by "sno", contradictions;

-- Temporal contradiction view for : s_city_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".wf_rctr_s_city_history as
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
  group by r."sno", r.contradictions
  having count(distinct s."city") > 1;

-- Temporal denseness view for s_city_history <-> s_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".dert_s_city_history_s_history as
  with unpack as
    (
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_city_history' as source
      from "supplier_part@V@UHF".s_city_history
      union
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_history' as source
      from "supplier_part@V@UHF".s_history
    ),
    anomalies as
    (
      select "sno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", point
    )
  select "sno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
       , sources
  from anomalies
  where array_length(sources, 1) < 2
  group by "sno", sources;

-- Temporal denseness view for s_city_history <-> s_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".wf_s_city_history_s_history as
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
  group by "sno", T
  having array_length(array_agg(distinct source), 1) = 1;

-- Temporal redundancy view for : s_city_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".s_city_history_red_ret as
  with unpack as
    (
      select "sno", "city"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
    ),
    anomalies as
      (
        select "sno", "city"
             , point
             , count(*) as count
        from unpack
        group by "sno", "city", point
        having count(*) > 1
      )
  select "sno", "city"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "sno", "city", count;

-- Temporal redundancy view for : s_city_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".s_city_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal redundancy view for : sp_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".sp_history_red_ret as
  with unpack as
    (
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_history
    ),
    anomalies as
      (
        select "sno", "pno"
             , point
             , count(*) as count
        from unpack
        group by "sno", "pno", point
        having count(*) > 1
      )
  select "sno", "pno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "sno", "pno", count;

-- Temporal redundancy view for : sp_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".sp_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

-- Temporal contradiction view for sp_qty_history
/* QUERYNAME=ContradictionUnfoldfold */
create or replace view "supplier_part@V@UHF".rctr_sp_qty_history as
  with unpack as
    (
      select "sno", "pno"
        , "qty"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
    ),
    anomalies as
      (
        select "sno", "pno"
             , point
             , array_agg(distinct "qty") as contradictions
        from unpack
        group by "sno", "pno", point
        having count("qty") > 1
      )
  select "sno", "pno"
       , contradictions
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
  from anomalies
  where array_length(contradictions, 1) > 1
  group by "sno", "pno", contradictions;

-- Temporal contradiction view for : sp_qty_history
/* QUERYNAME=ContradictionWindowFunction */
create or replace view "supplier_part@V@UHF".wf_rctr_sp_qty_history as
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
  group by r."sno", r."pno", r.contradictions
  having count(distinct s."qty") > 1;

-- Temporal denseness view for sp_qty_history <-> sp_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".dert_sp_qty_history_sp_history as
  with unpack as
    (
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
           , 'sp_qty_history' as source
      from "supplier_part@V@UHF".sp_qty_history
      union
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
           , 'sp_history' as source
      from "supplier_part@V@UHF".sp_history
    ),
    anomalies as
    (
      select "sno", "pno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", "pno", point
    )
  select "sno", "pno"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as during
       , sources
  from anomalies
  where array_length(sources, 1) < 2
  group by "sno", "pno", sources;

-- Temporal denseness view for sp_qty_history <-> sp_history
/* QUERYNAME=DensenessUnfoldfold */
create or replace view "supplier_part@V@UHF".wf_sp_qty_history_sp_history as
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
  group by "sno", "pno", T
  having array_length(array_agg(distinct source), 1) = 1;

-- Temporal redundancy view for : sp_qty_history
/* QUERYNAME=RedundancyUnfoldfold */
create or replace view "supplier_part@V@UHF".sp_qty_history_red_ret as
  with unpack as
    (
      select "sno", "pno", "qty"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
    ),
    anomalies as
      (
        select "sno", "pno", "qty"
             , point
             , count(*) as count
        from unpack
        group by "sno", "pno", "qty", point
        having count(*) > 1
      )
  select "sno", "pno", "qty"
       , unnest("UHF".fold("UHF".interval_cons(point,point))) as redundancies
       , count
  from anomalies
  group by "sno", "pno", "qty", count;

-- Temporal redundancy view for : sp_qty_history
/* QUERYNAME=RedundancyWindowFunction */
create or replace view "supplier_part@V@UHF".sp_qty_history_rwf_red as
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
  where Crt_Total_ts >1 and redundancies <> 'empty' and upper(redundancies) is not null;

