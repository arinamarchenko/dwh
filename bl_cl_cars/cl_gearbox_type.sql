---------------------gearbox type table-----------------------
drop table cl_gearbox_type;

Create table cl_gearbox_type(
gearbox_type_name varchar2(200) not null
);

truncate table cl_gearbox_type;
INSERT
INTO cl_gearbox_type
  (
    gearbox_type_name
  )
SELECT DISTINCT gearbox_type as gearbox_type_name
FROM  wrk_cars;
commit;
select count(*) from cl_gearbox_type;

GRANT SELECT ON cl_gearbox_type to bl_3nf;