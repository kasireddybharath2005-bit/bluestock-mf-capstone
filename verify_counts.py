import pandas as pd

print("\nCSV COUNTS")
print("-" * 30)

print(
    "dim_fund:",
    len(pd.read_csv("01_fund_master.csv"))
)

print(
    "fact_nav:",
    len(pd.read_csv("data/processed/nav_history_cleaned.csv"))
)

print(
    "fact_transactions:",
    len(pd.read_csv("data/processed/investor_transactions_cleaned.csv"))
)

print(
    "fact_performance:",
    len(pd.read_csv("data/processed/scheme_performance_cleaned.csv"))
)