-- A. KPI 

-- Total revenue 
  SELECT SUM(total_price) AS Total_Revenue
  FROM Pizza_DB.pizza_sales;

-- Average order value
  SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_order_value
  FROM Pizza_DB.pizza_sales;
-- Total pizzas sold
  SELECT SUM(quantity) AS Total_Pizza_Sold
  FROM pizza_sales;

-- Total orders
  SELECT COUNT(DISTINCT order_id) AS Total_orders
  FROM pizza_sales;

-- Average Pizzas Per Order
  SELECT CAST(CAST(SUM(quantity)AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))AS DECIMAL(10,2)) AS Avg_pizzas_per_ord
  FROM pizza_sales;

-- B. Chart Requirements

-- Daily Trend for Total Orders
    SELECT DAYNAME(STR_TO_DATE(order_date, '%d/%m/%Y')) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
    FROM pizza_sales
    GROUP BY order_day;

-- Hourly Trend for Orders
    SELECT 
      HOUR(order_time) AS order_hours,
      COUNT(DISTINCT order_id) AS total_orders
    FROM pizza_sales
    GROUP BY HOUR(order_time)
    ORDER BY HOUR(order_time);

-- % of sales by Pizza Category
    SELECT pizza_category, 
      CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
      CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
    FROM pizza_sales
    GROUP BY pizza_category;

-- % of sales by Pizza Size
    SELECT pizza_size, 
      CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
      CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
    FROM pizza_sales
    GROUP BY pizza_size
    ORDER BY pizza_size;

-- Total Pizzas sold by Pizza Category
    SELECT 
      pizza_category, 
      SUM(quantity) AS Total_Quantity_Sold
    FROM pizza_sales
    GROUP BY pizza_category
    ORDER BY Total_Quantity_Sold DESC;

-- Top 5 best sellers by total pizzas sold.
  SELECT
    pizza_name,
    SUM(quantity) AS Total_Pizza_Sold
  FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Pizza_Sold DESC
  LIMIT 5;

-- Top 5 slowest-selling pizza by total quantity sold
  SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
  FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Pizza_Sold ASC
  LIMIT 5;
-- Apply for the quarter if needed
  SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d/%m/%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
  FROM pizza_sales
  WHERE QUARTER(STR_TO_DATE(order_date, '%d/%m/%Y')) = 1
  GROUP BY order_day
  ORDER BY order_day;
