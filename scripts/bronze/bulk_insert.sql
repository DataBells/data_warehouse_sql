-- bulk insert from source scv files to bronze layer
-- run these scripts in psql command line from pgadmin 
-- use this script because COPY is a server-side operation, meaning the PostgreSQL server itself needs to access the file. 
-- When you're running the query through pgAdmin, it tries to access the file from the PostgreSQL server’s file system, not your local machine. 
-- Since the file is located on your local machine, the PostgreSQL server doesn't have permission or access to that file.
-- but if you replace your files to PostgreSQL server accessible then use the stored procedure scipt in bronze folder

TRUNCATE TABLE bronze.crm_cust_info;
\COPY bronze.crm_cust_info FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.crm_prd_info;
\COPY bronze.crm_prd_info FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.crm_sales_details;
\COPY bronze.crm_sales_details FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');


TRUNCATE TABLE bronze.erp_cust_az12;
\COPY bronze.erp_cust_az12 FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.erp_loc_a101;
\COPY bronze.erp_loc_a101 FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\COPY bronze.erp_px_cat_g1v2 FROM '/Users/sandeepsrinivasdwaram/Documents/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- check the quality of inserted data superficially 
select count (*) from bronze.erp_cust_az12;
select count (*) from bronze.crm_cust_info;
select count (*) from bronze.crm_prd_info;
select count (*) from bronze.crm_sales_details;
select count (*) from bronze.erp_loc_a101;
select count (*) from bronze.erp_px_cat_g1v2;

select * from bronze.erp_cust_az12;
select * from bronze.crm_cust_info;
select * from bronze.crm_prd_info;
select * from bronze.crm_sales_details;
select * from bronze.erp_loc_a101;
select * from bronze.erp_px_cat_g1v2;
