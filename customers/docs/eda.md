# Customer Shopping Data Analysis

## Dataset Overview

The dataset covers the period from **January 1, 2021 to March 8, 2023**.

| Metric | Value |
|---|---:|
| Total records | 99,457 |
| Unique customers | 99,457 |
| Unique transactions | 99,457 |
| Product categories | 8 |
| Total revenue | **$68.55M** |

Each record represents a unique customer transaction in the cleaned dataset.

---

## Revenue Performance by Year

| Year | Revenue |
|---|---:|
| 2021 | $31,316,304.63 |
| 2022 | $31,372,826.18 |
| 2023* | $5,862,235.10 |
| **Total** | **$68,551,365.91** |

\*2023 includes data only through **March 8, 2023**.

Revenue remained essentially flat between 2021 and 2022, increasing by approximately **$56.5K (+0.2%)**.

This indicates that the business maintained its revenue base year over year, but did not achieve meaningful annual growth.

The 2023 figure should not be directly compared with the full-year 2021 and 2022 results because 2023 contains only the first 67 days of the year.

---

## Monthly Revenue Trend — 2021

![Monthly Revenue Trend 2021](/customers/tableau/Monthly_Revenue_Trend_2021.png)

The 2021 monthly trend provides the baseline for evaluating seasonality and month-to-month changes in revenue.

The monthly view shows that annual revenue stability does not mean that performance was identical throughout the year. Individual months experienced noticeable fluctuations.

---

## Monthly Revenue Trend — 2022

![Monthly Revenue Trend 2022](/customers/tableau/Monthly_Revenue_Trend_2022.png)

The 2022 monthly trend provides the year-over-year comparison with 2021.

Although total annual revenue was almost unchanged, monthly performance shifted throughout the year. This suggests that the flat annual result masks meaningful differences in performance between individual months.

---

## Revenue by Product Category — 2021

![Revenue by Category 2021](/customers/tableau/Revenue_by_Category_Across_All_Malls_2021.png)

Clothing was the dominant revenue category in 2021, followed by Shoes and Technology.

The category mix was highly concentrated, meaning that changes in the largest categories had a significant impact on total business performance.

---

## Revenue by Product Category — 2022

![Revenue by Category 2022](/customers/tableau/Revenue_by_Category_Across_All_Malls_2022.png)

The 2022 category mix remained concentrated in the same major product categories.

### Revenue by Category — Full Dataset

| Category | Revenue |
|---|---:|
| Clothing | $31,075,684.64 |
| Shoes | $18,135,336.89 |
| Technology | $15,772,050.00 |
| Cosmetics | $1,848,606.90 |
| Toys | $1,086,704.64 |
| Food & Beverage | $231,568.71 |
| Books | $226,977.30 |
| Souvenir | $174,436.83 |

Clothing, Shoes, and Technology generated approximately **$64.98M**, representing about **95% of total revenue** across the dataset.

This makes these three categories the primary drivers of overall revenue performance.

---

## Revenue by Shopping Mall — 2021

![Revenue by Mall 2021](/customers/tableau/Revenue_by_Mall_2021.png)

Revenue was concentrated among a relatively small number of shopping malls.

**Mall of Istanbul and Kanyon** were the two largest revenue contributors, followed by **Metrocity** and **Metropol AVM**.

This concentration makes the performance of the leading malls particularly important to overall revenue.

---

## Revenue by Shopping Mall — 2022

![Revenue by Mall 2022](/customers/tableau/Revenue_by_Mall_2022.png)

The 2022 mall distribution remained concentrated among the leading locations.

### Revenue by Shopping Mall — Full Dataset

| Shopping Mall | Revenue |
|---|---:|
| Mall of Istanbul | $13,851,737.62 |
| Kanyon | $13,710,755.24 |
| Metrocity | $10,249,980.07 |
| Metropol AVM | $6,937,992.99 |
| Istinye Park | $6,717,077.54 |
| Zorlu Center | $3,509,649.02 |
| Cevahir AVM | $3,433,671.84 |
| Viaport Outlet | $3,414,019.46 |
| Emaar Square Mall | $3,390,408.31 |
| Forum Istanbul | $3,336,073.82 |

Mall of Istanbul and Kanyon generated approximately **$27.56M combined**, or about **40% of total revenue**.

The two largest malls therefore represent a significant share of the revenue base.

> **Important:** The top two malls do **not** generate more revenue than the bottom five malls combined. Therefore, the correct conclusion is revenue concentration in the leading malls, not that the top two outperform the bottom five combined.

---

## Transactions by Shopping Mall — 2021

![Transactions by Mall 2021](/customers/tableau/Transactions_By_Mall_2021.png)

Transaction volume was also concentrated among the leading shopping malls.

### 2021 Transactions

