-------------------------- vehicle type table -------------------
drop table cl_vehicle_type;
Create table cl_vehicle_type(
vehicle_type_name varchar2(200) not null
);

truncate table cl_vehicle_type;
INSERT
INTO cl_vehicle_type
  (
    vehicle_type_name
  )
SELECT distinct vehicle_type as vehicle_type_name
FROM wrk_cars;
commit;

select count(*) from cl_vehicle_type;

GRANT SELECT ON cl_vehicle_type to bl_3nf;