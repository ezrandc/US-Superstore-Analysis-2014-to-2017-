# Exploratory Data Analysis (EDA) Summary

This EDA was performed using SQL in PostgreSQL to understand data quality, financial trends, customer behavior, and category-level performance before building the final Power BI dashboard.

## 1. Data Quality & Preparation

- Loaded Kaggle’s US Superstore dataset (2014–2017) into PostgreSQL via Python
- Performed:
  - Data type verification
  - Missing value checks
  - Duplicate detection
  - Unique counts (customers, orders, products)
- Standardized the dataset and created a cleaned working table: clean_data, for all subsequent analysis

**Code:**
- [Loading CSV](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/82e6872ed92300f1f5c4497dc1ee0aa91a2b8b64/EDA/EDA_code/Data%20Preparation/load_superstore.py)
- [Sanity checks](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/82e6872ed92300f1f5c4497dc1ee0aa91a2b8b64/EDA/EDA_code/Data%20Preparation/Sanity_checks.sql)
- [Remove duplicates](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/82e6872ed92300f1f5c4497dc1ee0aa91a2b8b64/EDA/EDA_code/Data%20Preparation/Remove%20duplicates.sql)

## 2. Descriptive Financial Summary

### Cumulative summary:
  - Computed total revenue, total profit, average discount, and overall profit margin
  - Derived average order value and customer counts to establish topline metrics

### Time-based analysis:
**- Yearly Trends:**
  - Revenue and customer base grew steadily from 2014 to 2017, aside from a minor dip in 2015
  - Identified that profit margins were highest in 2015 and 2016, when weighted average discounts were the lowest

**- Quarterly & Monthly Trends:**
  - Clear seasonality — Q4 delivered the highest revenue across all years, likely due to holiday demand
  - Opportunity to ramp up inventory, promotions, and marketing from Q3 onwards

**- Customer Retention:**
  - Yearly retention rates improved steadily, showing stronger customer loyalty and repeat purchases

**SQL:**
- [Cumulative summary](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/tree/d7af86a4a79013eff440f25127e4933d77a99842/EDA/EDA_code/Descriptive%20Summary/Cumulative%20Summary)
- [Time-based analysis](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/tree/d7af86a4a79013eff440f25127e4933d77a99842/EDA/EDA_code/Descriptive%20Summary/Time-based%20Analysis)
