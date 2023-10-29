
with t1 as (
select  
ship_date_id,
order_id , sales , profit , quantity , discount , 
date as dt_order, year as year_order, quarter as quarter_order, month as month_order, 
week as week_order, week_day as week_day_order, 
customer_name, 
country, state, city, postal_code,
product_name, category, sub_category, segment,
shipping_mode
from dw.sales_fact s 
left join dw.calendar_dim cl on s.order_date_id = cl.dateid 
left join dw.customer_dim cst on s.cust_id = cst.cust_id 
left join dw.geo_dim g on s.geo_id = g.geo_id
left join dw.product_dim p on s.prod_id = p.prod_id 
left join dw.shipping_dim sh on s.ship_id = sh.ship_id
)

, t2 as (
select *,
date as dt_ship, year as year_ship, quarter as quarter_ship, month as month_ship, 
week as week_ship, week_day as week_day_ship
from t1
left join dw.calendar_dim cl on t1.ship_date_id = cl.dateid 
)

select order_id, sales , profit , quantity , discount , 
country, state, city, postal_code, customer_name, 
product_name, category, sub_category, segment,
shipping_mode,
dt_order, dt_ship, year_order, year_ship, quarter_order, quarter_ship, month_order, month_ship, 
week_order, week_ship, week_day_order, week_day_ship
from t2