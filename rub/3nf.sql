drop sequence seq_vehicle_type;
CREATE SEQUENCE seq_vehicle_type
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_vehicle_type;
Create table ce_vehicle_type(
vehicle_type_id number(6) not null,
vehicle_type_name varchar2(200) not null);

truncate table ce_vehicle_type;
INSERT
INTO ce_vehicle_type
  (
    vehicle_type_id,
    vehicle_type_name
  )
SELECT seq_vehicle_type.nextval as vehicle_type_id,
       vehicle_type_name as vehicle_type_name
FROM bl_cl.cl_vehicle_type;
select count(*) from ce_vehicle_type;

---------------------repaired status table-----------------------
drop sequence seq_repaired_status;
CREATE SEQUENCE seq_repaired_status
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_repaired_status;
Create table ce_repaired_status(
repaired_status_id number(6) not null,
repaired_status_name varchar2(200) not null);

truncate table ce_repaired_status;
INSERT
INTO ce_repaired_status
  (
    repaired_status_id,
    repaired_status_name
  )
SELECT seq_repaired_status.nextval as repaired_status_id,
       repaired_status_name as repaired_status_name
FROM bl_cl.cl_repaired_status;
select count(*) from ce_repaired_status;

---------------------gearbox type table-----------------------
drop sequence seq_gearbox_type;
CREATE SEQUENCE seq_gearbox_type
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_gearbox_type;
Create table ce_gearbox_type(
gearbox_type_id number(6) not null,
gearbox_type_name varchar2(200) not null);

truncate table ce_gearbox_type;
INSERT
INTO ce_gearbox_type
  (
    gearbox_type_id,
    gearbox_type_name
  )
SELECT seq_gearbox_type.nextval as gearbox_type_id,
       gearbox_type_name as gearbox_type_name
FROM bl_cl.cl_gearbox_type;
select count(*) from ce_gearbox_type;
---------------------engine type table-----------------------
drop sequence seq_engine_type;
CREATE SEQUENCE seq_engine_type
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

Create table ce_engine_type(
engine_type_id number(6) not null,
engine_type_name varchar2(200) not null);

truncate table ce_engine_type;
INSERT
INTO ce_engine_type
  (
    engine_type_id,
    engine_type_name
  )
SELECT seq_engine_type.nextval as engine_type_id,
       engine_type_name as engine_type_name
FROM bl_cl.cl_engine_type;
select count(*) from ce_engine_type;
---------------------brand table-----------------------
drop sequence seq_brand;
CREATE SEQUENCE seq_brand
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_brand;
Create table ce_brand(
brand_id number(6) not null,
brand_name varchar2(200) not null
);

truncate table ce_brand;
INSERT
INTO ce_brand
  (
    brand_id,
    brand_name
  )
SELECT seq_brand.nextval as brand_id,
       brand_name as brand_name
FROM bl_cl.cl_brand;

select count(*) from ce_brand;
---------------------model----------------
drop sequence seq_model;
CREATE SEQUENCE seq_model
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_model;
Create table ce_model(
model_id number(6) not null,
model_name varchar2(200) not null,
brand_id number(6) not null);

truncate table ce_model;
INSERT
INTO ce_model
  (
    model_id,
    model_name,
    brand_id
  )
SELECT seq_model.nextval as model_id,
       model_name as model_name,
       brand_id as brand_id
FROM bl_cl.cl_model;

select count(*) from ce_model ;
---------------------------------------
drop sequence seq_cars;
CREATE SEQUENCE seq_cars
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
NOCYCLE;

drop table ce_cars;
Create table ce_cars(
car_number varchar2(200) not null,
car_name varchar2(200) not null ,
registration_date date,
vehicle_type_id number(6) not null,
engine_type_id number(6) not null,
gearbox_type_id number(6) not null,
model_id number(6) not null,
repaired_status_id number(6) not null
);

INSERT
INTO ce_cars
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
SELECT  car_number as car_number,
        car_name as car_name, 
        registration_date as registration_date,
        vehicle_type_id as vehicle_type_id, 
        engine_type_id as engine_type_id, 
        gearbox_type_id as gearbox_type_id,
        model_id as model_id,
        repaired_status_id as repaired_status_id
FROM bl_cl.cl_cars ;

---------------------------------------------
GRANT SELECT ON ce_brand to bl_cl;
GRANT SELECT ON ce_engine_type to bl_cl;
GRANT SELECT ON ce_gearbox_type to bl_cl;
GRANT SELECT ON ce_repaired_status to bl_cl;
GRANT SELECT ON ce_vehicle_type to bl_cl;
GRANT SELECT ON ce_model to bl_cl;