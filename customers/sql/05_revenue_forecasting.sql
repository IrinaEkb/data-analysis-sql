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



SELECT
    DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
    category,
    SUM(price) AS monthly_revenue
FROM customer_shopping_data_cleaned
GROUP BY
    DATE_FORMAT(invoice_date, '%Y-%m-01'),
    category
ORDER BY
    month_date, monthly_revenue DESC;

SELECT
    DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
    AVG(price) AS avg_transaction_value,
    COUNT(*) AS total_transactions
FROM customer_shopping_data_cleaned
GROUP BY
    DATE_FORMAT(invoice_date, '%Y-%m-01')
ORDER BY
    month_date;

SELECT
    shopping_mall,
    DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
    SUM(price) AS monthly_revenue
FROM customer_shopping_data_cleaned
GROUP BY
    shopping_mall,
    DATE_FORMAT(invoice_date, '%Y-%m-01')
ORDER BY
    shopping_mall, month_date;