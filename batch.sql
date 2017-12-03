CONNECT SYS/123456;
show USER;
@directory.sql

create user bl_dm
identified by 123 
default tablespace tbs_pdb_test;

grant connect to bl_dm;
grant resource to bl_dm;
grant dba to bl_dm;



CONNECT SA_SRC/123;
show USER;
@sa_src/sa_src_cars.sql
@sa_src/sa_src_customer.sql
@sa_src/sa_src_seller.sql
@sa_src/sa_src_shops.sql
@sa_src/sa_src_fact.sql

CONNECT BL_CL/123;
show USER;
@create_wrk/wrk_cars.sql
@create_wrk/wrk_customers.sql
@create_wrk/wrk_seller.sql
@create_wrk/wrk_shops.sql
@create_wrk/wrk_fact.sql
@create_cl_cars/create_cl_vehicle_type.sql
@create_cl_cars/create_cl_repaired_status.sql
@create_cl_cars/create_cl_gearbox_type.sql
@create_cl_cars/create_cl_engine_type.sql
@create_cl_cars/create_cl_brand.sql
@create_cl_cars/create_cl_model.sql
@create_cl_cars/create_cl_cars.sql
@create_cl_customers.sql
@seller_store/create_cl_country.sql
@seller_store/create_cl_city.sql
@seller_store/create_cl_seller.sql
@seller_store/create_cl_address.sql
@seller_store/create_cl_shop.sql
@create_cl_fact;
CONNECT BL_3NF/123;
show USER;
@create_ce_cars/ce_vehicle_type.sql
@create_ce_cars/ce_repaired_status.sql
@create_ce_cars/ce_gearbox_type.sql
@create_ce_cars/ce_engine_type.sql
@create_ce_cars/ce_brand.sql
@create_ce_cars/ce_model.sql
@create_ce_cars/ce_cars.sql
@ce_customers.sql
@seller_store/ce_country.sql
@seller_store/ce_city.sql
@seller_store/ce_seller.sql
@seller_store/ce_address.sql
@seller_store/ce_shop.sql
@ce_fact.sql
CONNECT BL_CL/123;
show USER;
@package/package_wrk_tables.sql
@execute/ex_wrk_tables.sql
@package/package_cl_car.sql
@execute/execute_package_cl_car.sql
@package/pk_ce_brand.sql
@execute/ex_ce_brand.sql
@package/pk_model.sql
@execute/ex_cl_model.sql
@package/package_ce_cars.sql
@execute/execute_package_ce_car.sql
@package/pk_cars.sql
@execute/ex_cl_cars.sql
@package/pk_ce_cars.sql
@execute/ex_ce_cars.sql
@package/package_cl_customers.sql
@execute/ex_cl_customers.sql
@package/pk_ce_customers.sql
@execute/ex_ce_customers.sql
@package/pk_cl_city.sql
@execute/ex_cl_city.sql
@package/pk_ce_city.sql
@execute/ex_ce_city.sql
@package/pk_cl_seller.sql
@execute/ex_cl_seller.sql
@package/pk_ce_seller.sql
@execute/ex_ce_seller.sql
@package/pk_cl_address.sql
@execute/ex_cl_address.sql
@package/pk_ce_address.sql
@execute/ex_ce_address.sql
@package/pk_cl_shop.sql
@execute/ex_cl_shop.sql
@package/pk_ce_shop.sql
@execute/ex_ce_shop.sql
@package/pk_cl_fact.sql
@execute/ex_cl_fact.sql
@package/pk_ce_fact.sql
@execute/ex_ce_fact.sql

CONNECT BL_CL_DM/123;
show USER;
@create_dim/cl_dim_cars.sql
@create_dim/cl_dim_customers.sql
@create_dim/cl_dim_date.sql
@create_dim/cl_dim_seller.sql
@create_dim/cl_dim_shop.sql
@create_dim/cl_fact.sql
@create_dim/package_cl_dim.sql
@create_dim/ex_cl_dim.sql

CONNECT BL_DM/123;
show USER;
@create_dim/dim_cars.sql
@create_dim/dim_customers.sql
@create_dim/dim_date.sql
@create_dim/dim_seller.sql
@create_dim/dim_shop.sql
@create_dim/fact.sql
CONNECT BL_CL_DM/123;
show USER;
@create_dim/package_dim.sql
@create_dim/ex_dim.sql