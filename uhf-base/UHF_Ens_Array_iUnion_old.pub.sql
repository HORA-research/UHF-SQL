-- Version du 2022-08-07
-- Elle comporte un seul tri et utilise les opérateurs GiST && et -|- directement
-- One ne fait donc pas encore appel au module Allen (et ses variantes) pour ces fonctions

create function "iUnion_func_old"
  (
    _s "UHF"."Interval"[]
  )
  returns "UHF"."Interval"[]
  immutable strict
language plpgsql as
$$
declare
  _current "UHF"."Interval" := "UHF"."interval_min"();
  _next "UHF"."Interval" := "UHF"."interval_min"(); -- curieux qu'on doive le pré-déclarer, n'est pas le rôle du «for» ?
  _res "UHF"."Interval"[];
  _n Bigint := cardinality(_s);
  _first Boolean := true;
begin
  if _n <= 1 then
    -- _s est vide si _n = 0, _s est déjà la bonne réponse si _n = 1
    return _s ;
  else
    -- Il est inutile d’aller chercher la valeur minimale du tableau au cout
    -- d’un parcours préalable à la boucle qui, lors de son initialisation,
    -- fait le tri et place cette valeur minimale en position initiale.
    -- TOIMPROVE 2022-08-06 (LL01) : Étudier la possibilité de faire et de conserver
    --    le résultat du tri antérieurement à l’amorce de la boucle, un petit gain
    --    pourrait être obtenu (un test scalaire en moins par itération).
    for _next in select unnest(_s) as x order by x
    loop
      --raise notice 'union: _current0: %', _current;
      --raise notice 'union: _next0: %', _next;
      if _first then
        _current := _next ;
        _first := false ; -- c'est pas joli, mais moins couteux
      elsif _current && _next or _current -|- _next then
        _current := _current + _next;
        --raise notice 'union: _current+:%', _current;
      else
        _res := array_append(_res, _current);
        --raise notice 'union: _res:%', _res;
        _current := _next;
        --raise notice 'union: _current_reset:%', _current;
      end if;
    end loop;
    _res := array_append(_res, _current);
    --raise notice 'union: _current_result:%', _res;
    return _res;
  end if;
end
$$;

drop aggregate if exists "iUnion_agg_old" ("Interval") cascade  ;
create aggregate "iUnion_agg_old" ("Interval") (
  stype = "Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = "iUnion_func_old"
  );

/*
o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-

-- Version originale du 2022-07-01 (ou antérieure)
-- Elle comporte deux tris, mais utilise les opérateurs GiST && et -|- directement

-- Get the "total" union between multiple intervals (old deprecated version)
create function iUnion_func_old
  (
    _s "Interval"[]
  )
  returns "Interval"[]
  immutable strict
language plpgsql as
$$
declare
  _current "Interval" := "interval_min"();
  _next "Interval" := "interval_min"();
  _res "Interval"[];
begin
  _current := (
    select x
    from unnest(_s) x
    order by x
    limit 1
    );
  --
  for _next in select unnest(_s) as x order by x
  loop
    --raise notice '_current: %', _current;
    --raise notice '_next: %', _next;
    if _current && _next or _current -|- _next then
      _current := _current + _next;
      --raise notice 'union: %', _current;
    else
      _res := array_append(_res, _current);
      _current := _next;
      --raise notice '_result: %', _res;
    end if;
  end loop;
  _res := array_append(_res, _current);
  return _res;
end
$$;

drop aggregate if exists "iUnion_agg_old" ("Interval")  ;
create aggregate "iUnion_agg_old" ("Interval") (
  stype = "Interval"[],
  initcond = '{}',
  sfunc = array_append,
  finalfunc = iUnion_func_old
  );

o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-
*/