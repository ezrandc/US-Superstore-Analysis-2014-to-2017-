-- Yearly Retention Rate Calculation
WITH user_yearly_activity AS (
    SELECT DISTINCT
        "Customer ID",
        EXTRACT(YEAR FROM ("Order Date")::date)::int AS year
    FROM clean_data
)

SELECT
    previous.year + 1 AS year,
    ROUND(
        COUNT(DISTINCT current."Customer ID")::numeric
        / GREATEST(COUNT(DISTINCT previous."Customer ID")::numeric, 1),
        3
    ) AS retention_rate
FROM user_yearly_activity AS previous
LEFT JOIN user_yearly_activity AS current
    ON previous."Customer ID" = current."Customer ID"
   AND current.year = previous.year + 1
GROUP BY previous.year
HAVING COUNT(DISTINCT current."Customer ID") > 0
ORDER BY year;
