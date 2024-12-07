--Select all data
select *
from pizza_sales;

--finding the total revenue for each pizza
select Sum(total_price) Revenue
From pizza_sales;

-- Average quantity per order
select Sum(quantity), / count(Distinct Order_id) as Avgquantityperorder
From pizza_sales;


--Count of distinct orders
select count(Distinct Order_id)
from pizza_sales;


--orders by day of the week
select DATENAME(DW,order_date), count(distinct order_id)
from pizza_sales
group by DATENAME(DW,order_date);


--Orders by Month
select DATENAME(MONTH,order_date), count(distinct order_id)
from pizza_sales
group by DATENAME(MONTH,order_date)
ORDER BY DATENAME(MONTH,order_date) DESC;


--Revenue Contribution by Pizza Category
SELECT pizza_category, SUM(TOTAL_PRICE) *100 / (SELECT SUM(TOTAL_PRICE) from pizza_sales) 
FROM pizza_sales
GROUP BY pizza_category;


--Revenue Contribution by Pizza Size
SELECT pizza_size, SUM(TOTAL_PRICE) *100 / (SELECT SUM(TOTAL_PRICE) from pizza_sales) 
FROM pizza_sales
GROUP BY pizza_size;


--Top 5 Pizza by revenue
select distinct top(5) pizza_name_id, sum(total_price), sum(quantity), count(order_id)
from pizza_sales
group by pizza_name_id
order by pizza_name_id desc;