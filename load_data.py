import pandas as pd
from sqlalchemy import create_engine

# Connect to SQLite Database
engine = create_engine("sqlite:///bluestock_mf.db")

# Read Cleaned CSV Files
fund_df = pd.read_csv("data/raw/01_fund_master.csv")

nav_df = pd.read_csv(
    "data/processed/nav_history_cleaned.csv"
)

txn_df = pd.read_csv(
    "data/processed/investor_transactions_cleaned.csv"
)

perf_df = pd.read_csv(
    "data/processed/scheme_performance_cleaned.csv"
)

# Load into SQLite Tables
fund_df.to_sql(
    "dim_fund",
    engine,
    if_exists="append",
    index=False
)

nav_df.to_sql(
    "fact_nav",
    engine,
    if_exists="append",
    index=False
)

txn_df.to_sql(
    "fact_transactions",
    engine,
    if_exists="append",
    index=False
)

perf_df.to_sql(
    "fact_performance",
    engine,
    if_exists="append",
    index=False
)

print("Data Loaded Successfully!")