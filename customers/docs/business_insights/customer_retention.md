# Customer Retention & Revenue-at-Risk Analysis

## Business Question

How can we identify inactive customers and quantify potential revenue loss in the absence of repeat purchase behavior?

The goal of this analysis is to estimate customer retention risk and measure revenue exposure using only transaction-level data.

Specifically, the analysis aims to answer:

- Which customers are at risk of becoming inactive?
- How much revenue is associated with inactive customers?
- How does inactivity vary across segments (time, demographics, locations)?
- Where should retention efforts be prioritized to reduce revenue loss?

---

## Analytical Approach

Due to the dataset structure (one transaction per customer), traditional churn and lifetime-based retention models cannot be applied.

Instead, the analysis uses a **recency-based framework**, where customer inactivity is measured by time since last purchase.

---

## 1. Customer Recency Distribution (Inactivity Baseline)

This analysis measures how long customers have been inactive at the dataset cutoff date.

It establishes the foundation for all retention and risk-based segmentation.

```sql
SELECT
    CASE 
        WHEN DATEDIFF('2023-03-31', invoice_date) <= 90 THEN '0–90 days'
        WHEN DATEDIFF('2023-03-31', invoice_date) BETWEEN 91 AND 180 THEN '91–180 days'
        WHEN DATEDIFF('2023-03-31', invoice_date) BETWEEN 181 AND 365 THEN '181–365 days'
        ELSE '365+ days'
    END AS recency_bucket,
    COUNT(DISTINCT customer_id) AS customers
FROM customer_shopping_data_cleaned
GROUP BY 1
ORDER BY customers DESC;
```

| Recency Bucket   | Customers |
|------------------|----------:|
| 365+ days        | 56,494    |
| 181–365 days     | 23,153    |
| 91–180 days      | 11,173    |
| 0–90 days        | 8,637     |

**Business Value:**
Identifies how quickly the customer base transitions into inactivity and defines the structural risk distribution.
The customer base is heavily concentrated in long inactivity periods.

- The largest segment (56,494 customers) has not made a purchase for more than 365 days, indicating a fully inactive or highly decayed customer group.
- Mid-tier inactivity (181–365 days) also represents a significant share (23,153 customers), showing a large portion of customers are transitioning into long-term inactivity.
- Active customers (0–90 days) form the smallest group (8,637 customers), meaning only a limited portion of the base is currently engaged.
- 
---

## 2. Revenue at Risk by Recency Segment

This measures how much revenue is associated with inactive customers.

```sql
SELECT
    CASE
        WHEN DATEDIFF('2023-03-31', invoice_date) <= 90 THEN 'Active'
        WHEN DATEDIFF('2023-03-31', invoice_date) BETWEEN 91 AND 180 THEN 'At Risk'
        WHEN DATEDIFF('2023-03-31', invoice_date) BETWEEN 181 AND 365 THEN 'High Risk'
        ELSE 'Critical Risk'
        END AS risk_segment,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(price) AS revenue_2022
FROM customer_shopping_data_cleaned
WHERE YEAR(invoice_date) = 2022
GROUP BY 1;
```

This is revenue base for 2022 used to project 2023 risk.

| Risk Segment   | Customers | Revenue (2022) |
|----------------|----------:|---------------:|
| Active         | 113       | 75,754.29      |
| At Risk        | 11,173    | 7,714,820.08   |
| Critical Risk  | 11,112    | 7,612,904.87   |
| High Risk      | 23,153    | 15,969,346.94  |

**Business Value:**
Quantifies financial exposure across customer inactivity levels and prioritizes retention efforts.
The 2022 revenue base shows a strong concentration of revenue in customers already positioned in higher risk segments.

- **High Risk customers contribute the largest share of revenue (15.97M)**, indicating that a significant portion of 2022 performance is dependent on customers who are expected to become inactive under a 90-day forward projection.
- **At Risk and Critical Risk segments together account for ~15.33M in revenue**, which represents the most vulnerable portion of the customer base from a retention perspective.
- **Active customers contribute only 75.7K**, suggesting very limited revenue is generated from recently engaged customers within the defined 90-day window.
- 
---

## 3. Basket Behavior by Risk Segment

