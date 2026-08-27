# Customer Shopping Data Analysis

## Project Overview

---

This project analyzes retail shopping transactions across 10 shopping malls in Istanbul.

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
│   ├── exports_of_queries
│   └── raw
├── docs
│   ├── business_insights
│   └── data_dictionary
├── sql
├── tableau
└── README.md
```

---

# Data Quality & Data Preparation

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

The dataset was standardized for analytical use. The following transformations were applied:
- trimming of text fields
- conversion of numeric fields to proper data types
- conversion of invoice_date to date format
- standardization of values for grouping and aggregation

A cleaned dataset was created and used for analysis.

---

# Data Analysis & Key Insights

The analysis was performed using **99,457 transactions** covering **January 2021 through March 8, 2023**, across **10 shopping malls and 8 product categories**.

## Revenue Performance

Total revenue in the dataset was **$68.55M**.

| Year | Revenue | YoY Change |
|---|---:|---:|
| 2021 | $31.32M | — |
| 2022 | $31.37M | **+0.18%** |
| 2023* | $5.86M | — |

\*2023 contains data only through March 8 and is therefore not comparable with the full-year results.

The main finding is that revenue was **essentially flat between 2021 and 2022**. The business maintained its revenue base, but there was no meaningful annual growth.

![Yearly Revenue Trend](tableau/Yearly_Revenue_Trend.png)

## Where Revenue Comes From

Revenue is highly concentrated in three product categories:

| Category | Revenue |
|---|---:|
| Clothing | $31.08M |
| Shoes | $18.14M |
| Technology | $15.77M |
| Cosmetics | $1.85M |
| Toys | $1.09M |
| Food & Beverage | $0.23M |
| Books | $0.23M |
| Souvenir | $0.17M |

**Clothing, Shoes, and Technology generate approximately 95% of total revenue.**

Revenue is also concentrated across shopping malls. **Mall of Istanbul ($13.85M)** and **Kanyon ($13.71M)** are the two largest revenue contributors, together representing approximately **40% of total mall-level revenue**.

This concentration means that changes in the core categories and leading malls have a disproportionate impact on overall revenue.

![Revenue by Category](tableau/Revenue_by_Category_Across_All_Malls_2021.png)

## Monthly Performance and Seasonality

Although annual revenue was stable, monthly performance varied considerably.

The largest year-over-year declines identified in the analysis occurred in:

| Month | 2021 Revenue | 2022 Revenue | Change |
|---|---:|---:|---:|
| July | $2.80M | $2.75M | **-$52.9K (-1.9%)** |
| October | $2.78M | $2.76M | **-$26.6K (-1.0%)** |

The drivers were different:

- **July:** the largest negative category contribution came from Clothing (**-$81.0K**), followed by Technology (**-$23.1K**).
- **October:** Shoes were the largest negative contributor (**-$91.8K**), while Clothing and Technology increased.

![Monthly Revenue Trend 2021](tableau/Monthly_Revenue_Trend_2021.png)

![Monthly Revenue Trend 2022](tableau/Monthly_Revenue_Trend_2022.png)

This shows that the flat annual result masks meaningful changes in the timing and composition of revenue throughout the year.

## Customer Purchasing Behavior

Transaction-level analysis shows a consistent pattern in the two declining months:

| Metric | July | October |
|---|---:|---:|
| Average transaction value | **+0.4%** | **+0.8%** |
| Transaction volume | **-2.3%** | **-1.7%** |

Average transaction value increased slightly, while the number of transactions decreased.

This suggests that the decline was not driven by customers spending substantially less per transaction. **Transaction volume is therefore an important area for further investigation and potential growth.**

Basket-size analysis provides an additional measure of purchasing behavior and can help identify opportunities to increase items per transaction.

![Basket Size Distribution by Mall](tableau/Basket_Size_Distribution_by_Shopping_Mall.png)

## Key Takeaways

- **Annual revenue remained stable**, increasing only **0.18%** from 2021 to 2022.
- **95% of revenue comes from Clothing, Shoes, and Technology**, making these categories the primary revenue drivers.
- **Mall of Istanbul and Kanyon account for approximately 40% of mall-level revenue**, creating significant concentration in the leading locations.
- **July and October were the key declining months**, but their category drivers were different.
- **Transaction volume decreased while average transaction value increased** during both declining months.
- The strongest potential growth levers are therefore **transaction volume, basket size, core-category performance, and productivity of major shopping malls**.

## Recommendations

The analysis suggests four practical priorities:

1. **Increase transaction volume** through customer acquisition and retention initiatives.
2. **Increase basket size** through cross-selling, bundling, and complementary-product recommendations.
3. **Protect and improve the core categories** of Clothing, Shoes, and Technology.
4. **Investigate category-by-mall performance** to identify where declines are concentrated and where successful practices can be replicated.

The historical monthly patterns can also serve as a baseline for **2023 revenue planning and forecasting**, while recognizing that the available 2023 data covers only the first part of the year.