# Saudi Retail Operations Analytics

> **End-to-end retail analytics project built to demonstrate how raw operational data can be transformed into reliable business insights using Python, SQL and Power BI.**

## 📊 Project Overview

Retail organizations generate large amounts of transactional data across stores, customers and products. The challenge is not simply collecting the data, but turning it into information that management can use to understand performance and make better decisions.

This project simulates that environment for a **multi-branch Saudi retail business**.

The objective is to build a complete analytics workflow that starts with raw transactional data and ends with an interactive Power BI dashboard for monitoring:

* Sales performance
* Profitability
* Customer activity
* Product/category performance
* Store and city performance
* Monthly sales trends
* Potential sales anomalies

The dataset is **fully synthetic** and created for portfolio purposes. It does not contain proprietary or confidential company data.

---

## 🎯 Business Objective

The project is designed around questions a retail management team may ask:

> Which cities and stores generate the most revenue?

> Which products and categories generate the most profit?

> Which products have high sales but weak profitability?

> How is revenue changing over time?

> How many customers are actively purchasing?

> How much revenue comes from repeat customers?

> Are there unusual sales patterns that require investigation?

The goal is to move from **transaction-level data to decision-ready information**.

---

## 🔄 End-to-End Workflow

```text
Raw CSV Data
     │
     ▼
Python / Pandas
Data Cleaning & Validation
     │
     ▼
Processed Data
     │
     ├──────────────► SQL Analysis
     │                 KPIs / Trends / Rankings
     │
     ▼
Power BI Data Model
Star Schema
     │
     ▼
DAX Measures
     │
     ▼
Interactive Power BI Dashboard
     │
     ▼
Business Insights
```

### Why these tools?

**Python / Pandas**
Used for data preparation, cleaning and validation.

**SQL**
Used for analytical queries such as aggregations, joins, rankings, profitability analysis and trend analysis.

**Power BI**
Used to build the analytical data model, DAX measures, interactive filters and management dashboards.

---

# 🗂️ Dataset

The project contains synthetic data representing a multi-branch Saudi retail environment.

| Dataset                 | Description                                      |
| ----------------------- | ------------------------------------------------ |
| `sales_clean`           | Transaction-level sales data                     |
| `customers_clean`       | Customer information and segments                |
| `products_clean`        | Product, category, brand and pricing information |
| `stores_clean`          | Store, city, region and store type information   |
| `daily_sales_anomalies` | Daily revenue and anomaly flags                  |

### Dataset size

* **120,000** unique sales transactions after cleaning
* **6,000** customers
* **180** products
* **14** stores
* **18 months** of transaction activity
* Saudi cities including Jeddah, Riyadh, Dammam, Makkah, Madinah, Abha and Khobar

---

# 🧹 Data Cleaning & Quality

The raw data intentionally includes several common data-quality problems so that the project represents a more realistic analytics workflow.

Examples include:

* Duplicate transaction rows
* Missing payment methods
* Invalid discount values
* Inconsistent city formatting
* Referential integrity issues

Python/Pandas is used to clean and standardize the data before analysis.

### Examples of validation rules

* `order_id` must be unique
* Transaction dates must be valid
* Discounts must fall within an acceptable business range
* Revenue should not be negative
* Customer IDs must exist in the customer dataset
* Product IDs must exist in the product dataset
* Store IDs must exist in the store dataset

The objective is to make sure the dashboard is based on **validated and consistent data**, rather than simply producing attractive charts from unverified input.

---

# 🐍 Python Data Pipeline

The Python layer performs:

1. Data ingestion
2. Duplicate removal
3. Missing-value handling
4. Data standardization
5. Business-rule validation
6. Referential integrity checks
7. Analytical output generation

Main scripts:

```text
python/
├── data_cleaning.py
├── data_validation.py
├── analysis.py
└── run_pipeline.py
```

Run the pipeline with:

```bash
pip install -r requirements.txt
python python/run_pipeline.py
```

Cleaned and analytical outputs are written to:

```text
data/processed/
```

---

# 🧮 SQL Analytical Layer

The SQL layer demonstrates how the cleaned data can be analyzed using a warehouse-style relational model.

The project includes queries for:

### Executive KPIs

* Total revenue
* Total profit
* Total orders
* Monthly performance

### Customer analytics

* Customer revenue ranking
* Repeat-customer analysis
* Average order value

### Product analytics

