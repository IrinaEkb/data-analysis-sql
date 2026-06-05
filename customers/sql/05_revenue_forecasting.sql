-- REVENUE FORECASTING

-- revenue forecasting dataset (global)
with monthly as (
    select
        str_to_date(
                concat(year(invoice_date), '-', month(invoice_date), '-01'),
                '%Y-%m-%d'
        ) as month_date,
        price
    from customer_shopping_data_cleaned
    where invoice_date <= '2023-02-28'
)

select
    month_date,
    round(sum(price), 2) as monthly_revenue
from monthly
group by month_date
order by month_date;

-- revenue forecasting dataset (mall level)
with monthly as (
    select
        shopping_mall,
        str_to_date(
                concat(year(invoice_date), '-', month(invoice_date), '-01'),
                '%Y-%m-%d'
        ) as month_date,
        price
    from customer_shopping_data_cleaned
    where invoice_date <= '2023-02-28'
)

select
    shopping_mall,
    month_date,
    round(sum(price), 2) as monthly_revenue
from monthly
group by
    shopping_mall,
    month_date
order by
    shopping_mall,
    month_date;