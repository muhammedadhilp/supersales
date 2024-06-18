-- Details of table --
DESCRIBE store;

-- Overall view of superstore sales dataset --
SELECT
COUNT(order_id) AS Total_oreders,
COUNT(DISTINCT country) AS Total_countries,
COUNT(DISTINCT product_name) AS Total_products,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_subcategories,
COUNT(DISTINCT year) AS Total_years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount
FROM store;

-- sales performance analysis --
SELECT product_name,SUM(sales) AS Total_sales, SUM(quantity) AS Total_quantity_sold , COUNT(DISTINCT Order ID) AS Total_Orders
FROM store
GROUP BY product_name,category
ORDER BY SUM(sales) DESC;

-- total sales per year  --
SELECT  year, SUM(sales) AS Total_sales FROM Store
GROUP BY year
ORDER BY SUM(sales) DESC;

-- customer segmentation --
SELECT segment, COUNT(DISTINCT customer_name) AS Total_customers,SUM(sales) AS Total_sales
FROM store
GROUP BY segment
ORDER BY SUM(sales) DESC;

-- RECENT Shipping and order management --
SELECT ship_mode, AVG(shipping_cost) AS Avg_shipping_cost, AVG(profit) AS Avg_profit
FROM store
GROUP BY ship_mode
ORDER BY AVG(profit) DESC;

-- time analysis for order orderes and order received --
SELECT ship_mode, AVG(DATEDIFF(DAY, CAST(order_date AS DATE),CAST(ship_date AS DATE))) AS Avg_time_gap
FROM store
GROUP BY ship_mode;

-- profitability and cost analysis --
SELECT product_name,category,sub_category,AVG(profit) AS Avg_profit,AVG(discount) AS Avg_dicount
FROM store
GROUP BY product_name,category,sub_category
ORDER BY AVG(profit) DESC;

-- Global values for sales and quantity product  --
SELECT country,SUM(sales) AS Total_sales,SUM(quantity)  AS Total_quantity
FROM store
GROUP BY country
ORDER BY SUM(sales) DESC;


-- state level category exploration --
SELECT  product_name,category,SUM(quantity) AS Total_quantity_sold
FROM store
GROUP BY state,category
ORDER BY SUM(quantity) DESC;

-- Regional subcategory analysis --
SELECT region,sub_category,SUM(quantity) AS Total_quantity_sold
FROM store
GROUP BY region,sub_category
ORDER BY SUM(quantity) DESC


--Prediction of sales and profit for next one month--
