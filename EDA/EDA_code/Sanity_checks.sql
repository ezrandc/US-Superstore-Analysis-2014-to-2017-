--Row count
SELECT COUNT(*) FROM sales;

--Check for missing values in important columns
SELECT
    SUM(CASE WHEN "Sales" IS NULL THEN 1 ELSE 0 END) AS missing_sales_count,
    SUM(CASE WHEN "Profit" IS NULL THEN 1 ELSE 0 END) AS missing_profit_count
FROM sales;

--No of unique customers and products
SELECT
    COUNT(DISTINCT "Customer ID") AS unique_customers,
    COUNT(DISTINCT "Product ID") AS unique_products
FROM sales;

--Check for potential duplicate orders
SELECT "Order ID", "Product ID", "Quantity"
FROM sales
GROUP BY "Order ID", "Product ID", "Quantity"
HAVING COUNT(*) > 1;

--Double check if rows are actual duplicates
SELECT * FROM sales
WHERE ("Order ID", "Product ID", "Quantity") IN (
    SELECT "Order ID", "Product ID", "Quantity"
    FROM sales
    GROUP BY "Order ID", "Product ID", "Quantity"
    HAVING COUNT(*) > 1
); --returns 1 row with exact same values across all columns, high probability of being a true duplicate