select * from customer_shopping_data_cleaned;

describe customer_shopping_data_cleaned;

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