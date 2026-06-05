# Customer Shopping Data Analysis

## Project Overview

---

This project analyzes retail shopping transactions across multiple shopping malls using SQL and Tableau.

---

The project includes:

### Data Quality & Preparation
Data validation, cleaning, and standardization.

### Business Analysis
Revenue, customer, product, mall, and time-series analysis.

### Customer Churn Forecasting
Recency-based customer segmentation and churn risk forecasting.

---

## Customer shopping data

- File Name: `customer_shopping_data.csv`
- File Size: 7.5 MB
- Total Records: 99457

---
# Tools Used

- SQL (MySQL)
- Tableau Public
- CSV files

---

# Dataset Information

Main columns used in the analysis:

| Column Name | Description                   |
|---|-------------------------------|
| invoice_no | unique transaction identifier |
| customer_id | unique customer identifier    |
| gender | customer gender               |
| age | customer age                  |
| category | purchased product category    |
| quantity | number of purchased items     |
| price | transaction amount            |
| payment_method | payment type used             |
| invoice_date | transaction date              |
| shopping_mall | name of shopping mall         |


# Data Quality & Data Preparation

## Data Quality Checks

The dataset was checked for data integrity issues that could affect analysis.

The following checks were performed:
- null values across all columns
- duplicate records (full row and invoice-level)
- empty strings in text fields
- leading and trailing spaces
- hidden or control characters
- data type consistency
- invalid values in numeric fields (price, quantity, age)
- date format consistency and parsing issues

No critical data quality issues were identified.

---

## Data Preparation

The dataset was standardized for analytical use.

The following transformations were applied:
- trimming of text fields
- conversion of numeric fields to proper data types
- conversion of invoice_date to date format
- standardization of values for grouping and aggregation

A cleaned dataset was created and used for analysis.

---

## Exploratory Data Analysis (EDA)

The dataset was analyzed to understand business performance across sales, products, customers, and time.

The analysis covered:

### Revenue
- total revenue
- revenue trends over time (monthly, yearly)
- revenue by shopping mall
- revenue by product category
- revenue by payment method

### Transactions
- total number of transactions
- transaction trends over time
- distribution of transaction values

### Products
- top categories by revenue and quantity
- category performance comparison

### Customers
- revenue by gender
- age-based spending behavior
- category preferences by customer segments
---
### For instance, 
```sql
select
    gender,
    case
        when age between 18 and 25 then '18-25'
        when age between 26 and 35 then '26-35'
        when age between 36 and 45 then '36-45'
        when age between 46 and 60 then '46-60'
        else '60+'
        end as age_group,
    category,
    count(*) as total_purchases_by_age_group
from customer_shopping_data_cleaned
group by
    gender,
    age_group,
    category
order by
    gender,
    age_group,
    total_purchases_by_age_group desc; 
    
```
---

# Tableau Visualizations

---

## Monthly Revenue Trend, 2021

![Monthly Revenue Trend 2021](tableau/Monthly_Revenue_Trend_2021.png)

---

## Monthly Revenue Trend, 2022

![Monthly Revenue Trend 2022](tableau/Monthly_Revenue_Trend_2022.png)

---

## Revenue by Product Category, 2021

![Revenue by Category 2021](tableau/Revenue_by_Category_Across_All_Malls_2021.png)

---

## Revenue by Product Category, 2022

![Revenue by Category 2022](tableau/Revenue_by_Category_Across_All_Malls_2022.png)

---

## Revenue by Shopping Mall, 2021

![Revenue by Mall 2021](tableau/Revenue_by_Mall_2021.png)

---

## Revenue by Shopping Mall, 2022

![Revenue by Mall 2022](tableau/Revenue_by_Mall_2022.png)

---

## Transactions by Shopping Mall, 2021

![Transactions by Mall 2021](tableau/Transactions_By_Mall_2021.png)

---

## Transactions by Shopping Mall, 2022

![Transactions by Mall 2022](tableau/Transactions_By_Mall_2022.png)

---

## Yearly Revenue Trend

![Yearly Revenue Trend](tableau/Yearly_Revenue_Trend.png)

---

## Revenue by Gender, 2021

![Revenue by Gender, 2021](tableau/Revenue_by_Gender_2021.png)

---

## Revenue by Gender, 2022

![Revenue by Gender, 2021](tableau/Revenue_by_Gender_2022.png)

---

## Basket Size Distribution by Shopping Mall

![Basket Size Distribution by Mall](tableau/Basket_Size_Distribution_by_Shopping_Mall.png)

---
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

##  Revenue Time Series & Forecasting

### Monthly Revenue Data Overview

The dataset includes monthly aggregated revenue from January 2021 to March 2023:

2021-01-01 → 2,656,422.78  
2021-02-01 → 2,358,636.34  
2021-03-01 → 2,618,434.14  
...
2023-03-01 → 683,721.31 (partial month)

---

### Forecasting Method

A scenario-based time series forecasting approach was applied.

The model assumes:
- continuation of historical monthly patterns
- no structural changes in customer behavior
- no external shocks (promotions, macroeconomic events)

Forecast is derived using trend extrapolation in Tableau based on historical monthly revenue series.

---

### Tableau Visualization

Revenue trend and forecast visualization:

![Revenue Trend & Forecast](tableau/Revenue_Forecast.png)

---

### Key Revenue Insights

- February consistently shows the lowest revenue across years.
- July and October are the strongest revenue months.
- September also shows relatively lower performance compared to peak months.
- Revenue remains stable overall, with fluctuations driven mainly by seasonality rather than growth trend.

---

