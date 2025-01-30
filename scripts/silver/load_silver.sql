-- loading clean, tranform, standardized data of silver.crm_cust_info 
INSERT INTO silver.crm_cust_info (
    cst_id, 
    cst_key, 
    cst_firstname, 
    cst_lastname, 
    cst_marital_status, 
    cst_gndr,
    cst_create_date
)
select 
	cst_id,
	cst_key,
	trim(cst_firstname) as cst_firstname,
	trim(cst_lastname) as cst_lasttname,
		case
			when upper(trim(cst_marital_status)) = 'S' then 'Single'
			when upper(trim(cst_marital_status)) = 'M' then 'Married'
			else 'n/a'
		end as cst_marital_status,
		case
			when upper(trim(cst_gndr)) = 'M' then 'Male'
			when upper(trim(cst_gndr)) = 'F' then 'Female'
			else 'n/a'
		end as cst_gndr,
	cst_create_date

from (
select
*,
row_number() over (partition by cst_id order by cst_create_date desc) as flag_last 
from bronze.crm_cust_info

)t where flag_last = 1; 
-- check data
select * from silver.crm_cust_info;

-- loading clean, tranform, standardized data of silver.crm_prd_info 

insert into silver.crm_prd_info (
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt 
)
select
prd_id,
replace(substring(prd_key, 1, 5), '-','_') as cat_id,
substring(prd_key, 7, length(prd_key))as prd_key,
prd_nm,
coalesce(prd_cost, 0) AS prd_cost,
case
			when upper(trim(prd_line)) = 'R' then 'Road'
			when upper(trim(prd_line)) = 'M' then 'Mountain'
			when upper(trim(prd_line)) = 'S' then 'Other Sales'
			when upper(trim(prd_line)) = 'T' then 'Touring'
			else 'n/a'
		end as prd_line,
cast(prd_start_dt as DATE) as prd_start_dt,
cast(
    lead(prd_start_dt) over (partition by prd_key order by prd_start_dt) - interval '1 day' 
    as DATE
) as prd_end_dt
from bronze.crm_prd_info;
-- check data
select * from silver.crm_prd_info;

-- loading clean, tranform, standardized data of silver.crm_sales_details  

INSERT INTO silver.crm_sales_details (
			sls_ord_num,
			sls_prd_key,
			sls_cust_id,
			sls_order_dt,
			sls_ship_dt,
			sls_due_dt,
			sls_sales,
			sls_quantity,
			sls_price
)
select
sls_ord_num,
sls_prd_key,
sls_cust_id,
case 
    when sls_order_dt = '0' or length(sls_order_dt::TEXT) != 8 then null
    else TO_DATE(sls_order_dt::TEXT, 'YYYYMMDD')
end as sls_order_dt,
case 
    when sls_ship_dt = '0' or length(sls_ship_dt::TEXT) != 8 then null
    else TO_DATE(sls_ship_dt::TEXT, 'YYYYMMDD')
end as sls_ship_dt,
case 
    when sls_due_dt = '0' or length(sls_due_dt::TEXT) != 8 then null
    else TO_DATE(sls_due_dt::TEXT, 'YYYYMMDD')
end as sls_due_dt,
case 
	when sls_sales is null or sls_sales <= 0 or sls_sales != sls_quantity * abs(sls_price) 
	then sls_quantity * abs(sls_price)
	else sls_sales
end as sls_sales,
sls_quantity,
CASE 
	when sls_price is null or sls_price <= 0 
	then sls_sales / nullif(sls_quantity, 0)
	else sls_price  
	end as sls_price

from bronze.crm_sales_details;
-- check data
select * from silver.crm_sales_details;

