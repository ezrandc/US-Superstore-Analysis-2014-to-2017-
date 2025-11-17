# US Superstore Analysis (2014 to 2017)

## Executive Summary

This project analyses the [US Superstore dataset](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/a3e35543be45ae1fe2d59514e8e0e05158215e67/US%20Superstore%20data.csv) (Kaggle) containing four years of transactional sales data (2014–2017) across products, customers, cities, and discount structures. Using PostgreSQL (SQL) for data preparation and Power BI (DirectQuery) for reporting, the goal was to uncover what drives profitability, particularly the impact of discounting behavior, with a simplified model on how changes in pricing strategy could improve performance.

The analysis was driven by four key business questions:

1. Where is the company losing profit?
2. Why are margins particularly low in certain categories and cities?
3. Do discounts actually drive higher sales?
4. What would happen if discounting were capped?

Two interactive dashboard pages were built to answer these questions:

- Page 1: Business Performance Overview
- Page 2: Profit Analysis & Discount Impact

The insights were shaped by an SQL-based Exploratory Data Analysis (EDA), ensuring a rigorous analytical foundation.

## Page 1 – Business Performance Overview

![Page 1 - Business Performance Overview.png](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/cea104daa42ce0ecb36f6de8d4ea245f1e4a1fdb/assets/Page%201%20-%20Business%20Performance%20Overview.png)

This page provides an executive-level snapshot of company performance from 2014–2017. It sets the financial context before diving into profitability drivers.

**1. KPI Cards (Automated with DAX)**

- Revenue (2017): $733.2K
- YoY Growth: +20.4%
- Profit (2017): $93.4K
- Profit Margin: 12.7%
- Customer Retention: 87.5%

These KPIs are dynamically calculated using DAX to always show the latest year.

📌 Insight:
Revenue and profit show strong growth, while retention rates steadily improved from 73.4% to 87.5%, indicating healthier customer loyalty.

**2. Revenue & Profit Trends (2014–2017)**

A column & line combo chart visualizes:

- Revenue rising from $484K to $733K (10.9% 4-year CAGR)
- Margin stabilising around c.13% in the last 3 years, with a slight dip in 2017

📌 Insight:
While revenue scales steadily, margin fluctuations (low in 2014, declining in 2017) reveal underlying pricing and discount challenges uncovered in Page 2.

**3. Customer Retention Rate by Year**

Retention increased from 73.4% to 87.5% over the period.

SQL was modified to ensure retention reflects customers retained into the following year.

📌 Insight:
Steadily rising retention shows the customer base is getting stronger; margin issues are therefore more likely driven by pricing and discounting decisions than by churn.

**4. Top 5 Revenue Cities**

- Top contributors: New York (32%), Seattle (21%), Los Angeles, Philadelphia, San Francisco
- Combined, these cities contribute 25.2% of 2017 revenue, down 6.4% YoY, indicating diversification
- Philadelphia anomaly:
  - 4th highest revenue city in 2017
  - Top loss-making city over 4 years

📌 Insight:
- High sales do not automatically translate to profit.
- Philadelphia likely suffers from heavy discounting, logistics issues, or channel inefficiencies.

**5. Product Category Mix**

A 100% stacked bar chart shows a balanced annual revenue mix:

- Furniture: 30–37%
- Office Supplies: c.33%
- Technology: c.30%

📌 Insight:
Despite stable mix, Furniture significantly underperforms in margin, later confirmed in Page 2 analysis.
