
select * from customer_shopping_data_cleaned;

describe customer_shopping_data_cleaned;

select count(distinct customer_id)
from customer_shopping_data_cleaned;

select *
from customer_shopping_data_cleaned
order by quantity desc
    limit 20;

select *
from customer_shopping_data_cleaned
order by price desc
    limit 20;

select
    min(invoice_date) as min_date,
    max(invoice_date) as max_date
from customer_shopping_data_cleaned;

select
    count(*) as total_rows,
    count(distinct customer_id) as unique_customers,
    count(distinct invoice_no) as unique_invoices,
    count(distinct category) as unique_categories
from customer_shopping_data_cleaned;

select
    gender,
    avg(price) as avg_price
from customer_shopping_data_cleaned
group by gender;

select
    sum(price) as total_revenue
from customer_shopping_data_cleaned;

select
    shopping_mall,
    sum(price) as revenue_by_mall
from customer_shopping_data_cleaned
group by shopping_mall
order by revenue_by_mall desc;

select
    category,
    sum(price) as revenue
from customer_shopping_data_cleaned
group by category
order by revenue desc;

select payment_method,
       sum(price) as revenue_by_payment_method
from customer_shopping_data_cleaned
group by payment_method
order by revenue_by_payment_method desc;

select
    gender,
    sum(price) as revenue
from customer_shopping_data_cleaned
group by gender;

select
    gender,
    count(*) as total_transactions
from customer_shopping_data_cleaned
group by gender;

select
    gender,
    round(avg(price),2) as avg_spend_per_transactiom
from customer_shopping_data_cleaned
group by gender;

select
    gender,
    category,
    count(*) as total_purchases
from customer_shopping_data_cleaned
group by gender, category
order by gender, total_purchases desc;

select
    gender,
    case
        when age between 18 and 25 then '18-25'
        when age between 26 and 35 then '26-35'
        when age between 36 and 45 then '36-45'
        when age between 46 and 60 then '46-60'
        else '60+'
        end as age_group,
    category,
    count(*) as total_purchases_by_age_group
from customer_shopping_data_cleaned
group by
    gender,
    age_group,
    category
order by
    gender,
    age_group,
    total_purchases_by_age_group desc;

select
    gender,
    case
        when age between 18 and 25 then '18-25'
        when age between 26 and 35 then '26-35'
        when age between 36 and 45 then '36-45'
        when age between 46 and 60 then '46-60'
        else '60+'
        end as age_group,
    category,
    round(sum(price),2) as revenue,
    round(avg(price),2) as avg_order_value
from customer_shopping_data_cleaned
group by
    gender,
    age_group,
    category
order by revenue desc;

select
    age,
    round(avg(price),2) as avg_spend
from customer_shopping_data_cleaned
group by age
order by age;

select
    year(invoice_date) as year,
    sum(price) as revenue_by_year
from customer_shopping_data_cleaned
group by year
order by year;

select
    year(invoice_date) as year,
    month(invoice_date) as month,
    round(sum(price),2) as revenue_by_month
from customer_shopping_data_cleaned
group by year, month
order by year, month;

select
    year(invoice_date) as year,
    month(invoice_date) as month,
    count(*) as transactions
from customer_shopping_data_cleaned
group by year, month
order by year, month;

select
    category,
    count(*) as total_sales
from customer_shopping_data_cleaned
group by category
order by total_sales desc;

select
    category,
    round(avg(price),2) as avg_order_value
from customer_shopping_data_cleaned
group by category
order by avg_order_value desc;

select
    shopping_mall,
    category,
    round(sum(price),2) as revenue
from customer_shopping_data_cleaned
group by shopping_mall, category
order by shopping_mall, revenue desc;

select
    shopping_mall,
    count(*) as transactions
from customer_shopping_data_cleaned
group by shopping_mall
order by transactions desc;

select
    shopping_mall,
    avg(price) as avg_transaction
from customer_shopping_data_cleaned
group by shopping_mall
order by avg_transaction desc;

select
    shopping_mall,
    basket_size,
    count(*) as number_of_baskets
from (
         select
             shopping_mall,
             invoice_no,
             sum(quantity) as basket_size
         from customer_shopping_data_cleaned
         group by shopping_mall, invoice_no
     ) t
group by shopping_mall, basket_size
order by shopping_mall, basket_size;

create view basket_level as
select
    shopping_mall,
    invoice_no,
    sum(quantity) as basket_size,
    sum(price) as basket_value
from customer_shopping_data_cleaned
group by shopping_mall, invoice_no;