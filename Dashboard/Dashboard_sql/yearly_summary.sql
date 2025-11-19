WITH yearly_summary AS (
    SELECT
        EXTRACT(YEAR FROM ("Order Date")::date)::int AS year,
        ROUND(SUM("Sales")::numeric, 2) AS total_revenue,
        ROUND(SUM("Profit")::numeric, 2) AS total_profit,
        ROUND((SUM("Profit") / NULLIF(SUM("Sales"), 0))::numeric, 3) AS profit_margin,
        ROUND(SUM("Discount" * "Sales")::numeric / SUM("Sales")::numeric, 3) AS weighted_discount,
        ROUND((SUM("Sales")::numeric / COUNT(DISTINCT "Order ID")), 2) AS avg_order_value,
        COUNT(DISTINCT "Customer ID") AS num_customers
    FROM clean_data
    GROUP BY EXTRACT(YEAR FROM ("Order Date")::date)
)

SELECT
    year,
    total_revenue,
    total_profit,
    profit_margin,
    weighted_discount,
    avg_order_value,
    num_customers,

    -- Previous year comparisons
    LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue,
    LAG(total_profit)  OVER (ORDER BY year) AS prev_year_profit,

    -- YoY Revenue %
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY year)) /
        NULLIF(LAG(total_revenue) OVER (ORDER BY year), 0),
        3
    ) AS yoy_revenue_pct,

    -- YoY Profit %
    ROUND(
        (total_profit - LAG(total_profit) OVER (ORDER BY year)) /
        NULLIF(LAG(total_profit) OVER (ORDER BY year), 0),
        3
    ) AS yoy_profit_pct

FROM yearly_summary
ORDER BY year;
