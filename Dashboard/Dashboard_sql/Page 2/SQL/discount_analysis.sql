-- Discount Bins & Margin Analysis
SELECT
    CASE
        WHEN "Discount" < 0.10 THEN '0–10%'
        WHEN "Discount" < 0.20 THEN '10–20%'
        WHEN "Discount" < 0.30 THEN '20–30%'
        WHEN "Discount" < 0.40 THEN '30–40%'
        WHEN "Discount" < 0.50 THEN '40–50%'
        ELSE '50%+'
    END AS discount_bin,

    ROUND(SUM("Profit")::numeric / NULLIF(SUM("Sales")::numeric, 0), 3) AS avg_margin_pct,
    COUNT(*) AS num_orders,
    ROUND(SUM("Profit")::numeric, 2) AS total_profit,
    ROUND(SUM("Sales")::numeric, 2) AS total_sales

FROM clean_data
GROUP BY discount_bin
ORDER BY discount_bin;
