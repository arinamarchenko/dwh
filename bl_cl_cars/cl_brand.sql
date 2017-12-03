drop table cl_brand;

Create table cl_brand(
brand_name varchar2(200) not null
);

EXEC PKG_ETL_LOAD_BRAND.load_cl_brand;

select * from cl_brand;

GRANT SELECT ON cl_brand to bl_3nf;
---------------------------------------------



CREATE OR REPLACE PACKAGE pkg_etl_load_brand AS
     PROCEDURE load_cl_brand;
END pkg_etl_load_brand;
/


CREATE OR REPLACE PACKAGE BODY pkg_etl_load_brand
AS
  PROCEDURE load_cl_brand
  IS
  BEGIN
    EXECUTE IMMEDIATE 'truncate table cl_brand';
    INSERT INTO cl_brand
  (
    brand_name
  )
    SELECT distinct brand as brand_name
FROM wrk_cars;
commit;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE;
  END load_cl_brand;
END pkg_etl_load_brand;
/