| Shopping Mall | Transactions |
|---|---:|
| Mall of Istanbul | 9,026 |
| Kanyon | 8,946 |
| Metrocity | 6,856 |
| Metropol AVM | 4,679 |
| Istinye Park | 4,419 |
| Cevahir AVM | 2,365 |
| Zorlu Center | 2,330 |
| Viaport Outlet | 2,286 |
| Forum Istanbul | 2,253 |
| Emaar Square Mall | 2,222 |
| **Total across listed malls** | **45,382** |

Mall of Istanbul and Kanyon together generated **17,972 transactions**, making them the two highest-volume shopping malls in 2021.

---

## Transactions by Shopping Mall — 2022

![Transactions by Mall 2022](/customers/tableau/Transactions_By_Mall_2022.png)

The 2022 transaction distribution shows a similar pattern to the revenue distribution.

The leading malls account for a substantial share of transaction activity, while the lower-volume malls operate at considerably smaller transaction levels.

This suggests that mall-level revenue differences are closely related to differences in transaction volume.

---

## Yearly Revenue Trend

![Yearly Revenue Trend](/customers/tableau/Yearly_Revenue_Trend.png)

The yearly trend highlights the main business finding:

> **Revenue was essentially flat from 2021 to 2022.**

| Year | Revenue | YoY Change |
|---|---:|---:|
| 2021 | $31.32M | — |
| 2022 | $31.37M | **+0.2%** |

The business maintained its revenue level, but there was no meaningful year-over-year growth.

The key management question is therefore not simply how to maintain revenue, but how to generate additional revenue from the existing customer, category, and mall base.

---

## Revenue by Gender — 2021

![Revenue by Gender, 2021](/customers/tableau/Revenue_by_Gender_2021.png)

The 2021 gender analysis shows the relative contribution of male and female customers to revenue.

Average transaction price was very similar between the two groups:

| Gender | Average Price |
|---|---:|
| Female | $688.14 |
| Male | $690.92 |

The difference is only approximately **$2.78**, suggesting that gender is not a major differentiator in average transaction value.

---

## Revenue by Gender — 2022

![Revenue by Gender, 2022](/customers/tableau/Revenue_by_Gender_2022.png)

The 2022 gender analysis provides a year-over-year view of customer revenue contribution.

The gender results should be interpreted together with transaction volume rather than assuming that differences in total revenue represent materially different spending behavior.

The underlying average price data shows that male and female customers have very similar average transaction values.

---

## Basket Size Distribution by Shopping Mall

![Basket Size Distribution by Mall](/customers/tableau/Basket_Size_Distribution_by_Shopping_Mall.png)

The basket-size analysis examines the number of items purchased within a transaction across shopping malls.

Basket size provides an additional perspective on customer behavior beyond revenue and transaction volume.

This metric can help identify opportunities to increase **items per transaction** at locations where customer traffic is already established.

---

## Key Business Findings

### Revenue is stable, but not growing

2021 revenue was **$31.32M**, compared with **$31.37M in 2022**.

The **0.2% increase** indicates a stable revenue base rather than meaningful growth.

### Revenue is highly concentrated in three categories

**Clothing, Shoes, and Technology account for approximately 95% of total revenue.**

These categories should receive the greatest attention when evaluating changes in overall revenue performance.

### Revenue is concentrated among leading malls

**Mall of Istanbul and Kanyon account for approximately 40% of total revenue.**

Their performance therefore has a disproportionate impact on the overall business.

### Transaction volume follows a similar mall pattern

The highest-revenue malls are also among the highest-volume malls.

This indicates that **transaction volume is an important component of mall-level revenue performance**.

### Gender differences in average spend are small

Average transaction price is approximately **$688 for female customers and $691 for male customers**.

Gender therefore does not appear to be a major driver of differences in average transaction value.

### Basket size provides a potential growth lever

Increasing the number of items purchased per transaction represents a potential way to increase revenue without relying entirely on acquiring additional customers.

---

## Recommendations

### Focus on the core revenue categories

Prioritize **Clothing, Shoes, and Technology**, which together represent approximately **95% of total revenue**.

Small improvements in these categories can have a much larger impact on total revenue than changes in the smaller categories.

### Improve productivity at the largest malls

Mall of Istanbul and Kanyon represent approximately **40% of total revenue**.

Performance initiatives at these locations can therefore have a meaningful impact on the overall business.

### Increase basket size

Use the basket-size analysis to identify locations where customers already generate meaningful traffic but purchase relatively few items per transaction.

Potential initiatives include cross-selling, product bundling, and complementary-product recommendations.

### Investigate monthly volatility

Annual revenue was almost flat, but the monthly trends show meaningful fluctuations.

Management should investigate the operational or commercial factors behind the strongest and weakest months rather than relying only on annual totals.

### Protect the existing revenue base while pursuing growth

The data indicates a stable but mature revenue base.

The most practical growth strategy is therefore to combine **higher basket value, stronger performance in core categories, and improved productivity at major malls** rather than relying exclusively on additional transaction volume.