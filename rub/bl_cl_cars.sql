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

select count(*) from cl_vehicle_type;

GRANT SELECT ON cl_vehicle_type to bl_3nf;


---------------------repaired status table-----------------------
drop table cl_repaired_status;

Create table cl_repaired_status(
repaired_status_name varchar2(200) not null
);

truncate table cl_repaired_status;
INSERT
INTO cl_repaired_status
  (
    repaired_status_name
  )
SELECT  distinct repaired_status as repaired_status_name
FROM wrk_cars;
select count(*) from cl_repaired_status;

GRANT SELECT ON cl_repaired_status to bl_3nf;
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
select count(*) from cl_gearbox_type;

GRANT SELECT ON cl_gearbox_type to bl_3nf;
---------------------engine type table-----------------------
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
---------------------brand table-----------------------
drop table cl_brand;

Create table cl_brand(
brand_name varchar2(200) not null
);

truncate table cl_brand;
INSERT
INTO cl_brand
  (
    brand_name
  )
SELECT distinct brand as brand_name
FROM wrk_cars;
commit;

select count(*) from cl_brand;

GRANT SELECT ON cl_brand to bl_3nf;
-------------------model table---------------
drop table cl_model;
Create table cl_model(
model_name varchar2(200) not null,
brand_id number(6) not null) ;

truncate table cl_model;
INSERT
INTO cl_model
  (
    model_name,
    brand_id
  )
SELECT distinct rs.model as model_name, ce.brand_id as brand_id
FROM wrk_cars rs
left join bl_3nf.ce_brand ce on rs.brand = ce.brand_name;--298
commit;

select count(*) from cl_model;

GRANT SELECT ON cl_model to bl_3nf;
---------------------------------------
drop table cl_cars;
Create table cl_cars(
car_number varchar2(200) not null,
car_name varchar2(200) not null ,
registration_date date,
vehicle_type_id number(6) not null,
engine_type_id number(6) not null,
gearbox_type_id number(6) not null,
model_id number(6) not null,
repaired_status_id number(6) not null
);

truncate table cl_cars;
INSERT
INTO cl_cars
  (
    car_number,
    car_name,
    registration_date,
    vehicle_type_id,
    engine_type_id,
    gearbox_type_id,
    model_id,
    repaired_status_id
  )
SELECT  rs.car_number as car_number,
        rs.car_name as car_name, 
        rs.reg_date as reg_date,
        vt.vehicle_type_id as vehicle_type_id, 
        et.engine_type_id as engine_type_id, 
        gt.gearbox_type_id as gearbox_type_id,
        m.model_id as model_id,
        rst.repaired_status_id as repaired_status_id
FROM wrk_cars rs
left join bl_3nf.ce_vehicle_type vt on rs.vehicle_type = vt.vehicle_type_name
left join bl_3nf.ce_engine_type et on rs.engine_type = et.engine_type_name
left join bl_3nf.ce_gearbox_type gt on rs.gearbox_type = gt.gearbox_type_name
left join bl_3nf.ce_model m on rs.model = m.model_name
left join bl_3nf.ce_repaired_status rst on rs.repaired_status = rst.repaired_status_name
Where car_name is not null and rs.model is not null and rs.vehicle_type is not null
and rs.engine_type is not null and rs.gearbox_type is not null
and rs.model is not null and rs.repaired_status is not null;

select count(distinct car_number) from cl_cars;
select * from cl_cars order by car_name;
select count (distinct car_name) from cl_cars;
select distinct model from wrk_cars;
select * from bl_3nf.ce_model;
GRANT SELECT ON cl_cars to bl_3nf;
