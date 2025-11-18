-- Monthly Sales Analysis - Summary
SELECT
    TO_CHAR(TO_DATE(EXTRACT(MONTH FROM ("Order Date")::date)::text, 'MM'), 'Month') AS month,
    ROUND(SUM("Sales")::numeric, 2) AS total_revenue,
    ROUND(SUM("Profit")::numeric, 2) AS total_profit,
    ROUND((SUM("Profit") / NULLIF(SUM("Sales"), 0))::numeric * 100, 2) AS profit_margin_percentage,
    ROUND(SUM("Discount" * "Sales")::numeric / SUM("Sales")::numeric * 100, 2) AS weighted_discount_percentage,
    ROUND((SUM("Sales") / COUNT(DISTINCT "Order ID"))::numeric, 2) AS avg_order_value,
    COUNT(DISTINCT "Customer ID") AS num_customers
FROM clean_data
GROUP BY EXTRACT(MONTH FROM ("Order Date")::date)
ORDER BY EXTRACT(MONTH FROM ("Order Date")::date);

-- On the surface, it seems that revenue is more in the 2nd half of the year
-- Check quarterly sales per year to confirm seasonality

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab(
  $$
  SELECT
      CONCAT('Q', EXTRACT(QUARTER FROM ("Order Date")::date)::int) AS quarter_label,
      EXTRACT(YEAR FROM ("Order Date")::date)::int AS year_num,
      ROUND(SUM("Sales")::numeric, 2) AS quarterly_revenue
  FROM clean_data
  GROUP BY year_num, quarter_label
  ORDER BY quarter_label, year_num
  $$
) AS ct(
    quarter_label text,
    "2014" numeric,
    "2015" numeric,
    "2016" numeric,
    "2017" numeric
);

-- Clear trend of revenue increasing from Q1 to Q4 across all years
-- Likely due to holiday season in Q4
-- Business should consider ramping up marketing and inventory in Q3 and Q4 to capitalise on higher demand
