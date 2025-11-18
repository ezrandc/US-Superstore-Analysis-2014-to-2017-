CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Pivot table to show category revenue mix over the years
SELECT *
FROM crosstab (
  $$
  SELECT
      "Category",
      EXTRACT(YEAR FROM ("Order Date")::date)::int AS year,
      ROUND(((SUM("Sales")::numeric) / SUM((SUM("Sales")::numeric)) OVER (PARTITION BY EXTRACT(YEAR FROM ("Order Date")::date))) * 100, 2) AS Revenue_mix
  FROM clean_data
  GROUP BY "Category", EXTRACT(YEAR FROM ("Order Date")::date)
  ORDER BY "Category", EXTRACT(YEAR FROM ("Order Date")::date)
  $$
) AS ct("Category" text, "2014" numeric, "2015" numeric, "2016" numeric, "2017" numeric);

-- Pivot table to show profit margins by category over the years
SELECT *
FROM crosstab(
  $$
  SELECT
      "Category",
      EXTRACT(YEAR FROM ("Order Date")::date)::int AS year,
      ROUND((SUM("Profit") / SUM("Sales"))::numeric * 100, 2) AS profit_margin
  FROM clean_data
  GROUP BY "Category", year
  ORDER BY "Category", year
  $$
) AS ct("Category" text, "2014" numeric, "2015" numeric, "2016" numeric, "2017" numeric);

-- Overall profit margins increased from 2014 to 2016
  -- Furniture margins are the lowest but revenue mix for furniture increased in 2015 which should have led to lower overall profit margins, 
  -- However, overall profit margins increased in 2015 and 2016 due to improved margins for office supplies and technology
-- Focus on Office Supplies and Technology goods and discontinue the Furniture stream?