-- Remove duplicate rows based on "Order ID", "Product ID", and "Quantity"
-- Keep the first occurrence and remove others
-- Create a new table 'clean_data' without duplicates
CREATE TABLE clean_data AS
SELECT * FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY "Order ID", "Product ID", "Quantity" 
           ORDER BY ("Order ID")) AS rn
    FROM sales
) sub
WHERE rn = 1;