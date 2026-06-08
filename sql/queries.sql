-- =====================================================
-- 1. Top 5 Funds by AUM
-- =====================================================

SELECT
scheme_name,
aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

-- =====================================================
-- 2. Average NAV per Month
-- =====================================================

SELECT
d.year,
d.month,
ROUND(AVG(f.nav), 2) AS avg_nav
FROM fact_nav f
JOIN dim_date d
ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- =====================================================
-- 3. SIP Year-over-Year Growth
-- =====================================================

SELECT
strftime('%Y', transaction_date) AS year,
SUM(amount_inr) AS total_sip_amount
FROM fact_transactions
WHERE transaction_type = 'SIP'
GROUP BY year
ORDER BY year;

-- =====================================================
-- 4. Transactions by State
-- =====================================================

SELECT
state,
COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- =====================================================
-- 5. Funds with Expense Ratio < 1%
-- =====================================================

SELECT
scheme_name,
expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1
ORDER BY expense_ratio_pct;

-- =====================================================
-- 6. Top 10 Funds by Sharpe Ratio
-- =====================================================

SELECT
scheme_name,
sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

-- =====================================================
-- 7. Category-wise Average Return (3 Year)
-- =====================================================

SELECT
category,
ROUND(AVG(return_3yr_pct),2) AS avg_return
FROM fact_performance
GROUP BY category
ORDER BY avg_return DESC;

-- =====================================================
-- 8. Top 10 Cities by Investment Amount
-- =====================================================

SELECT
city,
ROUND(SUM(amount_inr),2) AS total_investment
FROM fact_transactions
GROUP BY city
ORDER BY total_investment DESC
LIMIT 10;

-- =====================================================
-- 9. Redemption vs SIP Amount
-- =====================================================

SELECT
transaction_type,
ROUND(SUM(amount_inr),2) AS total_amount
FROM fact_transactions
WHERE transaction_type IN ('SIP','Redemption')
GROUP BY transaction_type;

-- =====================================================
-- 10. Fund House AUM Ranking
-- =====================================================

SELECT
fund_house,
ROUND(SUM(aum_crore),2) AS total_aum
FROM fact_aum
GROUP BY fund_house
ORDER BY total_aum DESC;
