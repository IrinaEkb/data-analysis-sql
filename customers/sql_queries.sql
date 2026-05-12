-- for quick data check
select * from customer_shopping_data;

-- check total number of rows in dataset
select count(*) as total_rows
from customer_shopping_data;
-- total rows = 99457

-- check null values in each column
select
    count(*) AS total_rows,
    sum(case when invoice_no is null then 1 else 0 end) as invoice_no_nulls,
    sum(case when customer_id is null then 1 else 0 end) as customer_id_nulls,
    sum(case when gender is null then 1 else 0 end) as gender_nulls,
    sum(case when age is null then 1 else 0 end) as age_nulls,
    sum(case when category is null then 1 else 0 end) as category_nulls,
    sum(case when quantity is null then 1 else 0 end) as quantity_nulls,
    sum(case when price is null then 1 else 0 end) as price_nulls,
    sum(case when payment_method is null then 1 else 0 end) as payment_method_nulls,
    sum(case when invoice_date is null then 1 else 0 end) as invoice_date_nulls,
    sum(case when shopping_mall is null then 1 else 0 end) as shopping_mall_nulls

from customer_shopping_data;
-- no NULL values in dataset

-- check data duplicates
select  invoice_no, customer_id, gender, age, category, quantity, price, payment_method, invoice_date, shopping_mall,
        count(*) as count_duplicates
from customer_shopping_data
group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
having count(*) > 1;
-- no duplicates in dataset