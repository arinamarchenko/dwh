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