This analysis evaluates whether customer spending behavior differs by inactivity level.

```sql
SELECT
    CASE
        WHEN DATEDIFF('2023-03-31', invoice_date) <= 90 THEN 'Active'
        WHEN DATEDIFF('2023-03-31', invoice_date) BETWEEN 91 AND 180 THEN 'At Risk'
        ELSE 'High Risk'
        END AS risk_segment,

    ROUND(AVG(quantity), 2) AS avg_quantity,
    ROUND(AVG(price), 2) AS avg_spend

FROM customer_shopping_data_cleaned
WHERE YEAR(invoice_date) = 2022

GROUP BY 1
ORDER BY avg_spend DESC;
```
| Risk Segment | Avg Quantity | Avg Spend |
|--------------|-------------:|----------:|
| At Risk      | 3.02         | 690.49    |
| High Risk    | 3.01         | 688.23    |
| Active       | 2.88         | 670.39    |

**Business Value:**
Helps determine whether high-value baskets are more or less likely to become inactive.
Average basket size and spending are almost identical across all risk segments.

This indicates that:

Customer inactivity is not driven by basket size or purchase value
High-value and low-value baskets behave similarly in terms of retention risk
Churn in this dataset is likely not behaviorally driven by transaction size, but rather by external or structural factors (e.g., lack of repeat purchase opportunities in the dataset)

---

## 4. Revenue Exposure by Shopping Mall

This identifies which locations contribute most to inactivity-related revenue exposure.

```sql
SELECT
    shopping_mall,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(price) AS total_revenue
FROM customer_shopping_data_cleaned
WHERE YEAR(invoice_date) = 2022
GROUP BY shopping_mall
ORDER BY total_revenue DESC;
```
Revenue by Shopping Mall (2022)

| Shopping Mall        | Customers | Total Revenue |
|---------------------|----------:|--------------:|
| Mall of Istanbul    | 9,202     | 6,360,273.56  |
| Kanyon              | 9,153     | 6,239,315.43  |
| Metrocity           | 6,890     | 4,737,607.54  |
| Istinye Park        | 4,521     | 3,113,886.80  |
| Metropol AVM        | 4,613     | 3,102,653.04  |
| Zorlu Center        | 2,281     | 1,619,440.86  |
| Viaport Outlet      | 2,220     | 1,580,092.27  |
| Cevahir AVM         | 2,231     | 1,574,997.67  |
| Forum Istanbul      | 2,281     | 1,557,865.06  |
| Emaar Square Mall   | 2,159     | 1,486,693.95  |

**Business Value:**

Revenue is highly concentrated in a small number of high-performing shopping malls.

- Mall of Istanbul and Kanyon are the dominant revenue drivers, each generating over 6M in total sales and significantly outperforming all other locations.
- A clear performance gap exists between top-tier malls (6M+ revenue range) and the rest of the portfolio, where revenue drops sharply to the 3M–4M range and below.
- Lower-tier malls such as Emaar Square Mall, Forum Istanbul, and Cevahir AVM contribute comparatively smaller revenue volumes (~1.5M–1.6M), indicating limited individual impact on total business performance.

This distribution shows that overall revenue is strongly dependent on a small number of key retail locations.

This implies that:

- Optimization of top-performing malls will have the highest impact on total revenue
- Mid-tier malls represent scalable growth opportunities through targeted improvements
- Lower-performing malls should be treated as efficiency or expansion candidates rather than core revenue drivers

---

## 5. Demographic Risk Segmentation

This evaluates inactivity patterns across customer demographics.

```sql
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30–50'
        ELSE '50+'
        END AS age_group,

    gender,

    COUNT(DISTINCT customer_id) AS customers,
    SUM(price) AS total_revenue,
    ROUND(SUM(price) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer

FROM customer_shopping_data_cleaned
WHERE YEAR(invoice_date) = 2022

GROUP BY 1,2
ORDER BY total_revenue DESC;
```
Revenue by Age Group and Gender (2022)

