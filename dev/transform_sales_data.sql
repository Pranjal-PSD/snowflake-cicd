-- Transform sales data SQL 
CREATE OR REPLACE TABLE total_sales AS
SELECT 
    product, 
    SUM(amount) AS total_amount
FROM 
    sales_data
GROUP BY 
    product;
