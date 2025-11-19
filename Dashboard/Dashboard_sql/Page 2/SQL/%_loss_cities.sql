-- Proportion of cities that are loss making
WITH loss_making_cities AS (
    SELECT
        "City",
        ROUND(SUM("Sales")::numeric, 2) AS total_rev,
        ROUND(SUM("Profit")::numeric, 2) AS total_profit,
        ROUND((SUM("Profit") / SUM("Sales"))::numeric, 2) AS profit_margin,
        ROUND(AVG("Discount")::numeric, 2) AS avg_discount
    FROM clean_data
    GROUP BY "City"
    HAVING SUM("Profit") < 0
),

total_cities AS (
    SELECT
        COUNT(DISTINCT "City") AS num_cities
    FROM clean_data
)

SELECT
    (SELECT COUNT(*) FROM loss_making_cities) AS loss_making_cities,
    TC.num_cities AS total_cities,
    ROUND(
        (SELECT COUNT(*) FROM loss_making_cities)::numeric / TC.num_cities,
        2
    ) AS perc_loss_making_cities
FROM total_cities TC;
