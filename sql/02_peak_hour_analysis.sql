-- 01. Transaction volume per hour
SELECT
  hour,
  COUNT(*) AS total_transactions
FROM coffee_sales
GROUP BY hour
ORDER BY total_transactions DESC

-- 02. Revenue per hour
SELECT
  hour,
  SUM(money) AS total_revenue
FROM coffee_sales
GROUP BY hour
ORDER BY total_revenue DESC

-- 03. Average transaction value per hour
SELECT
  hour,
  COUNT(*) AS total_transactions,
  SUM(money) AS total_revenue,
  ROUND(AVG(money), 2) AS avg_transaction_value
From coffee_sales
GROUP BY hour
ORDER BY hour

-- 04. Peak hour by period
SELECT
  CASE
    WHEN hour BETWEEN 7 AND 10 THEN 'Morning'
    WHEN hour BETWEEN 11 AND 14 THEN 'Afternoon'
    WHEN hour BETWEEN 15 AND 17 THEN 'Evening'
    WHEN hour BETWEEN 18 AND 23 THEN 'Night'
    ELSE 'Late Night'
  END AS time_period,
  COUNT(*) AS total_transactions,
  SUM(money) AS total_revenue,
  ROUND(AVG(money), 2) AS avg_transactions_value
FROM coffee_sales
GROUP BY time_period
ORDER BY total_transactions DESC

-- 05. Best seller product during peak hour
SELECT
  coffee_name,
  COUNT(*) AS total_transactions,
  SUM(money) AS total_revenue
FROM coffee_sales
WHERE hour = 18
GROUP BY coffee_name
ORDER BY total_transactions DESC