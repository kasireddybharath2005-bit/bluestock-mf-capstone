-- =====================================================
-- Dimension Table: dim_fund
-- =====================================================

CREATE TABLE dim_fund (
amfi_code INTEGER PRIMARY KEY,
scheme_name TEXT NOT NULL,
fund_house TEXT,
category TEXT,
sub_category TEXT,
plan_type TEXT,
benchmark TEXT,
fund_manager TEXT,
launch_date DATE
);

-- =====================================================
-- Dimension Table: dim_date
-- =====================================================

CREATE TABLE dim_date (
date_id INTEGER PRIMARY KEY AUTOINCREMENT,
full_date DATE UNIQUE NOT NULL,
day INTEGER,
month INTEGER,
quarter INTEGER,
year INTEGER,
month_name TEXT
);

-- =====================================================
-- Fact Table: fact_nav
-- =====================================================

CREATE TABLE fact_nav (
nav_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,
date_id INTEGER NOT NULL,
nav REAL NOT NULL,

```
FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code),

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);

-- =====================================================
-- Fact Table: fact_transactions
-- =====================================================

CREATE TABLE fact_transactions (
transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
investor_id INTEGER,
amfi_code INTEGER NOT NULL,
date_id INTEGER NOT NULL,

```
transaction_type TEXT,
amount_inr REAL,
units REAL,

city TEXT,
state TEXT,
kyc_status TEXT,

FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code),

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);

-- =====================================================
-- Fact Table: fact_performance
-- =====================================================

CREATE TABLE fact_performance (
performance_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,

```
return_1yr_pct REAL,
return_3yr_pct REAL,
return_5yr_pct REAL,

alpha REAL,
beta REAL,
sharpe_ratio REAL,

expense_ratio_pct REAL,
aum_crore REAL,

FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code)
```

);

-- =====================================================
-- Fact Table: fact_aum
-- =====================================================

CREATE TABLE fact_aum (
aum_id INTEGER PRIMARY KEY AUTOINCREMENT,
date_id INTEGER NOT NULL,

```
fund_house TEXT,
aum_crore REAL,
num_schemes INTEGER,

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);
