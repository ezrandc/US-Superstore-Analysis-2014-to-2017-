-- Correlation between sales and weighted average discount
WITH order_summary AS (
    SELECT
        "Order ID",
        SUM("Sales") AS total_sales,
        SUM("Discount" * "Sales") / SUM("Sales") AS weighted_discount
    FROM clean_data
    GROUP BY "Order ID"
)

SELECT
    corr(total_sales, weighted_discount) AS corr_sales_discount
FROM order_summary;
