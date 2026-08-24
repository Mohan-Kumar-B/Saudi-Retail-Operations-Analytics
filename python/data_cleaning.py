import pandas as pd
from pathlib import Path

BASE = Path(__file__).resolve().parents[1]
RAW = BASE / "data" / "raw"
OUT = BASE / "data" / "processed"
OUT.mkdir(exist_ok=True)

def clean_sales():
    df = pd.read_csv(RAW / "sales.csv", parse_dates=["order_date"])
    before = len(df)
    df = df.drop_duplicates(subset=["order_id"]).copy()
    df["payment_method"] = df["payment_method"].fillna("Unknown")
    df["discount"] = pd.to_numeric(df["discount"], errors="coerce").fillna(0)
    df.loc[~df["discount"].between(0, 0.50), "discount"] = 0
    df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
    df = df.dropna(subset=["order_id","order_date","customer_id","product_id","store_id"])
    df.to_csv(OUT / "sales_clean.csv", index=False)
    print(f"Sales rows: {before:,} -> {len(df):,}")

def clean_customers():
    df = pd.read_csv(RAW / "customers.csv")
    df = df.drop_duplicates(subset=["customer_id"]).copy()
    df["city"] = df["city"].astype(str).str.strip().str.title()
    df.to_csv(OUT / "customers_clean.csv", index=False)

def clean_reference(name, key):
    df = pd.read_csv(RAW / name)
    df = df.drop_duplicates(subset=[key])
    df.to_csv(OUT / name.replace(".csv","_clean.csv"), index=False)

if __name__ == "__main__":
    clean_sales()
    clean_customers()
    clean_reference("products.csv","product_id")
    clean_reference("stores.csv","store_id")
