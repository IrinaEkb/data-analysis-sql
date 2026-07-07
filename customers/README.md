# Customer Shopping Data Analysis

## Project Overview

---

This project analyzes retail shopping transactions across multiple shopping malls.

---

## Business Problem

Management observed that overall revenue remained relatively flat between 2021 and 2022 despite a large volume of customer transactions.

The objective of this analysis was to determine:

* what factors were driving revenue performance;
* which categories contributed to growth or decline;
* whether customer purchasing behavior changed over time;
* which months had the greatest impact on annual results;
* how historical revenue patterns could be used to forecast future performance.

The findings can help prioritize revenue growth opportunities and guide business planning for 2023.

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

## Project Structure

```text
customers/
├── data
│   ├── cleaned
│   │   └── customer_shopping_data_cleaned.csv
│   ├── exports_of_queries
│   │   ├── avg_price_gender.csv
│   │   ├── basket_level.csv
│   │   ├── data_types_in_each_column_before_cast.csv
│   │   ├── for_forecasting_avg_and_total_transaction.csv
│   │   ├── for_forecasting_revenue_by_mall.csv
│   │   ├── for_forecasting_revenue_category.csv
│   │   ├── for_forecasting.csv
│   │   ├── purchases_age_group.csv
│   │   ├── purchases_category_gender.csv
│   │   ├── recency_bucket.csv
│   │   ├── revenue_by_category.csv
│   │   ├── revenue_by_mall.csv
│   │   ├── revenue_by_month.csv
│   │   ├── revenue_by_payment_method.csv
│   │   ├── revenue_by_year.csv
│   │   ├── revenue_category_gender.csv
│   │   ├── total_sales_by_category.csv
│   │   └── transactions_by_mall.csv
│   └── raw
│       └── customer_shopping_data.csv
│
├── docs
│   ├── business_insights
│   │   ├── churn_analysis.md
│   │   ├── customer_retention.md
│   │   └── revenue_analysis_seasonality.md
│   └── data_dictionary
│       └── data_dictionary.md
│
├── sql
│   ├── 01_data_quality_checks.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_eda.sql
│   ├── 04_churn_analysis.sql
│   ├── 05_revenue_forecasting.sql
│   └── 06_customer_retention.sql
│
├── tableau
│   ├── Basket_Size_Distribution_by_Shopping_Mall.png
│   ├── Monthly_Revenue_Trend_2021.png
│   ├── Monthly_Revenue_Trend_2022.png
│   ├── Revenue_by_Category_Across_All_Malls_2021.png
│   ├── Revenue_by_Category_Across_All_Malls_2022.png
│   ├── Revenue_by_Gender_2021.png
│   ├── Revenue_by_Gender_2022.png
│   ├── Revenue_by_Mall_2021.png
│   ├── Revenue_by_Mall_2022.png
│   ├── Revenue_Forecast.png
│   ├── Transactions_By_Mall_2021.png
│   ├── Transactions_By_Mall_2022.png
│   └── Yearly_Revenue_Trend.png
│
└── README.md
```

---

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
### Customer Segmentation by Age and Product Category

This query groups customers by gender and age bands, and calculates purchase frequency across product categories.
It is used to identify which demographic groups are associated with higher purchase volumes and category preferences.

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
This section presents key business insights through interactive dashboards built in Tableau Public. The visualizations are grouped by analytical theme to support revenue, customer, and product analysis.

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

# Revenue Analysis (2021 vs 2022)

---

## 1. Total Revenue

| Year | Total Revenue |
|------|--------------|
| 2021 | 31,316,304.63 |
| 2022 | 31,372,826.18 |

**Change**
- Δ = +56,521.55
- Growth = +0.18%

---

## 2. Transactions & Basket Metrics

| Metric | 2021 | 2022 | Change |
|--------|------|------|--------|
| Transactions | 45,678 | 45,973 | +295 (+0.65%) |
| Avg Basket Size | 686.1 | 682.3 | -3.8 (-0.55%) |
| Revenue per Transaction | 686.0 | 682.8 | -3.2 (-0.47%) |

---

## 3. Category Contribution (2022 vs 2021)

This analysis compares category-level revenue differences between 2022 and 2021 to identify which product groups drove overall revenue changes.

| Category | Revenue Change (2022 vs 2021) |
|----------|-------------------------------|
| Clothing | -294,678.56 |
| Shoes | +136,238.59 |
| Technology | +163,800.00 |
| Cosmetics | +27,323.52 |
| Toys | +15,554.56 |
| Books | +6,756.90 |
| Souvenir | +1,829.88 |
| Food & Beverage | -303.34 |

---

## 4. Core Drivers Breakdown

### Core Decline

The overall revenue decline is primarily driven by:

- Clothing: -294,678.56

Clothing is the main negative contributor and represents the largest driver of the overall revenue decrease.

---

### Growth Drivers

Revenue growth is observed in the following categories:

- Technology: +163,800.00
- Shoes: +136,238.59

---

## 5. ## Clothing Revenue Change by Shopping Mall (2021 vs 2022)

This analysis compares Clothing category revenue across shopping malls to identify where the decline or growth is concentrated.

