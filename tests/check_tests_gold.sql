-- ====================================================================
-- Checking for Duplicate Customer Keys in gold.dim_customers
-- Expectation: No results
-- ====================================================================
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results
-- ====================================================================
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking Data Model Connectivity in gold.fact_sales
-- Expectation: No orphan records (No results)
-- ====================================================================
SELECT f.* 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL;
