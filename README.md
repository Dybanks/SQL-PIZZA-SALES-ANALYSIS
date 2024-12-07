# SQL-PIZZA-SALES-ANALYSIS

### Project Summary
This is a project that analyze pizza sales trends, revenue contributions, and customers preferences using Microsoft SQL.

### Tools
- SQL[Pissa sales Project.sql…]()

### Queries

- Select all data
```SQL
select *from pizza_sales;
```
Results,

<img width="647" alt="image" src="https://github.com/user-attachments/assets/3f88cba3-1116-406d-bd90-948b38e0f91f">

- Finding the total revenue for each pizza
  ``` SQL
  select Sum(total_price) Revenue
  From pizza_sales;

  - This query calculates the total revenue generated from pizza sales.
  - It provides a holistic view of the business's overall earnings and helps stakeholders evaluate the success of sales strategies.
  ```
  - Average Quantity Per Order
  ``` SQL
  select Sum(quantity)/ count(Distinct Order_id) as Avg_quantity_perorder
  From pizza_sales;

  - This query shows the average number of pizzas sold per order, revealing customer purchasing behavior.
  - It can inform decisions on promotions like discounts for bulk orders.
  ```

  - Count of distinct orders
    ``` SQL
    select count(Distinct Order_id)
    from pizza_sales;

    - By counting unique orders, this query highlights the total number of transactions, which is essential for understanding customer activity and business volume.
    ```

    - 0rders by day of the week
      ``` SQL
      select DATENAME(DW,order_date), count(distinct order_id)
      from pizza_sales
      group by DATENAME(DW,order_date);

      - This query reveals customer purchasing patterns throughout the week. For example, if orders peak on weekends, you can allocate more resources to handle higher demand during those days.
      ```

      - Orders by Month
        ``` SQL
        select DATENAME(MONTH,order_date), count(distinct order_id)
        from pizza_sales
        group by DATENAME(MONTH,order_date)
        ORDER BY DATENAME(MONTH,order_date) DESC;

        - By identifying which months have the highest or lowest number of orders, this query helps in seasonal demand planning. For instance, promotions or events can be targeted during peak months.
```



- Revenue Contribution by Pizza Category
``` SQL
SELECT pizza_category, SUM(TOTAL_PRICE) *100 / (SELECT SUM(TOTAL_PRICE) from pizza_sales)
FROM pizza_sales
GROUP BY pizza_category;

- This query shows which pizza categories contribute the most to revenue. Business owners can focus on high-performing categories or reevaluate the marketing of less popular ones.
```

- Revenue Contribution by Pizza Size
  ``` SQL
  SELECT pizza_size, SUM(TOTAL_PRICE) *100 / (SELECT SUM(TOTAL_PRICE) from pizza_sales)
  FROM pizza_sales
  GROUP BY pizza_size;

  - Understanding the revenue share by pizza size helps tailor promotions and inventory. For instance, if large pizzas dominate sales, consider bundling offers for family-sized deals.
  ```

  - Top 5 Pizza by revenue
    ``` SQL
    select distinct top(5) pizza_name_id, sum(total_price), sum(quantity), count(order_id)
    from pizza_sales
    group by pizza_name_id
    order by pizza_name_id desc;

    - This query identifies the most popular pizzas in terms of revenue, quantity sold, and order count. It highlights customer favorites and can guide product promotions and menu updates.
```


