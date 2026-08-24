# Power BI Build Guide

## Page 1: Executive Overview
Cards: Revenue, Profit, Margin, Orders, Customers, AOV.
Charts: Monthly revenue line chart; revenue by city; revenue by category.

## Page 2: Customer Analytics
Charts: customer type revenue, repeat customer rate, top customers, city distribution.

## Page 3: Product & Store Performance
Charts: top products by profit, category margin, store ranking, city revenue.

## Page 4: Sales Anomalies
Use `daily_sales_anomalies.csv` to display daily revenue and flag dates where `anomaly = True`.

## Suggested DAX
```DAX
Total Revenue = SUM(fact_sales[revenue])

Total Profit = SUM(fact_sales[profit])

Profit Margin = DIVIDE([Total Profit], [Total Revenue])

Total Orders = DISTINCTCOUNT(fact_sales[order_id])

Average Order Value = DIVIDE([Total Revenue], [Total Orders])
```
