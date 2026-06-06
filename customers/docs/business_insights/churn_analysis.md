# Customer Churn & Forecasting Analysis

## Business Objective

The goal of this analysis was to identify customers at risk of churn and estimate potential future customer loss using recency-based forecasting.

Because the dataset contains only one transaction per customer, traditional churn modeling based on repeat purchase behavior was not possible. Instead, a recency-driven approach was used to evaluate customer inactivity and project future churn risk.

---

## Dataset Limitation

The dataset contains one transaction per customer.

As a result:

- Frequency-based churn analysis is limited.
- Customer lifetime behavior cannot be observed.
- Predictive modeling is not appropriate for this dataset.
- Churn forecasting is based on recency and inactivity projections.

---

## Business Questions

### Churn Analysis

- How recently did customers make a purchase?
- Which customers are currently inactive?
- How can customers be segmented by churn risk?

### Churn Forecasting

- How will customer risk distribution change in the next 90 days?
- How many customers are projected to become High Risk?
- How much revenue is associated with projected High Risk customers?
- Which shopping malls are expected to experience the highest customer loss?

---

## Key Metrics

| Metric | Description |
|----------|----------|
| Recency | Days since customer's last purchase |
| Churn Status | Active vs Inactive customer classification |
| Churn Risk Segment | Low Risk / Medium Risk / High Risk |
| Revenue at Risk | Revenue associated with projected High Risk customers |
| Projected Customer Loss | Customers expected to move into the High Risk segment |

---

## Example SQL: Churn Risk Segmentation

```sql
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
from recency;
```

This query classifies customers into churn risk groups based on the number of days since their most recent purchase.

---

## Forecasting Approach

A scenario-based forecasting framework was implemented.

The analysis assumes that no additional purchases occur during the forecast period. Customer recency is shifted forward by 90 days to estimate how many customers may transition into higher churn risk categories.

This approach does not predict customer behavior directly. Instead, it estimates future risk exposure based on observed inactivity patterns.

---

## Example SQL: Mall-Level Customer Loss Forecast

```sql
with base as (

    select
        shopping_mall,
        customer_id,
        datediff(
            '2023-03-31',
            max(invoice_date)
        ) as recency_days
    from customer_shopping_data_cleaned
    group by shopping_mall, customer_id

)

select
    shopping_mall,
    count(*) as projected_high_risk_customers
from base
where recency_days + 90 > 365
group by shopping_mall
order by projected_high_risk_customers desc;
```

This forecast identifies shopping malls with the highest number of customers projected to enter the High Risk segment within the next 90 days.

The output can be used to prioritize retention initiatives and customer engagement campaigns at the mall level.

---

## Key Findings

- Customer behavior is dominated by one-time purchases.
- Churn evaluation is primarily driven by recency rather than purchase frequency.
- Significant differences exist in customer inactivity levels across shopping malls.
- Transaction values vary substantially across product categories.
- Future customer loss can be approximated through recency-based risk migration.

---