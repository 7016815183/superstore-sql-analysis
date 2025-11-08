-- ======================================================
-- SUPERSTORE SALES ANALYSIS USING SQL (MySQL Workbench)
-- Author: Bhavya Panchal
-- Dataset Years: 2015 - 2018
-- ======================================================

-- USE DATABASE
CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

-- ======================================================
-- PART 1: BASIC DATA EXPLORATION
-- ======================================================

-- Preview Data
SELECT * FROM train LIMIT 10;

-- Total Rows
SELECT COUNT(*) AS total_rows FROM train;

-- Key Distinct Counts
SELECT 
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    COUNT(DISTINCT `Product ID`) AS total_products
FROM train;

-- ======================================================
-- PART 2: SALES KPIs
-- ======================================================

-- Total Sales
SELECT SUM(Sales) AS total_sales FROM train;

-- Average Sales Per Record
SELECT ROUND(AVG(Sales), 2) AS avg_sales_per_record FROM train;

-- ======================================================
-- PART 3: CATEGORY & SUB-CATEGORY ANALYSIS
-- ======================================================

-- Sales by Category
SELECT 
    Category,
    SUM(Sales) AS total_sales
FROM train
GROUP BY Category
ORDER BY total_sales DESC;

-- Sales by Sub-Category
SELECT 
    `Sub-Category`,
    SUM(Sales) AS total_sales
FROM train
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;

-- Product Count per Category
SELECT 
    Category,
    COUNT(`Product ID`) AS total_products
FROM train
GROUP BY Category;

-- Average Sales per Category
SELECT 
    Category,
    ROUND(AVG(Sales), 2) AS avg_sales
FROM train
GROUP BY Category
ORDER BY avg_sales DESC;

-- ======================================================
-- PART 4: REGION & STATE ANALYSIS
-- ======================================================

-- Sales by Region
SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM train
GROUP BY Region
ORDER BY total_sales DESC;

-- Sales by State
SELECT 
    State,
    SUM(Sales) AS total_sales
FROM train
GROUP BY State
ORDER BY total_sales DESC;

-- Top 10 States by Sales
SELECT 
    State,
    SUM(Sales) AS total_sales
FROM train
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;

-- Average Sales by Region
SELECT 
    Region,
    ROUND(AVG(Sales), 2) AS avg_sales
FROM train
GROUP BY Region
ORDER BY avg_sales DESC;

-- State Ranking (Window Function)
SELECT 
    State,
    SUM(Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS sales_rank
FROM train
GROUP BY State
ORDER BY total_sales DESC;

-- ======================================================
-- PART 5: CUSTOMER ANALYSIS
-- ======================================================

-- Top 10 Customers by Sales
SELECT 
    `Customer Name`,
    SUM(Sales) AS total_sales
FROM train
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Sales & Avg by Segment
SELECT 
    Segment,
    SUM(Sales) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_sales
FROM train
GROUP BY Segment
ORDER BY total_sales DESC;

-- Frequent Customers (Top 10 by Order Count)
SELECT 
    `Customer Name`,
    COUNT(*) AS order_count
FROM train
GROUP BY `Customer Name`
ORDER BY order_count DESC
LIMIT 10;

-- Customer Ranking (Window Function)
SELECT 
    `Customer Name`,
    SUM(Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS customer_rank
FROM train
GROUP BY `Customer Name`
ORDER BY total_sales DESC;

-- ======================================================
-- PART 6: PRODUCT ANALYSIS
-- ======================================================

-- Top 10 Products by Sales
SELECT 
    `Product Name`,
    SUM(Sales) AS total_sales
FROM train
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 Products by Sales
SELECT 
    `Product Name`,
    SUM(Sales) AS total_sales
FROM train
GROUP BY `Product Name`
ORDER BY total_sales ASC
LIMIT 10;

-- Product Count by Sub-Category
SELECT 
    `Sub-Category`,
    COUNT(`Product ID`) AS product_count
FROM train
GROUP BY `Sub-Category`
ORDER BY product_count DESC;

-- ======================================================
-- PART 7: SHIPPING PERFORMANCE
-- ======================================================

-- Orders by Shipping Mode
SELECT 
    `Ship Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Sales), 2) AS avg_sales
FROM train
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;

-- Shipping Time Calculation (DD-MM-YYYY Format)
SELECT 
    `Order ID`,
    DATEDIFF(
        STR_TO_DATE(`Ship Date`, '%d-%m-%Y'),
        STR_TO_DATE(`Order Date`, '%d-%m-%Y')
    ) AS ship_time_days
FROM train
LIMIT 10;

-- Average Shipping Days by Ship Mode
SELECT 
    `Ship Mode`,
    ROUND(AVG(
        DATEDIFF(
            STR_TO_DATE(`Ship Date`, '%d-%m-%Y'),
            STR_TO_DATE(`Order Date`, '%d-%m-%Y')
        )
    ), 2) AS avg_shipping_days
FROM train
GROUP_BY `Ship Mode`
ORDER BY avg_shipping_days;

-- ======================================================
-- PART 8: TIME SERIES ANALYSIS
-- ======================================================

-- Monthly Sales Trend
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d-%m-%Y'), '%Y-%m') AS month,
    SUM(Sales) AS total_sales
FROM train
GROUP BY month
ORDER BY month;

-- Yearly Sales Trend
SELECT 
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS year,
    SUM(Sales) AS total_sales
FROM train
GROUP BY year
ORDER BY year;
