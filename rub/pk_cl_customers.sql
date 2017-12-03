CREATE OR REPLACE PACKAGE pkg_etl_load_cl_customers AS
       PROCEDURE load_cl_customers;
	   PROCEDURE load_cl_country;
END pkg_etl_load_cl_customers;
/

CREATE OR REPLACE PACKAGE BODY pkg_etl_load_cl_customers
AS
  PROCEDURE load_cl_customers
  IS
  BEGIN
    EXECUTE IMMEDIATE 'truncate table cl_customers';
   INSERT
INTO cl_customers
  (
    customer_id,
    first_name,
    last_name,
    age,       
    gender,  
    phone,
    email  
  )
SELECT bl_3nf.seq_customers.nextval as customer_id,
	   ct.first_name as first_name,
	   ct.last_name as last_name,
	   ct.age as age,       
	   ct.gender as gender,  
	   ct.phone as phone,
	   ct.email as email
FROM (select distinct c.first_name, c.last_name, c.age, c.gender, c.phone,
    c.email from wrk_customers c)ct;
commit;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE;
  END load_cl_customers;
  ----------------------------------------------
  PROCEDURE load_cl_country
  IS
  BEGIN
    EXECUTE IMMEDIATE 'truncate table cl_country';
   INSERT
INTO cl_country
  (
    country_id,
    country_name
  )
SELECT bl_3nf.seq_country.nextval as country_id,
       rs.country as country_name
FROM (select distinct country from wrk_seller)rs;
commit;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE;
  END load_cl_country;
  END pkg_etl_load_cl_customers;
/
