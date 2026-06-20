/*
-- =========================================================================== A
Schema     : supplier_part@V@UHF
Creation   : 20260619-1752
Encoding   : UTF-8, sans BOM, fin de ligne Unix (LF)
Plateforme : PostgreSQL 15
Responsable : uhf
Version : 1.0
Status  : dev
Objet   : Create the constraint functions.
  Assertion that cannot be defined directly using constraints
-- =========================================================================== A
*/

-- Temporal redundancy check for : p_history
create or replace function "supplier_part@V@UHF".p_history_noredundancy_check
  (pno_ BPCHAR(3))
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
      select "pno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_history
      where "pno" = pno_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'p_history relation has no redundancies';
    return true;
  else
    raise warning 'p_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : p_name_history
create or replace function "supplier_part@V@UHF".p_name_history_nocontradiction_check
  (pno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pno"
        , "name"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
      where "pno" = pno_ 

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
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'p_name_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'p_name_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : p_name_history -> p_history
create or replace function "supplier_part@V@UHF".p_name_history_p_history_denseness_check
  (pno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "pno"
           , "UHF".unfold("validTime") as point
           , 'p_name_history' as source
      from "supplier_part@V@UHF".p_name_history
      where "pno" = pno_ 

      union
      select "pno"
           , "UHF".unfold("validTime") as point
           , 'p_history' as source
      from "supplier_part@V@UHF".p_history
      where "pno" = pno_ 

    ),
    anomalies as
    (
      select "pno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "pno", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'p_name_history and p_history are dense';
    return true;
  else
    raise warning 'p_name_history and p_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : p_name_history
create or replace function "supplier_part@V@UHF".p_name_history_noredundancy_check
  (pno_ BPCHAR(3), name_ VARCHAR(30))
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
      select "pno", "name"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".p_name_history
      where "pno" = pno_ and "name" = name_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'p_name_history relation has no redundancies';
    return true;
  else
    raise warning 'p_name_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : s_history
create or replace function "supplier_part@V@UHF".s_history_noredundancy_check
  (sno_ BPCHAR(3))
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
      select "sno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_history
      where "sno" = sno_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_history relation has no redundancies';
    return true;
  else
    raise warning 's_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : s_status_history
create or replace function "supplier_part@V@UHF".s_status_history_nocontradiction_check
  (sno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno"
        , "status"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
      where "sno" = sno_ 

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
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_status_history relation has no contradiction';
    return true;
  ELSE
    raise warning 's_status_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : s_status_history -> s_history
create or replace function "supplier_part@V@UHF".s_status_history_s_history_denseness_check
  (sno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_status_history' as source
      from "supplier_part@V@UHF".s_status_history
      where "sno" = sno_ 

      union
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_history' as source
      from "supplier_part@V@UHF".s_history
      where "sno" = sno_ 

    ),
    anomalies as
    (
      select "sno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_status_history and s_history are dense';
    return true;
  else
    raise warning 's_status_history and s_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : s_status_history
create or replace function "supplier_part@V@UHF".s_status_history_noredundancy_check
  (sno_ BPCHAR(3), status_ INT4)
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
      select "sno", "status"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_status_history
      where "sno" = sno_ and "status" = status_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_status_history relation has no redundancies';
    return true;
  else
    raise warning 's_status_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : s_city_history
create or replace function "supplier_part@V@UHF".s_city_history_nocontradiction_check
  (sno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno"
        , "city"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
      where "sno" = sno_ 

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
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_city_history relation has no contradiction';
    return true;
  ELSE
    raise warning 's_city_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : s_city_history -> s_history
create or replace function "supplier_part@V@UHF".s_city_history_s_history_denseness_check
  (sno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_city_history' as source
      from "supplier_part@V@UHF".s_city_history
      where "sno" = sno_ 

      union
      select "sno"
           , "UHF".unfold("validTime") as point
           , 's_history' as source
      from "supplier_part@V@UHF".s_history
      where "sno" = sno_ 

    ),
    anomalies as
    (
      select "sno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_city_history and s_history are dense';
    return true;
  else
    raise warning 's_city_history and s_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : s_city_history
create or replace function "supplier_part@V@UHF".s_city_history_noredundancy_check
  (sno_ BPCHAR(3), city_ VARCHAR(30))
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
      select "sno", "city"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".s_city_history
      where "sno" = sno_ and "city" = city_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 's_city_history relation has no redundancies';
    return true;
  else
    raise warning 's_city_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : sp_history
create or replace function "supplier_part@V@UHF".sp_history_noredundancy_check
  (sno_ BPCHAR(3), pno_ BPCHAR(3))
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
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_history
      where "sno" = sno_ and "pno" = pno_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'sp_history relation has no redundancies';
    return true;
  else
    raise warning 'sp_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal contradiction check for : sp_qty_history
create or replace function "supplier_part@V@UHF".sp_qty_history_nocontradiction_check
  (sno_ BPCHAR(3), pno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno", "pno"
        , "qty"
        , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
      where "sno" = sno_ and "pno" = pno_ 

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
  select * into _rec
  from anomalies
  where array_length(contradictions, 1) > 1;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'sp_qty_history relation has no contradiction';
    return true;
  ELSE
    raise warning 'sp_qty_history has % contradiction', _nbTuple;
    return false;
  end if;
end
$$;

-- Temporal denseness check for : sp_qty_history -> sp_history
create or replace function "supplier_part@V@UHF".sp_qty_history_sp_history_denseness_check
  (sno_ BPCHAR(3), pno_ BPCHAR(3))
  returns Boolean
  language 'plpgsql'
  volatile
as
$$
declare
  _rec RECORD;
  _nbTuple INT;
begin
  with unpack as
    (
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
           , 'sp_qty_history' as source
      from "supplier_part@V@UHF".sp_qty_history
      where "sno" = sno_ and "pno" = pno_ 

      union
      select "sno", "pno"
           , "UHF".unfold("validTime") as point
           , 'sp_history' as source
      from "supplier_part@V@UHF".sp_history
      where "sno" = sno_ and "pno" = pno_ 

    ),
    anomalies as
    (
      select "sno", "pno"
           , point
           , array_agg(distinct source) as sources
      from unpack
      group by "sno", "pno", point
    )
  select * into _rec
  from anomalies
  where array_length(sources, 1) < 2;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'sp_qty_history and sp_history are dense';
    return true;
  else
    raise warning 'sp_qty_history and sp_history are not dense';
    return false;
  end if;
end
$$;

-- Temporal redundancy check for : sp_qty_history
create or replace function "supplier_part@V@UHF".sp_qty_history_noredundancy_check
  (sno_ BPCHAR(3), pno_ BPCHAR(3), qty_ INT4)
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
      select "sno", "pno", "qty"
           , "UHF".unfold("validTime") as point
      from "supplier_part@V@UHF".sp_qty_history
      where "sno" = sno_ and "pno" = pno_ and "qty" = qty_ 

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
  select * into _rec
  from anomalies;
  --
  get diagnostics _nbTuple = row_count;
  if (_nbTuple = 0) then
    raise notice 'sp_qty_history relation has no redundancies';
    return true;
  else
    raise warning 'sp_qty_history relation has % redundancies', _nbTuple;
    return false;
  end if;
end
$$;

