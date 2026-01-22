# US Superstore Analysis (2014 to 2017)

## Executive Summary

This project analyses the [US Superstore dataset](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/276695292af4989d3e46eecb36873ca97dc63732/Dataset/US%20Superstore%20data.csv) (Kaggle) containing four years of transactional sales data (2014–2017) across products, customers, cities, and discount structures. Using PostgreSQL (SQL) for data preparation and Power BI (DirectQuery) for reporting, the goal was to uncover what drives profitability, particularly the impact of discounting behavior, with a simplified model on how changes in pricing strategy could improve performance.

The analysis was driven by four key business questions:

1. Where is the company losing profit?
2. Why are margins particularly low in certain categories and cities?
3. Do discounts actually drive higher sales?
4. What would happen if discounting were capped?

A [Power BI dashboard](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/US%20Superstore%20Dashboard.pbix) was built with 2 pages to answer these questions:

| Page 1: Business Performance Overview | Page 2: Profit Analysis & Discount Impact |
| :---: | :---: |
| ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/Page%201%20-%20Business%20Performance%20Overview.png) | ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/639d582777977cf1548eb6ca11fc33a701195259/Dashboard/Images/Dashboard%20-%20Page%202/Page%202%20-%20Profit%20Analysis.png) |

The insights were shaped by an SQL-based [Exploratory Data Analysis (EDA)](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/41020484ab16aa498ebec0a842b0580de9566b68/EDA/EDA.md), ensuring a rigorous analytical foundation.

## Page 1 – Business Performance Overview

Page 1 provides an executive-level snapshot of company performance from 2014–2017. It sets the financial context before diving into profitability drivers.

### 1. KPI Cards (Automated with DAX)

<img 
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/1.%20KPI%20cards.png" 
  width="600">

These KPIs are dynamically calculated using DAX to always show the latest year.

📌 Insight:
Revenue and profit show strong growth, while retention rates steadily improved from 73.4% to 87.5%, indicating healthier customer loyalty, improved post-sales engagement, or enhanced customer value perception

### 2. Revenue & Profit Trends (2014–2017)

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/2.%20Revenue%20%26%20Profit%20Chart.png"
  width="600">

- Revenue rising from $484K to $733K (10.9% 4-year CAGR)
- Margin stabilising around c.13% in the last 3 years, with a slight dip in 2017

📌 Insight:
While revenue scales steadily, margin fluctuations (low in 2014, declining in 2017) reveal underlying pricing and discount challenges uncovered in Page 2.

### 3. Customer Retention Rate by Year

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/3.%20Customer%20Retention%20Chart.png"
  width="600">

Retention increased from 73.4% to 87.5% over the period.

SQL was modified to ensure retention reflects customers retained into the following year.

📌 Insight:
Steadily rising retention shows the customer base is getting stronger; margin issues are therefore more likely driven by pricing and discounting decisions than by churn.

### 4. Top 5 Revenue Cities

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/4.%20Top%205%20Revenue%20by%20City%20in%202017%20Chart.png"
  width="600">

- Top contributors: New York (32%), Seattle (21%), Los Angeles, Philadelphia, San Francisco
- Combined, these cities contribute 25.2% of 2017 revenue, down 6.4% YoY, indicating geographic diversification
- Philadelphia anomaly:
  - 4th highest revenue city in 2017
  - Top loss-making city over 4 years

📌 Insight:
- High sales do not automatically translate to profit.
- Revenue dependence on key cities is decreasing — a sign of successful market expansion, though potential underperformance in major markets should be monitored.
- Philadelphia likely suffers from heavy discounting, logistics issues, or channel inefficiencies.

### 5. Product Category Mix

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/c7a906afcd3d712c8237cd84f062102faa00f8c3/Dashboard/Images/Dashboard%20-%20Page%201/5.%20Product%20Category%20Mix%20Chart.png"
  width="600">

- Revenue mix is well-balanced across all categories (each ~30–37%)
- Furniture share declines from 36% to 29% between 2015–2017
- Balanced mix suggests diversified revenue with no category over-concentration

📌 Insight:
Category mix alone does not fully explain changes in company-wide profitability. Profit drivers are explored in detail on Page 2.

## Page 2 - Profit Analysis

This page answers the core business question:

- What is causing profit erosion?
  - Through segment performance, discount patterns, location losses, and a high-level profit-recovery simulation.

### 1. Where is the company losing profit?
- A combined view of discounts, margins, category & location performance reveals a major source of profit loss: Discounts.

