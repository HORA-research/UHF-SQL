/*
-- =========================================================================== A
Schema     : mimiciv_hosp@V@UHF
Creation   : 20260619-1747
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the constraint functions.
  Assertion that cannot be defined directly using constraints
-- =========================================================================== A
*/

-- Temporal redundancy check for : d_hcpcs_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_history_noredundancy_check
  (code_ BPCHAR(5))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_history
      where "code" = code_ 

    ),
    anomalies as
      (
        select "code"
             , point
             , count(*) as count
        from unpack
        group by "code", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_history relation has no redundancies';
    return true;
  else
    raise warning 'd_hcpcs_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_hcpcs_category_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_category_history_nocontradiction_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
        , "category"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_category_history
      where "code" = code_ 

    ),
  anomalies as
    (
      select "code"
           , point
           , array_agg(distinct "category") as contradictions
      from unpack
      group by "code", point
      having count("category") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_category_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_hcpcs_category_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_hcpcs_category_history -> d_hcpcs_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_category_history_d_hcpcs_history_denseness_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_category_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_category_history
      where "code" = code_ 

      union
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_history
      where "code" = code_ 

    ),
    anomalies as
    (
      select "code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_category_history and d_hcpcs_history are dense';
    return true;
  else
    raise warning 'd_hcpcs_category_history and d_hcpcs_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_hcpcs_category_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_category_history_noredundancy_check
  (code_ BPCHAR(5), category_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code", "category"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_category_history
      where "code" = code_ and "category" = category_ 

    ),
    anomalies as
      (
        select "code", "category"
             , point
             , count(*) as count
        from unpack
        group by "code", "category", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_category_history relation has no redundancies';
    return true;
  else
    raise warning 'd_hcpcs_category_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_hcpcs_long_description_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history_nocontradiction_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
        , "long_description"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history
      where "code" = code_ 

    ),
  anomalies as
    (
      select "code"
           , point
           , array_agg(distinct "long_description") as contradictions
      from unpack
      group by "code", point
      having count("long_description") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_long_description_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_hcpcs_long_description_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_hcpcs_long_description_history -> d_hcpcs_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history_d_hcpcs_history_denseness_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_long_description_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history
      where "code" = code_ 

      union
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_history
      where "code" = code_ 

    ),
    anomalies as
    (
      select "code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_long_description_history and d_hcpcs_history are dense';
    return true;
  else
    raise warning 'd_hcpcs_long_description_history and d_hcpcs_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_hcpcs_long_description_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history_noredundancy_check
  (code_ BPCHAR(5), long_description_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code", "long_description"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_long_description_history
      where "code" = code_ and "long_description" = long_description_ 

    ),
    anomalies as
      (
        select "code", "long_description"
             , point
             , count(*) as count
        from unpack
        group by "code", "long_description", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_long_description_history relation has no redundancies';
    return true;
  else
    raise warning 'd_hcpcs_long_description_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_hcpcs_short_description_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history_nocontradiction_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
        , "short_description"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history
      where "code" = code_ 

    ),
  anomalies as
    (
      select "code"
           , point
           , array_agg(distinct "short_description") as contradictions
      from unpack
      group by "code", point
      having count("short_description") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_short_description_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_hcpcs_short_description_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_hcpcs_short_description_history -> d_hcpcs_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history_d_hcpcs_history_denseness_check
  (code_ BPCHAR(5))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_short_description_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history
      where "code" = code_ 

      union
      select "code"
           , "UHF".unfold("validTime") as point
           , 'd_hcpcs_history' as source
      from "mimiciv_hosp@V@UHF".d_hcpcs_history
      where "code" = code_ 

    ),
    anomalies as
    (
      select "code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_short_description_history and d_hcpcs_history are dense';
    return true;
  else
    raise warning 'd_hcpcs_short_description_history and d_hcpcs_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_hcpcs_short_description_history
create or replace function "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history_noredundancy_check
  (code_ BPCHAR(5), short_description_ VARCHAR(180))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "code", "short_description"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_hcpcs_short_description_history
      where "code" = code_ and "short_description" = short_description_ 

    ),
    anomalies as
      (
        select "code", "short_description"
             , point
             , count(*) as count
        from unpack
        group by "code", "short_description", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_hcpcs_short_description_history relation has no redundancies';
    return true;
  else
    raise warning 'd_hcpcs_short_description_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_icd_diagnoses_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_diagnoses_history_noredundancy_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_diagnoses_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
      (
        select "icd_code", "icd_version"
             , point
             , count(*) as count
        from unpack
        group by "icd_code", "icd_version", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_diagnoses_history relation has no redundancies';
    return true;
  else
    raise warning 'd_icd_diagnoses_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_icd_diagnoses_long_title_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history_nocontradiction_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
        , "long_title"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
  anomalies as
    (
      select "icd_code", "icd_version"
           , point
           , array_agg(distinct "long_title") as contradictions
      from unpack
      group by "icd_code", "icd_version", point
      having count("long_title") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_diagnoses_long_title_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_icd_diagnoses_long_title_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_icd_diagnoses_long_title_history -> d_icd_diagnoses_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history_d_icd_diagnoses_history_denseness_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'd_icd_diagnoses_long_title_history' as source
      from "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

      union
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'd_icd_diagnoses_history' as source
      from "mimiciv_hosp@V@UHF".d_icd_diagnoses_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
    (
      select "icd_code", "icd_version"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "icd_code", "icd_version", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_diagnoses_long_title_history and d_icd_diagnoses_history are dense';
    return true;
  else
    raise warning 'd_icd_diagnoses_long_title_history and d_icd_diagnoses_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_icd_diagnoses_long_title_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history_noredundancy_check
  (icd_code_ BPCHAR(7), icd_version_ INT2, long_title_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version", "long_title"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_diagnoses_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ and "long_title" = long_title_ 

    ),
    anomalies as
      (
        select "icd_code", "icd_version", "long_title"
             , point
             , count(*) as count
        from unpack
        group by "icd_code", "icd_version", "long_title", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_diagnoses_long_title_history relation has no redundancies';
    return true;
  else
    raise warning 'd_icd_diagnoses_long_title_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_icd_procedures_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_procedures_history_noredundancy_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_procedures_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
      (
        select "icd_code", "icd_version"
             , point
             , count(*) as count
        from unpack
        group by "icd_code", "icd_version", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_procedures_history relation has no redundancies';
    return true;
  else
    raise warning 'd_icd_procedures_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_icd_procedures_long_title_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history_nocontradiction_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
        , "long_title"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
  anomalies as
    (
      select "icd_code", "icd_version"
           , point
           , array_agg(distinct "long_title") as contradictions
      from unpack
      group by "icd_code", "icd_version", point
      having count("long_title") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_procedures_long_title_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_icd_procedures_long_title_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_icd_procedures_long_title_history -> d_icd_procedures_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history_d_icd_procedures_history_denseness_check
  (icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'd_icd_procedures_long_title_history' as source
      from "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

      union
      select "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'd_icd_procedures_history' as source
      from "mimiciv_hosp@V@UHF".d_icd_procedures_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
    (
      select "icd_code", "icd_version"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "icd_code", "icd_version", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_procedures_long_title_history and d_icd_procedures_history are dense';
    return true;
  else
    raise warning 'd_icd_procedures_long_title_history and d_icd_procedures_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_icd_procedures_long_title_history
create or replace function "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history_noredundancy_check
  (icd_code_ BPCHAR(7), icd_version_ INT2, long_title_ VARCHAR(222))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "icd_code", "icd_version", "long_title"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_icd_procedures_long_title_history
      where "icd_code" = icd_code_ and "icd_version" = icd_version_ and "long_title" = long_title_ 

    ),
    anomalies as
      (
        select "icd_code", "icd_version", "long_title"
             , point
             , count(*) as count
        from unpack
        group by "icd_code", "icd_version", "long_title", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_icd_procedures_long_title_history relation has no redundancies';
    return true;
  else
    raise warning 'd_icd_procedures_long_title_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_labitems_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_history_noredundancy_check
  (itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_history
      where "itemid" = itemid_ 

    ),
    anomalies as
      (
        select "itemid"
             , point
             , count(*) as count
        from unpack
        group by "itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_history relation has no redundancies';
    return true;
  else
    raise warning 'd_labitems_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_labitems_label_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_label_history_nocontradiction_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
        , "label"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_label_history
      where "itemid" = itemid_ 

    ),
  anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct "label") as contradictions
      from unpack
      group by "itemid", point
      having count("label") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_label_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_labitems_label_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_labitems_label_history -> d_labitems_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_label_history_d_labitems_history_denseness_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_label_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_label_history
      where "itemid" = itemid_ 

      union
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_history
      where "itemid" = itemid_ 

    ),
    anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "itemid", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_label_history and d_labitems_history are dense';
    return true;
  else
    raise warning 'd_labitems_label_history and d_labitems_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_labitems_label_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_label_history_noredundancy_check
  (itemid_ INT4, label_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid", "label"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_label_history
      where "itemid" = itemid_ and "label" = label_ 

    ),
    anomalies as
      (
        select "itemid", "label"
             , point
             , count(*) as count
        from unpack
        group by "itemid", "label", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_label_history relation has no redundancies';
    return true;
  else
    raise warning 'd_labitems_label_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_labitems_fluid_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_fluid_history_nocontradiction_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
        , "fluid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_fluid_history
      where "itemid" = itemid_ 

    ),
  anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct "fluid") as contradictions
      from unpack
      group by "itemid", point
      having count("fluid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_fluid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_labitems_fluid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_labitems_fluid_history -> d_labitems_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_fluid_history_d_labitems_history_denseness_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_fluid_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_fluid_history
      where "itemid" = itemid_ 

      union
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_history
      where "itemid" = itemid_ 

    ),
    anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "itemid", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_fluid_history and d_labitems_history are dense';
    return true;
  else
    raise warning 'd_labitems_fluid_history and d_labitems_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_labitems_fluid_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_fluid_history_noredundancy_check
  (itemid_ INT4, fluid_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid", "fluid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_fluid_history
      where "itemid" = itemid_ and "fluid" = fluid_ 

    ),
    anomalies as
      (
        select "itemid", "fluid"
             , point
             , count(*) as count
        from unpack
        group by "itemid", "fluid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_fluid_history relation has no redundancies';
    return true;
  else
    raise warning 'd_labitems_fluid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : d_labitems_category_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_category_history_nocontradiction_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
        , "category"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_category_history
      where "itemid" = itemid_ 

    ),
  anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct "category") as contradictions
      from unpack
      group by "itemid", point
      having count("category") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_category_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'd_labitems_category_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : d_labitems_category_history -> d_labitems_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_category_history_d_labitems_history_denseness_check
  (itemid_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_category_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_category_history
      where "itemid" = itemid_ 

      union
      select "itemid"
           , "UHF".unfold("validTime") as point
           , 'd_labitems_history' as source
      from "mimiciv_hosp@V@UHF".d_labitems_history
      where "itemid" = itemid_ 

    ),
    anomalies as
    (
      select "itemid"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "itemid", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_category_history and d_labitems_history are dense';
    return true;
  else
    raise warning 'd_labitems_category_history and d_labitems_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : d_labitems_category_history
create or replace function "mimiciv_hosp@V@UHF".d_labitems_category_history_noredundancy_check
  (itemid_ INT4, category_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "itemid", "category"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".d_labitems_category_history
      where "itemid" = itemid_ and "category" = category_ 

    ),
    anomalies as
      (
        select "itemid", "category"
             , point
             , count(*) as count
        from unpack
        group by "itemid", "category", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'd_labitems_category_history relation has no redundancies';
    return true;
  else
    raise warning 'd_labitems_category_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : omr_history
create or replace function "mimiciv_hosp@V@UHF".omr_history_noredundancy_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".omr_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

    ),
    anomalies as
      (
        select "subject_id", "chartdate", "seq_num"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "chartdate", "seq_num", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_history relation has no redundancies';
    return true;
  else
    raise warning 'omr_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : omr_result_name_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_name_history_nocontradiction_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num"
        , "result_name"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".omr_result_name_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

    ),
  anomalies as
    (
      select "subject_id", "chartdate", "seq_num"
           , point
           , array_agg(distinct "result_name") as contradictions
      from unpack
      group by "subject_id", "chartdate", "seq_num", point
      having count("result_name") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_name_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'omr_result_name_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : omr_result_name_history -> omr_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_name_history_omr_history_denseness_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'omr_result_name_history' as source
      from "mimiciv_hosp@V@UHF".omr_result_name_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

      union
      select "subject_id", "chartdate", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'omr_history' as source
      from "mimiciv_hosp@V@UHF".omr_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

    ),
    anomalies as
    (
      select "subject_id", "chartdate", "seq_num"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "chartdate", "seq_num", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_name_history and omr_history are dense';
    return true;
  else
    raise warning 'omr_result_name_history and omr_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : omr_result_name_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_name_history_noredundancy_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4, result_name_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num", "result_name"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".omr_result_name_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ and "result_name" = result_name_ 

    ),
    anomalies as
      (
        select "subject_id", "chartdate", "seq_num", "result_name"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "chartdate", "seq_num", "result_name", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_name_history relation has no redundancies';
    return true;
  else
    raise warning 'omr_result_name_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : omr_result_value_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_value_history_nocontradiction_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num"
        , "result_value"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".omr_result_value_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

    ),
  anomalies as
    (
      select "subject_id", "chartdate", "seq_num"
           , point
           , array_agg(distinct "result_value") as contradictions
      from unpack
      group by "subject_id", "chartdate", "seq_num", point
      having count("result_value") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_value_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'omr_result_value_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : omr_result_value_history -> omr_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_value_history_omr_history_denseness_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'omr_result_value_history' as source
      from "mimiciv_hosp@V@UHF".omr_result_value_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

      union
      select "subject_id", "chartdate", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'omr_history' as source
      from "mimiciv_hosp@V@UHF".omr_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ 

    ),
    anomalies as
    (
      select "subject_id", "chartdate", "seq_num"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "chartdate", "seq_num", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_value_history and omr_history are dense';
    return true;
  else
    raise warning 'omr_result_value_history and omr_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : omr_result_value_history
create or replace function "mimiciv_hosp@V@UHF".omr_result_value_history_noredundancy_check
  (subject_id_ INT4, chartdate_ DATE, seq_num_ INT4, result_value_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "chartdate", "seq_num", "result_value"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".omr_result_value_history
      where "subject_id" = subject_id_ and "chartdate" = chartdate_ and "seq_num" = seq_num_ and "result_value" = result_value_ 

    ),
    anomalies as
      (
        select "subject_id", "chartdate", "seq_num", "result_value"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "chartdate", "seq_num", "result_value", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'omr_result_value_history relation has no redundancies';
    return true;
  else
    raise warning 'omr_result_value_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_history_noredundancy_check
  (subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : patients_gender_history
create or replace function "mimiciv_hosp@V@UHF".patients_gender_history_nocontradiction_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
        , "gender"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_gender_history
      where "subject_id" = subject_id_ 

    ),
  anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct "gender") as contradictions
      from unpack
      group by "subject_id", point
      having count("gender") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_gender_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'patients_gender_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : patients_gender_history -> patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_gender_history_patients_history_denseness_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_gender_history' as source
      from "mimiciv_hosp@V@UHF".patients_gender_history
      where "subject_id" = subject_id_ 

      union
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_history' as source
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_gender_history and patients_history are dense';
    return true;
  else
    raise warning 'patients_gender_history and patients_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_gender_history
create or replace function "mimiciv_hosp@V@UHF".patients_gender_history_noredundancy_check
  (subject_id_ INT4, gender_ BPCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "gender"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_gender_history
      where "subject_id" = subject_id_ and "gender" = gender_ 

    ),
    anomalies as
      (
        select "subject_id", "gender"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "gender", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_gender_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_gender_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : patients_anchor_age_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_age_history_nocontradiction_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
        , "anchor_age"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_age_history
      where "subject_id" = subject_id_ 

    ),
  anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct "anchor_age") as contradictions
      from unpack
      group by "subject_id", point
      having count("anchor_age") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_age_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'patients_anchor_age_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : patients_anchor_age_history -> patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_age_history_patients_history_denseness_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_anchor_age_history' as source
      from "mimiciv_hosp@V@UHF".patients_anchor_age_history
      where "subject_id" = subject_id_ 

      union
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_history' as source
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_age_history and patients_history are dense';
    return true;
  else
    raise warning 'patients_anchor_age_history and patients_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_anchor_age_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_age_history_noredundancy_check
  (subject_id_ INT4, anchor_age_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "anchor_age"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_age_history
      where "subject_id" = subject_id_ and "anchor_age" = anchor_age_ 

    ),
    anomalies as
      (
        select "subject_id", "anchor_age"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "anchor_age", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_age_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_anchor_age_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : patients_anchor_year_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_history_nocontradiction_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
        , "anchor_year"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_year_history
      where "subject_id" = subject_id_ 

    ),
  anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct "anchor_year") as contradictions
      from unpack
      group by "subject_id", point
      having count("anchor_year") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'patients_anchor_year_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : patients_anchor_year_history -> patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_history_patients_history_denseness_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_anchor_year_history' as source
      from "mimiciv_hosp@V@UHF".patients_anchor_year_history
      where "subject_id" = subject_id_ 

      union
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_history' as source
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_history and patients_history are dense';
    return true;
  else
    raise warning 'patients_anchor_year_history and patients_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_anchor_year_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_history_noredundancy_check
  (subject_id_ INT4, anchor_year_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "anchor_year"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_year_history
      where "subject_id" = subject_id_ and "anchor_year" = anchor_year_ 

    ),
    anomalies as
      (
        select "subject_id", "anchor_year"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "anchor_year", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_anchor_year_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : patients_anchor_year_group_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_group_history_nocontradiction_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
        , "anchor_year_group"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_year_group_history
      where "subject_id" = subject_id_ 

    ),
  anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct "anchor_year_group") as contradictions
      from unpack
      group by "subject_id", point
      having count("anchor_year_group") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_group_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'patients_anchor_year_group_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : patients_anchor_year_group_history -> patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_group_history_patients_history_denseness_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_anchor_year_group_history' as source
      from "mimiciv_hosp@V@UHF".patients_anchor_year_group_history
      where "subject_id" = subject_id_ 

      union
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_history' as source
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_group_history and patients_history are dense';
    return true;
  else
    raise warning 'patients_anchor_year_group_history and patients_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_anchor_year_group_history
create or replace function "mimiciv_hosp@V@UHF".patients_anchor_year_group_history_noredundancy_check
  (subject_id_ INT4, anchor_year_group_ VARCHAR(20))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "anchor_year_group"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_anchor_year_group_history
      where "subject_id" = subject_id_ and "anchor_year_group" = anchor_year_group_ 

    ),
    anomalies as
      (
        select "subject_id", "anchor_year_group"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "anchor_year_group", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_anchor_year_group_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_anchor_year_group_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : patients_dod_history
create or replace function "mimiciv_hosp@V@UHF".patients_dod_history_nocontradiction_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
        , "dod"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_dod_history
      where "subject_id" = subject_id_ 

    ),
  anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct "dod") as contradictions
      from unpack
      group by "subject_id", point
      having count("dod") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_dod_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'patients_dod_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : patients_dod_history -> patients_history
create or replace function "mimiciv_hosp@V@UHF".patients_dod_history_patients_history_denseness_check
  (subject_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_dod_history' as source
      from "mimiciv_hosp@V@UHF".patients_dod_history
      where "subject_id" = subject_id_ 

      union
      select "subject_id"
           , "UHF".unfold("validTime") as point
           , 'patients_history' as source
      from "mimiciv_hosp@V@UHF".patients_history
      where "subject_id" = subject_id_ 

    ),
    anomalies as
    (
      select "subject_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_dod_history and patients_history are dense';
    return true;
  else
    raise warning 'patients_dod_history and patients_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : patients_dod_history
create or replace function "mimiciv_hosp@V@UHF".patients_dod_history_noredundancy_check
  (subject_id_ INT4, dod_ DATE)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "dod"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".patients_dod_history
      where "subject_id" = subject_id_ and "dod" = dod_ 

    ),
    anomalies as
      (
        select "subject_id", "dod"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "dod", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'patients_dod_history relation has no redundancies';
    return true;
  else
    raise warning 'patients_dod_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : provider_history
create or replace function "mimiciv_hosp@V@UHF".provider_history_noredundancy_check
  (provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".provider_history
      where "provider_id" = provider_id_ 

    ),
    anomalies as
      (
        select "provider_id"
             , point
             , count(*) as count
        from unpack
        group by "provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'provider_history relation has no redundancies';
    return true;
  else
    raise warning 'provider_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_history_noredundancy_check
  (hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".admissions_subject_id_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_subject_id_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "hadm_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_subject_id_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_subject_id_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".admissions_subject_id_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_subject_id_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_subject_id_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".admissions_subject_id_history_noredundancy_check
  (hadm_id_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_subject_id_history
      where "hadm_id" = hadm_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_admittime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admittime_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "admittime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admittime_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "admittime") as contradictions
      from unpack
      group by "hadm_id", point
      having count("admittime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admittime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_admittime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_admittime_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admittime_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_admittime_history' as source
      from "mimiciv_hosp@V@UHF".admissions_admittime_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admittime_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_admittime_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_admittime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admittime_history_noredundancy_check
  (hadm_id_ INT4, admittime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "admittime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admittime_history
      where "hadm_id" = hadm_id_ and "admittime" = admittime_ 

    ),
    anomalies as
      (
        select "hadm_id", "admittime"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "admittime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admittime_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_admittime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_dischtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_dischtime_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "dischtime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_dischtime_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "dischtime") as contradictions
      from unpack
      group by "hadm_id", point
      having count("dischtime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_dischtime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_dischtime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_dischtime_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_dischtime_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_dischtime_history' as source
      from "mimiciv_hosp@V@UHF".admissions_dischtime_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_dischtime_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_dischtime_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_dischtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_dischtime_history_noredundancy_check
  (hadm_id_ INT4, dischtime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "dischtime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_dischtime_history
      where "hadm_id" = hadm_id_ and "dischtime" = dischtime_ 

    ),
    anomalies as
      (
        select "hadm_id", "dischtime"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "dischtime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_dischtime_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_dischtime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_deathtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_deathtime_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "deathtime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_deathtime_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "deathtime") as contradictions
      from unpack
      group by "hadm_id", point
      having count("deathtime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_deathtime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_deathtime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_deathtime_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_deathtime_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_deathtime_history' as source
      from "mimiciv_hosp@V@UHF".admissions_deathtime_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_deathtime_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_deathtime_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_deathtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_deathtime_history_noredundancy_check
  (hadm_id_ INT4, deathtime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "deathtime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_deathtime_history
      where "hadm_id" = hadm_id_ and "deathtime" = deathtime_ 

    ),
    anomalies as
      (
        select "hadm_id", "deathtime"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "deathtime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_deathtime_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_deathtime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_admission_type_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_type_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "admission_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admission_type_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "admission_type") as contradictions
      from unpack
      group by "hadm_id", point
      having count("admission_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_admission_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_admission_type_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_type_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_admission_type_history' as source
      from "mimiciv_hosp@V@UHF".admissions_admission_type_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_type_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_admission_type_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_admission_type_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_type_history_noredundancy_check
  (hadm_id_ INT4, admission_type_ VARCHAR(40))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "admission_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admission_type_history
      where "hadm_id" = hadm_id_ and "admission_type" = admission_type_ 

    ),
    anomalies as
      (
        select "hadm_id", "admission_type"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "admission_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_type_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_admission_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_admit_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "admit_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "admit_provider_id") as contradictions
      from unpack
      group by "hadm_id", point
      having count("admit_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admit_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_admit_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_admit_provider_id_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_admit_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admit_provider_id_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_admit_provider_id_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_admit_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history_noredundancy_check
  (hadm_id_ INT4, admit_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "admit_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admit_provider_id_history
      where "hadm_id" = hadm_id_ and "admit_provider_id" = admit_provider_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "admit_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "admit_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admit_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_admit_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_admission_location_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_location_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "admission_location"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admission_location_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "admission_location") as contradictions
      from unpack
      group by "hadm_id", point
      having count("admission_location") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_location_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_admission_location_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_admission_location_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_location_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_admission_location_history' as source
      from "mimiciv_hosp@V@UHF".admissions_admission_location_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_location_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_admission_location_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_admission_location_history
create or replace function "mimiciv_hosp@V@UHF".admissions_admission_location_history_noredundancy_check
  (hadm_id_ INT4, admission_location_ VARCHAR(60))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "admission_location"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_admission_location_history
      where "hadm_id" = hadm_id_ and "admission_location" = admission_location_ 

    ),
    anomalies as
      (
        select "hadm_id", "admission_location"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "admission_location", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_admission_location_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_admission_location_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_discharge_location_history
create or replace function "mimiciv_hosp@V@UHF".admissions_discharge_location_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "discharge_location"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_discharge_location_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "discharge_location") as contradictions
      from unpack
      group by "hadm_id", point
      having count("discharge_location") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_discharge_location_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_discharge_location_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_discharge_location_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_discharge_location_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_discharge_location_history' as source
      from "mimiciv_hosp@V@UHF".admissions_discharge_location_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_discharge_location_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_discharge_location_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_discharge_location_history
create or replace function "mimiciv_hosp@V@UHF".admissions_discharge_location_history_noredundancy_check
  (hadm_id_ INT4, discharge_location_ VARCHAR(60))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "discharge_location"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_discharge_location_history
      where "hadm_id" = hadm_id_ and "discharge_location" = discharge_location_ 

    ),
    anomalies as
      (
        select "hadm_id", "discharge_location"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "discharge_location", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_discharge_location_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_discharge_location_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_insurance_history
create or replace function "mimiciv_hosp@V@UHF".admissions_insurance_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "insurance"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_insurance_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "insurance") as contradictions
      from unpack
      group by "hadm_id", point
      having count("insurance") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_insurance_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_insurance_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_insurance_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_insurance_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_insurance_history' as source
      from "mimiciv_hosp@V@UHF".admissions_insurance_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_insurance_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_insurance_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_insurance_history
create or replace function "mimiciv_hosp@V@UHF".admissions_insurance_history_noredundancy_check
  (hadm_id_ INT4, insurance_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "insurance"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_insurance_history
      where "hadm_id" = hadm_id_ and "insurance" = insurance_ 

    ),
    anomalies as
      (
        select "hadm_id", "insurance"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "insurance", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_insurance_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_insurance_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_language_history
create or replace function "mimiciv_hosp@V@UHF".admissions_language_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "language"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_language_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "language") as contradictions
      from unpack
      group by "hadm_id", point
      having count("language") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_language_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_language_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_language_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_language_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_language_history' as source
      from "mimiciv_hosp@V@UHF".admissions_language_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_language_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_language_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_language_history
create or replace function "mimiciv_hosp@V@UHF".admissions_language_history_noredundancy_check
  (hadm_id_ INT4, language_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "language"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_language_history
      where "hadm_id" = hadm_id_ and "language" = language_ 

    ),
    anomalies as
      (
        select "hadm_id", "language"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "language", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_language_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_language_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_marital_status_history
create or replace function "mimiciv_hosp@V@UHF".admissions_marital_status_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "marital_status"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_marital_status_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "marital_status") as contradictions
      from unpack
      group by "hadm_id", point
      having count("marital_status") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_marital_status_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_marital_status_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_marital_status_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_marital_status_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_marital_status_history' as source
      from "mimiciv_hosp@V@UHF".admissions_marital_status_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_marital_status_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_marital_status_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_marital_status_history
create or replace function "mimiciv_hosp@V@UHF".admissions_marital_status_history_noredundancy_check
  (hadm_id_ INT4, marital_status_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "marital_status"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_marital_status_history
      where "hadm_id" = hadm_id_ and "marital_status" = marital_status_ 

    ),
    anomalies as
      (
        select "hadm_id", "marital_status"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "marital_status", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_marital_status_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_marital_status_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_race_history
create or replace function "mimiciv_hosp@V@UHF".admissions_race_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "race"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_race_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "race") as contradictions
      from unpack
      group by "hadm_id", point
      having count("race") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_race_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_race_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_race_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_race_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_race_history' as source
      from "mimiciv_hosp@V@UHF".admissions_race_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_race_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_race_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_race_history
create or replace function "mimiciv_hosp@V@UHF".admissions_race_history_noredundancy_check
  (hadm_id_ INT4, race_ VARCHAR(80))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "race"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_race_history
      where "hadm_id" = hadm_id_ and "race" = race_ 

    ),
    anomalies as
      (
        select "hadm_id", "race"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "race", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_race_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_race_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_edregtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edregtime_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "edregtime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_edregtime_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "edregtime") as contradictions
      from unpack
      group by "hadm_id", point
      having count("edregtime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edregtime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_edregtime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_edregtime_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edregtime_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_edregtime_history' as source
      from "mimiciv_hosp@V@UHF".admissions_edregtime_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edregtime_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_edregtime_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_edregtime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edregtime_history_noredundancy_check
  (hadm_id_ INT4, edregtime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "edregtime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_edregtime_history
      where "hadm_id" = hadm_id_ and "edregtime" = edregtime_ 

    ),
    anomalies as
      (
        select "hadm_id", "edregtime"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "edregtime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edregtime_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_edregtime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_edouttime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edouttime_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "edouttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_edouttime_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "edouttime") as contradictions
      from unpack
      group by "hadm_id", point
      having count("edouttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edouttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_edouttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_edouttime_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edouttime_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_edouttime_history' as source
      from "mimiciv_hosp@V@UHF".admissions_edouttime_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edouttime_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_edouttime_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_edouttime_history
create or replace function "mimiciv_hosp@V@UHF".admissions_edouttime_history_noredundancy_check
  (hadm_id_ INT4, edouttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "edouttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_edouttime_history
      where "hadm_id" = hadm_id_ and "edouttime" = edouttime_ 

    ),
    anomalies as
      (
        select "hadm_id", "edouttime"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "edouttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_edouttime_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_edouttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : admissions_hospital_expire_flag_history
create or replace function "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history_nocontradiction_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
        , "hospital_expire_flag"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history
      where "hadm_id" = hadm_id_ 

    ),
  anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct "hospital_expire_flag") as contradictions
      from unpack
      group by "hadm_id", point
      having count("hospital_expire_flag") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_hospital_expire_flag_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'admissions_hospital_expire_flag_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : admissions_hospital_expire_flag_history -> admissions_history
create or replace function "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history_admissions_history_denseness_check
  (hadm_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_hospital_expire_flag_history' as source
      from "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history
      where "hadm_id" = hadm_id_ 

      union
      select "hadm_id"
           , "UHF".unfold("validTime") as point
           , 'admissions_history' as source
      from "mimiciv_hosp@V@UHF".admissions_history
      where "hadm_id" = hadm_id_ 

    ),
    anomalies as
    (
      select "hadm_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_hospital_expire_flag_history and admissions_history are dense';
    return true;
  else
    raise warning 'admissions_hospital_expire_flag_history and admissions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : admissions_hospital_expire_flag_history
create or replace function "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history_noredundancy_check
  (hadm_id_ INT4, hospital_expire_flag_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hospital_expire_flag"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".admissions_hospital_expire_flag_history
      where "hadm_id" = hadm_id_ and "hospital_expire_flag" = hospital_expire_flag_ 

    ),
    anomalies as
      (
        select "hadm_id", "hospital_expire_flag"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "hospital_expire_flag", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'admissions_hospital_expire_flag_history relation has no redundancies';
    return true;
  else
    raise warning 'admissions_hospital_expire_flag_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_history_noredundancy_check
  (labevent_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
      (
        select "labevent_id"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_subject_id_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_subject_id_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "labevent_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_subject_id_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_subject_id_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".labevents_subject_id_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_subject_id_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_subject_id_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_subject_id_history_noredundancy_check
  (labevent_id_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_subject_id_history
      where "labevent_id" = labevent_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "labevent_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_hadm_id_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_hadm_id_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "labevent_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_hadm_id_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_hadm_id_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".labevents_hadm_id_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_hadm_id_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_hadm_id_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_hadm_id_history_noredundancy_check
  (labevent_id_ INT4, hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_hadm_id_history
      where "labevent_id" = labevent_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "labevent_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_specimen_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_specimen_id_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "specimen_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_specimen_id_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "specimen_id") as contradictions
      from unpack
      group by "labevent_id", point
      having count("specimen_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_specimen_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_specimen_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_specimen_id_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_specimen_id_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_specimen_id_history' as source
      from "mimiciv_hosp@V@UHF".labevents_specimen_id_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_specimen_id_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_specimen_id_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_specimen_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_specimen_id_history_noredundancy_check
  (labevent_id_ INT4, specimen_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "specimen_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_specimen_id_history
      where "labevent_id" = labevent_id_ and "specimen_id" = specimen_id_ 

    ),
    anomalies as
      (
        select "labevent_id", "specimen_id"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "specimen_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_specimen_id_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_specimen_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_itemid_history
create or replace function "mimiciv_hosp@V@UHF".labevents_itemid_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "itemid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_itemid_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "itemid") as contradictions
      from unpack
      group by "labevent_id", point
      having count("itemid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_itemid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_itemid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_itemid_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_itemid_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_itemid_history' as source
      from "mimiciv_hosp@V@UHF".labevents_itemid_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_itemid_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_itemid_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_itemid_history
create or replace function "mimiciv_hosp@V@UHF".labevents_itemid_history_noredundancy_check
  (labevent_id_ INT4, itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_itemid_history
      where "labevent_id" = labevent_id_ and "itemid" = itemid_ 

    ),
    anomalies as
      (
        select "labevent_id", "itemid"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_itemid_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_itemid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_order_provider_id_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "order_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_order_provider_id_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "order_provider_id") as contradictions
      from unpack
      group by "labevent_id", point
      having count("order_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_order_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_order_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_order_provider_id_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_order_provider_id_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_order_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".labevents_order_provider_id_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_order_provider_id_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_order_provider_id_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".labevents_order_provider_id_history_noredundancy_check
  (labevent_id_ INT4, order_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "order_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_order_provider_id_history
      where "labevent_id" = labevent_id_ and "order_provider_id" = order_provider_id_ 

    ),
    anomalies as
      (
        select "labevent_id", "order_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "order_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_order_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_order_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_charttime_history
create or replace function "mimiciv_hosp@V@UHF".labevents_charttime_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "charttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_charttime_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "charttime") as contradictions
      from unpack
      group by "labevent_id", point
      having count("charttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_charttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_charttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_charttime_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_charttime_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_charttime_history' as source
      from "mimiciv_hosp@V@UHF".labevents_charttime_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_charttime_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_charttime_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_charttime_history
create or replace function "mimiciv_hosp@V@UHF".labevents_charttime_history_noredundancy_check
  (labevent_id_ INT4, charttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "charttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_charttime_history
      where "labevent_id" = labevent_id_ and "charttime" = charttime_ 

    ),
    anomalies as
      (
        select "labevent_id", "charttime"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "charttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_charttime_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_charttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_storetime_history
create or replace function "mimiciv_hosp@V@UHF".labevents_storetime_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "storetime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_storetime_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "storetime") as contradictions
      from unpack
      group by "labevent_id", point
      having count("storetime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_storetime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_storetime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_storetime_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_storetime_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_storetime_history' as source
      from "mimiciv_hosp@V@UHF".labevents_storetime_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_storetime_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_storetime_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_storetime_history
create or replace function "mimiciv_hosp@V@UHF".labevents_storetime_history_noredundancy_check
  (labevent_id_ INT4, storetime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "storetime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_storetime_history
      where "labevent_id" = labevent_id_ and "storetime" = storetime_ 

    ),
    anomalies as
      (
        select "labevent_id", "storetime"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "storetime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_storetime_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_storetime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_value_history
create or replace function "mimiciv_hosp@V@UHF".labevents_value_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "value"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_value_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "value") as contradictions
      from unpack
      group by "labevent_id", point
      having count("value") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_value_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_value_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_value_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_value_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_value_history' as source
      from "mimiciv_hosp@V@UHF".labevents_value_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_value_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_value_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_value_history
create or replace function "mimiciv_hosp@V@UHF".labevents_value_history_noredundancy_check
  (labevent_id_ INT4, value_ VARCHAR(200))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "value"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_value_history
      where "labevent_id" = labevent_id_ and "value" = value_ 

    ),
    anomalies as
      (
        select "labevent_id", "value"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "value", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_value_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_value_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_valuenum_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valuenum_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "valuenum"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_valuenum_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "valuenum") as contradictions
      from unpack
      group by "labevent_id", point
      having count("valuenum") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valuenum_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_valuenum_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_valuenum_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valuenum_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_valuenum_history' as source
      from "mimiciv_hosp@V@UHF".labevents_valuenum_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valuenum_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_valuenum_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_valuenum_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valuenum_history_noredundancy_check
  (labevent_id_ INT4, valuenum_ FLOAT8)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "valuenum"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_valuenum_history
      where "labevent_id" = labevent_id_ and "valuenum" = valuenum_ 

    ),
    anomalies as
      (
        select "labevent_id", "valuenum"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "valuenum", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valuenum_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_valuenum_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_valueuom_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valueuom_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "valueuom"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_valueuom_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "valueuom") as contradictions
      from unpack
      group by "labevent_id", point
      having count("valueuom") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valueuom_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_valueuom_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_valueuom_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valueuom_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_valueuom_history' as source
      from "mimiciv_hosp@V@UHF".labevents_valueuom_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valueuom_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_valueuom_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_valueuom_history
create or replace function "mimiciv_hosp@V@UHF".labevents_valueuom_history_noredundancy_check
  (labevent_id_ INT4, valueuom_ VARCHAR(20))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "valueuom"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_valueuom_history
      where "labevent_id" = labevent_id_ and "valueuom" = valueuom_ 

    ),
    anomalies as
      (
        select "labevent_id", "valueuom"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "valueuom", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_valueuom_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_valueuom_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_ref_range_lower_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "ref_range_lower"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "ref_range_lower") as contradictions
      from unpack
      group by "labevent_id", point
      having count("ref_range_lower") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_lower_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_ref_range_lower_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_ref_range_lower_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_ref_range_lower_history' as source
      from "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_lower_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_ref_range_lower_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_ref_range_lower_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history_noredundancy_check
  (labevent_id_ INT4, ref_range_lower_ FLOAT8)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "ref_range_lower"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_ref_range_lower_history
      where "labevent_id" = labevent_id_ and "ref_range_lower" = ref_range_lower_ 

    ),
    anomalies as
      (
        select "labevent_id", "ref_range_lower"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "ref_range_lower", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_lower_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_ref_range_lower_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_ref_range_upper_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "ref_range_upper"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "ref_range_upper") as contradictions
      from unpack
      group by "labevent_id", point
      having count("ref_range_upper") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_upper_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_ref_range_upper_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_ref_range_upper_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_ref_range_upper_history' as source
      from "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_upper_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_ref_range_upper_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_ref_range_upper_history
create or replace function "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history_noredundancy_check
  (labevent_id_ INT4, ref_range_upper_ FLOAT8)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "ref_range_upper"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_ref_range_upper_history
      where "labevent_id" = labevent_id_ and "ref_range_upper" = ref_range_upper_ 

    ),
    anomalies as
      (
        select "labevent_id", "ref_range_upper"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "ref_range_upper", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_ref_range_upper_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_ref_range_upper_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_flag_history
create or replace function "mimiciv_hosp@V@UHF".labevents_flag_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "flag"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_flag_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "flag") as contradictions
      from unpack
      group by "labevent_id", point
      having count("flag") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_flag_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_flag_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_flag_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_flag_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_flag_history' as source
      from "mimiciv_hosp@V@UHF".labevents_flag_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_flag_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_flag_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_flag_history
create or replace function "mimiciv_hosp@V@UHF".labevents_flag_history_noredundancy_check
  (labevent_id_ INT4, flag_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "flag"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_flag_history
      where "labevent_id" = labevent_id_ and "flag" = flag_ 

    ),
    anomalies as
      (
        select "labevent_id", "flag"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "flag", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_flag_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_flag_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_priority_history
create or replace function "mimiciv_hosp@V@UHF".labevents_priority_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "priority"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_priority_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "priority") as contradictions
      from unpack
      group by "labevent_id", point
      having count("priority") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_priority_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_priority_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_priority_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_priority_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_priority_history' as source
      from "mimiciv_hosp@V@UHF".labevents_priority_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_priority_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_priority_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_priority_history
create or replace function "mimiciv_hosp@V@UHF".labevents_priority_history_noredundancy_check
  (labevent_id_ INT4, priority_ VARCHAR(7))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "priority"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_priority_history
      where "labevent_id" = labevent_id_ and "priority" = priority_ 

    ),
    anomalies as
      (
        select "labevent_id", "priority"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "priority", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_priority_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_priority_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : labevents_comments_history
create or replace function "mimiciv_hosp@V@UHF".labevents_comments_history_nocontradiction_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
        , "comments"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_comments_history
      where "labevent_id" = labevent_id_ 

    ),
  anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct "comments") as contradictions
      from unpack
      group by "labevent_id", point
      having count("comments") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_comments_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'labevents_comments_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : labevents_comments_history -> labevents_history
create or replace function "mimiciv_hosp@V@UHF".labevents_comments_history_labevents_history_denseness_check
  (labevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_comments_history' as source
      from "mimiciv_hosp@V@UHF".labevents_comments_history
      where "labevent_id" = labevent_id_ 

      union
      select "labevent_id"
           , "UHF".unfold("validTime") as point
           , 'labevents_history' as source
      from "mimiciv_hosp@V@UHF".labevents_history
      where "labevent_id" = labevent_id_ 

    ),
    anomalies as
    (
      select "labevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "labevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_comments_history and labevents_history are dense';
    return true;
  else
    raise warning 'labevents_comments_history and labevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : labevents_comments_history
create or replace function "mimiciv_hosp@V@UHF".labevents_comments_history_noredundancy_check
  (labevent_id_ INT4, comments_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "labevent_id", "comments"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".labevents_comments_history
      where "labevent_id" = labevent_id_ and "comments" = comments_ 

    ),
    anomalies as
      (
        select "labevent_id", "comments"
             , point
             , count(*) as count
        from unpack
        group by "labevent_id", "comments", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'labevents_comments_history relation has no redundancies';
    return true;
  else
    raise warning 'labevents_comments_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_history_noredundancy_check
  (transfer_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
      (
        select "transfer_id"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".transfers_subject_id_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_subject_id_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "transfer_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_subject_id_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_subject_id_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".transfers_subject_id_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_subject_id_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_subject_id_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".transfers_subject_id_history_noredundancy_check
  (transfer_id_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_subject_id_history
      where "transfer_id" = transfer_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "transfer_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".transfers_hadm_id_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_hadm_id_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "transfer_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_hadm_id_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_hadm_id_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".transfers_hadm_id_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_hadm_id_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_hadm_id_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".transfers_hadm_id_history_noredundancy_check
  (transfer_id_ INT4, hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_hadm_id_history
      where "transfer_id" = transfer_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "transfer_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_eventtype_history
create or replace function "mimiciv_hosp@V@UHF".transfers_eventtype_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "eventtype"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_eventtype_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "eventtype") as contradictions
      from unpack
      group by "transfer_id", point
      having count("eventtype") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_eventtype_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_eventtype_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_eventtype_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_eventtype_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_eventtype_history' as source
      from "mimiciv_hosp@V@UHF".transfers_eventtype_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_eventtype_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_eventtype_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_eventtype_history
create or replace function "mimiciv_hosp@V@UHF".transfers_eventtype_history_noredundancy_check
  (transfer_id_ INT4, eventtype_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "eventtype"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_eventtype_history
      where "transfer_id" = transfer_id_ and "eventtype" = eventtype_ 

    ),
    anomalies as
      (
        select "transfer_id", "eventtype"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "eventtype", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_eventtype_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_eventtype_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_careunit_history
create or replace function "mimiciv_hosp@V@UHF".transfers_careunit_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "careunit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_careunit_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "careunit") as contradictions
      from unpack
      group by "transfer_id", point
      having count("careunit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_careunit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_careunit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_careunit_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_careunit_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_careunit_history' as source
      from "mimiciv_hosp@V@UHF".transfers_careunit_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_careunit_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_careunit_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_careunit_history
create or replace function "mimiciv_hosp@V@UHF".transfers_careunit_history_noredundancy_check
  (transfer_id_ INT4, careunit_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "careunit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_careunit_history
      where "transfer_id" = transfer_id_ and "careunit" = careunit_ 

    ),
    anomalies as
      (
        select "transfer_id", "careunit"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "careunit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_careunit_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_careunit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_intime_history
create or replace function "mimiciv_hosp@V@UHF".transfers_intime_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "intime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_intime_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "intime") as contradictions
      from unpack
      group by "transfer_id", point
      having count("intime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_intime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_intime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_intime_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_intime_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_intime_history' as source
      from "mimiciv_hosp@V@UHF".transfers_intime_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_intime_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_intime_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_intime_history
create or replace function "mimiciv_hosp@V@UHF".transfers_intime_history_noredundancy_check
  (transfer_id_ INT4, intime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "intime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_intime_history
      where "transfer_id" = transfer_id_ and "intime" = intime_ 

    ),
    anomalies as
      (
        select "transfer_id", "intime"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "intime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_intime_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_intime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : transfers_outtime_history
create or replace function "mimiciv_hosp@V@UHF".transfers_outtime_history_nocontradiction_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
        , "outtime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_outtime_history
      where "transfer_id" = transfer_id_ 

    ),
  anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct "outtime") as contradictions
      from unpack
      group by "transfer_id", point
      having count("outtime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_outtime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'transfers_outtime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : transfers_outtime_history -> transfers_history
create or replace function "mimiciv_hosp@V@UHF".transfers_outtime_history_transfers_history_denseness_check
  (transfer_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_outtime_history' as source
      from "mimiciv_hosp@V@UHF".transfers_outtime_history
      where "transfer_id" = transfer_id_ 

      union
      select "transfer_id"
           , "UHF".unfold("validTime") as point
           , 'transfers_history' as source
      from "mimiciv_hosp@V@UHF".transfers_history
      where "transfer_id" = transfer_id_ 

    ),
    anomalies as
    (
      select "transfer_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "transfer_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_outtime_history and transfers_history are dense';
    return true;
  else
    raise warning 'transfers_outtime_history and transfers_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : transfers_outtime_history
create or replace function "mimiciv_hosp@V@UHF".transfers_outtime_history_noredundancy_check
  (transfer_id_ INT4, outtime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "transfer_id", "outtime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".transfers_outtime_history
      where "transfer_id" = transfer_id_ and "outtime" = outtime_ 

    ),
    anomalies as
      (
        select "transfer_id", "outtime"
             , point
             , count(*) as count
        from unpack
        group by "transfer_id", "outtime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'transfers_outtime_history relation has no redundancies';
    return true;
  else
    raise warning 'transfers_outtime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : diagnoses_icd_history
create or replace function "mimiciv_hosp@V@UHF".diagnoses_icd_history_noredundancy_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ BPCHAR(7), icd_version_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".diagnoses_icd_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
      (
        select "hadm_id", "seq_num", "icd_code", "icd_version"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "seq_num", "icd_code", "icd_version", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'diagnoses_icd_history relation has no redundancies';
    return true;
  else
    raise warning 'diagnoses_icd_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : diagnoses_icd_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history_nocontradiction_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
  anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'diagnoses_icd_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'diagnoses_icd_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : diagnoses_icd_subject_id_history -> diagnoses_icd_history
create or replace function "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history_diagnoses_icd_history_denseness_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ BPCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'diagnoses_icd_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

      union
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'diagnoses_icd_history' as source
      from "mimiciv_hosp@V@UHF".diagnoses_icd_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'diagnoses_icd_subject_id_history and diagnoses_icd_history are dense';
    return true;
  else
    raise warning 'diagnoses_icd_subject_id_history and diagnoses_icd_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : diagnoses_icd_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history_noredundancy_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ BPCHAR(7), icd_version_ INT2, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".diagnoses_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'diagnoses_icd_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'diagnoses_icd_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : drgcodes_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_history_noredundancy_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
    anomalies as
      (
        select "subject_id", "hadm_id", "drg_code"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "hadm_id", "drg_code", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_history relation has no redundancies';
    return true;
  else
    raise warning 'drgcodes_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : drgcodes_drg_type_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_type_history_nocontradiction_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
        , "drg_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_type_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
  anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct "drg_type") as contradictions
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
      having count("drg_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'drgcodes_drg_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : drgcodes_drg_type_history -> drgcodes_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_type_history_drgcodes_history_denseness_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_drg_type_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_drg_type_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

      union
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
    anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_type_history and drgcodes_history are dense';
    return true;
  else
    raise warning 'drgcodes_drg_type_history and drgcodes_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : drgcodes_drg_type_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_type_history_noredundancy_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10), drg_type_ VARCHAR(4))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code", "drg_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_type_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ and "drg_type" = drg_type_ 

    ),
    anomalies as
      (
        select "subject_id", "hadm_id", "drg_code", "drg_type"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "hadm_id", "drg_code", "drg_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_type_history relation has no redundancies';
    return true;
  else
    raise warning 'drgcodes_drg_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : drgcodes_description_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_description_history_nocontradiction_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
        , "description"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_description_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
  anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct "description") as contradictions
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
      having count("description") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_description_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'drgcodes_description_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : drgcodes_description_history -> drgcodes_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_description_history_drgcodes_history_denseness_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_description_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_description_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

      union
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
    anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_description_history and drgcodes_history are dense';
    return true;
  else
    raise warning 'drgcodes_description_history and drgcodes_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : drgcodes_description_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_description_history_noredundancy_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10), description_ VARCHAR(195))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code", "description"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_description_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ and "description" = description_ 

    ),
    anomalies as
      (
        select "subject_id", "hadm_id", "drg_code", "description"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "hadm_id", "drg_code", "description", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_description_history relation has no redundancies';
    return true;
  else
    raise warning 'drgcodes_description_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : drgcodes_drg_severity_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history_nocontradiction_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
        , "drg_severity"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
  anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct "drg_severity") as contradictions
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
      having count("drg_severity") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_severity_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'drgcodes_drg_severity_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : drgcodes_drg_severity_history -> drgcodes_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history_drgcodes_history_denseness_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_drg_severity_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

      union
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
    anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_severity_history and drgcodes_history are dense';
    return true;
  else
    raise warning 'drgcodes_drg_severity_history and drgcodes_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : drgcodes_drg_severity_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history_noredundancy_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10), drg_severity_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code", "drg_severity"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_severity_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ and "drg_severity" = drg_severity_ 

    ),
    anomalies as
      (
        select "subject_id", "hadm_id", "drg_code", "drg_severity"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "hadm_id", "drg_code", "drg_severity", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_severity_history relation has no redundancies';
    return true;
  else
    raise warning 'drgcodes_drg_severity_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : drgcodes_drg_mortality_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history_nocontradiction_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
        , "drg_mortality"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
  anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct "drg_mortality") as contradictions
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
      having count("drg_mortality") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_mortality_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'drgcodes_drg_mortality_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : drgcodes_drg_mortality_history -> drgcodes_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history_drgcodes_history_denseness_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_drg_mortality_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

      union
      select "subject_id", "hadm_id", "drg_code"
           , "UHF".unfold("validTime") as point
           , 'drgcodes_history' as source
      from "mimiciv_hosp@V@UHF".drgcodes_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ 

    ),
    anomalies as
    (
      select "subject_id", "hadm_id", "drg_code"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "subject_id", "hadm_id", "drg_code", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_mortality_history and drgcodes_history are dense';
    return true;
  else
    raise warning 'drgcodes_drg_mortality_history and drgcodes_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : drgcodes_drg_mortality_history
create or replace function "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history_noredundancy_check
  (subject_id_ INT4, hadm_id_ INT4, drg_code_ VARCHAR(10), drg_mortality_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "subject_id", "hadm_id", "drg_code", "drg_mortality"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".drgcodes_drg_mortality_history
      where "subject_id" = subject_id_ and "hadm_id" = hadm_id_ and "drg_code" = drg_code_ and "drg_mortality" = drg_mortality_ 

    ),
    anomalies as
      (
        select "subject_id", "hadm_id", "drg_code", "drg_mortality"
             , point
             , count(*) as count
        from unpack
        group by "subject_id", "hadm_id", "drg_code", "drg_mortality", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'drgcodes_drg_mortality_history relation has no redundancies';
    return true;
  else
    raise warning 'drgcodes_drg_mortality_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_history_noredundancy_check
  (emar_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
      (
        select "emar_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_subject_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_subject_id_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "emar_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_subject_id_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_subject_id_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_subject_id_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_subject_id_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_subject_id_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_subject_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_subject_id_history
      where "emar_id" = emar_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "emar_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_hadm_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_hadm_id_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "emar_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_hadm_id_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_hadm_id_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_hadm_id_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_hadm_id_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_hadm_id_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_hadm_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_hadm_id_history
      where "emar_id" = emar_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "emar_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_emar_seq_history
create or replace function "mimiciv_hosp@V@UHF".emar_emar_seq_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "emar_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_emar_seq_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "emar_seq") as contradictions
      from unpack
      group by "emar_id", point
      having count("emar_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_emar_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_emar_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_emar_seq_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_emar_seq_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_emar_seq_history' as source
      from "mimiciv_hosp@V@UHF".emar_emar_seq_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_emar_seq_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_emar_seq_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_emar_seq_history
create or replace function "mimiciv_hosp@V@UHF".emar_emar_seq_history_noredundancy_check
  (emar_id_ VARCHAR(25), emar_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "emar_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_emar_seq_history
      where "emar_id" = emar_id_ and "emar_seq" = emar_seq_ 

    ),
    anomalies as
      (
        select "emar_id", "emar_seq"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "emar_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_emar_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_emar_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_poe_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "poe_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_poe_id_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "poe_id") as contradictions
      from unpack
      group by "emar_id", point
      having count("poe_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_poe_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_poe_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_poe_id_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_poe_id_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_poe_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_poe_id_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_poe_id_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_poe_id_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_poe_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_poe_id_history
      where "emar_id" = emar_id_ and "poe_id" = poe_id_ 

    ),
    anomalies as
      (
        select "emar_id", "poe_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_poe_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_poe_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_pharmacy_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_pharmacy_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "pharmacy_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_pharmacy_id_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "pharmacy_id") as contradictions
      from unpack
      group by "emar_id", point
      having count("pharmacy_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_pharmacy_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_pharmacy_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_pharmacy_id_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_pharmacy_id_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_pharmacy_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_pharmacy_id_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_pharmacy_id_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_pharmacy_id_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_pharmacy_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_pharmacy_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), pharmacy_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "pharmacy_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_pharmacy_id_history
      where "emar_id" = emar_id_ and "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
      (
        select "emar_id", "pharmacy_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "pharmacy_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_pharmacy_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_pharmacy_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_enter_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_enter_provider_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "enter_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_enter_provider_id_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "enter_provider_id") as contradictions
      from unpack
      group by "emar_id", point
      having count("enter_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_enter_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_enter_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_enter_provider_id_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_enter_provider_id_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_enter_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_enter_provider_id_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_enter_provider_id_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_enter_provider_id_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_enter_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_enter_provider_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), enter_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "enter_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_enter_provider_id_history
      where "emar_id" = emar_id_ and "enter_provider_id" = enter_provider_id_ 

    ),
    anomalies as
      (
        select "emar_id", "enter_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "enter_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_enter_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_enter_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_charttime_history
create or replace function "mimiciv_hosp@V@UHF".emar_charttime_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "charttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_charttime_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "charttime") as contradictions
      from unpack
      group by "emar_id", point
      having count("charttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_charttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_charttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_charttime_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_charttime_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_charttime_history' as source
      from "mimiciv_hosp@V@UHF".emar_charttime_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_charttime_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_charttime_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_charttime_history
create or replace function "mimiciv_hosp@V@UHF".emar_charttime_history_noredundancy_check
  (emar_id_ VARCHAR(25), charttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "charttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_charttime_history
      where "emar_id" = emar_id_ and "charttime" = charttime_ 

    ),
    anomalies as
      (
        select "emar_id", "charttime"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "charttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_charttime_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_charttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_medication_history
create or replace function "mimiciv_hosp@V@UHF".emar_medication_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "medication"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_medication_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "medication") as contradictions
      from unpack
      group by "emar_id", point
      having count("medication") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_medication_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_medication_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_medication_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_medication_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_medication_history' as source
      from "mimiciv_hosp@V@UHF".emar_medication_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_medication_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_medication_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_medication_history
create or replace function "mimiciv_hosp@V@UHF".emar_medication_history_noredundancy_check
  (emar_id_ VARCHAR(25), medication_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "medication"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_medication_history
      where "emar_id" = emar_id_ and "medication" = medication_ 

    ),
    anomalies as
      (
        select "emar_id", "medication"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "medication", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_medication_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_medication_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_event_txt_history
create or replace function "mimiciv_hosp@V@UHF".emar_event_txt_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "event_txt"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_event_txt_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "event_txt") as contradictions
      from unpack
      group by "emar_id", point
      having count("event_txt") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_event_txt_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_event_txt_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_event_txt_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_event_txt_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_event_txt_history' as source
      from "mimiciv_hosp@V@UHF".emar_event_txt_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_event_txt_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_event_txt_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_event_txt_history
create or replace function "mimiciv_hosp@V@UHF".emar_event_txt_history_noredundancy_check
  (emar_id_ VARCHAR(25), event_txt_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "event_txt"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_event_txt_history
      where "emar_id" = emar_id_ and "event_txt" = event_txt_ 

    ),
    anomalies as
      (
        select "emar_id", "event_txt"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "event_txt", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_event_txt_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_event_txt_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_scheduletime_history
create or replace function "mimiciv_hosp@V@UHF".emar_scheduletime_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "scheduletime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_scheduletime_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "scheduletime") as contradictions
      from unpack
      group by "emar_id", point
      having count("scheduletime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_scheduletime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_scheduletime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_scheduletime_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_scheduletime_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_scheduletime_history' as source
      from "mimiciv_hosp@V@UHF".emar_scheduletime_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_scheduletime_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_scheduletime_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_scheduletime_history
create or replace function "mimiciv_hosp@V@UHF".emar_scheduletime_history_noredundancy_check
  (emar_id_ VARCHAR(25), scheduletime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "scheduletime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_scheduletime_history
      where "emar_id" = emar_id_ and "scheduletime" = scheduletime_ 

    ),
    anomalies as
      (
        select "emar_id", "scheduletime"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "scheduletime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_scheduletime_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_scheduletime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_storetime_history
create or replace function "mimiciv_hosp@V@UHF".emar_storetime_history_nocontradiction_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
        , "storetime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_storetime_history
      where "emar_id" = emar_id_ 

    ),
  anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct "storetime") as contradictions
      from unpack
      group by "emar_id", point
      having count("storetime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_storetime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_storetime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_storetime_history -> emar_history
create or replace function "mimiciv_hosp@V@UHF".emar_storetime_history_emar_history_denseness_check
  (emar_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_storetime_history' as source
      from "mimiciv_hosp@V@UHF".emar_storetime_history
      where "emar_id" = emar_id_ 

      union
      select "emar_id"
           , "UHF".unfold("validTime") as point
           , 'emar_history' as source
      from "mimiciv_hosp@V@UHF".emar_history
      where "emar_id" = emar_id_ 

    ),
    anomalies as
    (
      select "emar_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_storetime_history and emar_history are dense';
    return true;
  else
    raise warning 'emar_storetime_history and emar_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_storetime_history
create or replace function "mimiciv_hosp@V@UHF".emar_storetime_history_noredundancy_check
  (emar_id_ VARCHAR(25), storetime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "storetime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_storetime_history
      where "emar_id" = emar_id_ and "storetime" = storetime_ 

    ),
    anomalies as
      (
        select "emar_id", "storetime"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "storetime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_storetime_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_storetime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : hcpcsevents_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_history_noredundancy_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
    anomalies as
      (
        select "hadm_id", "hcpcs_cd", "seq_num"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "hcpcs_cd", "seq_num", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_history relation has no redundancies';
    return true;
  else
    raise warning 'hcpcsevents_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : hcpcsevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history_nocontradiction_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
  anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'hcpcsevents_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : hcpcsevents_subject_id_history -> hcpcsevents_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history_hcpcsevents_history_denseness_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

      union
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
    anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_subject_id_history and hcpcsevents_history are dense';
    return true;
  else
    raise warning 'hcpcsevents_subject_id_history and hcpcsevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : hcpcsevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history_noredundancy_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_subject_id_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "hcpcs_cd", "seq_num", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "hcpcs_cd", "seq_num", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'hcpcsevents_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : hcpcsevents_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history_nocontradiction_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
        , "chartdate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
  anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct "chartdate") as contradictions
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
      having count("chartdate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_chartdate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'hcpcsevents_chartdate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : hcpcsevents_chartdate_history -> hcpcsevents_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history_hcpcsevents_history_denseness_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_chartdate_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

      union
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
    anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_chartdate_history and hcpcsevents_history are dense';
    return true;
  else
    raise warning 'hcpcsevents_chartdate_history and hcpcsevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : hcpcsevents_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history_noredundancy_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4, chartdate_ DATE)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num", "chartdate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_chartdate_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ and "chartdate" = chartdate_ 

    ),
    anomalies as
      (
        select "hadm_id", "hcpcs_cd", "seq_num", "chartdate"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "hcpcs_cd", "seq_num", "chartdate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_chartdate_history relation has no redundancies';
    return true;
  else
    raise warning 'hcpcsevents_chartdate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : hcpcsevents_short_description_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history_nocontradiction_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
        , "short_description"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
  anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct "short_description") as contradictions
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
      having count("short_description") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_short_description_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'hcpcsevents_short_description_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : hcpcsevents_short_description_history -> hcpcsevents_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history_hcpcsevents_history_denseness_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_short_description_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

      union
      select "hadm_id", "hcpcs_cd", "seq_num"
           , "UHF".unfold("validTime") as point
           , 'hcpcsevents_history' as source
      from "mimiciv_hosp@V@UHF".hcpcsevents_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ 

    ),
    anomalies as
    (
      select "hadm_id", "hcpcs_cd", "seq_num"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "hcpcs_cd", "seq_num", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_short_description_history and hcpcsevents_history are dense';
    return true;
  else
    raise warning 'hcpcsevents_short_description_history and hcpcsevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : hcpcsevents_short_description_history
create or replace function "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history_noredundancy_check
  (hadm_id_ INT4, hcpcs_cd_ BPCHAR(5), seq_num_ INT4, short_description_ VARCHAR(180))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "hcpcs_cd", "seq_num", "short_description"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".hcpcsevents_short_description_history
      where "hadm_id" = hadm_id_ and "hcpcs_cd" = hcpcs_cd_ and "seq_num" = seq_num_ and "short_description" = short_description_ 

    ),
    anomalies as
      (
        select "hadm_id", "hcpcs_cd", "seq_num", "short_description"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "hcpcs_cd", "seq_num", "short_description", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'hcpcsevents_short_description_history relation has no redundancies';
    return true;
  else
    raise warning 'hcpcsevents_short_description_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_history_noredundancy_check
  (microevent_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
      (
        select "microevent_id"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "microevent_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_subject_id_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_subject_id_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_subject_id_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history_noredundancy_check
  (microevent_id_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_subject_id_history
      where "microevent_id" = microevent_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "microevent_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "microevent_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_hadm_id_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_hadm_id_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_hadm_id_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history_noredundancy_check
  (microevent_id_ INT4, hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_hadm_id_history
      where "microevent_id" = microevent_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "microevent_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_micro_specimen_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "micro_specimen_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "micro_specimen_id") as contradictions
      from unpack
      group by "microevent_id", point
      having count("micro_specimen_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_micro_specimen_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_micro_specimen_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_micro_specimen_id_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_micro_specimen_id_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_micro_specimen_id_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_micro_specimen_id_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_micro_specimen_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history_noredundancy_check
  (microevent_id_ INT4, micro_specimen_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "micro_specimen_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_micro_specimen_id_history
      where "microevent_id" = microevent_id_ and "micro_specimen_id" = micro_specimen_id_ 

    ),
    anomalies as
      (
        select "microevent_id", "micro_specimen_id"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "micro_specimen_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_micro_specimen_id_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_micro_specimen_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "order_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "order_provider_id") as contradictions
      from unpack
      group by "microevent_id", point
      having count("order_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_order_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_order_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_order_provider_id_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_order_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_order_provider_id_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_order_provider_id_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history_noredundancy_check
  (microevent_id_ INT4, order_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "order_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_order_provider_id_history
      where "microevent_id" = microevent_id_ and "order_provider_id" = order_provider_id_ 

    ),
    anomalies as
      (
        select "microevent_id", "order_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "order_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_order_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_order_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "chartdate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "chartdate") as contradictions
      from unpack
      group by "microevent_id", point
      having count("chartdate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_chartdate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_chartdate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_chartdate_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_chartdate_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_chartdate_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_chartdate_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history_noredundancy_check
  (microevent_id_ INT4, chartdate_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "chartdate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_chartdate_history
      where "microevent_id" = microevent_id_ and "chartdate" = chartdate_ 

    ),
    anomalies as
      (
        select "microevent_id", "chartdate"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "chartdate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_chartdate_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_chartdate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_charttime_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "charttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "charttime") as contradictions
      from unpack
      group by "microevent_id", point
      having count("charttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_charttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_charttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_charttime_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_charttime_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_charttime_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_charttime_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_charttime_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history_noredundancy_check
  (microevent_id_ INT4, charttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "charttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_charttime_history
      where "microevent_id" = microevent_id_ and "charttime" = charttime_ 

    ),
    anomalies as
      (
        select "microevent_id", "charttime"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "charttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_charttime_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_charttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_spec_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "spec_itemid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "spec_itemid") as contradictions
      from unpack
      group by "microevent_id", point
      having count("spec_itemid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_itemid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_spec_itemid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_spec_itemid_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_spec_itemid_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_itemid_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_spec_itemid_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_spec_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history_noredundancy_check
  (microevent_id_ INT4, spec_itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "spec_itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_itemid_history
      where "microevent_id" = microevent_id_ and "spec_itemid" = spec_itemid_ 

    ),
    anomalies as
      (
        select "microevent_id", "spec_itemid"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "spec_itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_itemid_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_spec_itemid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_spec_type_desc_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "spec_type_desc"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "spec_type_desc") as contradictions
      from unpack
      group by "microevent_id", point
      having count("spec_type_desc") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_type_desc_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_spec_type_desc_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_spec_type_desc_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_spec_type_desc_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_type_desc_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_spec_type_desc_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_spec_type_desc_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history_noredundancy_check
  (microevent_id_ INT4, spec_type_desc_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "spec_type_desc"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_spec_type_desc_history
      where "microevent_id" = microevent_id_ and "spec_type_desc" = spec_type_desc_ 

    ),
    anomalies as
      (
        select "microevent_id", "spec_type_desc"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "spec_type_desc", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_spec_type_desc_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_spec_type_desc_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_test_seq_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "test_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "test_seq") as contradictions
      from unpack
      group by "microevent_id", point
      having count("test_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_test_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_test_seq_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_test_seq_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_seq_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_test_seq_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_test_seq_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history_noredundancy_check
  (microevent_id_ INT4, test_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "test_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_seq_history
      where "microevent_id" = microevent_id_ and "test_seq" = test_seq_ 

    ),
    anomalies as
      (
        select "microevent_id", "test_seq"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "test_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_test_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_storedate_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "storedate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "storedate") as contradictions
      from unpack
      group by "microevent_id", point
      having count("storedate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storedate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_storedate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_storedate_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_storedate_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storedate_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_storedate_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_storedate_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history_noredundancy_check
  (microevent_id_ INT4, storedate_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "storedate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_storedate_history
      where "microevent_id" = microevent_id_ and "storedate" = storedate_ 

    ),
    anomalies as
      (
        select "microevent_id", "storedate"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "storedate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storedate_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_storedate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_storetime_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "storetime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "storetime") as contradictions
      from unpack
      group by "microevent_id", point
      having count("storetime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storetime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_storetime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_storetime_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_storetime_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storetime_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_storetime_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_storetime_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history_noredundancy_check
  (microevent_id_ INT4, storetime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "storetime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_storetime_history
      where "microevent_id" = microevent_id_ and "storetime" = storetime_ 

    ),
    anomalies as
      (
        select "microevent_id", "storetime"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "storetime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_storetime_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_storetime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_test_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "test_itemid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "test_itemid") as contradictions
      from unpack
      group by "microevent_id", point
      having count("test_itemid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_itemid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_test_itemid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_test_itemid_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_test_itemid_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_itemid_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_test_itemid_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_test_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history_noredundancy_check
  (microevent_id_ INT4, test_itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "test_itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_itemid_history
      where "microevent_id" = microevent_id_ and "test_itemid" = test_itemid_ 

    ),
    anomalies as
      (
        select "microevent_id", "test_itemid"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "test_itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_itemid_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_test_itemid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_test_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "test_name"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "test_name") as contradictions
      from unpack
      group by "microevent_id", point
      having count("test_name") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_name_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_test_name_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_test_name_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_test_name_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_name_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_test_name_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_test_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history_noredundancy_check
  (microevent_id_ INT4, test_name_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "test_name"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_test_name_history
      where "microevent_id" = microevent_id_ and "test_name" = test_name_ 

    ),
    anomalies as
      (
        select "microevent_id", "test_name"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "test_name", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_test_name_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_test_name_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_org_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "org_itemid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "org_itemid") as contradictions
      from unpack
      group by "microevent_id", point
      having count("org_itemid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_itemid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_org_itemid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_org_itemid_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_org_itemid_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_itemid_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_org_itemid_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_org_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history_noredundancy_check
  (microevent_id_ INT4, org_itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "org_itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_itemid_history
      where "microevent_id" = microevent_id_ and "org_itemid" = org_itemid_ 

    ),
    anomalies as
      (
        select "microevent_id", "org_itemid"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "org_itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_itemid_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_org_itemid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_org_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "org_name"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "org_name") as contradictions
      from unpack
      group by "microevent_id", point
      having count("org_name") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_name_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_org_name_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_org_name_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_org_name_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_name_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_org_name_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_org_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history_noredundancy_check
  (microevent_id_ INT4, org_name_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "org_name"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_org_name_history
      where "microevent_id" = microevent_id_ and "org_name" = org_name_ 

    ),
    anomalies as
      (
        select "microevent_id", "org_name"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "org_name", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_org_name_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_org_name_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_isolate_num_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "isolate_num"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "isolate_num") as contradictions
      from unpack
      group by "microevent_id", point
      having count("isolate_num") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_isolate_num_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_isolate_num_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_isolate_num_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_isolate_num_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_isolate_num_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_isolate_num_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_isolate_num_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history_noredundancy_check
  (microevent_id_ INT4, isolate_num_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "isolate_num"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_isolate_num_history
      where "microevent_id" = microevent_id_ and "isolate_num" = isolate_num_ 

    ),
    anomalies as
      (
        select "microevent_id", "isolate_num"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "isolate_num", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_isolate_num_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_isolate_num_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_quantity_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "quantity"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "quantity") as contradictions
      from unpack
      group by "microevent_id", point
      having count("quantity") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_quantity_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_quantity_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_quantity_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_quantity_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_quantity_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_quantity_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_quantity_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history_noredundancy_check
  (microevent_id_ INT4, quantity_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "quantity"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_quantity_history
      where "microevent_id" = microevent_id_ and "quantity" = quantity_ 

    ),
    anomalies as
      (
        select "microevent_id", "quantity"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "quantity", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_quantity_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_quantity_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_ab_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "ab_itemid"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "ab_itemid") as contradictions
      from unpack
      group by "microevent_id", point
      having count("ab_itemid") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_itemid_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_ab_itemid_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_ab_itemid_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_ab_itemid_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_itemid_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_ab_itemid_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_ab_itemid_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history_noredundancy_check
  (microevent_id_ INT4, ab_itemid_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "ab_itemid"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_itemid_history
      where "microevent_id" = microevent_id_ and "ab_itemid" = ab_itemid_ 

    ),
    anomalies as
      (
        select "microevent_id", "ab_itemid"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "ab_itemid", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_itemid_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_ab_itemid_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_ab_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "ab_name"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "ab_name") as contradictions
      from unpack
      group by "microevent_id", point
      having count("ab_name") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_name_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_ab_name_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_ab_name_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_ab_name_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_name_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_ab_name_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_ab_name_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history_noredundancy_check
  (microevent_id_ INT4, ab_name_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "ab_name"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_ab_name_history
      where "microevent_id" = microevent_id_ and "ab_name" = ab_name_ 

    ),
    anomalies as
      (
        select "microevent_id", "ab_name"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "ab_name", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_ab_name_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_ab_name_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_dilution_text_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "dilution_text"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "dilution_text") as contradictions
      from unpack
      group by "microevent_id", point
      having count("dilution_text") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_text_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_dilution_text_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_dilution_text_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_dilution_text_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_text_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_dilution_text_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_dilution_text_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history_noredundancy_check
  (microevent_id_ INT4, dilution_text_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "dilution_text"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_text_history
      where "microevent_id" = microevent_id_ and "dilution_text" = dilution_text_ 

    ),
    anomalies as
      (
        select "microevent_id", "dilution_text"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "dilution_text", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_text_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_dilution_text_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_dilution_comparison_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "dilution_comparison"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "dilution_comparison") as contradictions
      from unpack
      group by "microevent_id", point
      having count("dilution_comparison") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_comparison_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_dilution_comparison_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_dilution_comparison_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_dilution_comparison_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_comparison_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_dilution_comparison_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_dilution_comparison_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history_noredundancy_check
  (microevent_id_ INT4, dilution_comparison_ VARCHAR(20))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "dilution_comparison"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_comparison_history
      where "microevent_id" = microevent_id_ and "dilution_comparison" = dilution_comparison_ 

    ),
    anomalies as
      (
        select "microevent_id", "dilution_comparison"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "dilution_comparison", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_comparison_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_dilution_comparison_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_dilution_value_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "dilution_value"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "dilution_value") as contradictions
      from unpack
      group by "microevent_id", point
      having count("dilution_value") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_value_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_dilution_value_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_dilution_value_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_dilution_value_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_value_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_dilution_value_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_dilution_value_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history_noredundancy_check
  (microevent_id_ INT4, dilution_value_ FLOAT8)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "dilution_value"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_dilution_value_history
      where "microevent_id" = microevent_id_ and "dilution_value" = dilution_value_ 

    ),
    anomalies as
      (
        select "microevent_id", "dilution_value"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "dilution_value", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_dilution_value_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_dilution_value_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_interpretation_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "interpretation"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "interpretation") as contradictions
      from unpack
      group by "microevent_id", point
      having count("interpretation") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_interpretation_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_interpretation_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_interpretation_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_interpretation_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_interpretation_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_interpretation_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_interpretation_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history_noredundancy_check
  (microevent_id_ INT4, interpretation_ VARCHAR(5))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "interpretation"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_interpretation_history
      where "microevent_id" = microevent_id_ and "interpretation" = interpretation_ 

    ),
    anomalies as
      (
        select "microevent_id", "interpretation"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "interpretation", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_interpretation_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_interpretation_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : microbiologyevents_comments_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_comments_history_nocontradiction_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
        , "comments"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_comments_history
      where "microevent_id" = microevent_id_ 

    ),
  anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct "comments") as contradictions
      from unpack
      group by "microevent_id", point
      having count("comments") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_comments_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'microbiologyevents_comments_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : microbiologyevents_comments_history -> microbiologyevents_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_comments_history_microbiologyevents_history_denseness_check
  (microevent_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_comments_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_comments_history
      where "microevent_id" = microevent_id_ 

      union
      select "microevent_id"
           , "UHF".unfold("validTime") as point
           , 'microbiologyevents_history' as source
      from "mimiciv_hosp@V@UHF".microbiologyevents_history
      where "microevent_id" = microevent_id_ 

    ),
    anomalies as
    (
      select "microevent_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "microevent_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_comments_history and microbiologyevents_history are dense';
    return true;
  else
    raise warning 'microbiologyevents_comments_history and microbiologyevents_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : microbiologyevents_comments_history
create or replace function "mimiciv_hosp@V@UHF".microbiologyevents_comments_history_noredundancy_check
  (microevent_id_ INT4, comments_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "microevent_id", "comments"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".microbiologyevents_comments_history
      where "microevent_id" = microevent_id_ and "comments" = comments_ 

    ),
    anomalies as
      (
        select "microevent_id", "comments"
             , point
             , count(*) as count
        from unpack
        group by "microevent_id", "comments", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'microbiologyevents_comments_history relation has no redundancies';
    return true;
  else
    raise warning 'microbiologyevents_comments_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_history_noredundancy_check
  (pharmacy_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_subject_id_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_subject_id_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_subject_id_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_subject_id_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_subject_id_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_subject_id_history_noredundancy_check
  (pharmacy_id_ INT4, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_subject_id_history
      where "pharmacy_id" = pharmacy_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_hadm_id_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_hadm_id_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_hadm_id_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history_noredundancy_check
  (pharmacy_id_ INT4, hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_poe_id_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "poe_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_poe_id_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "poe_id") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("poe_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_poe_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_poe_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_poe_id_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_poe_id_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_poe_id_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_poe_id_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_poe_id_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_poe_id_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_poe_id_history_noredundancy_check
  (pharmacy_id_ INT4, poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_poe_id_history
      where "pharmacy_id" = pharmacy_id_ and "poe_id" = poe_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "poe_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_poe_id_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_poe_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_starttime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_starttime_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "starttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_starttime_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "starttime") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("starttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_starttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_starttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_starttime_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_starttime_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_starttime_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_starttime_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_starttime_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_starttime_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_starttime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_starttime_history_noredundancy_check
  (pharmacy_id_ INT4, starttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "starttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_starttime_history
      where "pharmacy_id" = pharmacy_id_ and "starttime" = starttime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "starttime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "starttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_starttime_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_starttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_stoptime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_stoptime_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "stoptime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_stoptime_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "stoptime") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("stoptime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_stoptime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_stoptime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_stoptime_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_stoptime_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_stoptime_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_stoptime_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_stoptime_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_stoptime_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_stoptime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_stoptime_history_noredundancy_check
  (pharmacy_id_ INT4, stoptime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "stoptime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_stoptime_history
      where "pharmacy_id" = pharmacy_id_ and "stoptime" = stoptime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "stoptime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "stoptime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_stoptime_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_stoptime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_medication_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_medication_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "medication"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_medication_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "medication") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("medication") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_medication_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_medication_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_medication_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_medication_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_medication_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_medication_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_medication_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_medication_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_medication_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_medication_history_noredundancy_check
  (pharmacy_id_ INT4, medication_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "medication"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_medication_history
      where "pharmacy_id" = pharmacy_id_ and "medication" = medication_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "medication"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "medication", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_medication_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_medication_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_proc_type_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_proc_type_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "proc_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_proc_type_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "proc_type") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("proc_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_proc_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_proc_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_proc_type_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_proc_type_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_proc_type_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_proc_type_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_proc_type_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_proc_type_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_proc_type_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_proc_type_history_noredundancy_check
  (pharmacy_id_ INT4, proc_type_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "proc_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_proc_type_history
      where "pharmacy_id" = pharmacy_id_ and "proc_type" = proc_type_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "proc_type"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "proc_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_proc_type_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_proc_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_status_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_status_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "status"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_status_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "status") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("status") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_status_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_status_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_status_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_status_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_status_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_status_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_status_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_status_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_status_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_status_history_noredundancy_check
  (pharmacy_id_ INT4, status_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "status"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_status_history
      where "pharmacy_id" = pharmacy_id_ and "status" = status_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "status"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "status", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_status_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_status_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_entertime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_entertime_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "entertime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_entertime_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "entertime") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("entertime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_entertime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_entertime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_entertime_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_entertime_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_entertime_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_entertime_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_entertime_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_entertime_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_entertime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_entertime_history_noredundancy_check
  (pharmacy_id_ INT4, entertime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "entertime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_entertime_history
      where "pharmacy_id" = pharmacy_id_ and "entertime" = entertime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "entertime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "entertime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_entertime_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_entertime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_verifiedtime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "verifiedtime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "verifiedtime") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("verifiedtime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_verifiedtime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_verifiedtime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_verifiedtime_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_verifiedtime_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_verifiedtime_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_verifiedtime_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_verifiedtime_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history_noredundancy_check
  (pharmacy_id_ INT4, verifiedtime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "verifiedtime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_verifiedtime_history
      where "pharmacy_id" = pharmacy_id_ and "verifiedtime" = verifiedtime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "verifiedtime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "verifiedtime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_verifiedtime_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_verifiedtime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_route_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_route_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "route"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_route_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "route") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("route") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_route_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_route_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_route_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_route_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_route_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_route_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_route_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_route_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_route_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_route_history_noredundancy_check
  (pharmacy_id_ INT4, route_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "route"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_route_history
      where "pharmacy_id" = pharmacy_id_ and "route" = route_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "route"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "route", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_route_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_route_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_frequency_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_frequency_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "frequency"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_frequency_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "frequency") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("frequency") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_frequency_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_frequency_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_frequency_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_frequency_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_frequency_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_frequency_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_frequency_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_frequency_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_frequency_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_frequency_history_noredundancy_check
  (pharmacy_id_ INT4, frequency_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "frequency"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_frequency_history
      where "pharmacy_id" = pharmacy_id_ and "frequency" = frequency_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "frequency"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "frequency", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_frequency_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_frequency_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_disp_sched_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "disp_sched"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "disp_sched") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("disp_sched") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_disp_sched_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_disp_sched_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_disp_sched_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_disp_sched_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_disp_sched_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_disp_sched_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_disp_sched_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history_noredundancy_check
  (pharmacy_id_ INT4, disp_sched_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "disp_sched"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_disp_sched_history
      where "pharmacy_id" = pharmacy_id_ and "disp_sched" = disp_sched_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "disp_sched"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "disp_sched", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_disp_sched_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_disp_sched_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_infusion_type_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "infusion_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "infusion_type") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("infusion_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_infusion_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_infusion_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_infusion_type_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_infusion_type_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_infusion_type_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_infusion_type_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_infusion_type_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history_noredundancy_check
  (pharmacy_id_ INT4, infusion_type_ VARCHAR(15))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "infusion_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_infusion_type_history
      where "pharmacy_id" = pharmacy_id_ and "infusion_type" = infusion_type_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "infusion_type"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "infusion_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_infusion_type_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_infusion_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_sliding_scale_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "sliding_scale"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "sliding_scale") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("sliding_scale") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_sliding_scale_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_sliding_scale_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_sliding_scale_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_sliding_scale_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_sliding_scale_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_sliding_scale_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_sliding_scale_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history_noredundancy_check
  (pharmacy_id_ INT4, sliding_scale_ VARCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "sliding_scale"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_sliding_scale_history
      where "pharmacy_id" = pharmacy_id_ and "sliding_scale" = sliding_scale_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "sliding_scale"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "sliding_scale", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_sliding_scale_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_sliding_scale_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_lockout_interval_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "lockout_interval"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "lockout_interval") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("lockout_interval") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_lockout_interval_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_lockout_interval_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_lockout_interval_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_lockout_interval_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_lockout_interval_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_lockout_interval_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_lockout_interval_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history_noredundancy_check
  (pharmacy_id_ INT4, lockout_interval_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "lockout_interval"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_lockout_interval_history
      where "pharmacy_id" = pharmacy_id_ and "lockout_interval" = lockout_interval_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "lockout_interval"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "lockout_interval", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_lockout_interval_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_lockout_interval_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_basal_rate_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "basal_rate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "basal_rate") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("basal_rate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_basal_rate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_basal_rate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_basal_rate_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_basal_rate_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_basal_rate_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_basal_rate_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_basal_rate_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history_noredundancy_check
  (pharmacy_id_ INT4, basal_rate_ FLOAT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "basal_rate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_basal_rate_history
      where "pharmacy_id" = pharmacy_id_ and "basal_rate" = basal_rate_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "basal_rate"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "basal_rate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_basal_rate_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_basal_rate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_one_hr_max_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "one_hr_max"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "one_hr_max") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("one_hr_max") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_one_hr_max_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_one_hr_max_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_one_hr_max_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_one_hr_max_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_one_hr_max_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_one_hr_max_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_one_hr_max_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history_noredundancy_check
  (pharmacy_id_ INT4, one_hr_max_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "one_hr_max"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_one_hr_max_history
      where "pharmacy_id" = pharmacy_id_ and "one_hr_max" = one_hr_max_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "one_hr_max"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "one_hr_max", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_one_hr_max_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_one_hr_max_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_doses_per_24_hrs_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "doses_per_24_hrs"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "doses_per_24_hrs") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("doses_per_24_hrs") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_doses_per_24_hrs_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_doses_per_24_hrs_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_doses_per_24_hrs_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_doses_per_24_hrs_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_doses_per_24_hrs_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_doses_per_24_hrs_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_doses_per_24_hrs_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history_noredundancy_check
  (pharmacy_id_ INT4, doses_per_24_hrs_ FLOAT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "doses_per_24_hrs"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ and "doses_per_24_hrs" = doses_per_24_hrs_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "doses_per_24_hrs"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "doses_per_24_hrs", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_doses_per_24_hrs_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_doses_per_24_hrs_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_duration_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "duration"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_duration_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "duration") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("duration") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_duration_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_duration_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_duration_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_duration_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_duration_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_duration_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_history_noredundancy_check
  (pharmacy_id_ INT4, duration_ FLOAT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "duration"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_duration_history
      where "pharmacy_id" = pharmacy_id_ and "duration" = duration_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "duration"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "duration", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_duration_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_duration_interval_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "duration_interval"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "duration_interval") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("duration_interval") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_interval_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_duration_interval_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_duration_interval_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_duration_interval_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_interval_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_duration_interval_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_duration_interval_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history_noredundancy_check
  (pharmacy_id_ INT4, duration_interval_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "duration_interval"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_duration_interval_history
      where "pharmacy_id" = pharmacy_id_ and "duration_interval" = duration_interval_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "duration_interval"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "duration_interval", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_duration_interval_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_duration_interval_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_expiration_value_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "expiration_value"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "expiration_value") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("expiration_value") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_value_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_expiration_value_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_expiration_value_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_expiration_value_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_value_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_expiration_value_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_expiration_value_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history_noredundancy_check
  (pharmacy_id_ INT4, expiration_value_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "expiration_value"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_value_history
      where "pharmacy_id" = pharmacy_id_ and "expiration_value" = expiration_value_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "expiration_value"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "expiration_value", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_value_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_expiration_value_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_expiration_unit_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "expiration_unit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "expiration_unit") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("expiration_unit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_unit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_expiration_unit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_expiration_unit_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_expiration_unit_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_unit_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_expiration_unit_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_expiration_unit_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history_noredundancy_check
  (pharmacy_id_ INT4, expiration_unit_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "expiration_unit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expiration_unit_history
      where "pharmacy_id" = pharmacy_id_ and "expiration_unit" = expiration_unit_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "expiration_unit"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "expiration_unit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expiration_unit_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_expiration_unit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_expirationdate_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "expirationdate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "expirationdate") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("expirationdate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expirationdate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_expirationdate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_expirationdate_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_expirationdate_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expirationdate_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_expirationdate_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_expirationdate_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history_noredundancy_check
  (pharmacy_id_ INT4, expirationdate_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "expirationdate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_expirationdate_history
      where "pharmacy_id" = pharmacy_id_ and "expirationdate" = expirationdate_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "expirationdate"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "expirationdate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_expirationdate_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_expirationdate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_dispensation_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_dispensation_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "dispensation"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_dispensation_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "dispensation") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("dispensation") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_dispensation_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_dispensation_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_dispensation_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_dispensation_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_dispensation_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_dispensation_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_dispensation_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_dispensation_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_dispensation_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_dispensation_history_noredundancy_check
  (pharmacy_id_ INT4, dispensation_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "dispensation"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_dispensation_history
      where "pharmacy_id" = pharmacy_id_ and "dispensation" = dispensation_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "dispensation"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "dispensation", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_dispensation_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_dispensation_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : pharmacy_fill_quantity_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history_nocontradiction_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
        , "fill_quantity"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
  anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct "fill_quantity") as contradictions
      from unpack
      group by "pharmacy_id", point
      having count("fill_quantity") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_fill_quantity_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'pharmacy_fill_quantity_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : pharmacy_fill_quantity_history -> pharmacy_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history_pharmacy_history_denseness_check
  (pharmacy_id_ INT4)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_fill_quantity_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history
      where "pharmacy_id" = pharmacy_id_ 

      union
      select "pharmacy_id"
           , "UHF".unfold("validTime") as point
           , 'pharmacy_history' as source
      from "mimiciv_hosp@V@UHF".pharmacy_history
      where "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
    (
      select "pharmacy_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_fill_quantity_history and pharmacy_history are dense';
    return true;
  else
    raise warning 'pharmacy_fill_quantity_history and pharmacy_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : pharmacy_fill_quantity_history
create or replace function "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history_noredundancy_check
  (pharmacy_id_ INT4, fill_quantity_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "fill_quantity"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".pharmacy_fill_quantity_history
      where "pharmacy_id" = pharmacy_id_ and "fill_quantity" = fill_quantity_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "fill_quantity"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "fill_quantity", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'pharmacy_fill_quantity_history relation has no redundancies';
    return true;
  else
    raise warning 'pharmacy_fill_quantity_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_history_noredundancy_check
  (poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
      (
        select "poe_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".poe_poe_seq_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "poe_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_poe_seq_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "poe_seq") as contradictions
      from unpack
      group by "poe_id", point
      having count("poe_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_poe_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_poe_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_poe_seq_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_poe_seq_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_poe_seq_history' as source
      from "mimiciv_hosp@V@UHF".poe_poe_seq_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_poe_seq_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_poe_seq_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".poe_poe_seq_history_noredundancy_check
  (poe_id_ VARCHAR(25), poe_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "poe_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_poe_seq_history
      where "poe_id" = poe_id_ and "poe_seq" = poe_seq_ 

    ),
    anomalies as
      (
        select "poe_id", "poe_seq"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "poe_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_poe_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_poe_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_subject_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_subject_id_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "poe_id", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_subject_id_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_subject_id_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_subject_id_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_subject_id_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_subject_id_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_subject_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_subject_id_history
      where "poe_id" = poe_id_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "poe_id", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_hadm_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_hadm_id_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "poe_id", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_hadm_id_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_hadm_id_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_hadm_id_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_hadm_id_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_hadm_id_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_hadm_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_hadm_id_history
      where "poe_id" = poe_id_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "poe_id", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_ordertime_history
create or replace function "mimiciv_hosp@V@UHF".poe_ordertime_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "ordertime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_ordertime_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "ordertime") as contradictions
      from unpack
      group by "poe_id", point
      having count("ordertime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_ordertime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_ordertime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_ordertime_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_ordertime_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_ordertime_history' as source
      from "mimiciv_hosp@V@UHF".poe_ordertime_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_ordertime_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_ordertime_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_ordertime_history
create or replace function "mimiciv_hosp@V@UHF".poe_ordertime_history_noredundancy_check
  (poe_id_ VARCHAR(25), ordertime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "ordertime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_ordertime_history
      where "poe_id" = poe_id_ and "ordertime" = ordertime_ 

    ),
    anomalies as
      (
        select "poe_id", "ordertime"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "ordertime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_ordertime_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_ordertime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_order_type_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_type_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "order_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_type_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "order_type") as contradictions
      from unpack
      group by "poe_id", point
      having count("order_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_order_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_order_type_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_type_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_order_type_history' as source
      from "mimiciv_hosp@V@UHF".poe_order_type_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_type_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_order_type_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_order_type_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_type_history_noredundancy_check
  (poe_id_ VARCHAR(25), order_type_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "order_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_type_history
      where "poe_id" = poe_id_ and "order_type" = order_type_ 

    ),
    anomalies as
      (
        select "poe_id", "order_type"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "order_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_type_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_order_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_order_subtype_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_subtype_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "order_subtype"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_subtype_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "order_subtype") as contradictions
      from unpack
      group by "poe_id", point
      having count("order_subtype") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_subtype_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_order_subtype_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_order_subtype_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_subtype_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_order_subtype_history' as source
      from "mimiciv_hosp@V@UHF".poe_order_subtype_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_subtype_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_order_subtype_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_order_subtype_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_subtype_history_noredundancy_check
  (poe_id_ VARCHAR(25), order_subtype_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "order_subtype"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_subtype_history
      where "poe_id" = poe_id_ and "order_subtype" = order_subtype_ 

    ),
    anomalies as
      (
        select "poe_id", "order_subtype"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "order_subtype", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_subtype_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_order_subtype_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_transaction_type_history
create or replace function "mimiciv_hosp@V@UHF".poe_transaction_type_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "transaction_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_transaction_type_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "transaction_type") as contradictions
      from unpack
      group by "poe_id", point
      having count("transaction_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_transaction_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_transaction_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_transaction_type_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_transaction_type_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_transaction_type_history' as source
      from "mimiciv_hosp@V@UHF".poe_transaction_type_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_transaction_type_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_transaction_type_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_transaction_type_history
create or replace function "mimiciv_hosp@V@UHF".poe_transaction_type_history_noredundancy_check
  (poe_id_ VARCHAR(25), transaction_type_ VARCHAR(15))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "transaction_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_transaction_type_history
      where "poe_id" = poe_id_ and "transaction_type" = transaction_type_ 

    ),
    anomalies as
      (
        select "poe_id", "transaction_type"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "transaction_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_transaction_type_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_transaction_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_discontinue_of_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "discontinue_of_poe_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "discontinue_of_poe_id") as contradictions
      from unpack
      group by "poe_id", point
      having count("discontinue_of_poe_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinue_of_poe_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_discontinue_of_poe_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_discontinue_of_poe_id_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_discontinue_of_poe_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinue_of_poe_id_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_discontinue_of_poe_id_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_discontinue_of_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), discontinue_of_poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "discontinue_of_poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_discontinue_of_poe_id_history
      where "poe_id" = poe_id_ and "discontinue_of_poe_id" = discontinue_of_poe_id_ 

    ),
    anomalies as
      (
        select "poe_id", "discontinue_of_poe_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "discontinue_of_poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinue_of_poe_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_discontinue_of_poe_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_discontinued_by_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "discontinued_by_poe_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "discontinued_by_poe_id") as contradictions
      from unpack
      group by "poe_id", point
      having count("discontinued_by_poe_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinued_by_poe_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_discontinued_by_poe_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_discontinued_by_poe_id_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_discontinued_by_poe_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinued_by_poe_id_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_discontinued_by_poe_id_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_discontinued_by_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), discontinued_by_poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "discontinued_by_poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_discontinued_by_poe_id_history
      where "poe_id" = poe_id_ and "discontinued_by_poe_id" = discontinued_by_poe_id_ 

    ),
    anomalies as
      (
        select "poe_id", "discontinued_by_poe_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "discontinued_by_poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_discontinued_by_poe_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_discontinued_by_poe_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_provider_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "order_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_provider_id_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "order_provider_id") as contradictions
      from unpack
      group by "poe_id", point
      having count("order_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_order_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_order_provider_id_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_provider_id_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_order_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_order_provider_id_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_provider_id_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_order_provider_id_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_provider_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), order_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "order_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_provider_id_history
      where "poe_id" = poe_id_ and "order_provider_id" = order_provider_id_ 

    ),
    anomalies as
      (
        select "poe_id", "order_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "order_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_order_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_order_status_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_status_history_nocontradiction_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
        , "order_status"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_status_history
      where "poe_id" = poe_id_ 

    ),
  anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct "order_status") as contradictions
      from unpack
      group by "poe_id", point
      having count("order_status") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_status_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_order_status_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_order_status_history -> poe_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_status_history_poe_history_denseness_check
  (poe_id_ VARCHAR(25))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_order_status_history' as source
      from "mimiciv_hosp@V@UHF".poe_order_status_history
      where "poe_id" = poe_id_ 

      union
      select "poe_id"
           , "UHF".unfold("validTime") as point
           , 'poe_history' as source
      from "mimiciv_hosp@V@UHF".poe_history
      where "poe_id" = poe_id_ 

    ),
    anomalies as
    (
      select "poe_id"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_status_history and poe_history are dense';
    return true;
  else
    raise warning 'poe_order_status_history and poe_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_order_status_history
create or replace function "mimiciv_hosp@V@UHF".poe_order_status_history_noredundancy_check
  (poe_id_ VARCHAR(25), order_status_ VARCHAR(15))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "order_status"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_order_status_history
      where "poe_id" = poe_id_ and "order_status" = order_status_ 

    ),
    anomalies as
      (
        select "poe_id", "order_status"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "order_status", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_order_status_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_order_status_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_subject_id_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_subject_id_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_subject_id_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_subject_id_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_subject_id_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_subject_id_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_subject_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "hadm_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "hadm_id") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("hadm_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_hadm_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_hadm_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_hadm_id_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_hadm_id_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_hadm_id_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_hadm_id_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_hadm_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), hadm_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "hadm_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_hadm_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "hadm_id" = hadm_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "hadm_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "hadm_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_hadm_id_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_hadm_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_id_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "poe_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_poe_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "poe_id") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("poe_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_poe_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_poe_id_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_id_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_poe_id_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_poe_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_id_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_poe_id_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_poe_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_id_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), poe_id_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "poe_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_poe_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "poe_id" = poe_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "poe_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "poe_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_id_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_poe_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "poe_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "poe_seq") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("poe_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_poe_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_poe_seq_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_poe_seq_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_seq_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_poe_seq_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), poe_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "poe_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_poe_seq_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "poe_seq" = poe_seq_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "poe_seq"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "poe_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_poe_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_poe_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "order_provider_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "order_provider_id") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("order_provider_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_order_provider_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_order_provider_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_order_provider_id_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_order_provider_id_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_order_provider_id_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_order_provider_id_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_order_provider_id_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), order_provider_id_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "order_provider_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_order_provider_id_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "order_provider_id" = order_provider_id_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "order_provider_id"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "order_provider_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_order_provider_id_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_order_provider_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_starttime_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_starttime_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "starttime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_starttime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "starttime") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("starttime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_starttime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_starttime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_starttime_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_starttime_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_starttime_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_starttime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_starttime_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_starttime_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_starttime_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_starttime_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), starttime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "starttime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_starttime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "starttime" = starttime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "starttime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "starttime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_starttime_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_starttime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_stoptime_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_stoptime_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "stoptime"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_stoptime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "stoptime") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("stoptime") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_stoptime_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_stoptime_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_stoptime_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_stoptime_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_stoptime_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_stoptime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_stoptime_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_stoptime_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_stoptime_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_stoptime_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), stoptime_ TIMESTAMP)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "stoptime"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_stoptime_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "stoptime" = stoptime_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "stoptime"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "stoptime", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_stoptime_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_stoptime_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_formulary_drug_cd_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "formulary_drug_cd"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "formulary_drug_cd") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("formulary_drug_cd") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_formulary_drug_cd_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_formulary_drug_cd_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_formulary_drug_cd_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_formulary_drug_cd_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_formulary_drug_cd_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_formulary_drug_cd_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_formulary_drug_cd_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), formulary_drug_cd_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "formulary_drug_cd"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_formulary_drug_cd_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "formulary_drug_cd" = formulary_drug_cd_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "formulary_drug_cd"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "formulary_drug_cd", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_formulary_drug_cd_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_formulary_drug_cd_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_gsn_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_gsn_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "gsn"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_gsn_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "gsn") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("gsn") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_gsn_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_gsn_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_gsn_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_gsn_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_gsn_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_gsn_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_gsn_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_gsn_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_gsn_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_gsn_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), gsn_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "gsn"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_gsn_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "gsn" = gsn_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "gsn"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "gsn", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_gsn_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_gsn_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_ndc_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_ndc_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "ndc"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_ndc_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "ndc") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("ndc") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_ndc_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_ndc_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_ndc_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_ndc_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_ndc_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_ndc_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_ndc_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_ndc_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_ndc_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_ndc_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), ndc_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "ndc"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_ndc_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "ndc" = ndc_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "ndc"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "ndc", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_ndc_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_ndc_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_prod_strength_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "prod_strength"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "prod_strength") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("prod_strength") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_prod_strength_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_prod_strength_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_prod_strength_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_prod_strength_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_prod_strength_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_prod_strength_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_prod_strength_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), prod_strength_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "prod_strength"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_prod_strength_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "prod_strength" = prod_strength_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "prod_strength"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "prod_strength", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_prod_strength_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_prod_strength_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_form_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_rx_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "form_rx"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "form_rx") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("form_rx") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_rx_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_form_rx_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_form_rx_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_rx_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_form_rx_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_form_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_rx_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_form_rx_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_form_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_rx_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), form_rx_ VARCHAR(25))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "form_rx"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "form_rx" = form_rx_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "form_rx"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "form_rx", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_rx_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_form_rx_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_dose_val_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "dose_val_rx"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "dose_val_rx") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("dose_val_rx") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_val_rx_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_dose_val_rx_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_dose_val_rx_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_dose_val_rx_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_val_rx_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_dose_val_rx_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_dose_val_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), dose_val_rx_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "dose_val_rx"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_dose_val_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "dose_val_rx" = dose_val_rx_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "dose_val_rx"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "dose_val_rx", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_val_rx_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_dose_val_rx_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_dose_unit_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "dose_unit_rx"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "dose_unit_rx") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("dose_unit_rx") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_unit_rx_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_dose_unit_rx_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_dose_unit_rx_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_dose_unit_rx_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_unit_rx_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_dose_unit_rx_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_dose_unit_rx_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), dose_unit_rx_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "dose_unit_rx"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_dose_unit_rx_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "dose_unit_rx" = dose_unit_rx_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "dose_unit_rx"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "dose_unit_rx", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_dose_unit_rx_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_dose_unit_rx_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_form_val_disp_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "form_val_disp"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "form_val_disp") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("form_val_disp") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_val_disp_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_form_val_disp_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_form_val_disp_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_form_val_disp_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_val_disp_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_form_val_disp_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_form_val_disp_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), form_val_disp_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "form_val_disp"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_val_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "form_val_disp" = form_val_disp_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "form_val_disp"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "form_val_disp", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_val_disp_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_form_val_disp_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_form_unit_disp_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "form_unit_disp"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "form_unit_disp") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("form_unit_disp") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_unit_disp_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_form_unit_disp_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_form_unit_disp_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_form_unit_disp_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_unit_disp_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_form_unit_disp_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_form_unit_disp_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), form_unit_disp_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "form_unit_disp"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_form_unit_disp_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "form_unit_disp" = form_unit_disp_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "form_unit_disp"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "form_unit_disp", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_form_unit_disp_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_form_unit_disp_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_doses_per_24_hrs_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "doses_per_24_hrs"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "doses_per_24_hrs") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("doses_per_24_hrs") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_doses_per_24_hrs_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_doses_per_24_hrs_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_doses_per_24_hrs_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_doses_per_24_hrs_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_doses_per_24_hrs_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_doses_per_24_hrs_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_doses_per_24_hrs_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), doses_per_24_hrs_ FLOAT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "doses_per_24_hrs"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_doses_per_24_hrs_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "doses_per_24_hrs" = doses_per_24_hrs_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "doses_per_24_hrs"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "doses_per_24_hrs", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_doses_per_24_hrs_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_doses_per_24_hrs_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : prescriptions_route_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_route_history_nocontradiction_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
        , "route"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_route_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
  anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct "route") as contradictions
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
      having count("route") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_route_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'prescriptions_route_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : prescriptions_route_history -> prescriptions_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_route_history_prescriptions_history_denseness_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_route_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_route_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

      union
      select "pharmacy_id", "drug_type", "drug"
           , "UHF".unfold("validTime") as point
           , 'prescriptions_history' as source
      from "mimiciv_hosp@V@UHF".prescriptions_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ 

    ),
    anomalies as
    (
      select "pharmacy_id", "drug_type", "drug"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pharmacy_id", "drug_type", "drug", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_route_history and prescriptions_history are dense';
    return true;
  else
    raise warning 'prescriptions_route_history and prescriptions_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : prescriptions_route_history
create or replace function "mimiciv_hosp@V@UHF".prescriptions_route_history_noredundancy_check
  (pharmacy_id_ INT4, drug_type_ VARCHAR(20), drug_ VARCHAR(255), route_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pharmacy_id", "drug_type", "drug", "route"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".prescriptions_route_history
      where "pharmacy_id" = pharmacy_id_ and "drug_type" = drug_type_ and "drug" = drug_ and "route" = route_ 

    ),
    anomalies as
      (
        select "pharmacy_id", "drug_type", "drug", "route"
             , point
             , count(*) as count
        from unpack
        group by "pharmacy_id", "drug_type", "drug", "route", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'prescriptions_route_history relation has no redundancies';
    return true;
  else
    raise warning 'prescriptions_route_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : procedures_icd_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_history_noredundancy_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".procedures_icd_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
      (
        select "hadm_id", "seq_num", "icd_code", "icd_version"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "seq_num", "icd_code", "icd_version", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_history relation has no redundancies';
    return true;
  else
    raise warning 'procedures_icd_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : procedures_icd_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history_nocontradiction_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
  anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'procedures_icd_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : procedures_icd_subject_id_history -> procedures_icd_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history_procedures_icd_history_denseness_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'procedures_icd_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

      union
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'procedures_icd_history' as source
      from "mimiciv_hosp@V@UHF".procedures_icd_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_subject_id_history and procedures_icd_history are dense';
    return true;
  else
    raise warning 'procedures_icd_subject_id_history and procedures_icd_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : procedures_icd_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history_noredundancy_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2, subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".procedures_icd_subject_id_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "seq_num", "icd_code", "icd_version", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'procedures_icd_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : procedures_icd_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history_nocontradiction_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
        , "chartdate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
  anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct "chartdate") as contradictions
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
      having count("chartdate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_chartdate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'procedures_icd_chartdate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : procedures_icd_chartdate_history -> procedures_icd_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history_procedures_icd_history_denseness_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2)
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'procedures_icd_chartdate_history' as source
      from "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

      union
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , "UHF".unfold("validTime") as point
           , 'procedures_icd_history' as source
      from "mimiciv_hosp@V@UHF".procedures_icd_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ 

    ),
    anomalies as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "seq_num", "icd_code", "icd_version", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_chartdate_history and procedures_icd_history are dense';
    return true;
  else
    raise warning 'procedures_icd_chartdate_history and procedures_icd_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : procedures_icd_chartdate_history
create or replace function "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history_noredundancy_check
  (hadm_id_ INT4, seq_num_ INT4, icd_code_ VARCHAR(7), icd_version_ INT2, chartdate_ DATE)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "seq_num", "icd_code", "icd_version", "chartdate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".procedures_icd_chartdate_history
      where "hadm_id" = hadm_id_ and "seq_num" = seq_num_ and "icd_code" = icd_code_ and "icd_version" = icd_version_ and "chartdate" = chartdate_ 

    ),
    anomalies as
      (
        select "hadm_id", "seq_num", "icd_code", "icd_version", "chartdate"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "seq_num", "icd_code", "icd_version", "chartdate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'procedures_icd_chartdate_history relation has no redundancies';
    return true;
  else
    raise warning 'procedures_icd_chartdate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : services_history
create or replace function "mimiciv_hosp@V@UHF".services_history_noredundancy_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".services_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

    ),
    anomalies as
      (
        select "hadm_id", "transfertime", "curr_service"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "transfertime", "curr_service", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_history relation has no redundancies';
    return true;
  else
    raise warning 'services_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : services_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".services_subject_id_history_nocontradiction_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".services_subject_id_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

    ),
  anomalies as
    (
      select "hadm_id", "transfertime", "curr_service"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "hadm_id", "transfertime", "curr_service", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'services_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : services_subject_id_history -> services_history
create or replace function "mimiciv_hosp@V@UHF".services_subject_id_history_services_history_denseness_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service"
           , "UHF".unfold("validTime") as point
           , 'services_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".services_subject_id_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

      union
      select "hadm_id", "transfertime", "curr_service"
           , "UHF".unfold("validTime") as point
           , 'services_history' as source
      from "mimiciv_hosp@V@UHF".services_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

    ),
    anomalies as
    (
      select "hadm_id", "transfertime", "curr_service"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "transfertime", "curr_service", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_subject_id_history and services_history are dense';
    return true;
  else
    raise warning 'services_subject_id_history and services_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : services_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".services_subject_id_history_noredundancy_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".services_subject_id_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "hadm_id", "transfertime", "curr_service", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "transfertime", "curr_service", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'services_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : services_prev_service_history
create or replace function "mimiciv_hosp@V@UHF".services_prev_service_history_nocontradiction_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service"
        , "prev_service"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".services_prev_service_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

    ),
  anomalies as
    (
      select "hadm_id", "transfertime", "curr_service"
           , point
           , array_agg(distinct "prev_service") as contradictions
      from unpack
      group by "hadm_id", "transfertime", "curr_service", point
      having count("prev_service") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_prev_service_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'services_prev_service_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : services_prev_service_history -> services_history
create or replace function "mimiciv_hosp@V@UHF".services_prev_service_history_services_history_denseness_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service"
           , "UHF".unfold("validTime") as point
           , 'services_prev_service_history' as source
      from "mimiciv_hosp@V@UHF".services_prev_service_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

      union
      select "hadm_id", "transfertime", "curr_service"
           , "UHF".unfold("validTime") as point
           , 'services_history' as source
      from "mimiciv_hosp@V@UHF".services_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ 

    ),
    anomalies as
    (
      select "hadm_id", "transfertime", "curr_service"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "hadm_id", "transfertime", "curr_service", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_prev_service_history and services_history are dense';
    return true;
  else
    raise warning 'services_prev_service_history and services_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : services_prev_service_history
create or replace function "mimiciv_hosp@V@UHF".services_prev_service_history_noredundancy_check
  (hadm_id_ INT4, transfertime_ TIMESTAMP, curr_service_ VARCHAR(10), prev_service_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "hadm_id", "transfertime", "curr_service", "prev_service"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".services_prev_service_history
      where "hadm_id" = hadm_id_ and "transfertime" = transfertime_ and "curr_service" = curr_service_ and "prev_service" = prev_service_ 

    ),
    anomalies as
      (
        select "hadm_id", "transfertime", "curr_service", "prev_service"
             , point
             , count(*) as count
        from unpack
        group by "hadm_id", "transfertime", "curr_service", "prev_service", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'services_prev_service_history relation has no redundancies';
    return true;
  else
    raise warning 'services_prev_service_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_subject_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_subject_id_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_subject_id_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_subject_id_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_subject_id_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_subject_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_subject_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_emar_seq_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "emar_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "emar_seq") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("emar_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_emar_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_emar_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_emar_seq_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_emar_seq_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_emar_seq_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_emar_seq_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_emar_seq_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), emar_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "emar_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_emar_seq_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "emar_seq" = emar_seq_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "emar_seq"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "emar_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_emar_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_emar_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_administration_type_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_administration_type_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "administration_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_administration_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "administration_type") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("administration_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_administration_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_administration_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_administration_type_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_administration_type_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_administration_type_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_administration_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_administration_type_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_administration_type_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_administration_type_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_administration_type_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), administration_type_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "administration_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_administration_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "administration_type" = administration_type_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "administration_type"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "administration_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_administration_type_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_administration_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_pharmacy_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "pharmacy_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "pharmacy_id") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("pharmacy_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_pharmacy_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_pharmacy_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_pharmacy_id_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_pharmacy_id_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_pharmacy_id_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_pharmacy_id_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_pharmacy_id_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), pharmacy_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "pharmacy_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_pharmacy_id_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "pharmacy_id" = pharmacy_id_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "pharmacy_id"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "pharmacy_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_pharmacy_id_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_pharmacy_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_barcode_type_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "barcode_type"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "barcode_type") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("barcode_type") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_barcode_type_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_barcode_type_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_barcode_type_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_barcode_type_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_barcode_type_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_barcode_type_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_barcode_type_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), barcode_type_ VARCHAR(4))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "barcode_type"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_barcode_type_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "barcode_type" = barcode_type_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "barcode_type"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "barcode_type", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_barcode_type_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_barcode_type_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_reason_for_no_barcode_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "reason_for_no_barcode"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "reason_for_no_barcode") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("reason_for_no_barcode") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_reason_for_no_barcode_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_reason_for_no_barcode_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_reason_for_no_barcode_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_reason_for_no_barcode_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_reason_for_no_barcode_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_reason_for_no_barcode_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_reason_for_no_barcode_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), reason_for_no_barcode_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "reason_for_no_barcode"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_reason_for_no_barcode_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "reason_for_no_barcode" = reason_for_no_barcode_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "reason_for_no_barcode"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "reason_for_no_barcode", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_reason_for_no_barcode_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_reason_for_no_barcode_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_complete_dose_not_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "complete_dose_not_given"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "complete_dose_not_given") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("complete_dose_not_given") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_complete_dose_not_given_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_complete_dose_not_given_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_complete_dose_not_given_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_complete_dose_not_given_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_complete_dose_not_given_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_complete_dose_not_given_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_complete_dose_not_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), complete_dose_not_given_ VARCHAR(5))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "complete_dose_not_given"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_complete_dose_not_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "complete_dose_not_given" = complete_dose_not_given_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "complete_dose_not_given"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "complete_dose_not_given", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_complete_dose_not_given_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_complete_dose_not_given_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_dose_due_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "dose_due"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "dose_due") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("dose_due") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_dose_due_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_dose_due_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_dose_due_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_dose_due_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_dose_due_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), dose_due_ VARCHAR(100))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "dose_due"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "dose_due" = dose_due_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "dose_due"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "dose_due", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_dose_due_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_dose_due_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "dose_due_unit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "dose_due_unit") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("dose_due_unit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_unit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_dose_due_unit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_dose_due_unit_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_dose_due_unit_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_unit_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_dose_due_unit_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_dose_due_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), dose_due_unit_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "dose_due_unit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_due_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "dose_due_unit" = dose_due_unit_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "dose_due_unit"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "dose_due_unit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_due_unit_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_dose_due_unit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_dose_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "dose_given"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "dose_given") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("dose_given") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_dose_given_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_dose_given_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_dose_given_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_dose_given_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_dose_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), dose_given_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "dose_given"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "dose_given" = dose_given_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "dose_given"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "dose_given", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_dose_given_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_dose_given_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "dose_given_unit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "dose_given_unit") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("dose_given_unit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_unit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_dose_given_unit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_dose_given_unit_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_dose_given_unit_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_unit_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_dose_given_unit_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_dose_given_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), dose_given_unit_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "dose_given_unit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_dose_given_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "dose_given_unit" = dose_given_unit_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "dose_given_unit"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "dose_given_unit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_dose_given_unit_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_dose_given_unit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_will_remainder_of_dose_be_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "will_remainder_of_dose_be_given"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "will_remainder_of_dose_be_given") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("will_remainder_of_dose_be_given") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_will_remainder_of_dose_be_given_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_will_remainder_of_dose_be_given_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_will_remainder_of_dose_be_given_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_will_remainder_of_dose_be_given_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_will_remainder_of_dose_be_given_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_will_remainder_of_dose_be_given_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_will_remainder_of_dose_be_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), will_remainder_of_dose_be_given_ VARCHAR(5))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "will_remainder_of_dose_be_given"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_will_remainder_of_dose_be_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "will_remainder_of_dose_be_given" = will_remainder_of_dose_be_given_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "will_remainder_of_dose_be_given"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "will_remainder_of_dose_be_given", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_will_remainder_of_dose_be_given_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_will_remainder_of_dose_be_given_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_product_amount_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "product_amount_given"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "product_amount_given") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("product_amount_given") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_amount_given_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_product_amount_given_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_product_amount_given_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_product_amount_given_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_amount_given_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_product_amount_given_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_product_amount_given_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), product_amount_given_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "product_amount_given"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_amount_given_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "product_amount_given" = product_amount_given_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "product_amount_given"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "product_amount_given", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_amount_given_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_product_amount_given_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_product_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_unit_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "product_unit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "product_unit") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("product_unit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_unit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_product_unit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_product_unit_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_unit_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_product_unit_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_product_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_unit_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_product_unit_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_product_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_unit_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), product_unit_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "product_unit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "product_unit" = product_unit_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "product_unit"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "product_unit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_unit_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_product_unit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_product_code_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_code_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "product_code"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_code_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "product_code") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("product_code") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_code_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_product_code_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_product_code_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_code_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_product_code_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_product_code_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_code_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_product_code_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_product_code_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_code_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), product_code_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "product_code"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_code_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "product_code" = product_code_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "product_code"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "product_code", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_code_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_product_code_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_product_description_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "product_description"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "product_description") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("product_description") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_product_description_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_product_description_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_product_description_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_product_description_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_product_description_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), product_description_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "product_description"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "product_description" = product_description_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "product_description"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "product_description", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_product_description_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_product_description_other_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "product_description_other"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "product_description_other") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("product_description_other") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_other_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_product_description_other_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_product_description_other_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_product_description_other_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_other_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_product_description_other_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_product_description_other_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), product_description_other_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "product_description_other"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_product_description_other_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "product_description_other" = product_description_other_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "product_description_other"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "product_description_other", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_product_description_other_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_product_description_other_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_prior_infusion_rate_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "prior_infusion_rate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "prior_infusion_rate") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("prior_infusion_rate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_prior_infusion_rate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_prior_infusion_rate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_prior_infusion_rate_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_prior_infusion_rate_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_prior_infusion_rate_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_prior_infusion_rate_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_prior_infusion_rate_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), prior_infusion_rate_ VARCHAR(40))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "prior_infusion_rate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_prior_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "prior_infusion_rate" = prior_infusion_rate_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "prior_infusion_rate"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "prior_infusion_rate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_prior_infusion_rate_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_prior_infusion_rate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_infusion_rate_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "infusion_rate"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "infusion_rate") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("infusion_rate") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_infusion_rate_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_infusion_rate_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_infusion_rate_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_infusion_rate_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), infusion_rate_ VARCHAR(40))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "infusion_rate"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "infusion_rate" = infusion_rate_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "infusion_rate"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "infusion_rate", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_infusion_rate_adjustment_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "infusion_rate_adjustment"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "infusion_rate_adjustment") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("infusion_rate_adjustment") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_infusion_rate_adjustment_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_infusion_rate_adjustment_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_infusion_rate_adjustment_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_adjustment_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_infusion_rate_adjustment_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), infusion_rate_adjustment_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "infusion_rate_adjustment"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "infusion_rate_adjustment" = infusion_rate_adjustment_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "infusion_rate_adjustment"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "infusion_rate_adjustment", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_adjustment_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_infusion_rate_adjustment_amount_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "infusion_rate_adjustment_amount"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "infusion_rate_adjustment_amount") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("infusion_rate_adjustment_amount") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_amount_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_infusion_rate_adjustment_amount_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_infusion_rate_adjustment_amount_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_infusion_rate_adjustment_amount_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_amount_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_adjustment_amount_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_infusion_rate_adjustment_amount_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), infusion_rate_adjustment_amount_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "infusion_rate_adjustment_amount"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_adjustment_amount_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "infusion_rate_adjustment_amount" = infusion_rate_adjustment_amount_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "infusion_rate_adjustment_amount"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "infusion_rate_adjustment_amount", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_adjustment_amount_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_adjustment_amount_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_infusion_rate_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "infusion_rate_unit"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "infusion_rate_unit") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("infusion_rate_unit") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_unit_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_infusion_rate_unit_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_infusion_rate_unit_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_infusion_rate_unit_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_unit_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_unit_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_infusion_rate_unit_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), infusion_rate_unit_ VARCHAR(30))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "infusion_rate_unit"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_rate_unit_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "infusion_rate_unit" = infusion_rate_unit_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "infusion_rate_unit"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "infusion_rate_unit", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_rate_unit_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_infusion_rate_unit_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_route_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_route_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "route"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_route_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "route") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("route") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_route_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_route_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_route_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_route_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_route_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_route_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_route_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_route_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_route_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_route_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), route_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "route"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_route_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "route" = route_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "route"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "route", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_route_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_route_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_infusion_complete_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "infusion_complete"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "infusion_complete") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("infusion_complete") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_complete_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_infusion_complete_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_infusion_complete_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_infusion_complete_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_complete_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_infusion_complete_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_infusion_complete_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), infusion_complete_ VARCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "infusion_complete"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_infusion_complete_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "infusion_complete" = infusion_complete_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "infusion_complete"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "infusion_complete", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_infusion_complete_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_infusion_complete_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_completion_interval_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "completion_interval"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "completion_interval") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("completion_interval") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_completion_interval_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_completion_interval_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_completion_interval_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_completion_interval_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_completion_interval_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_completion_interval_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_completion_interval_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), completion_interval_ VARCHAR(50))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "completion_interval"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_completion_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "completion_interval" = completion_interval_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "completion_interval"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "completion_interval", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_completion_interval_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_completion_interval_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_new_iv_bag_hung_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "new_iv_bag_hung"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "new_iv_bag_hung") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("new_iv_bag_hung") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_new_iv_bag_hung_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_new_iv_bag_hung_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_new_iv_bag_hung_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_new_iv_bag_hung_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_new_iv_bag_hung_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_new_iv_bag_hung_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_new_iv_bag_hung_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), new_iv_bag_hung_ VARCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "new_iv_bag_hung"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_new_iv_bag_hung_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "new_iv_bag_hung" = new_iv_bag_hung_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "new_iv_bag_hung"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "new_iv_bag_hung", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_new_iv_bag_hung_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_new_iv_bag_hung_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_continued_infusion_in_other_location_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "continued_infusion_in_other_location"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "continued_infusion_in_other_location") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("continued_infusion_in_other_location") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_continued_infusion_in_other_location_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_continued_infusion_in_other_location_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_continued_infusion_in_other_location_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_continued_infusion_in_other_location_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_continued_infusion_in_other_location_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_continued_infusion_in_other_location_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_continued_infusion_in_other_location_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), continued_infusion_in_other_location_ VARCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "continued_infusion_in_other_location"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_continued_infusion_in_other_location_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "continued_infusion_in_other_location" = continued_infusion_in_other_location_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "continued_infusion_in_other_location"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "continued_infusion_in_other_location", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_continued_infusion_in_other_location_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_continued_infusion_in_other_location_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_restart_interval_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "restart_interval"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "restart_interval") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("restart_interval") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_restart_interval_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_restart_interval_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_restart_interval_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_restart_interval_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_restart_interval_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_restart_interval_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_restart_interval_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), restart_interval_ VARCHAR(2305))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "restart_interval"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_restart_interval_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "restart_interval" = restart_interval_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "restart_interval"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "restart_interval", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_restart_interval_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_restart_interval_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_side_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_side_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "side"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_side_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "side") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("side") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_side_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_side_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_side_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_side_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_side_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_side_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_side_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_side_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_side_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_side_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), side_ VARCHAR(10))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "side"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_side_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "side" = side_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "side"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "side", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_side_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_side_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_site_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_site_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "site"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_site_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "site") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("site") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_site_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_site_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_site_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_site_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_site_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_site_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_site_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_site_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_site_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_site_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), site_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "site"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_site_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "site" = site_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "site"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "site", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_site_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_site_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : emar_detail_non_formulary_visual_verification_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history_nocontradiction_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
        , "non_formulary_visual_verification"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
  anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct "non_formulary_visual_verification") as contradictions
      from unpack
      group by "emar_id", "parent_field_ordinal", point
      having count("non_formulary_visual_verification") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_non_formulary_visual_verification_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'emar_detail_non_formulary_visual_verification_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : emar_detail_non_formulary_visual_verification_history -> emar_detail_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history_emar_detail_history_denseness_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_non_formulary_visual_verification_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

      union
      select "emar_id", "parent_field_ordinal"
           , "UHF".unfold("validTime") as point
           , 'emar_detail_history' as source
      from "mimiciv_hosp@V@UHF".emar_detail_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ 

    ),
    anomalies as
    (
      select "emar_id", "parent_field_ordinal"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "emar_id", "parent_field_ordinal", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_non_formulary_visual_verification_history and emar_detail_history are dense';
    return true;
  else
    raise warning 'emar_detail_non_formulary_visual_verification_history and emar_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : emar_detail_non_formulary_visual_verification_history
create or replace function "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history_noredundancy_check
  (emar_id_ VARCHAR(25), parent_field_ordinal_ VARCHAR(10), non_formulary_visual_verification_ VARCHAR(1))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "emar_id", "parent_field_ordinal", "non_formulary_visual_verification"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".emar_detail_non_formulary_visual_verification_history
      where "emar_id" = emar_id_ and "parent_field_ordinal" = parent_field_ordinal_ and "non_formulary_visual_verification" = non_formulary_visual_verification_ 

    ),
    anomalies as
      (
        select "emar_id", "parent_field_ordinal", "non_formulary_visual_verification"
             , point
             , count(*) as count
        from unpack
        group by "emar_id", "parent_field_ordinal", "non_formulary_visual_verification", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'emar_detail_non_formulary_visual_verification_history relation has no redundancies';
    return true;
  else
    raise warning 'emar_detail_non_formulary_visual_verification_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_detail_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_history_noredundancy_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
    anomalies as
      (
        select "poe_id", "field_name"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "field_name", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_detail_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_detail_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history_nocontradiction_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
        , "poe_seq"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
  anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct "poe_seq") as contradictions
      from unpack
      group by "poe_id", "field_name", point
      having count("poe_seq") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_poe_seq_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_detail_poe_seq_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_detail_poe_seq_history -> poe_detail_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history_poe_detail_history_denseness_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_poe_seq_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

      union
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
    anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", "field_name", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_poe_seq_history and poe_detail_history are dense';
    return true;
  else
    raise warning 'poe_detail_poe_seq_history and poe_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_detail_poe_seq_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history_noredundancy_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255), poe_seq_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name", "poe_seq"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_poe_seq_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ and "poe_seq" = poe_seq_ 

    ),
    anomalies as
      (
        select "poe_id", "field_name", "poe_seq"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "field_name", "poe_seq", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_poe_seq_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_detail_poe_seq_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_detail_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_subject_id_history_nocontradiction_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
        , "subject_id"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
  anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct "subject_id") as contradictions
      from unpack
      group by "poe_id", "field_name", point
      having count("subject_id") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_subject_id_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_detail_subject_id_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_detail_subject_id_history -> poe_detail_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_subject_id_history_poe_detail_history_denseness_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_subject_id_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

      union
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
    anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", "field_name", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_subject_id_history and poe_detail_history are dense';
    return true;
  else
    raise warning 'poe_detail_subject_id_history and poe_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_detail_subject_id_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_subject_id_history_noredundancy_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255), subject_id_ INT4)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name", "subject_id"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_subject_id_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ and "subject_id" = subject_id_ 

    ),
    anomalies as
      (
        select "poe_id", "field_name", "subject_id"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "field_name", "subject_id", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_subject_id_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_detail_subject_id_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : poe_detail_field_value_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_field_value_history_nocontradiction_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
        , "field_value"
        , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_field_value_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
  anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct "field_value") as contradictions
      from unpack
      group by "poe_id", "field_name", point
      having count("field_value") > 1
    )
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_field_value_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'poe_detail_field_value_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : poe_detail_field_value_history -> poe_detail_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_field_value_history_poe_detail_history_denseness_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_field_value_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_field_value_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

      union
      select "poe_id", "field_name"
           , "UHF".unfold("validTime") as point
           , 'poe_detail_history' as source
      from "mimiciv_hosp@V@UHF".poe_detail_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ 

    ),
    anomalies as
    (
      select "poe_id", "field_name"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "poe_id", "field_name", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_field_value_history and poe_detail_history are dense';
    return true;
  else
    raise warning 'poe_detail_field_value_history and poe_detail_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : poe_detail_field_value_history
create or replace function "mimiciv_hosp@V@UHF".poe_detail_field_value_history_noredundancy_check
  (poe_id_ VARCHAR(25), field_name_ VARCHAR(255), field_value_ TEXT)
  returns boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "poe_id", "field_name", "field_value"
           , "UHF".unfold("validTime") as point
      from "mimiciv_hosp@V@UHF".poe_detail_field_value_history
      where "poe_id" = poe_id_ and "field_name" = field_name_ and "field_value" = field_value_ 

    ),
    anomalies as
      (
        select "poe_id", "field_name", "field_value"
             , point
             , count(*) as count
        from unpack
        group by "poe_id", "field_name", "field_value", point
        having count(*) > 1
      )
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'poe_detail_field_value_history relation has no redundancies';
    return true;
  else
    raise warning 'poe_detail_field_value_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

