
--------------------------------------------------
			-- HOME PAGE Visuals --
--------------------------------------------------

-- Lets start from KPI's
USE [Pizza DB];


SELECT * FROM pizza_sales;
-- Total Revenue
SELECT  ROUND(SUM(total_price),2) AS [Total Revenue] FROM pizza_sales;

-- Average Order Value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS [Average Order Value] FROM pizza_sales; 

-- Total Pizzas Sold
SELECT SUM(quantity) AS [Total Pizza Sold] FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT(order_id)) AS [Total Order] FROM pizza_sales;

-- Average Pizza Per Order
SELECT ROUND(CAST(SUM(quantity) AS FLOAT) / COUNT(DISTINCT(order_id)),2) AS [Avg Pizza Per Order] FROM pizza_sales;


-- Daily Trends for Total Orders
SELECT DATENAME(DW,order_date) AS Order_Date,COUNT(DISTINCT(order_id)) AS [Total Order] FROM pizza_sales GROUP BY DATENAME(DW,order_date) ORDER BY [Total Order];

-- Total Orders by Order Month
SELECT DATENAME(MONTH,order_date) AS Month_Name,COUNT(DISTINCT(order_id)) AS [Total Order] FROM pizza_sales GROUP BY DATENAME(MONTH,order_date) ORDER BY Month_Name;

-- % of Sales by Pizza Category
SELECT pizza_category, CAST(ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS VARCHAR(10)) + '%' AS Percentage FROM pizza_sales GROUP BY(pizza_category) ORDER BY Percentage DESC;

-- % of Sales by Pizza Size
SELECT pizza_size, CAST(ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS VARCHAR(10)) + '%' AS Percentage FROM pizza_sales GROUP BY(pizza_size) ORDER BY Percentage DESC;

-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Orders FROM pizza_sales GROUP BY(pizza_category) ORDER BY Total_Orders DESC;


--------------------------------------------------
			-- Best/Wrost Seller --
--------------------------------------------------

-- Best Seller


-- TOP 5 Pizzas by Revenue
SELECT TOP 5 pizza_name ,SUM(pizza_sales.total_price) AS Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Revenue DESC;

-- TOP 5 Pizzas by Quantity
SELECT TOP 5 pizza_name ,SUM(quantity) AS Quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Quantity DESC;

-- TOP 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name ,COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Order DESC;

-- Wrost Seller

-- TOP 5 Pizzas by Revenue
SELECT TOP 5 pizza_name ,SUM(pizza_sales.total_price) AS Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Revenue ASC;

-- TOP 5 Pizzas by Quantity
SELECT TOP 5 pizza_name ,SUM(quantity) AS Quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Quantity ASC;

-- TOP 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name ,COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Order ASC;







