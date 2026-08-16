-- 01. Preview data
SELECT * FROM coffee_sales
LIMIT 10

-- 02. Count total rows
SELECT COUNT(*) FROM coffee_sales

-- 03. Check range date
SELECT 
  MIN(date) AS start_date, 
  MAX(date) AS end_date 
FROM coffee_sales

-- 04. Number of coffee product
SELECT COUNT(DISTINCT coffee_name) AS total_coffee_products 
FROM coffee_sales

-- 05. Available payment method
SELECT DISTINCT cash_type FROM coffee_sales

-- 06. Total revenue
SELECT SUM(money) AS total_revenue FROM coffee_sale

-- 07. Average transaction value
SELECT ROUND(AVG(money), 2) AS avg_transaction_value FROM coffee_sales