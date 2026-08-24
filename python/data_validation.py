import pandas as pd
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]
DATA = BASE / "data" / "processed"

def run_checks():
    sales = pd.read_csv(DATA / "sales_clean.csv")
    customers = pd.read_csv(DATA / "customers_clean.csv")
    products = pd.read_csv(DATA / "products_clean.csv")
    stores = pd.read_csv(DATA / "stores_clean.csv")

    checks = {
        "duplicate_order_ids": sales["order_id"].duplicated().sum(),
        "null_order_ids": sales["order_id"].isna().sum(),
        "invalid_discount": (~sales["discount"].between(0, .50)).sum(),
        "negative_revenue": (sales["revenue"] < 0).sum(),
        "orphan_customers": (~sales["customer_id"].isin(customers["customer_id"])).sum(),
        "orphan_products": (~sales["product_id"].isin(products["product_id"])).sum(),
        "orphan_stores": (~sales["store_id"].isin(stores["store_id"])).sum(),
    }
    for name, value in checks.items():
        status = "PASS" if value == 0 else "FAIL"
        print(f"{status:4} | {name:22} | {value}")
    if any(v != 0 for v in checks.values()):
        raise SystemExit("Data validation failed.")

if __name__ == "__main__":
    run_checks()