```sql
SELECT
    shopping_mall,

    SUM(CASE WHEN YEAR(invoice_date) = 2021 THEN price ELSE 0 END) AS revenue_2021,
    SUM(CASE WHEN YEAR(invoice_date) = 2022 THEN price ELSE 0 END) AS revenue_2022,

    SUM(CASE WHEN YEAR(invoice_date) = 2022 THEN price ELSE 0 END)
    - SUM(CASE WHEN YEAR(invoice_date) = 2021 THEN price ELSE 0 END) AS abs_change,

    ROUND(
        (
            SUM(CASE WHEN YEAR(invoice_date) = 2022 THEN price ELSE 0 END)
            - SUM(CASE WHEN YEAR(invoice_date) = 2021 THEN price ELSE 0 END)
        )
        / NULLIF(SUM(CASE WHEN YEAR(invoice_date) = 2021 THEN price ELSE 0 END), 0)
        * 100, 2
    ) AS pct_change

FROM customer_shopping_data_cleaned
WHERE category = 'Clothing'
GROUP BY shopping_mall
ORDER BY abs_change ASC;
```

---

### Results

| Shopping Mall        | Revenue 2021 | Revenue 2022 | Abs Change | % Change |
|----------------------|-------------:|-------------:|------------:|---------:|
| Metrocity            | 2,211,589.60 | 2,113,763.52 | -97,826.08  | -4.42%   |
| Cevahir AVM          | 754,701.20   | 666,177.60   | -88,523.60  | -11.73%  |
| Kanyon               | 2,848,959.52 | 2,779,340.96 | -69,618.56  | -2.44%   |
| Mall of Istanbul     | 2,877,767.20 | 2,828,254.00 | -49,513.20  | -1.72%   |
| Metropol AVM         | 1,469,491.76 | 1,428,080.72 | -41,411.04  | -2.82%   |
| Viaport Outlet       | 709,689.20   | 700,986.88   | -8,702.32   | -1.23%   |
| Emaar Square Mall    | 695,585.44   | 695,885.52   | +300.08     | +0.04%   |
| Forum Istanbul       | 717,191.20   | 721,992.48   | +4,801.28   | +0.67%   |
| Zorlu Center         | 700,386.72   | 722,892.72   | +22,506.00  | +3.21%   |
| Istinye Park         | 1,379,767.84 | 1,413,076.72 | +33,308.88  | +2.41%   |

---

### Key Insights

- The largest absolute declines are concentrated in **Metrocity (-97.8K)** and **Cevahir AVM (-88.5K)**, indicating these malls are the primary drivers of the overall Clothing revenue drop.
- Mid-tier malls such as **Kanyon, Mall of Istanbul, and Metropol AVM** also show consistent but smaller declines, suggesting a broad but moderate downward pressure across major retail locations.
- Several malls show **positive growth**, including **Istinye Park (+33.3K)**, **Zorlu Center (+22.5K)**, and **Forum Istanbul**, which partially offset the overall decline.
- The pattern indicates that the Clothing category decline is **not uniform**, but driven by concentrated underperformance in specific high-volume malls rather than system-wide demand collapse.

---

### Additional Revenue Analysis

➡️ [Revenue Analysis & Seasonality](docs/business_insights/revenue_analysis_seasonality.md)

Includes a detailed comparison of peak revenue months and category-level analysis explaining why revenue was lower in 2022 than in 2021 during those periods.

---

## 6. Key Findings

- Total revenue increased by only 0.18% (+56.5K) despite a 0.65% increase in transactions, indicating that higher sales volume generated only marginal revenue growth. Increasing average customer spend may provide a stronger growth opportunity than relying solely on additional transactions.
- Average basket value declined from 686.1 to 682.3 (-0.55%), suggesting customers spent slightly less per purchase in 2022. Further analysis could identify opportunities for cross-selling, upselling, or promotional bundling.
- The Clothing category declined by 294.7K, making it the largest factor limiting overall revenue growth. Understanding whether this decline was driven by lower demand, reduced purchase frequency, or changing customer preferences could help recover lost category performance.
- Technology (+163.8K) and Shoes (+136.2K) were the strongest-performing categories and accounted for most of the positive revenue change. These categories may represent the most promising areas for future growth initiatives.
- Revenue underperformed in July (-52.9K) and October (-26.6K) compared with the same months in 2021. Since both months remained among the highest-revenue periods of the year, improving performance during peak sales months could have a disproportionate impact on annual revenue growth.

---

## Revenue Time Series Analysis & Baseline Projection

### Monthly Revenue Trend (2021–2022)

- 2021 monthly range: ~2.35M – 2.80M
- 2022 monthly range: ~2.31M – 2.75M

---

### Purpose of Analysis

This analysis evaluates historical revenue patterns and establishes a baseline for expected revenue performance in 2023 based on observed trends in 2021–2022.

The analysis supports:

- identification of revenue trends and seasonality patterns;
- planning and budgeting decisions;
- establishment of baseline expectations for 2023;
- detection of deviations from historical behavior.

---

### Projection Approach

A scenario-based projection was applied using historical revenue patterns.

The model assumes:

- continuation of observed monthly trends;
- stable customer behavior;
- no significant external shocks (e.g., promotions, macroeconomic events);

---

### Revenue Trend and Projection Visualization

![Revenue Trend & Forecast](tableau/Revenue_Forecast.png)

---

