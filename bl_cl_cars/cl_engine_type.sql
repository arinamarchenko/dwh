drop table cl_engine_type;

Create table cl_engine_type(
engine_type_name varchar2(200) not null
);

truncate table cl_engine_type;
INSERT
INTO cl_engine_type
  (
    engine_type_name
  )
SELECT DISTINCT engine_type as engine_type_name
FROM wrk_cars;
commit;

select count(*) from cl_engine_type;

GRANT SELECT ON cl_engine_type to bl_3nf;