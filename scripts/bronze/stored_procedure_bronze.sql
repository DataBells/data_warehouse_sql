CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Truncate and load data into bronze.crm_cust_info
    TRUNCATE TABLE bronze.crm_cust_info;
    COPY bronze.crm_cust_info FROM '/Library/PostgreSQL/17/data/cust_info.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Truncate and load data into bronze.crm_prd_info
    TRUNCATE TABLE bronze.crm_prd_info;
    COPY bronze.crm_prd_info FROM '/Library/PostgreSQL/17/data/prd_info.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Truncate and load data into bronze.crm_sales_details
    TRUNCATE TABLE bronze.crm_sales_details;
    COPY bronze.crm_sales_details FROM '/Library/PostgreSQL/17/data/sales_details.csv' 
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Truncate and load data into bronze.erp_cust_az12
    TRUNCATE TABLE bronze.erp_cust_az12;
    COPY bronze.erp_cust_az12 FROM '/Library/PostgreSQL/17/data/CUST_AZ12.csv' 
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Truncate and load data into bronze.erp_loc_a101
    TRUNCATE TABLE bronze.erp_loc_a101;
    COPY bronze.erp_loc_a101 FROM '/Library/PostgreSQL/17/data/LOC_A101.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Truncate and load data into bronze.erp_px_cat_g1v2
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    COPY bronze.erp_px_cat_g1v2 FROM '/Library/PostgreSQL/17/data/PX_CAT_G1V2.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- Optionally, add quality checks (row counts)
    RAISE NOTICE 'Row counts after data load:';
    RAISE NOTICE 'crm_cust_info: %', (SELECT COUNT(*) FROM bronze.crm_cust_info);
    RAISE NOTICE 'crm_prd_info: %', (SELECT COUNT(*) FROM bronze.crm_prd_info);
    RAISE NOTICE 'crm_sales_details: %', (SELECT COUNT(*) FROM bronze.crm_sales_details);
    RAISE NOTICE 'erp_cust_az12: %', (SELECT COUNT(*) FROM bronze.erp_cust_az12);
    RAISE NOTICE 'erp_loc_a101: %', (SELECT COUNT(*) FROM bronze.erp_loc_a101);
    RAISE NOTICE 'erp_px_cat_g1v2: %', (SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2);
END;
$$;

CALL bronze.load_bronze();