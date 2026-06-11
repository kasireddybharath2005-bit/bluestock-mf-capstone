# Bluestock MF Capstone — Mutual Fund Data Analysis

> **Internship:** Data Analyst Intern @ Bluestock Fintech  
> **Author:** Kasireddy Bharath Hari Kumar  
> **Duration:** May 28 – July 28, 2026  
> **Internship ID:** BFDA56877  

---

## Project Overview

An end-to-end data analytics pipeline analyzing Indian mutual fund data across 10 datasets comprising ~87,500 records. The project covers ETL design, exploratory data analysis, SQL querying, and an interactive dashboard — delivering actionable insights on NAV trends, AUM growth, SIP inflows, scheme performance, and investor behavior.

---

## Project Structure

```
bluestock_mf_capstone/
├── data/
│   ├── raw/                  ← 10 original CSV datasets
│   └── processed/            ← Cleaned/transformed data
├── notebooks/                ← Jupyter notebooks for exploration
├── sql/                      ← SQL queries and schema
├── dashboard/                ← Plotly Dash dashboard app
├── reports/                  ← 16 EDA charts (PNG)
├── data_ingestion.py         ← Day 1: ETL pipeline
├── eda.py                    ← Day 2: EDA + 16 charts
├── database_setup.py         ← Day 3: SQLite database
├── dashboard_app.py          ← Day 4-5: Interactive dashboard
├── run_pipeline.py           ← Master execution script
├── requirements.txt          ← Python dependencies
└── README.md                 ← This file
```

---

## Datasets

| # | File | Records | Description |
|---|------|---------|-------------|
| 01 | fund_master.csv | 40 | Scheme metadata, categories, risk grades |
| 02 | nav_history.csv | 46,000 | Daily NAV for all schemes (2022–2026) |
| 03 | aum_by_fund_house.csv | 90 | Monthly AUM by fund house |
| 04 | monthly_sip_inflows.csv | 48 | Industry SIP inflow data |
| 05 | category_inflows.csv | 144 | Category-wise net inflows |
| 06 | industry_folio_count.csv | 21 | Folio count by type |
| 07 | scheme_performance.csv | 40 | Returns, Sharpe ratio, alpha, beta |
| 08 | investor_transactions.csv | 32,778 | Individual investor transactions |
| 09 | portfolio_holdings.csv | 322 | Stock-level portfolio holdings |
| 10 | benchmark_indices.csv | 8,050 | Daily benchmark index values |

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/kasireddybharath2005-bit/bluestock_mf_capstone.git
cd bluestock_mf_capstone
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Add datasets
Place all 10 CSV files into `data/raw/`

---

## How to Run

### Run the full pipeline (recommended)
```bash
python run_pipeline.py
```
This runs all stages in sequence: ETL → EDA → Database → Dashboard.

### Run individual stages
```bash
python data_ingestion.py     # Stage 1: Load & validate all datasets
python eda.py                # Stage 2: Generate 16 EDA charts
python database_setup.py     # Stage 3: Build SQLite database
```

### Open the Dashboard
```bash
python dashboard/dashboard_app.py
```
Then open your browser and go to: **http://localhost:8050**

---

## Key Findings

1. **NAV Growth** — All 5 bluechip schemes delivered 80–100% cumulative returns (2022–2026)
2. **SIP Boom** — Monthly SIP inflows grew 155% from ₹12,142 Cr to ₹31,002 Cr
3. **Direct Plans Win** — Direct plan expense ratio (0.78%) vs Regular (1.35%) — save 0.57% annually
4. **Banking Dominance** — Banking sector has highest portfolio weight across all equity schemes
5. **KYC Compliance** — 92% of 32,778 transactions are KYC verified
6. **Data Quality** — 100% AMFI code consistency across all datasets

---

## Live NAV API

The project fetches live NAV data using the AMFI API:
```
GET https://api.mfapi.in/mf/{amfi_code}
```
Key schemes tracked: SBI Bluechip (119551), ICICI Bluechip (120503), Nippon Large Cap (118632), Axis Bluechip (119092), Kotak Bluechip (120841), HDFC Top 100 (125497)

---

## Technologies Used

- **Python 3.x** — Core language
- **Pandas, NumPy** — Data manipulation
- **Matplotlib, Seaborn** — Static visualizations
- **Plotly Dash** — Interactive dashboard
- **SQLite + SQLAlchemy** — Database layer
- **Requests** — Live NAV API calls
- **Git + GitHub** — Version control

---

## GitHub

**Repository:** https://github.com/kasireddybharath2005-bit/bluestock_mf_capstone

---

## Contact

**Kasireddy Bharath Hari Kumar**  
B.Tech CSE (AI/ML) | Uttaranchal University  
kasireddybharath2005@gmail.com | +91 9581743295
