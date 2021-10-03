/*
  If you receive errors about "could not identify an equality operator
  for type json" and you cannot or do not want to convert the column type
  from json to jsonb, you can try applying this file. It adds equality
  operator support for the json type.

  See also https://github.com/mla/pg_sample/issues/20
*/

create function json_lt(json, json)
returns boolean language sql immutable as $$
    select $1::jsonb < $2::jsonb
$$;

create function json_lte(json, json)
returns boolean language sql immutable as $$
    select $1::jsonb < $2::jsonb OR $1::jsonb = $2::jsonb
$$;

create function json_gt(json, json)
returns boolean language sql immutable as $$
    select $1::jsonb > $2::jsonb
$$;

create function json_gte(json, json)
returns boolean language sql immutable as $$
    select $1::jsonb > $2::jsonb OR $1::jsonb = $2::jsonb
$$;

create function json_eq(json, json)
returns boolean language sql immutable as $$
    select $1::jsonb = $2::jsonb
$$;


create operator < (leftarg = json, rightarg = json, procedure = json_lt);
create operator > (leftarg = json, rightarg = json, procedure = json_gt);
create operator >= (leftarg = json, rightarg = json, procedure = json_gte);
create operator <= (leftarg = json, rightarg = json, procedure = json_lte);
create operator = (leftarg = json, rightarg = json, procedure = json_eq);

create function jsoncmp(json, json)
returns integer language sql immutable as $$
    select case 
        when $1 = $2 then 0
        when $1 < $2 then -1
        else 1
    end
$$;

create operator class json_ops
  default for type json using btree AS
    operator 1 <,
    operator 2 <=,
    operator 3 =,
    operator 4 >=,
    operator 5 >,
    function 1 jsoncmp(json, json)
;
