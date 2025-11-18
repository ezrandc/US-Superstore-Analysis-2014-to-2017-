-- Yearly Retention Rate Calculation
WITH user_yearly_activity AS (
    SELECT DISTINCT
        "Customer ID",
        EXTRACT(YEAR FROM ("Order Date")::date)::INT AS Year
    FROM clean_data
)
SELECT
    previous.Year AS Year,
    ROUND(
        COUNT(DISTINCT current."Customer ID")::numeric
        / GREATEST(COUNT(DISTINCT previous."Customer ID")::numeric, 1) * 100, 1
    ) AS Retention_rate
FROM user_yearly_activity AS previous
LEFT JOIN user_yearly_activity AS current
    ON previous."Customer ID" = current."Customer ID"
    AND current.Year = previous.Year + 1
GROUP BY previous.Year
ORDER BY previous.Year;

-- Retention rates are increasing over the years
    -- Indicates improving customer loyalty and satisfaction