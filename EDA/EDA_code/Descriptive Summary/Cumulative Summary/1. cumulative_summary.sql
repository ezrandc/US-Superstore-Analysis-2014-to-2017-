-- Summary of financials cumulatively over the 4 years
SELECT 
    ROUND(SUM("Sales")::numeric, 2) AS Total_revenue,
    ROUND(((AVG("Discount")) * 100)::numeric, 2) AS Avg_discount_perc,
    ROUND(SUM("Profit")::numeric, 2) AS Total_profit,
    ROUND(((SUM("Profit")/SUM("Sales")) * 100)::numeric, 2) AS Profit_margin_perc,
    ROUND(SUM("Sales")::numeric/COUNT(DISTINCT "Order ID"), 2) AS Avg_order_value
FROM clean_data;