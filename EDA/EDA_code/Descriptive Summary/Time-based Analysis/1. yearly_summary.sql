-- Yearly Analysis - Summary
SELECT
    EXTRACT(YEAR FROM ("Order Date")::date) AS Year,
    ROUND(SUM("Sales")::numeric, 2) AS Total_revenue,
    ROUND(SUM("Profit")::numeric, 2) AS Total_profit,
    ROUND((SUM("Profit")/NULLIF(SUM("Sales"), 0))::numeric * 100, 2) AS Profit_margin_percentage,
    ROUND(SUM("Discount" * "Sales")::numeric / SUM("Sales")::numeric * 100, 2) AS weighted_discount_percentage,
    ROUND((SUM("Sales"))::numeric/COUNT(DISTINCT "Order ID"), 2) AS Avg_order_value,
    COUNT(DISTINCT "Customer ID") AS Num_customers
FROM clean_data
GROUP BY Year;

-- Profit margins were higher in 2015 & 2016, when weighted average discounts were the lowest

-- Y-o-Y Growth of revenue and customers
WITH Yearly_Summary AS (
    SELECT
        EXTRACT(YEAR FROM ("Order Date")::date) AS Year,
        ROUND(SUM("Sales")::numeric, 2) AS Total_revenue,
        COUNT(DISTINCT "Customer ID") AS Num_customers
    FROM clean_data
    GROUP BY Year
)
SELECT
    Year,
    Total_revenue,
    ROUND(((Total_revenue - LAG(Total_revenue) OVER (ORDER BY Year)) / NULLIF(LAG(Total_revenue) OVER (ORDER BY Year), 0)) * 100, 2) AS Revenue_growth_percentage,
    Num_customers,
    ROUND(((Num_customers::numeric - LAG(Num_customers) OVER (ORDER BY Year)) / NULLIF(LAG(Num_customers) OVER (ORDER BY Year)::numeric, 0)) * 100, 2) AS Customer_growth_percentage
FROM Yearly_Summary
ORDER BY Year;

-- Apart from a slight decline in 2015, Y-o-Y growth shows steady increase in both revenue and customer base