### City Yoy Change DAX
**Purpose: Measure to show YoY change of latest year's contribution from Top 5 cities vs previous year**
```
YoY Change = 
VAR latest_year =
    CALCULATE(
        MAX('city_revenue'[Year]),
        REMOVEFILTERS('city_revenue')
    )
VAR prev_year = latest_year - 1

-- Top 5 contribution (latest year)
VAR top5_latest =
    DIVIDE(
        CALCULATE(
            SUM('city_revenue'[Total_rev]),
            TOPN(
                5,
                FILTER('city_revenue', 'city_revenue'[Year] = latest_year),
                'city_revenue'[Total_rev],
                DESC
            )
        ),
        CALCULATE(
            SUM('city_revenue'[Total_rev]),
            FILTER(ALL('city_revenue'), 'city_revenue'[Year] = latest_year)
        )
    )

-- Top 5 contribution (previous year)
VAR top5_prev =
    DIVIDE(
        CALCULATE(
            SUM('city_revenue'[Total_rev]),
            TOPN(
                5,
                FILTER('city_revenue', 'city_revenue'[Year] = prev_year),
                'city_revenue'[Total_rev],
                DESC
            )
        ),
        CALCULATE(
            SUM('city_revenue'[Total_rev]),
            FILTER(ALL('city_revenue'), 'city_revenue'[Year] = prev_year)
        )
    )

RETURN
FORMAT(top5_latest - top5_prev, "+0.0%;-0.0%;0.0%")
```
