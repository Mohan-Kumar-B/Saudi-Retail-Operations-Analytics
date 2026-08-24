import pandas as pd
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]
DATA = BASE / "data" / "processed"
OUT = BASE / "data" / "processed"

sales = pd.read_csv(DATA / "sales_clean.csv", parse_dates=["order_date"])
products = pd.read_csv(DATA / "products_clean.csv")
stores = pd.read_csv(DATA / "stores_clean.csv")
customers = pd.read_csv(DATA / "customers_clean.csv")

df = sales.merge(products, on="product_id").merge(stores, on="store_id").merge(customers, on="customer_id", suffixes=("","_customer"))

df["month"] = df["order_date"].dt.to_period("M").astype(str)

monthly = df.groupby("month", as_index=False).agg(
    revenue=("revenue","sum"), profit=("profit","sum"), orders=("order_id","nunique")
)
monthly.to_csv(OUT/"monthly_kpis.csv", index=False)

store_perf = df.groupby(["store_id","store_name","city"], as_index=False).agg(
    revenue=("revenue","sum"), profit=("profit","sum"), orders=("order_id","nunique")
)
store_perf["profit_margin"] = (store_perf["profit"]/store_perf["revenue"]).round(4)
store_perf.to_csv(OUT/"store_performance.csv", index=False)

product_perf = df.groupby(["product_id","product_name","category"], as_index=False).agg(
    revenue=("revenue","sum"), profit=("profit","sum"), units=("quantity","sum")
)
product_perf["profit_margin"] = (product_perf["profit"]/product_perf["revenue"]).round(4)
product_perf.to_csv(OUT/"product_performance.csv", index=False)

customer_perf = df.groupby(["customer_id","customer_type","city_customer"], as_index=False).agg(
    revenue=("revenue","sum"), orders=("order_id","nunique")
).rename(columns={"city_customer":"city"})
customer_perf["avg_order_value"] = (customer_perf["revenue"]/customer_perf["orders"]).round(2)
customer_perf.to_csv(OUT/"customer_performance.csv", index=False)

# Simple IQR-based daily anomaly flag
daily = df.groupby("order_date", as_index=False)["revenue"].sum()
q1, q3 = daily["revenue"].quantile([.25,.75])
iqr = q3-q1
daily["anomaly"] = (daily["revenue"] < q1-1.5*iqr) | (daily["revenue"] > q3+1.5*iqr)
daily.to_csv(OUT/"daily_sales_anomalies.csv", index=False)

print("Analysis outputs created.")
