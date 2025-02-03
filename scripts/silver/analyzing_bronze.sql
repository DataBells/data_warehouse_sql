-- analyzing first 1000 rows of data for each table in the bronze layer
-- based on that we can develope integration model and help us for analyzing and understand data

SELECT * FROM bronze.crm_cust_info
LIMIT 1000;

SELECT * FROM bronze.crm_prd_info
LIMIT 1000;

SELECT * FROM bronze.crm_sales_details
LIMIT 1000;

SELECT * FROM bronze.erp_cust_az12
LIMIT 1000;

SELECT * FROM bronze.erp_loc_a101
LIMIT 1000;

SELECT * FROM bronze.erp_px_cat_g1v2
LIMIT 1000;
