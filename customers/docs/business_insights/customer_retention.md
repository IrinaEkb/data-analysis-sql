# Recency-Based Customer Retention Strategy & Revenue-at-Risk Analysis

## 1. Business Problem & Analytical Logic
The core discovery of this analysis reveals a critical structural issue: **100% of the customers in this dataset are "One-and-Done" buyers.** Every single customer record stops after exactly one invoice.

### The Leaky Bucket Reality
In real-world retail analytics, customers do not limit themselves to a single lifetime purchase because they are forbidden from buying again. They stop buying because **the business is doing nothing to bring them back.**

In high-traffic, physical retail environments like *Kanyon, Mall of Istanbul,* and *Cevahir AVM*, repeat foot traffic is a natural expectation. A complete absence of repeat invoices points directly to a total failure in post-purchase engagement. The business is trapped in an expensive, high-risk cycle of relying entirely on primary customer acquisition (CAC) while letting existing buyers permanently fade into inactivity.

---

## 2. Business Objective: The Re-Engagement Framework
Because individual historical behavior patterns are absent, standard predictive churn models cannot be applied. Instead, this project pivots to an **Asset Exposure and Lifecycle Framework**.

The operational business objective is to **design and execute an automated, recency-driven marketing trigger system.** We treat the single customer invoice as a depreciating asset. The goal is to isolate target customer cohorts based on their exact days of inactivity and inject a second-purchase incentive before they migrate completely out of the brand’s ecosystem.

---

## 3. Data Strategy & Execution Methodology

### Which Data Fields Are Used and Why?
We utilize the existing transaction schema to build the strategy without needing external financial data (like cost margins or acquisition spend):
*   `customer_id` & `invoice_no`: To isolate and track unique consumer identities.
*   `invoice_date`: The single most critical anchor point. It serves as the baseline to measure exactly how long a customer has been silent.
*   `shopping_mall` & `category`: Used to segment the financial scale of the risk, identifying exactly *where* and *in what product lines* the highest volume of capital is stagnating.
*   `age` & `gender`: Used to build precise demographic personas for targeted marketing message customization.

### Operational Step 1: Customer Recency Segmentation (Core Retention Exposure)

To identify customers at risk of churn, we calculate recency based on the number of days since their last purchase. The reference date is set to the dataset cutoff (`2023-03-31`).

This step allows us to segment customers into retention stages without requiring repeat purchase history.

```sql
WITH customer_recency AS (
    SELECT
        customer_id,
        price,
        DATEDIFF('2023-03-31', invoice_date) AS current_inactivity_days
    FROM customer_shopping_data_cleaned
)

SELECT
    CASE
        WHEN current_inactivity_days BETWEEN 30 AND 59 THEN 'Day-30 (Warm Stage)'
        WHEN current_inactivity_days BETWEEN 60 AND 89 THEN 'Day-60 (Cooling Stage)'
        WHEN current_inactivity_days BETWEEN 90 AND 179 THEN 'Day-90 (Critical Stage)'
        END AS retention_stage,

    COUNT(DISTINCT customer_id) AS customer_count,
    SUM(price) AS revenue_at_risk

FROM customer_recency
WHERE current_inactivity_days BETWEEN 30 AND 179
GROUP BY 1
ORDER BY revenue_at_risk DESC;
``` 
---

### Operational Step 2: Customer Segmentation for Targeted Re-Engagement

After identifying high-risk retention stages, we further segment customers by demographic attributes to support targeted marketing campaigns.

This helps the marketing team understand which customer groups contribute most to inactive revenue.

```sql
WITH customer_recency AS (
    SELECT
        customer_id,
        gender,
        age,
        price,
        DATEDIFF('2023-03-31', invoice_date) AS current_inactivity_days
    FROM customer_shopping_data_cleaned
),

segmented_customers AS (
    SELECT 
        CASE 
            WHEN current_inactivity_days BETWEEN 30 AND 59 THEN 'Day-30 (Warm Stage)'
            WHEN current_inactivity_days BETWEEN 60 AND 89 THEN 'Day-60 (Cooling Stage)'
            WHEN current_inactivity_days BETWEEN 90 AND 179 THEN 'Day-90 (Critical Stage)'
        END AS retention_stage,

        CASE 
            WHEN age < 30 THEN 'Under 30'
            WHEN age BETWEEN 30 AND 50 THEN '30–50'
            ELSE 'Over 50'
        END AS age_cohort,

        gender,
        price
    FROM customer_recency
    WHERE current_inactivity_days BETWEEN 30 AND 179
)

SELECT
    retention_stage,
    age_cohort,
    gender,
    COUNT(DISTINCT customer_id) AS customer_count,
    SUM(price) AS revenue_at_risk
FROM segmented_customers
GROUP BY 1,2,3
ORDER BY revenue_at_risk DESC;
```

### Operational Step 3: Differentiated Budget Allocation
Marketing resources are finite. To determine exactly how to distribute the retention budget across different physical retail locations, we calculate the absolute volume of revenue shifting into the permanent "High Risk" zone (>365 days of inactivity) within the next 90 days.

```sql
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
```

---

## 4. Key Strategic Findings & Recommendations

### Key Insights
*   **The Lifetime Value Bottleneck:** The current business framework suffers from a hard ceiling on Customer Lifetime Value (CLV) because it treats the transaction checkout as the *end* of the relationship rather than the *beginning*.
*   **Localized Inactivity Velocity:** Customer decay is highly dependent on location. The budget allocation share index highlights that a tiny volume of high-ticket transactions at premium malls contributes to the same financial risk profile as massive customer volumes at lower-tier malls.

### Business Strategy
1.  **Deploy the Trigger Loop Immediately:** Hand the output of the Day-30, Day-60, and Day-90 customer lists directly to the CRM/Marketing department. Automate digital re-engagement campaigns tailored to the dominant age and gender cohorts found in each bucket.
2.  **Redistribute Marketing Spend via the Share Index:** Use the calculated `budget_allocation_share_pct`. If a single location like *Mall of Istanbul* or *Kanyon* represents 35% of the total revenue-at-risk, it must automatically receive 35% of the retention budget to deploy high-value localized incentives.
3.  **Implement Check-Out Disruptors:** To permanently alter this data trend for future analysis cycles, implement a physical "Bounce-Back" campaign at mall registers. Providing vouchers that are only valid for a second purchase within a strict 45-day window will intentionally break the one-time purchase anomaly.
