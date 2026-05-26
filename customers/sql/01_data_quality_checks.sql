-- for quick data check
select * from customer_shopping_data;

-- check total number of rows in dataset
select count(*) as total_rows
from customer_shopping_data;
-- total rows = 99457

-- check data types of each column
describe customer_shopping_data;
-- problems with data types in quantity, price, and invoice_date

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

-- check data duplicates, where all rows are the same
select  invoice_no, customer_id, gender, age, category, quantity, price, payment_method, invoice_date, shopping_mall,
        count(*) as count_duplicates
from customer_shopping_data
group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
having count(*) > 1;
-- no duplicates in dataset

-- check for duplicates in invoice_no
select
    invoice_no,
    count(*) as invoice_count
from customer_shopping_data
group by invoice_no
having count(*) > 1;
-- no duplicates

-- check for empty strings in columns
select *
from customer_shopping_data
where trim(invoice_no) = ''
   or trim(customer_id) = ''
   or trim(gender) = ''
   or trim(age) = ''
   or trim(category) = ''
   or trim(quantity) = ''
   or trim(price) = ''
   or trim(payment_method) = ''
   or trim(invoice_date) = ''
   or trim(shopping_mall) = '';
-- no empty strings in dataset

select distinct gender
from customer_shopping_data;
-- only 2 unique

select distinct category
from customer_shopping_data;
-- all category names are unique, no capslock issues

select distinct payment_method
from customer_shopping_data;
-- all payment methods are unique

select distinct shopping_mall
from customer_shopping_data;
-- all shopping malls are unique

-- check for leading/trailing spaces
select *
from customer_shopping_data
where invoice_no      != trim(invoice_no)
   or customer_id     != trim(customer_id)
   or gender          != trim(gender)
   or cast(age as char) != trim(cast(age as char))
   or category        != trim(category)
   or quantity        != trim(quantity)
   or price           != trim(price)
   or payment_method  != trim(payment_method)
   or invoice_date    != trim(invoice_date)
   or shopping_mall   != trim(shopping_mall);
-- no leading/trailing spaces in dataset

-- check hidden control characters in columns
select *
from customer_shopping_data
where invoice_no     regexp '[[:cntrl:]]'
   or customer_id    regexp '[[:cntrl:]]'
   or gender         regexp '[[:cntrl:]]'
   or category       regexp '[[:cntrl:]]'
   or quantity       regexp '[[:cntrl:]]'
   or price          regexp '[[:cntrl:]]'
   or payment_method regexp '[[:cntrl:]]'
   or invoice_date   regexp '[[:cntrl:]]'
   or shopping_mall  regexp '[[:cntrl:]]';
-- no hidden control characters in dataset

-- check for multiple consecutive spaces
select *
from customer_shopping_data
where invoice_no     like '%  %'
   or customer_id    like '%  %'
   or gender         like '%  %'
   or category       like '%  %'
   or quantity       like '%  %'
   or price          like '%  %'
   or payment_method like '%  %'
   or invoice_date   like '%  %'
   or shopping_mall  like '%  %';
-- no multiple consecutive spaces

-- check for invalid date formats
select invoice_date
from customer_shopping_data
where invoice_date not regexp '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2,4}$';
-- no invalid date formats in dataset

-- check for non-numeric values in quantity
select quantity
from customer_shopping_data
where trim(quantity) not regexp '^[0-9]+$';
-- no non-numeric values in quantity

-- check for non-numeric values in price
select price
from customer_shopping_data
where trim(price) not regexp '^[0-9]+(\.[0-9]+)?$';
-- no invalid price formats

-- check for dates that cannot be parsed
select invoice_date
from customer_shopping_data
where str_to_date(invoice_date, '%d/%m/%Y') is null;
-- mo errors with date parsing

-- check for futute dates
select * from customer_shopping_data
where invoice_date > current_date;
-- no future dates

-- check for negative or zero values in quantity
select *
from customer_shopping_data
where quantity <= 0;
-- no negative values in quantity

-- check for unrealistic age values
select *
from customer_shopping_data
where age < 0
   or age > 120;
-- no unrealistic age values

-- check for negative or zero values in price
select *
from customer_shopping_data
where price <= 0;
-- no errors
