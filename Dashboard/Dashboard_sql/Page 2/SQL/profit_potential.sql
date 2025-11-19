-- High level profit potential, capping discounts at 30% and adding back profits from discounts of >30%
WITH profit_scenarios AS (
    SELECT
        ROUND(SUM("Profit")::numeric, 2) AS actual_profit,
        ROUND(
            SUM(
                "Profit" +
                CASE
                    WHEN "Discount" > 0.3
                        THEN ("Sales" * ("Discount" - 0.3))
                    ELSE 0
                END
            )::numeric,
            2
        ) AS simulated_profit
    FROM clean_data
)

-- Output results as separate scenario rows
SELECT
    'actual_profit' AS scenario,
    actual_profit AS value
FROM profit_scenarios

UNION ALL

SELECT
    'simulated_profit' AS scenario,
    simulated_profit
FROM profit_scenarios

UNION ALL

SELECT
    'potential_gain' AS scenario,
    simulated_profit - actual_profit
FROM profit_scenarios;
