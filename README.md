# US Superstore Analysis (2014 to 2017)

## Executive Summary

This project analyses the [US Superstore dataset](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/a3e35543be45ae1fe2d59514e8e0e05158215e67/US%20Superstore%20data.csv) (Kaggle) containing four years of transactional sales data (2014–2017) across products, customers, cities, and discount structures. Using PostgreSQL (SQL) for data preparation and Power BI (DirectQuery) for reporting, the goal was to uncover what drives profitability, particularly the impact of discounting behavior, with a simplified model on how changes in pricing strategy could improve performance.

The analysis was driven by four key business questions:

1. Where is the company losing profit?
2. Why are margins particularly low in certain categories and cities?
3. Do discounts actually drive higher sales?
4. What would happen if discounting were capped?

A [Power BI dashboard](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/08493ab86ffa5732622586be993ad0e718c23b5f/US%20Superstore%20Dashboard.pbix) was built with 2 pages to answer these questions:

| Page 1: Business Performance Overview | Page 2: Profit Analysis & Discount Impact |
| :---: | :---: |
| ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/cea104daa42ce0ecb36f6de8d4ea245f1e4a1fdb/assets/Page%201%20-%20Business%20Performance%20Overview.png) | ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/a8b4f0dcd17de635dffa9bcf4ebf1d8f789097e4/assets/Page%202%20-%20Profit%20Analysis.png) |

The insights were shaped by an SQL-based Exploratory Data Analysis (EDA), ensuring a rigorous analytical foundation.

## Page 1 – Business Performance Overview

Page 1 provides an executive-level snapshot of company performance from 2014–2017. It sets the financial context before diving into profitability drivers.

**1. KPI Cards (Automated with DAX)**

<img 
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/2262f1493cec2695920d35f1fc3bc49605ec266d/assets/1.%20KPI%20cards.png" 
  width="600">

- Revenue (2017): $733.2K
- YoY Growth: +20.4%
- Profit (2017): $93.4K
- Profit Margin: 12.7%
- Customer Retention: 87.5%

These KPIs are dynamically calculated using DAX to always show the latest year.

📌 Insight:
Revenue and profit show strong growth, while retention rates steadily improved from 73.4% to 87.5%, indicating healthier customer loyalty.

**2. Revenue & Profit Trends (2014–2017)**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/2262f1493cec2695920d35f1fc3bc49605ec266d/assets/2.%20Revenue%20%26%20Profit%20Chart.png"
  width="600">

- Revenue rising from $484K to $733K (10.9% 4-year CAGR)
- Margin stabilising around c.13% in the last 3 years, with a slight dip in 2017

📌 Insight:
While revenue scales steadily, margin fluctuations (low in 2014, declining in 2017) reveal underlying pricing and discount challenges uncovered in Page 2.

**3. Customer Retention Rate by Year**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/08493ab86ffa5732622586be993ad0e718c23b5f/assets/3.%20Customer%20Retention%20Chart.png"
  width="600">

Retention increased from 73.4% to 87.5% over the period.

SQL was modified to ensure retention reflects customers retained into the following year.

📌 Insight:
Steadily rising retention shows the customer base is getting stronger; margin issues are therefore more likely driven by pricing and discounting decisions than by churn.

**4. Top 5 Revenue Cities**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/08493ab86ffa5732622586be993ad0e718c23b5f/assets/4.%20Top%205%20Revenue%20by%20City%20in%202017%20Chart.png"
  width="600">

- Top contributors: New York (32%), Seattle (21%), Los Angeles, Philadelphia, San Francisco
- Combined, these cities contribute 25.2% of 2017 revenue, down 6.4% YoY, indicating diversification
- Philadelphia anomaly:
  - 4th highest revenue city in 2017
  - Top loss-making city over 4 years

📌 Insight:
- High sales do not automatically translate to profit.
- Revenue dependence on key cities is decreasing — a sign of successful market expansion, though potential underperformance in major markets should be monitored.
- Philadelphia likely suffers from heavy discounting, logistics issues, or channel inefficiencies.

**5. Product Category Mix**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/08493ab86ffa5732622586be993ad0e718c23b5f/assets/5.%20Product%20Category%20Mix%20Chart.png"
  width="600">

- Revenue mix is well-balanced across all categories (each ~30–37%).
- Furniture share declines from 36% to 29% between 2015–2017.
- Balanced mix suggests diversified revenue with no category over-concentration.
- However, similar revenue shares hide major margin differences, as seen in Page 2 - Company-wide margins improve as Furniture’s share decreases, hinting at structural unprofitability.

📌 Insight:
A stable category mix hides profitability issues — Furniture’s shrinking share aligns with rising profit margins, signalling it as the weakest category despite similar revenue contribution.
