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
- [Data preparation](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/tree/0e85be06299e6fc4f4d1741c11edf33f34147735/EDA/EDA_code/Data%20Preparation)

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

## 3. Category Analysis

- Furniture consistently underperformed in profit margin
- Office Supplies and Technology delivered stable or improving margins
- In 2015, Furniture's revenue share increased but overall profit margin still rose — driven by strong performance in the other two categories

**SQL:**
- [Category analysis](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/tree/bfead36a65b0f2468fa7178d159fcfa5d9030ab9/EDA/EDA_code/Category%20Analysis)
