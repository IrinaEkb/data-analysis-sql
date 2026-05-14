
create view customer_shopping_data_cleaned as
select
    trim(invoice_no) as invoice_no,
    trim(customer_id) as customer_id,
    trim(gender) as gender,
    age,
    trim(category) as category,
    cast(trim(quantity) as signed) as quantity,
    cast(trim(price) as decimal(10,2)) as price,
    trim(payment_method) as payment_method,
    str_to_date(trim(invoice_date), '%d/%m/%Y') as invoice_date,
    trim(shopping_mall) as shopping_mall
from customer_shopping_data;

select * from customer_shopping_data_cleaned;

