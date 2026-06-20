/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the referential key constraint functions
-- =========================================================================== A
*/

-- Temporal foreign key constraint : admissions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_admissions_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".admissions_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".admissions_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : admissions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_admissions_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : admissions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_admissions_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : labevents_itemid_history -> d_labitems_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_labevents_itemid_history_d_labitems_history()
returns table (
    itemid INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, itemid) as (
    select
      lower("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".d_labitems_history
    union all
    select
      upper("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".d_labitems_history
  ),
  T1_dest (ts, itemid) as (
    select
      lower("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".labevents_itemid_history
    union all
    select
      upper("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".labevents_itemid_history
  ),
  t3 as (
    select * from (
      select distinct
        "itemid",
        int4range(ts, lead(ts) over (
          partition by "itemid"
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
        "itemid",
        int4range(ts, lead(ts) over (
          partition by "itemid"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."itemid",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."itemid" = t3."itemid"
      and t7.during <@ t3.during
  )
  where t3."itemid" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : labevents_itemid_history -> d_labitems_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_labevents_itemid_history_d_labitems_history_wf(
    p_itemid INT4,
    p_validTime int4range
)
returns table (
    itemid INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, itemid) as (
    select
      lower("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".d_labitems_history
    union all
    select
      upper("validTime"),
      "itemid"
    from "mimiciv_hosp@V@UHF".d_labitems_history
  ),
  t3 as (
    select * from (
      select distinct
        "itemid",
        int4range(ts, lead(ts) over (
          partition by "itemid"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (itemid, during) as (
    select
      p_itemid,
      p_validTime
  )
  select
    t7."itemid",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."itemid" = t3."itemid"
    and t7.during <@ t3.during
  )
  where t3."itemid" is null;
$$ language sql;

-- Temporal foreign key constraint : labevents_itemid_history -> d_labitems_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_labevents_itemid_history_d_labitems_history()
returns table (
    itemid INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "itemid",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".d_labitems_history
  ),
  T1_dest as (
    select
      "itemid",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".labevents_itemid_history
  ),
  violations as (
    select
      d."itemid",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."itemid" = s."itemid"
      and d.point = s.point
    )
    where s."itemid" is null
  )
  select
    "itemid",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "itemid";
$$ language sql;

-- Temporal foreign key constraint : labevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_labevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".labevents_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".labevents_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : labevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_labevents_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : labevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_labevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".labevents_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : transfers_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_transfers_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".transfers_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".transfers_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : transfers_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_transfers_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : transfers_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_transfers_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".transfers_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : diagnoses_icd_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_diagnoses_icd_history_admissions_history()
returns table (
    hadm_id INT4,
    seq_num INT4,
    icd_code BPCHAR(7),
    icd_version INT2,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id, seq_num, icd_code, icd_version) as (
    select
      lower("validTime"),
      "hadm_id", "seq_num", "icd_code", "icd_version"
    from "mimiciv_hosp@V@UHF".diagnoses_icd_history
    union all
    select
      upper("validTime"),
      "hadm_id", "seq_num", "icd_code", "icd_version"
    from "mimiciv_hosp@V@UHF".diagnoses_icd_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id", "seq_num", "icd_code", "icd_version",
        int4range(ts, lead(ts) over (
          partition by "hadm_id", "seq_num", "icd_code", "icd_version"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id", t7."seq_num", t7."icd_code", t7."icd_version",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : diagnoses_icd_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_diagnoses_icd_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : diagnoses_icd_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_diagnoses_icd_history_admissions_history()
returns table (
    hadm_id INT4,
    seq_num INT4,
    icd_code BPCHAR(7),
    icd_version INT2,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id", "seq_num", "icd_code", "icd_version",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".diagnoses_icd_history
  ),
  violations as (
    select
      d."hadm_id", d."seq_num", d."icd_code", d."icd_version",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id", "seq_num", "icd_code", "icd_version",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id", "seq_num", "icd_code", "icd_version";
$$ language sql;

-- Temporal foreign key constraint : diagnoses_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_diagnoses_icd_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : diagnoses_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_diagnoses_icd_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : diagnoses_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_diagnoses_icd_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : drgcodes_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_drgcodes_history_admissions_history()
returns table (
    subject_id INT4,
    hadm_id INT4,
    drg_code VARCHAR(10),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, subject_id, hadm_id, drg_code) as (
    select
      lower("validTime"),
      "subject_id", "hadm_id", "drg_code"
    from "mimiciv_hosp@V@UHF".drgcodes_history
    union all
    select
      upper("validTime"),
      "subject_id", "hadm_id", "drg_code"
    from "mimiciv_hosp@V@UHF".drgcodes_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "subject_id", "hadm_id", "drg_code",
        int4range(ts, lead(ts) over (
          partition by "subject_id", "hadm_id", "drg_code"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id", t7."hadm_id", t7."drg_code",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : drgcodes_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_drgcodes_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : drgcodes_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_drgcodes_history_admissions_history()
returns table (
    subject_id INT4,
    hadm_id INT4,
    drg_code VARCHAR(10),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "subject_id", "hadm_id", "drg_code",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".drgcodes_history
  ),
  violations as (
    select
      d."subject_id", d."hadm_id", d."drg_code",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "subject_id", "hadm_id", "drg_code",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id", "hadm_id", "drg_code";
$$ language sql;

-- Temporal foreign key constraint : drgcodes_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_drgcodes_history_patients_history()
returns table (
    subject_id INT4,
    hadm_id INT4,
    drg_code VARCHAR(10),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id, hadm_id, drg_code) as (
    select
      lower("validTime"),
      "subject_id", "hadm_id", "drg_code"
    from "mimiciv_hosp@V@UHF".drgcodes_history
    union all
    select
      upper("validTime"),
      "subject_id", "hadm_id", "drg_code"
    from "mimiciv_hosp@V@UHF".drgcodes_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id", "hadm_id", "drg_code",
        int4range(ts, lead(ts) over (
          partition by "subject_id", "hadm_id", "drg_code"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id", t7."hadm_id", t7."drg_code",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : drgcodes_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_drgcodes_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : drgcodes_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_drgcodes_history_patients_history()
returns table (
    subject_id INT4,
    hadm_id INT4,
    drg_code VARCHAR(10),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id", "hadm_id", "drg_code",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".drgcodes_history
  ),
  violations as (
    select
      d."subject_id", d."hadm_id", d."drg_code",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id", "hadm_id", "drg_code",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id", "hadm_id", "drg_code";
$$ language sql;

-- Temporal foreign key constraint : emar_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_emar_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".emar_hadm_id_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".emar_hadm_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : emar_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_emar_hadm_id_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : emar_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_emar_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".emar_hadm_id_history
  ),
  violations as (
    select
      d."hadm_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id";
$$ language sql;

-- Temporal foreign key constraint : emar_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_emar_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".emar_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".emar_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : emar_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_emar_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : emar_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_emar_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".emar_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_hcpcsevents_history_admissions_history()
returns table (
    hadm_id INT4,
    hcpcs_cd BPCHAR(5),
    seq_num INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id, hcpcs_cd, seq_num) as (
    select
      lower("validTime"),
      "hadm_id", "hcpcs_cd", "seq_num"
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
    union all
    select
      upper("validTime"),
      "hadm_id", "hcpcs_cd", "seq_num"
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id", "hcpcs_cd", "seq_num",
        int4range(ts, lead(ts) over (
          partition by "hadm_id", "hcpcs_cd", "seq_num"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id", t7."hcpcs_cd", t7."seq_num",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : hcpcsevents_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_hcpcsevents_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_hcpcsevents_history_admissions_history()
returns table (
    hadm_id INT4,
    hcpcs_cd BPCHAR(5),
    seq_num INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id", "hcpcs_cd", "seq_num",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
  ),
  violations as (
    select
      d."hadm_id", d."hcpcs_cd", d."seq_num",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id", "hcpcs_cd", "seq_num",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id", "hcpcs_cd", "seq_num";
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_history -> d_hcpcs_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_hcpcsevents_history_d_hcpcs_history()
returns table (
    hadm_id INT4,
    hcpcs_cd BPCHAR(5),
    seq_num INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, code) as (
    select
      lower("validTime"),
      "code"
    from "mimiciv_hosp@V@UHF".d_hcpcs_history
    union all
    select
      upper("validTime"),
      "code"
    from "mimiciv_hosp@V@UHF".d_hcpcs_history
  ),
  T1_dest (ts, hadm_id, hcpcs_cd, seq_num) as (
    select
      lower("validTime"),
      "hadm_id", "hcpcs_cd", "seq_num"
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
    union all
    select
      upper("validTime"),
      "hadm_id", "hcpcs_cd", "seq_num"
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
  ),
  t3 as (
    select * from (
      select distinct
        "code",
        int4range(ts, lead(ts) over (
          partition by "code"
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
        "hadm_id", "hcpcs_cd", "seq_num",
        int4range(ts, lead(ts) over (
          partition by "hadm_id", "hcpcs_cd", "seq_num"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id", t7."hcpcs_cd", t7."seq_num",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hcpcs_cd" = t3."code"
      and t7.during <@ t3.during
  )
  where t3."code" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : hcpcsevents_history -> d_hcpcs_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_hcpcsevents_history_d_hcpcs_history_wf(
    p_hcpcs_cd BPCHAR(5),
    p_validTime int4range
)
returns table (
    hcpcs_cd BPCHAR(5),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, code) as (
    select
      lower("validTime"),
      "code"
    from "mimiciv_hosp@V@UHF".d_hcpcs_history
    union all
    select
      upper("validTime"),
      "code"
    from "mimiciv_hosp@V@UHF".d_hcpcs_history
  ),
  t3 as (
    select * from (
      select distinct
        "code",
        int4range(ts, lead(ts) over (
          partition by "code"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hcpcs_cd, during) as (
    select
      p_hcpcs_cd,
      p_validTime
  )
  select
    t7."hcpcs_cd",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hcpcs_cd" = t3."code"
    and t7.during <@ t3.during
  )
  where t3."code" is null;
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_history -> d_hcpcs_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_hcpcsevents_history_d_hcpcs_history()
returns table (
    hadm_id INT4,
    hcpcs_cd BPCHAR(5),
    seq_num INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "code",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".d_hcpcs_history
  ),
  T1_dest as (
    select
      "hadm_id", "hcpcs_cd", "seq_num",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".hcpcsevents_history
  ),
  violations as (
    select
      d."hadm_id", d."hcpcs_cd", d."seq_num",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hcpcs_cd" = s."code"
      and d.point = s.point
    )
    where s."code" is null
  )
  select
    "hadm_id", "hcpcs_cd", "seq_num",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id", "hcpcs_cd", "seq_num";
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_hcpcsevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : hcpcsevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_hcpcsevents_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : hcpcsevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_hcpcsevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : microbiologyevents_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_microbiologyevents_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : microbiologyevents_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_microbiologyevents_hadm_id_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : microbiologyevents_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_microbiologyevents_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
  ),
  violations as (
    select
      d."hadm_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id";
$$ language sql;

-- Temporal foreign key constraint : microbiologyevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_microbiologyevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : microbiologyevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_microbiologyevents_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : microbiologyevents_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_microbiologyevents_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : pharmacy_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_pharmacy_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : pharmacy_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_pharmacy_hadm_id_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : pharmacy_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_pharmacy_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
  ),
  violations as (
    select
      d."hadm_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id";
$$ language sql;

-- Temporal foreign key constraint : pharmacy_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_pharmacy_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : pharmacy_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_pharmacy_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : pharmacy_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_pharmacy_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : poe_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_poe_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".poe_hadm_id_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".poe_hadm_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : poe_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_poe_hadm_id_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : poe_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_poe_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".poe_hadm_id_history
  ),
  violations as (
    select
      d."hadm_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id";
$$ language sql;

-- Temporal foreign key constraint : poe_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_poe_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".poe_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".poe_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : poe_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_poe_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : poe_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_poe_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".poe_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : prescriptions_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_prescriptions_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : prescriptions_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_prescriptions_hadm_id_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : prescriptions_hadm_id_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_prescriptions_hadm_id_history_admissions_history()
returns table (
    hadm_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
  ),
  violations as (
    select
      d."hadm_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id";
$$ language sql;

-- Temporal foreign key constraint : prescriptions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_prescriptions_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : prescriptions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_prescriptions_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : prescriptions_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_prescriptions_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : procedures_icd_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_procedures_icd_history_admissions_history()
returns table (
    hadm_id INT4,
    seq_num INT4,
    icd_code VARCHAR(7),
    icd_version INT2,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id, seq_num, icd_code, icd_version) as (
    select
      lower("validTime"),
      "hadm_id", "seq_num", "icd_code", "icd_version"
    from "mimiciv_hosp@V@UHF".procedures_icd_history
    union all
    select
      upper("validTime"),
      "hadm_id", "seq_num", "icd_code", "icd_version"
    from "mimiciv_hosp@V@UHF".procedures_icd_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id", "seq_num", "icd_code", "icd_version",
        int4range(ts, lead(ts) over (
          partition by "hadm_id", "seq_num", "icd_code", "icd_version"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id", t7."seq_num", t7."icd_code", t7."icd_version",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : procedures_icd_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_procedures_icd_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : procedures_icd_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_procedures_icd_history_admissions_history()
returns table (
    hadm_id INT4,
    seq_num INT4,
    icd_code VARCHAR(7),
    icd_version INT2,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id", "seq_num", "icd_code", "icd_version",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".procedures_icd_history
  ),
  violations as (
    select
      d."hadm_id", d."seq_num", d."icd_code", d."icd_version",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id", "seq_num", "icd_code", "icd_version",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id", "seq_num", "icd_code", "icd_version";
$$ language sql;

-- Temporal foreign key constraint : procedures_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_procedures_icd_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : procedures_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_procedures_icd_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : procedures_icd_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_procedures_icd_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : services_history -> admissions_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_services_history_admissions_history()
returns table (
    hadm_id INT4,
    transfertime TIMESTAMP,
    curr_service VARCHAR(10),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest (ts, hadm_id, transfertime, curr_service) as (
    select
      lower("validTime"),
      "hadm_id", "transfertime", "curr_service"
    from "mimiciv_hosp@V@UHF".services_history
    union all
    select
      upper("validTime"),
      "hadm_id", "transfertime", "curr_service"
    from "mimiciv_hosp@V@UHF".services_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
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
        "hadm_id", "transfertime", "curr_service",
        int4range(ts, lead(ts) over (
          partition by "hadm_id", "transfertime", "curr_service"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."hadm_id", t7."transfertime", t7."curr_service",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."hadm_id" = t3."hadm_id"
      and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : services_history -> admissions_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_services_history_admissions_history_wf(
    p_hadm_id INT4,
    p_validTime int4range
)
returns table (
    hadm_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, hadm_id) as (
    select
      lower("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
    union all
    select
      upper("validTime"),
      "hadm_id"
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  t3 as (
    select * from (
      select distinct
        "hadm_id",
        int4range(ts, lead(ts) over (
          partition by "hadm_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (hadm_id, during) as (
    select
      p_hadm_id,
      p_validTime
  )
  select
    t7."hadm_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."hadm_id" = t3."hadm_id"
    and t7.during <@ t3.during
  )
  where t3."hadm_id" is null;
$$ language sql;

-- Temporal foreign key constraint : services_history -> admissions_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_services_history_admissions_history()
returns table (
    hadm_id INT4,
    transfertime TIMESTAMP,
    curr_service VARCHAR(10),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "hadm_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".admissions_history
  ),
  T1_dest as (
    select
      "hadm_id", "transfertime", "curr_service",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".services_history
  ),
  violations as (
    select
      d."hadm_id", d."transfertime", d."curr_service",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."hadm_id" = s."hadm_id"
      and d.point = s.point
    )
    where s."hadm_id" is null
  )
  select
    "hadm_id", "transfertime", "curr_service",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "hadm_id", "transfertime", "curr_service";
$$ language sql;

-- Temporal foreign key constraint : services_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_services_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".services_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".services_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : services_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_services_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : services_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_services_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".services_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : emar_detail_history -> emar_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_emar_detail_history_emar_history()
returns table (
    emar_id VARCHAR(25),
    parent_field_ordinal VARCHAR(10),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, emar_id) as (
    select
      lower("validTime"),
      "emar_id"
    from "mimiciv_hosp@V@UHF".emar_history
    union all
    select
      upper("validTime"),
      "emar_id"
    from "mimiciv_hosp@V@UHF".emar_history
  ),
  T1_dest (ts, emar_id, parent_field_ordinal) as (
    select
      lower("validTime"),
      "emar_id", "parent_field_ordinal"
    from "mimiciv_hosp@V@UHF".emar_detail_history
    union all
    select
      upper("validTime"),
      "emar_id", "parent_field_ordinal"
    from "mimiciv_hosp@V@UHF".emar_detail_history
  ),
  t3 as (
    select * from (
      select distinct
        "emar_id",
        int4range(ts, lead(ts) over (
          partition by "emar_id"
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
        "emar_id", "parent_field_ordinal",
        int4range(ts, lead(ts) over (
          partition by "emar_id", "parent_field_ordinal"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."emar_id", t7."parent_field_ordinal",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."emar_id" = t3."emar_id"
      and t7.during <@ t3.during
  )
  where t3."emar_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : emar_detail_history -> emar_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_emar_detail_history_emar_history_wf(
    p_emar_id VARCHAR(25),
    p_validTime int4range
)
returns table (
    emar_id VARCHAR(25),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, emar_id) as (
    select
      lower("validTime"),
      "emar_id"
    from "mimiciv_hosp@V@UHF".emar_history
    union all
    select
      upper("validTime"),
      "emar_id"
    from "mimiciv_hosp@V@UHF".emar_history
  ),
  t3 as (
    select * from (
      select distinct
        "emar_id",
        int4range(ts, lead(ts) over (
          partition by "emar_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (emar_id, during) as (
    select
      p_emar_id,
      p_validTime
  )
  select
    t7."emar_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."emar_id" = t3."emar_id"
    and t7.during <@ t3.during
  )
  where t3."emar_id" is null;
$$ language sql;

-- Temporal foreign key constraint : emar_detail_history -> emar_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_emar_detail_history_emar_history()
returns table (
    emar_id VARCHAR(25),
    parent_field_ordinal VARCHAR(10),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "emar_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".emar_history
  ),
  T1_dest as (
    select
      "emar_id", "parent_field_ordinal",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".emar_detail_history
  ),
  violations as (
    select
      d."emar_id", d."parent_field_ordinal",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."emar_id" = s."emar_id"
      and d.point = s.point
    )
    where s."emar_id" is null
  )
  select
    "emar_id", "parent_field_ordinal",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "emar_id", "parent_field_ordinal";
$$ language sql;

-- Temporal foreign key constraint : emar_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_emar_detail_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : emar_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_emar_detail_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : emar_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_emar_detail_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

-- Temporal foreign key constraint : poe_detail_history -> poe_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_poe_detail_history_poe_history()
returns table (
    poe_id VARCHAR(25),
    field_name VARCHAR(255),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, poe_id) as (
    select
      lower("validTime"),
      "poe_id"
    from "mimiciv_hosp@V@UHF".poe_history
    union all
    select
      upper("validTime"),
      "poe_id"
    from "mimiciv_hosp@V@UHF".poe_history
  ),
  T1_dest (ts, poe_id, field_name) as (
    select
      lower("validTime"),
      "poe_id", "field_name"
    from "mimiciv_hosp@V@UHF".poe_detail_history
    union all
    select
      upper("validTime"),
      "poe_id", "field_name"
    from "mimiciv_hosp@V@UHF".poe_detail_history
  ),
  t3 as (
    select * from (
      select distinct
        "poe_id",
        int4range(ts, lead(ts) over (
          partition by "poe_id"
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
        "poe_id", "field_name",
        int4range(ts, lead(ts) over (
          partition by "poe_id", "field_name"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."poe_id", t7."field_name",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."poe_id" = t3."poe_id"
      and t7.during <@ t3.during
  )
  where t3."poe_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : poe_detail_history -> poe_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_poe_detail_history_poe_history_wf(
    p_poe_id VARCHAR(25),
    p_validTime int4range
)
returns table (
    poe_id VARCHAR(25),
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, poe_id) as (
    select
      lower("validTime"),
      "poe_id"
    from "mimiciv_hosp@V@UHF".poe_history
    union all
    select
      upper("validTime"),
      "poe_id"
    from "mimiciv_hosp@V@UHF".poe_history
  ),
  t3 as (
    select * from (
      select distinct
        "poe_id",
        int4range(ts, lead(ts) over (
          partition by "poe_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (poe_id, during) as (
    select
      p_poe_id,
      p_validTime
  )
  select
    t7."poe_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."poe_id" = t3."poe_id"
    and t7.during <@ t3.during
  )
  where t3."poe_id" is null;
$$ language sql;

-- Temporal foreign key constraint : poe_detail_history -> poe_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_poe_detail_history_poe_history()
returns table (
    poe_id VARCHAR(25),
    field_name VARCHAR(255),
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "poe_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".poe_history
  ),
  T1_dest as (
    select
      "poe_id", "field_name",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".poe_detail_history
  ),
  violations as (
    select
      d."poe_id", d."field_name",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."poe_id" = s."poe_id"
      and d.point = s.point
    )
    where s."poe_id" is null
  )
  select
    "poe_id", "field_name",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "poe_id", "field_name";
$$ language sql;

-- Temporal foreign key constraint : poe_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".Twf_poe_detail_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
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
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_dest
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
      t7."subject_id" = t3."subject_id"
      and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint for NEW : poe_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalNewWindowFunction */
create or replace function "mimiciv_hosp@V@UHF".check_fk_new_poe_detail_subject_id_history_patients_history_wf(
    p_subject_id INT4,
    p_validTime int4range
)
returns table (
    subject_id INT4,
    periode_dest int4range,
    periode_source int4range
) as $$
  with T1_source (ts, subject_id) as (
    select
      lower("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
    union all
    select
      upper("validTime"),
      "subject_id"
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  t3 as (
    select * from (
      select distinct
        "subject_id",
        int4range(ts, lead(ts) over (
          partition by "subject_id"
          order by ts
        )) as during
      from T1_source
    ) sub
    where during <> 'empty'
      and upper(during) is not null
  ),
  t7 (subject_id, during) as (
    select
      p_subject_id,
      p_validTime
  )
  select
    t7."subject_id",
    t7.during as periode_dest,
    t3.during as periode_source
  from t7
  left join t3 on (
    t7."subject_id" = t3."subject_id"
    and t7.during <@ t3.during
  )
  where t3."subject_id" is null;
$$ language sql;

-- Temporal foreign key constraint : poe_detail_subject_id_history -> patients_history
/* QUERYNAME=FKTemporalUnfoldFold */
create or replace function "mimiciv_hosp@V@UHF".Tuf_poe_detail_subject_id_history_patients_history()
returns table (
    subject_id INT4,
    periode_dest "UHF"."Interval",
    periode_source "UHF"."Interval"
) as $$
  with T1_source as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".patients_history
  ),
  T1_dest as (
    select
      "subject_id",
      "UHF".unfold("validTime") as point
    from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
  ),
  violations as (
    select
      d."subject_id",
      d.point
    from T1_dest d
    left join T1_source s on (
      d."subject_id" = s."subject_id"
      and d.point = s.point
    )
    where s."subject_id" is null
  )
  select
    "subject_id",
    unnest("UHF".fold("UHF".interval_cons(point, point))) as periode_dest,
    null::int4range as periode_source
  from violations
  group by "subject_id";
$$ language sql;