* Product profitability
* Category performance
* High-revenue / low-margin products

### Store analytics

* Store ranking
* City performance

### Advanced analysis

* Common Table Expressions (CTEs)
* Window functions
* Month-over-month growth
* Cumulative revenue / Pareto-style analysis

SQL files:

```text
sql/
├── schema.sql
├── kpi_analysis.sql
├── customer_analysis.sql
├── product_analysis.sql
├── store_analysis.sql
└── advanced_analysis.sql
```

---

# 🏗️ Data Model

The analytical model follows a simple **star-schema design**.

```text
                  ┌──────────────┐
                  │  DateTable   │
                  └──────┬───────┘
                         │
                         ▼
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│ dim_customer │──►│  fact_sales  │◄──│  dim_product │
└──────────────┘   └──────┬───────┘   └──────────────┘
                          ▲
                          │
                   ┌──────┴──────┐
                   │  dim_store  │
                   └─────────────┘
```

`fact_sales` is the central transaction table.

The dimension tables provide descriptive context for:

* Customers
* Products
* Stores
* Dates

This structure allows the same sales measures to be analyzed from different business perspectives.

---

# 📈 Power BI Dashboard

The Power BI layer converts the validated data into an interactive management dashboard.

## Executive Overview

The first completed dashboard page provides:

### KPI cards

* Total Revenue
* Total Profit
* Total Orders
* Active Customers
* Average Order Value
* Profit Margin

### Visual analysis

* Monthly Revenue Trend
* Revenue by Category
* Revenue by City

### Interactive filters

* Date Range
* City
* Product Category

These filters dynamically update the dashboard so users can investigate a specific period, market or product category.

---

## 📷 Dashboard Preview

![Executive Overview](screenshots/executive-overview.png)

> **Current status:** Executive Overview completed. Additional customer, product/store and anomaly-analysis pages are planned as the project continues.

---

# 💡 Example Business Insights

The dashboard is designed to help answer questions such as:

* Which market contributes the highest revenue?
* Which product category drives the most sales?
* Is revenue growing or declining over time?
* Which products generate revenue but relatively weak margins?
* How important are repeat customers to overall revenue?
* Which stores may require additional investigation?

The final recommendations are based on the actual analytical results produced by the project rather than predefined assumptions.

---

# 🛠️ Technology Stack

| Area               | Technology      |
| ------------------ | --------------- |
| Data Generation    | Python          |
| Data Cleaning      | Python / Pandas |
| Data Validation    | Python          |
| Analytical Queries | SQL             |
| Data Modeling      | Power BI        |
| Calculations       | DAX             |
| Visualization      | Power BI        |
| Version Control    | Git / GitHub    |

---

# 📁 Repository Structure

```text
Saudi-Retail-Operations-Analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── python/
│   ├── data_cleaning.py
│   ├── data_validation.py
│   ├── analysis.py
│   └── run_pipeline.py
│
├── sql/
│   ├── schema.sql
│   ├── kpi_analysis.sql
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   ├── store_analysis.sql
│   └── advanced_analysis.sql
│
├── powerbi/
│   ├── DAX_Measures.dax
│   └── POWER_BI_BUILD_CHECKLIST.md
│
├── docs/
│   ├── business_questions.md
│   ├── data_dictionary.md
│   └── project_architecture.md
│
├── screenshots/
│   └── executive-overview.png
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

# 🚀 Future Improvements

The project is intentionally being developed in stages.

Planned extensions include:

* Customer Analytics dashboard
* Product & Store Performance dashboard
* Sales anomaly investigation
* Deeper profitability analysis
* Additional customer segmentation
* Automated data refresh
* Cloud-based data pipeline
* AWS-based data lake / ETL architecture

The longer-term goal is to extend the project from a business analytics solution toward a **cloud data engineering architecture**.

---

# 📌 Project Status

### ✅ Completed

* Synthetic Saudi retail dataset
* Data cleaning pipeline
* Data-quality validation
* SQL analytical queries
* Star-schema Power BI model
* DAX KPI measures
* Executive Overview dashboard
* Interactive date, city and category filters

### 🔄 In Progress

* Customer Analytics
* Product & Store Performance
* Sales anomaly analysis
* Business insight documentation

---

# ⚠️ Disclaimer

This is an **independent portfolio project** created for learning and demonstration purposes.

All business data is synthetic. The project is **not affiliated with, sponsored by, or based on confidential data from any company**.
