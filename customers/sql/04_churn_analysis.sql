-- Business Questions:

-- CHURN RISK ANALYSIS

-- How recently did each customer make a purchase?
-- This helps identify inactive customers and potential churn risk.
select
    customer_id,
    max(invoice_date) as last_purchase_date
from customer_shopping_data_cleaned
group by customer_id;

-- How long has it been since each customer's last purchase?
select
    customer_id,
    datediff('2023-03-31', max(invoice_date)) as recency_days
from customer_shopping_data_cleaned
group by customer_id;

-- How frequently does each customer make purchases?
select
    customer_id,
    count(*) as frequency
from customer_shopping_data_cleaned
group by customer_id;

-- How much revenue does each customer generate? This helps identify high-value customers.
select
    customer_id,
    sum(price) as total_spent
from customer_shopping_data_cleaned
group by customer_id
order by total_spent desc;


-- Which customers are at risk of churn based on inactivity threshold?
-- A customer is considered inactive if no purchase in last 180 days.
select
    customer_id,
    case
        when max(invoice_date) < date_sub('2023-01-31', interval 180 day)
            then 'Inactive'
        else 'Active'
        end as churn_status
from customer_shopping_data_cleaned
group by customer_id;

-- How can we segment customers based on engagement level?
-- We use recency-based segmentation due to lack of repeat purchase behavior.
with base as (
    select
        customer_id,
        max(invoice_date) as last_purchase
    from customer_shopping_data_cleaned
    group by customer_id
),
     recency as (
         select
             customer_id,
             datediff('2023-03-31', last_purchase) as recency_days
         from base
     )

select
    customer_id,
    recency_days,
    case
        when recency_days <= 180 then 'Low Risk'
        when recency_days <= 365 then 'Medium Risk'
        else 'High Risk'
        end as churn_risk_segment
from recency
order by churn_risk_segment;


-- How will customer churn risk distribution change in the next 90 days if no additional purchases occur?
-- Query simulates customer risk levels 90 days into the future assuming no additional purchases occur.
with base as (
    select
        customer_id,
        datediff('2023-03-31', max(invoice_date)) as recency_days
    from customer_shopping_data_cleaned
    group by customer_id
)
select
    case
        when recency_days + 90 <= 180 then 'Low Risk'
        when recency_days + 90 <= 365 then 'Medium Risk'
        else 'High Risk'
        end as projected_churn_risk_segment,
    count(*) as customers
from base
group by projected_churn_risk_segment
order by customers desc;

-- How many customers are expected to move into the High Risk segment within the next 90 days?
with base as (
    select
        customer_id,
        datediff('2023-03-31', max(invoice_date)) as recency_days
    from customer_shopping_data_cleaned
    group by customer_id
)
select
    count(*) as projected_high_risk_customers
from base
where recency_days + 90 > 365;

-- How much revenue is associated with customers projected to be in the High Risk segment within 90 days?
with customer_value as (
    select
        customer_id,
        sum(price) as revenue,
        datediff(
                '2023-03-31',
                max(invoice_date)
        ) as recency_days
    from customer_shopping_data_cleaned
    group by customer_id
)
select
    round(sum(revenue),2) as revenue_at_risk
from customer_value
where recency_days + 90 > 365;

-- Which shopping malls are projected to have the highest number of High Risk customers within 90 days?
with base as (
    select
        shopping_mall,
        customer_id,
        datediff(
                '2023-03-31',
                max(invoice_date)
        ) as recency_days
    from customer_shopping_data_cleaned
    group by
        shopping_mall,
        customer_id
)
select shopping_mall,
       count(*) as projected_high_risk_customers
from base
where recency_days + 90 > 365
group by shopping_mall
order by projected_high_risk_customers desc;