**1.1 Category-Level Underperformance — Furniture**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/1.1%20Product%20Category%20Analysis%20Chart.png"
  width="500">

- Revenue generated by the 3 categories over the 4 years was similar, but Furniture delivered the weakest margins (c.2%)
- Technology & Office Supplies maintained healthy margins (c.17%)

**1.2 Discount Analysis**

Revenue Concentration vs. Margin Erosion by Discount Bin

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/d481d1337d965f87f8e0c9ce11b0be834007dbae/Dashboard/Images/Dashboard%20-%20Page%202/1.2%20Revenue%20%26%20Avg%20Margin%20by%20Discount%20Bin.png"
  width="500">

- Most revenue comes from 0–30% discount bins and margins turn negative beyond 30%
- Indicates that deep discounts eroded gains rather than driving incremental sales

Profit vs. Discounts

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/1.2%20Margin%20%26%20Avg%20Discount%20by%20Year.png"
  width="500">

- 2014 has the highest average discounts, which directly explains the lowest margins (10.2%), when compared to other years
- Profit margins improve through 2015–2016 as discounts normalise
- In 2017, average discounts rise again and margins soften to 12.7%, confirming renewed discount pressure

### 2. Why are margins low?

**2.1 Furniture Drilldown**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/2.1%20Furniture%20Drilldown.png"
  width="500">

- At discounts below 30%, Furniture delivers strong profitability
- Deep discounts (>30%) eliminate ~75% of potential profit and ends with only +18K profit
- This confirms that the category’s underperformance is almost entirely caused by excessive discounting rather than weak unit economics
- Maintaining discounts below 30% would preserve profitability while still supporting competitive pricing, with revenues within the 0-10% discount bin still having the largest proportion

**2.2 Location Analysis**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/239766ef2238d4c4687d1bb5c3befe3968e110c6/Dashboard/Images/Dashboard%20-%20Page%202/2.2%20Location%20Analysis.png"
  width="500">

- 116 cities (c.22%) were loss-making
- Top loss-making cities (Philadelphia - Top 5 revenue overall, Houston, San Antonio):
  - Weighted average discounts are around 30% or more, aligning with excessive discounting patterns
 
### 3. Do discounts drive higher sales?

| Behavioural Analysis |  |
| :---: | :---: |
| ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/3.1%20Orders%20by%20Discount%20Bin.png) | ![](https://github.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/blob/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/3.2%20Revenue%20vs%20Avg%20Discount.png) |

- 84% of orders occur within the 0–30% discount range, where margins remain positive — implying deep discounts are unnecessary for volume generation
- Revenue vs. Average Discount produced a near-zero correlation coefficient (-0.04), indicating no statistically meaningful relationship between discounts and sales performance

### 4. What if we fix it?

**Profit Recovery Simulation**

<img
  src="https://raw.githubusercontent.com/ezrandc/US-Superstore-Analysis-2014-to-2017-/0d667b64ee2d5f1f57c44543fe0ba9e34d990518/Dashboard/Images/Dashboard%20-%20Page%202/4.1%20Profit%20Potential.png"
  width="500">

- A “what-if” SQL model simulated capping discounts at 30% across all orders
- Total profit could increase from $286.4K to $337.7K, (+18%), with overall profit margin improving from 12.5% to 15.0%

**Why this estimate should be considered optimistic:**
- Furniture example:
  - c.26% of all Furniture revenue comes from orders discounted above 30%, meaning a large share of Furniture sales depend on heavy discounting.
  - These discounts may be required to clear:
    - Aged or slow-moving stock
    - Overstock from earlier quarters
    - Seasonal products
    - Damaged/open-box items
  - Reducing these discounts might reduce volume or prevent inventory turnover.
- Profit is net profit, but the dataset does not show how it is derived:
  - The dataset includes final profit per transaction, but does not break down:
    - Product cost (COGS)
    - Shipping / delivery cost
    - Warehousing / handling
    - Marketing or channel fees
    - Operational overhead allocations
  - This means we cannot tell whether high discounts were offset by lower costs, bundled shipments, or operational efficiencies.
- As a result, the simulation is a **high-level financial estimate**, not a full operational margin analysis.
- More detailed data is required to assess feasibility of capping discounts:
    - Inventory ageing and turnover
    - SKU-level cost structures
    - Demand elasticity
    - Logistics cost variation by region
    - Competitive pricing pressures