| Age Group | Gender | Customers | Total Revenue | Revenue per Customer |
|------------|--------|----------:|--------------:|----------------------:|
| 30–50      | Female | 11,025    | 7,619,761.81  | 691.13 |
| 50+        | Female | 9,823     | 6,733,642.71  | 685.50 |
| 30–50      | Male   | 7,455     | 5,189,953.61  | 696.17 |
| 50+        | Male   | 6,668     | 4,629,539.46  | 694.29 |
| Under 30   | Female | 6,344     | 4,377,735.73  | 690.06 |
| Under 30   | Male   | 4,236     | 2,822,192.86  | 666.24 |

**Business Value:**

Revenue is broadly distributed across age and gender segments, with no single cohort dominating overall performance.

- The 30–50 Female segment represents the highest revenue contribution and customer base, making it the core commercial demographic.
- Revenue per customer remains highly consistent across most segments (~685–696), indicating that customer value is stable and not significantly influenced by age or gender.
- The Under 30 Male segment shows the lowest revenue per customer, suggesting a comparatively weaker monetization efficiency in this cohort.

This structure indicates that overall revenue performance is primarily driven by **customer volume rather than differences in spending behavior across demographic groups**.

As a result:

- Scaling high-volume segments (especially 30–50 Female) will have the strongest impact on revenue growth
- Underperforming segments (Under 30 Male) present opportunities for targeted uplift in customer value
- Demographic segmentation is more useful for targeting and marketing optimization than for identifying fundamentally different spending behaviors

---

## Key Insights & Forecasting Implications

### Key Quantitative Findings:
- Over **56K customers (Critical Risk segment)** already represent the largest share of both customer base and revenue exposure.
- Basket size remains nearly identical across all risk segments (~3 items per transaction and ~689 average spend), confirming behavioral consistency.
- Revenue is heavily concentrated in a small number of segments and locations, with Mall of Istanbul and Kanyon accounting for the highest absolute exposure.

### Forecasting Insight:
Using a 90-day forward recency projection, a significant portion of customers currently classified as Active or At Risk are expected to migrate into higher risk categories, increasing overall revenue exposure in the inactive base.

This allows estimation of:
- **future inactive customer volume**
- **future revenue at risk under no re-engagement scenario**
- **priority segments for retention interventions**

### Business Implication:
Retention strategy should not focus on changing purchase behavior (which is stable), but on **preventing time-based customer decay through re-engagement mechanisms within the first 90–180 days after purchase**.

---

## 90-Day Customer Risk Projection (Scenario Simulation)

This analysis estimates how customer risk levels would change if no additional purchases occur over the next 90 days.

```sql
SELECT
    CASE
        WHEN DATEDIFF('2023-03-31', invoice_date) + 90 > 365 THEN 'Future High Risk'
        WHEN DATEDIFF('2023-03-31', invoice_date) + 90 BETWEEN 181 AND 365 THEN 'Future At Risk'
        ELSE 'Future Active'
        END AS future_risk,

    COUNT(DISTINCT customer_id) AS customers,
    SUM(price) AS revenue

FROM customer_shopping_data_cleaned
WHERE YEAR(invoice_date) = 2022

GROUP BY 1
ORDER BY revenue DESC;
```

Future Risk Segmentation (90-Day Scenario Simulation)

| Future Risk Segment | Customers | Revenue        |
|---------------------|----------:|---------------:|
| Future At Risk      | 23,064    | 15,965,902.10  |
| Future High Risk    | 22,374    | 15,331,169.79  |
| Future Active       | 113       | 75,754.29      |

**Business Value:**

The 90-day scenario simulation shows that future revenue is heavily concentrated in customers who are expected to move into inactivity over time.

- The **Future At Risk segment represents the largest revenue pool (15.97M)**, indicating a significant portion of customers are in a transitional state where retention actions can still prevent revenue loss.
- The **Future High Risk segment is nearly equal in scale (15.33M)**, showing that a large share of revenue is already structurally exposed to long-term inactivity.
- The **Future Active segment is minimal (75.7K)**, meaning only a very small portion of revenue is associated with customers expected to remain stable without intervention.

This distribution highlights that the majority of future revenue is not stable, but positioned within segments that are expected to deteriorate without retention actions.

As a result:

- The highest business impact comes from converting **Future At Risk customers into Future Active**
- Without intervention, a large portion of revenue will gradually shift into the High Risk category
- Retention strategy should prioritize early-stage intervention rather than reacting after customers become inactive
