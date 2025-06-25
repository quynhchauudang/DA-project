# DA-project
# 🧮 Pizza Sales Portfolio (SQL + Excel)

This repository contains my analysis of pizza sales data, using **SQL** (MySQL Workbench) and **Excel**.

---

## 📁 Project Structure
# 🎯 Project Objectives

1. Load pizza sales data into MySQL Workbench and perform data cleaning & transformations using SQL.
2. Calculate key metrics (KPIs) such as:
   - Total revenue
   - Average order value
   - Total pizzas sold
   - Average pizzas per order
3. Analyze trends:
   - Daily and hourly order patterns
   - Sales breakdown by pizza category and size
   - Top 5 best-selling and bottom 5 slowest-selling pizzas
   - Weekly order distribution (e.g. within Q1)
4. Visualize results and build dashboards using Excel.

---

## ⚙️ How to Run

### ✅ SQL (MySQL Workbench):
1. Open MySQL Workbench and create or load the `pizza_sales` table.
2. Open `pizza_sales_queries.sql`, containing all queries.
3. Execute queries to extract KPIs and trends.

### ✅ Excel:
1. Load `pizza_sales_raw.csv` into `pizza_sales_clean.xlsx`.
2. Clean and format data using formulas—e.g.:
   ```excel
   =TEXT(E2, "yyyy-mm-dd")
