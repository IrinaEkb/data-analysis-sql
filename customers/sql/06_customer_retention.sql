WITH customer_recency AS (
    SELECT
        customer_id,
        gender,
        age,
        category,
        price,
        DATEDIFF('2023-03-31', invoice_date) AS current_inactivity_days
    FROM customer_shopping_data_cleaned
)
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
        END AS age_cohort,
    gender,
    CASE
        WHEN current_inactivity_days BETWEEN 30 AND 59 THEN 'Send Day-30 Offer (Warm Trigger)'
        WHEN current_inactivity_days BETWEEN 60 AND 89 THEN 'Send Day-60 Offer (Cooling Trigger)'
        WHEN current_inactivity_days BETWEEN 90 AND 179 THEN 'Send Day-90 Offer (Critical Window)'
        ELSE 'Outside Active Trigger Loop'
        END AS targeted_marketing_workflow,
    COUNT(*) AS target_customer_count,
    SUM(price) AS total_mobilized_revenue_value
FROM customer_recency
WHERE current_inactivity_days <= 179
GROUP BY 1, 2, 3
ORDER BY total_mobilized_revenue_value DESC;

WITH risk_summary AS (
    SELECT
        shopping_mall,
        price AS invoice_value,
        DATEDIFF('2023-03-31', MAX(invoice_date)) AS recency_days
    FROM customer_shopping_data_cleaned
    GROUP BY shopping_mall, customer_id, price
),
     mall_risk_aggregates AS (
         SELECT
             shopping_mall,
             COUNT(*) AS projected_lost_customers,
             SUM(CASE WHEN recency_days <= 365 AND (recency_days + 90) > 365 THEN invoice_value ELSE 0 END) AS revenue_at_immediate_risk
         FROM risk_summary
         GROUP BY shopping_mall
     )
SELECT
    shopping_mall,
    projected_lost_customers,
    revenue_at_immediate_risk,
    ROUND((revenue_at_immediate_risk / SUM(revenue_at_immediate_risk) OVER()) * 100, 2) AS budget_allocation_share_pct
FROM mall_risk_aggregates
ORDER BY revenue_at_immediate_risk DESC;

