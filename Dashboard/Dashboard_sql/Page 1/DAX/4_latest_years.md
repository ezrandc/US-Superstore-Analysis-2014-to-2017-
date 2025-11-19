### Filter - 4 Latest Years
**Purpose: Filter to add to charts to show values for the latest 4 years available**
- Set filter to "is 1"
```
IsLatest4Years = 
VAR MaxYear =
    CALCULATE(
        MAX('yearly_summary'[year]),
        ALL('yearly_summary')
    )
VAR CurrYear =
    MAX('yearly_summary'[year])
RETURN
    IF(CurrYear >= MaxYear - 3, 1, 0)
```
