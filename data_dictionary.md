# Data Dictionary

## Bluestock Mutual Fund Capstone

---

# 01_fund_master.csv

| Column Name  | Data Type | Description                                       | Source          |
| ------------ | --------- | ------------------------------------------------- | --------------- |
| amfi_code    | INTEGER   | Unique AMFI identifier for the mutual fund scheme | fund_master.csv |
| scheme_name  | TEXT      | Name of the mutual fund scheme                    | fund_master.csv |
| fund_house   | TEXT      | Asset Management Company (AMC) name               | fund_master.csv |
| category     | TEXT      | Fund category (Equity, Debt, Hybrid, etc.)        | fund_master.csv |
| sub_category | TEXT      | Detailed category classification                  | fund_master.csv |
| plan_type    | TEXT      | Direct or Regular Plan                            | fund_master.csv |
| benchmark    | TEXT      | Benchmark index used for comparison               | fund_master.csv |
| fund_manager | TEXT      | Fund manager name                                 | fund_master.csv |
| launch_date  | DATE      | Scheme launch date                                | fund_master.csv |

---

# 02_nav_history.csv

| Column Name | Data Type | Description              | Source          |
| ----------- | --------- | ------------------------ | --------------- |
| amfi_code   | INTEGER   | Mutual fund identifier   | nav_history.csv |
| date        | DATE      | NAV date                 | nav_history.csv |
| nav         | REAL      | Net Asset Value per unit | nav_history.csv |

---

# 03_aum_by_fund_house.csv

| Column Name | Data Type | Description                        | Source                |
| ----------- | --------- | ---------------------------------- | --------------------- |
| fund_house  | TEXT      | Fund house name                    | aum_by_fund_house.csv |
| aum_crore   | REAL      | Assets Under Management (₹ Crores) | aum_by_fund_house.csv |
| num_schemes | INTEGER   | Number of schemes managed          | aum_by_fund_house.csv |

---

# 04_monthly_sip_inflows.csv

| Column Name      | Data Type | Description                   | Source                  |
| ---------------- | --------- | ----------------------------- | ----------------------- |
| month            | TEXT      | Reporting month               | monthly_sip_inflows.csv |
| sip_inflow_crore | REAL      | SIP inflow amount in ₹ Crores | monthly_sip_inflows.csv |

---

# 05_category_inflows.csv

| Column Name  | Data Type | Description                   | Source               |
| ------------ | --------- | ----------------------------- | -------------------- |
| category     | TEXT      | Mutual fund category          | category_inflows.csv |
| inflow_crore | REAL      | Net inflow amount in ₹ Crores | category_inflows.csv |
| month        | TEXT      | Reporting month               | category_inflows.csv |

---

# 06_industry_folio_count.csv

| Column Name | Data Type | Description               | Source                   |
| ----------- | --------- | ------------------------- | ------------------------ |
| month       | TEXT      | Reporting month           | industry_folio_count.csv |
| folio_count | INTEGER   | Number of investor folios | industry_folio_count.csv |

---

# 07_scheme_performance.csv

| Column Name       | Data Type | Description                             | Source                 |
| ----------------- | --------- | --------------------------------------- | ---------------------- |
| amfi_code         | INTEGER   | Mutual fund identifier                  | scheme_performance.csv |
| return_1yr_pct    | REAL      | One-year return percentage              | scheme_performance.csv |
| return_3yr_pct    | REAL      | Three-year annualized return percentage | scheme_performance.csv |
| return_5yr_pct    | REAL      | Five-year annualized return percentage  | scheme_performance.csv |
| alpha             | REAL      | Alpha performance metric                | scheme_performance.csv |
| beta              | REAL      | Beta risk metric                        | scheme_performance.csv |
| sharpe_ratio      | REAL      | Risk-adjusted return measure            | scheme_performance.csv |
| expense_ratio_pct | REAL      | Fund expense ratio (%)                  | scheme_performance.csv |
| aum_crore         | REAL      | Assets Under Management (₹ Crores)      | scheme_performance.csv |

---

# 08_investor_transactions.csv

| Column Name      | Data Type | Description               | Source                    |
| ---------------- | --------- | ------------------------- | ------------------------- |
| transaction_id   | INTEGER   | Unique transaction ID     | investor_transactions.csv |
| investor_id      | INTEGER   | Unique investor ID        | investor_transactions.csv |
| amfi_code        | INTEGER   | Mutual fund identifier    | investor_transactions.csv |
| transaction_date | DATE      | Transaction date          | investor_transactions.csv |
| transaction_type | TEXT      | SIP, Lumpsum, Redemption  | investor_transactions.csv |
| amount_inr       | REAL      | Transaction amount in INR | investor_transactions.csv |
| units            | REAL      | Units purchased/redeemed  | investor_transactions.csv |
| city             | TEXT      | Investor city             | investor_transactions.csv |
| state            | TEXT      | Investor state            | investor_transactions.csv |
| kyc_status       | TEXT      | KYC Verification Status   | investor_transactions.csv |

---

# 09_portfolio_holdings.csv

| Column Name   | Data Type | Description                     | Source                 |
| ------------- | --------- | ------------------------------- | ---------------------- |
| amfi_code     | INTEGER   | Mutual fund identifier          | portfolio_holdings.csv |
| security_name | TEXT      | Security/Stock name             | portfolio_holdings.csv |
| sector        | TEXT      | Industry sector                 | portfolio_holdings.csv |
| weight_pct    | REAL      | Portfolio allocation percentage | portfolio_holdings.csv |

---

# 10_benchmark_indices.csv

| Column Name | Data Type | Description          | Source                |
| ----------- | --------- | -------------------- | --------------------- |
| date        | DATE      | Trading date         | benchmark_indices.csv |
| index_name  | TEXT      | Benchmark index name | benchmark_indices.csv |
| index_value | REAL      | Closing index value  | benchmark_indices.csv |

---

# Database Tables

## Dimension Tables

* dim_fund
* dim_date

## Fact Tables

* fact_nav
* fact_transactions
* fact_performance
* fact_aum

---

# Data Quality Checks Performed

1. Converted date columns to datetime format.
2. Removed duplicate records.
3. Validated NAV values > 0.
4. Validated transaction amounts > 0.
5. Standardized transaction types.
6. Verified KYC status values.
7. Converted return columns to numeric values.
8. Validated expense ratio range (0.1% – 2.5%).
9. Flagged anomalous return values.
10. Loaded cleaned data into SQLite database.
