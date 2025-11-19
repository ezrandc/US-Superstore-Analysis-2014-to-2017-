--Yearly Category Revenue Mix
SELECT
    "Category",
    EXTRACT(YEAR FROM ("Order Date")::date)::int AS year,
    ROUND(
        (SUM("Sales")::numeric) /
        SUM(SUM("Sales")::numeric) OVER (
            PARTITION BY EXTRACT(YEAR FROM ("Order Date")::date)) * 100,
        2) AS revenue_mix
FROM clean_data
GROUP BY
    "Category",
    EXTRACT(YEAR FROM ("Order Date")::date)
ORDER BY
    "Category",
    EXTRACT(YEAR FROM ("Order Date")::date);
