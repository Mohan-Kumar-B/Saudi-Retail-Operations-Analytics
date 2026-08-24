# Saudi Retail Operations Analytics

> End-to-end business analytics portfolio project using realistic Saudi multi-branch retail data.

## Business Problem

A multi-branch retail organization needs reliable reporting across sales, customers, products and stores. Management needs to understand revenue, profitability, customer behavior and branch performance without manually combining inconsistent source files.

This project simulates that workflow from raw operational data to business-ready insights.

## Solution

**Raw CSV → Python data quality pipeline → SQL analytical model → Power BI-ready outputs → Business insights**

### Technology
- Python / Pandas
- SQL (PostgreSQL/Redshift-compatible)
- Power BI
- Excel-compatible CSV outputs
- Git/GitHub

## Data

The synthetic dataset represents a Saudi retail environment with branches across Jeddah, Riyadh, Dammam, Makkah, Madinah, Abha and Khobar.

The repository contains:
- 120,000 unique sales transactions after cleaning
- 6,000 customers
- 180 products
- 14 stores
- 18 months of daily transaction activity

The data is **synthetic** and does not contain Alesayi proprietary information.

## Data Quality

The raw sales data intentionally contains small, realistic quality issues:
- Duplicate order rows
- Missing payment methods
- Invalid discount values
- Inconsistent city formatting

The Python pipeline detects and fixes these before analysis.

## Key Business Questions

1. Which stores and cities generate the most revenue?
2. Which products generate the most profit?
3. Which products have high revenue but weak margins?
4. What is the monthly revenue and profit trend?
5. What percentage of customers are repeat customers?
6. Which customers contribute the most revenue?
7. Which dates show unusual sales activity?
8. How does performance differ by category and store?

## Run the Pipeline

```bash
pip install -r requirements.txt
python python/run_pipeline.py
```

The pipeline writes cleaned and analytical outputs to `data/processed/`.

## SQL Model

The analytical model follows a simple star-schema approach:

```text
dim_customer ──┐
dim_product  ──┼── fact_sales ── dim_store
               │
            order_date
```

## Power BI

Import the files in `data/processed/` into Power BI.

Recommended pages:
1. Executive Overview
2. Customer Analytics
3. Product & Store Performance
4. Sales Anomalies

Recommended KPI cards:
- Total Revenue
- Total Profit
- Profit Margin
- Orders
- Active Customers
- Average Order Value

Recommended slicers:
- Date
- City
- Store
- Category
- Customer Type

## Important Portfolio Note

This project is designed to demonstrate the candidate's ability to move from raw data to validated analysis and business recommendations. All data is synthetic.

## Interview Summary

**60-second explanation:**

"I built an end-to-end retail analytics solution to simulate how a multi-branch organization can turn operational sales and customer data into business insights. I generated realistic Saudi retail data, introduced common data-quality issues, and built a Python/Pandas pipeline to clean and validate the data. I then modeled the data for SQL analysis, including customer, product and store performance, profitability, monthly trends and repeat-customer analysis. Finally, I prepared Power BI-ready outputs for management dashboards. I also added anomaly detection to flag unusual daily sales patterns. The main goal was to demonstrate that I can work from raw data through data quality and analysis to actionable business insights."

## Disclaimer

This is an independent portfolio project. It is not affiliated with, sponsored by, or based on confidential data from Alesayi Holding or any other company.
