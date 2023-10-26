Вопросы курса

1. Overview (обзор ключевых метрик)
Total Sales
Total Profit
Profit Ratio
Profit per Order
Sales per Customer
Avg. Discount

SELECT SUM(sales)::int AS "Total Sales",
	   SUM(profit)::int AS "Total Profit",
	   ROUND(SUM(profit)/SUM(sales),2) AS "Profit Ratio",
	   (SUM(profit)/COUNT(DISTINCT order_id))::int AS "Profit per Order",
	   (SUM(sales)/COUNT(DISTINCT customer_id))::int AS "Sales per Customer",
	   ROUND(AVG(discount),2) AS "Avg. Discount"
FROM public.orders

Monthly Sales by Segment 

SELECT segment, date_trunc('month', order_date)::date AS dt_month, SUM(sales) AS revenue  
FROM public.orders
GROUP BY 1, 2
ORDER BY 1, 2

Monthly Sales by Product Category 

SELECT category, date_trunc('month', order_date)::date AS dt_month, SUM(sales) AS revenue
FROM public.orders
GROUP BY 1, 2
ORDER BY 1, 2


2. Product Dashboard (Продуктовые метрики)
Sales by Product Category over time 

SELECT *, SUM(revenue) OVER(PARTITION BY category ORDER BY dt) AS revenue_cumsum
FROM (
SELECT category, order_date::date AS dt, SUM(sales) AS revenue
FROM public.orders
GROUP BY 1, 2
ORDER BY 1, 2)

3. Customer Analysis
Sales and Profit by Customer

SELECT customer_name, SUM(sales)::int AS total_sales, SUM(profit)::int AS total_profit
FROM public.orders o 
LEFT JOIN public.returns r USING(order_id)
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 3 DESC

Sales per region 

SELECT region, state, city, SUM(sales)::int AS total_sales, SUM(profit)::int AS total_profit
FROM public.orders o 
LEFT JOIN public.returns r USING(order_id)
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1, 2, 3
ORDER BY 5 desc
------------------------------------

Личные идеи

Что? Где? Когда?

Посмотрим на метрики с трёх ракурсов.

1. Что?

-- что приносит больше всего прибыли? какие товары?
SELECT product_name, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- какие подкатегории?
SELECT subcategory, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- а какие товары приносят меньше всего прибыли?
SELECT product_name, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 
LIMIT 10
-- какие подкатегории?
SELECT subcategory, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 
LIMIT 10
-- что имеет наибольший объём продаж? рассмотрим подкатегории как и не слишком детальный, и не слишком общий вариант
SELECT subcategory, SUM(sales)::int AS sales
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
-- есть ли подкатегории, которые входят в топ-10 по объёму продаж, но при этом имеют отрицательную прибыль?
WITH subcategory_sales_top AS (
SELECT subcategory, SUM(sales)::int AS sales
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
)
SELECT subcategory, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns) AND 
subcategory IN (SELECT subcategory FROM subcategory_sales_top)
GROUP BY 1
HAVING SUM(profit)::int < 0
-- на что идёт наибольшая скидка? на какие подкатегории?
SELECT subcategory, ROUND(AVG(discount), 2) AS avg_discount
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
--что чаще всего возвращают?
SELECT subcategory, COUNT(*) AS quantity
FROM public.orders 
WHERE order_id IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- а что чаще всего покупают?
SELECT subcategory, SUM(quantity) AS quantity
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10

2. Где?

-- где самый больший большой объём продаж? посмотрим по регионам
SELECT region, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC 
-- по штатам
SELECT state, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- по городам
SELECT city, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- где высокий объём продаж, но отрицательная прибыль? в каких штатах?
WITH state_negative_profit AS (
SELECT state, SUM(profit)
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
HAVING SUM(profit)::int < 0
)
SELECT state, SUM(sales)::int AS sales, SUM(profit)::int AS profit
FROM public.orders 
WHERE state IN (SELECT state FROM state_negative_profit)
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
-- где наименее удачная ситуация в плане рентабельности бизнеса?
WITH profit_table AS (
SELECT state, SUM(profit) AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
),
sales_table AS (
SELECT state, SUM(sales) AS sales
FROM public.orders 
GROUP BY 1
)
SELECT p.state, ROUND(p.profit/s.sales, 2) AS profit_ratio
FROM profit_table p
LEFT JOIN sales_table s USING(state)
ORDER BY 2 
LIMIT 10
-- рассмотрим тот же вопрос в разрезе городов
WITH profit_table AS (
SELECT city, SUM(profit) AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
),
sales_table AS (
SELECT city, SUM(sales) AS sales
FROM public.orders 
GROUP BY 1
)
SELECT p.city, ROUND(p.profit/s.sales, 2) AS profit_ratio
FROM profit_table p
LEFT JOIN sales_table s USING(city)
ORDER BY 2 
LIMIT 10
-- а в каких городах наоборот, самая удачная ситуация с соотношением прибыли и объёма продаж?
WITH profit_table AS (
SELECT city, SUM(profit) AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
),
sales_table AS (
SELECT city, SUM(sales) AS sales
FROM public.orders 
GROUP BY 1
)
SELECT p.city, ROUND(p.profit/s.sales, 2) AS profit_ratio
FROM profit_table p
LEFT JOIN sales_table s USING(city)
ORDER BY 2 DESC
LIMIT 10
-- какие города приносят больше всего выручки в чистом виде?
SELECT city, SUM(profit) AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 desc
LIMIT 10
-- рассмотрим на эти города поподробней
WITH profit_table AS (
SELECT city, SUM(profit) AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
),
metrics_table as (
SELECT p.city, p.profit::int, SUM(o.sales)::int AS sales, COUNT(DISTINCT customer_id) AS customers, 
COUNT(DISTINCT order_id) AS orders
FROM profit_table p
LEFT JOIN public.orders o USING(city)
GROUP BY 1, 2
ORDER BY 2 DESC
)
SELECT city, profit, sales, ROUND(profit*1.0/sales, 2) AS profit_ratio, customers, orders, 
ROUND(orders*1.0/customers, 2) AS orders_per_customer
FROM metrics_table
ORDER BY 2 DESC

3. Когда?

-- в каком году наибольший объём продаж?
SELECT EXTRACT('year' FROM order_date) AS year, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC
-- а прибыли?
SELECT EXTRACT('year' FROM order_date) AS year, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
-- в какие месяцы наиболее высокие объёмы продаж?
SELECT EXTRACT('month' FROM order_date) AS month, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC
-- а в какие месяцы наибольшая прибыль?
SELECT EXTRACT('month' FROM order_date) AS month, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
-- в какие дни недели наибольший объём продаж?
SELECT TO_CHAR(DATE ("order_date"::date), 'Day') AS day_of_week, SUM(sales)::int AS sales
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC
-- а прибыль?
SELECT TO_CHAR(DATE ("order_date"::date), 'Day') AS day_of_week, SUM(profit)::int AS profit
FROM public.orders 
WHERE order_id NOT IN (SELECT order_id FROM public.returns)
GROUP BY 1
ORDER BY 2 DESC
-- сколько времени проходит между оформлением заказа и его доставкой?
SELECT AGE(ship_date, order_date), COUNT(*)
FROM public.orders 
GROUP BY 1
ORDER BY 2 DESC
