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

### Customer Churn Risk Segmentation

* **Strategic Purpose:** Establishes a baseline view of customer inactivity and identifies which customers are most likely to be lost without intervention.

* **Methodological Value:** Calculates customer recency by measuring the number of days since the most recent purchase and assigns each customer to a risk tier (Low, Medium, or High Risk). This creates the foundation for all subsequent churn and forecasting analyses.

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

* **Actionable Business Value:** Provides a prioritized customer risk framework that can be used to target retention efforts. Low-risk customers can receive loyalty campaigns, medium-risk customers can be targeted with re-engagement offers, and high-risk customers can be evaluated for win-back initiatives.

---

### Mall-Level Customer Loss Forecast

* **Strategic Purpose:** Identifies which shopping malls are expected to experience the highest concentration of future customer attrition.

* **Methodological Value:** Applies a forward-looking 90-day recency shift to estimate how many currently active customers will migrate into the High Risk segment if no additional purchases occur. Results are aggregated at the shopping mall level to compare future customer loss exposure across locations.

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

* **Actionable Business Value:** Highlights locations where customer retention risk is expected to be highest. Business teams can use the results to prioritize marketing spend, loyalty programs, and customer engagement campaigns in malls with the largest projected customer losses.

---

### Average Quantity per Churn Risk Profile

*   **Strategic Purpose:** Measures the direct relationship between purchase volume (basket size) and customer abandonment.
*   **Methodological Value:** Groups the entire dataset by Churn Risk Segments (Low, Medium, High Risk based on current recency) and calculates the average item count for each tier. This identifies if bulk-buyers detach from the brand faster than single-item buyers.

```sql
WITH customer_processing AS (
    SELECT
        customer_id,
        CAST(quantity AS SIGNED) AS item_quantity,
        DATEDIFF('2023-03-31', STR_TO_DATE(invoice_date, '%Y-%m-%d')) AS recency_days
    FROM customer_shopping_data_cleaned
),
risk_mapping AS (
    SELECT
        item_quantity,
        CASE
            WHEN recency_days <= 180 THEN 'Low Risk'
            WHEN recency_days <= 365 THEN 'Medium Risk'
            ELSE 'High Risk'
        END AS churn_risk_segment
    FROM customer_processing
)
SELECT
    churn_risk_segment,
    COUNT(*) AS total_customers_in_segment,
    ROUND(AVG(item_quantity), 2) AS avg_items_per_basket
FROM risk_mapping
GROUP BY churn_risk_segment
ORDER BY avg_items_per_basket DESC;
```

*   **Actionable Business Value:** If the *High Risk* segment shows a lower average quantity than active buyers, single-item impulse shoppers are driving the database decay. Marketing must deploy bundle offers (e.g., "Buy 2, Get 1 Free") at checkout to force larger initial baskets. If the quantity is already high, flat monetary discounts must be used instead.

---

### Payment Method Friction Index

*   **Strategic Purpose:** Identifies the correlation between payment channels and transaction-level customer retention friction.
*   **Methodological Value:** Calculates the percentage of consumers per payment channel who are already completely inactive and resting in the "High Risk" zone (>365 days silent) relative to the total customer base of that channel.

```sql
WITH processed_transactions AS (
    SELECT
        customer_id,
        payment_method,
        DATEDIFF('2023-03-31', STR_TO_DATE(invoice_date, '%Y-%m-%d')) AS recency_days
    FROM customer_shopping_data_cleaned
)
SELECT
    payment_method,
    COUNT(*) AS total_acquired_customers,
    ROUND((COUNT(CASE WHEN recency_days > 365 THEN 1 END) / COUNT(*)) * 100, 2) AS payment_friction_index_pct
FROM processed_transactions
GROUP BY payment_method
ORDER BY payment_friction_index_pct DESC;
```

*   **Actionable Business Value:** Pinpoints whether anonymous, non-digital payment methods (like *Cash*) generate a higher rate of permanent customer detachment compared to digital methods (like *Credit Cards*). A high cash friction index signals a broken communication loop at checkouts, dictating the need for localized card-collection campaigns or physical loyalty sign-ups at the register.

---

### Demographic Inactivity Velocity (Age & Gender)

*   **Strategic Purpose:** Maps the exact demographic composition of the decaying customer asset base to identify which cohorts drop out the fastest.
*   **Methodological Value:** Groups consumers into age cohorts and genders, then calculates a forward-looking 90-day velocity by determining exactly how many consumers—and how much gross revenue—will migrate from active windows into the permanent "High Risk" tier if no action is taken.

```sql
WITH demographic_base AS (
    SELECT
        gender,
        CAST(price AS DECIMAL(10,2)) AS invoice_price,
        CASE 
            WHEN age < 30 THEN 'Under 30 (Gen Z)'
            WHEN age BETWEEN 30 AND 50 THEN '30-50 (Millennials / Gen X)'
            ELSE 'Over 50 (Boomers)'
        END AS age_cohort,
        DATEDIFF('2023-03-31', STR_TO_DATE(invoice_date, '%Y-%m-%d')) AS recency_days
    FROM customer_shopping_data_cleaned
)
SELECT
    age_cohort,
    gender,
    COUNT(*) AS total_acquired_base,
    COUNT(CASE WHEN recency_days <= 365 AND (recency_days + 90) > 365 THEN 1 END) AS projected_90d_lost_customers,
    SUM(CASE WHEN recency_days <= 365 AND (recency_days + 90) > 365 THEN invoice_price ELSE 0 END) AS projected_revenue_at_risk
FROM demographic_base
GROUP BY age_cohort, gender
ORDER BY projected_revenue_at_risk DESC;
```

*   **Actionable Business Value:** Quantifies the precise financial leakage rate across age and gender brackets. The CRM team can utilize the output customer lists to execute automated, post-purchase communication tracks (SMS/Email loops) targeted exclusively at the top-loss cohorts exactly 30, 60, and 90 days following their initial invoice date.

---

## Key Findings

- Customer behavior is dominated by one-time purchases.
- Churn evaluation is primarily driven by recency rather than purchase frequency.
- Significant differences exist in customer inactivity levels across shopping malls.
- Transaction values vary substantially across product categories.
- Future customer loss can be approximated through recency-based risk migration.

---

