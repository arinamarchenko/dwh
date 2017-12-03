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
commit;
select count(*) from cl_repaired_status;

GRANT SELECT ON cl_repaired_status to bl_3nf;