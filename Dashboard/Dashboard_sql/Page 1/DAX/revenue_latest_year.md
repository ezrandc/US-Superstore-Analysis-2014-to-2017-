### Latest Year's Revenue DAX
**Purpose: Measure to show revenue from latest year available**
```
Revenue Latest Year = 
VAR latest_year = CALCULATE(MAX('yearly_summary'[year]), ALL('yearly_summary'))
RETURN
CALCULATE(
    SUM('yearly_summary'[total_revenue]),
    'yearly_summary'[year] = latest_year,
    REMOVEFILTERS('yearly_summary'[year])
)
```
