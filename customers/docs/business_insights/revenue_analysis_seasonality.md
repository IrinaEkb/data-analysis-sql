# Revenue Seasonality Insights

## Business Objective & Problem Framing

The objective of this analysis is to understand how revenue performance changed between 2021 and 2022, with particular attention to the two months that showed the largest year-over-year declines in the analysis: **July and October**.

The analysis examines three dimensions of performance:

* Product category
* Shopping mall
* Transaction behavior

The goal is to determine **where revenue declined and what measurable changes accompanied those declines**, while avoiding assumptions about external factors that are not contained in the dataset.

---

## Annual Revenue

| Year |        Revenue |           YoY Change |
| ---- | -------------: | -------------------: |
| 2021 | $31,316,304.63 |                    — |
| 2022 | $31,372,826.18 | +$56,521.55 (+0.18%) |

Annual revenue was essentially flat between 2021 and 2022.

The increase of **$56.5K represents only 0.18%**, indicating that the overall revenue base remained stable rather than experiencing meaningful year-over-year growth.

However, annual stability did not mean that performance was uniform throughout the year.

Two important months experienced year-over-year declines:

| Month   |  2021 Revenue |  2022 Revenue |                  Change |
| ------- | ------------: | ------------: | ----------------------: |
| July    | $2,802,468.58 | $2,749,554.99 | **-$52,913.59 (-1.9%)** |
| October | $2,782,418.40 | $2,755,839.69 | **-$26,578.71 (-1.0%)** |

These monthly changes provide the basis for a more detailed investigation of category, location, and transaction-level performance.

---

## Key Business Questions

The analysis focuses on four questions:

* Which product categories contributed most to the July and October declines?
* Which shopping malls experienced the largest changes?
* Did average transaction value increase or decrease?
* Did the number of transactions change alongside monthly revenue?

The available data can identify these measurable relationships, but it does not directly explain external causes such as promotions, inventory availability, customer traffic, holidays, or competitive activity.

---

# Seasonal Revenue Pattern

## Monthly Revenue — 2021

![Monthly Revenue Trend 2021](/customers/tableau/Monthly_Revenue_Trend_2021.png)

The 2021 monthly revenue trend provides the baseline for comparing monthly performance in 2022.

## Monthly Revenue — 2022

![Monthly Revenue Trend 2022](/customers/tableau/Monthly_Revenue_Trend_2022.png)

The 2022 trend shows that annual revenue remained stable while individual months performed differently from the previous year.

July and October both remained high-revenue months, but revenue in each month was lower than in 2021.

This indicates that annual revenue stability was accompanied by **changes in the timing and distribution of revenue across months**.

The data identifies the months where performance changed, but does not establish external reasons for those changes.

---

# July 2022 Revenue Decline

July revenue decreased by:

**-$52,913.59 (-1.9%)**

The July decline can be examined through category performance, mall performance, and transaction behavior.

---

## Category Performance in July

### July 2021 vs. July 2022

| Category        |      Change | Change % |
| --------------- | ----------: | -------: |
| Clothing        | -$81,021.60 |    -6.1% |
| Technology      | -$23,100.00 |    -3.6% |
| Toys            |  -$3,189.76 |    -7.2% |
| Cosmetics       |  -$2,968.18 |    -4.2% |
| Shoes           | +$56,415.98 |    +8.2% |
| Books           |    +$954.45 |   +10.6% |
| Food & Beverage |    +$230.12 |    +2.6% |
| Souvenir        |    -$234.60 |    -3.6% |

The largest negative change came from **Clothing (-$81.0K)**, followed by **Technology (-$23.1K)**.

Together, Clothing and Technology declined by approximately:

**-$104.1K**

The decline was partially offset by stronger performance in Shoes:

**+$56.4K**

Other categories had relatively small changes compared with the movements in Clothing, Technology, and Shoes.

### What does this tell us?

The July decline was **not broad-based across all categories**.

The largest negative changes were concentrated in Clothing and Technology, while Shoes generated a substantial positive offset.

This means that the overall July decline resulted from the balance between several large category movements rather than from every category performing worse.

The most important category to investigate further is **Clothing**, followed by Technology.

The next analytical step would be to examine these categories by shopping mall and transaction volume to determine where the decline occurred.

---

# Shopping Mall Performance in July

![Revenue by Mall 2021](/customers/tableau/Revenue_by_Mall_2021.png)

![Revenue by Mall 2022](/customers/tableau/Revenue_by_Mall_2022.png)

### July 2021 vs. July 2022

| Shopping Mall     |      Change | Change % |
| ----------------- | ----------: | -------: |
| Istinye Park      | -$79,189.18 |   -24.5% |
| Emaar Square Mall | -$49,652.91 |   -28.0% |
| Cevahir AVM       | -$15,630.65 |   -10.8% |
| Metrocity         |  -$3,518.86 |    -0.9% |
| Forum Istanbul    |    +$539.58 |    +0.4% |
| Zorlu Center      |  +$2,131.10 |    +1.5% |
| Metropol AVM      | +$12,414.32 |    +5.2% |
| Kanyon            | +$18,011.29 |    +3.4% |
| Mall of Istanbul  | +$35,388.26 |    +6.6% |
| Viaport Outlet    | +$26,593.46 |   +18.2% |

The largest negative changes occurred at:

* **Istinye Park: -$79.2K**
* **Emaar Square Mall: -$49.7K**
* **Cevahir AVM: -$15.6K**

These declines were partially offset by increases at several other malls, including:

* **Mall of Istanbul: +$35.4K**
* **Viaport Outlet: +$26.6K**
* **Kanyon: +$18.0K**

### Key Finding

July performance differed substantially across shopping malls.

Some locations experienced significant declines while others increased revenue.

The data therefore indicates that the July decline was **unevenly distributed across locations**.

However, mall-level revenue data alone cannot determine whether the differences were caused by customer traffic, category mix, inventory, promotions, tenant performance, or another operational factor.

Further analysis should combine **mall + category + transaction volume** to identify the most important combinations.

---

# Transaction Behavior in July

| Metric                    | July 2021 | July 2022 |         Change |
| ------------------------- | --------: | --------: | -------------: |
| Average transaction value |   $703.43 |   $706.28 | +$2.85 (+0.4%) |
| Transactions              |     3,984 |     3,893 |    -91 (-2.3%) |

Average transaction value increased slightly from **$703.43 to $706.28**.

At the same time, the number of transactions decreased from **3,984 to 3,893**.

### Key Finding

July shows an important relationship between transaction volume and revenue.

Customers spent slightly more per transaction on average, but there were fewer transactions.

Therefore, the July revenue decline occurred **alongside lower transaction volume rather than lower average transaction value**.

This does not prove that lower transaction volume was the only cause of the revenue decline, but it identifies transaction volume as an important measurable factor to investigate.

---

# October 2022 Revenue Decline

October revenue decreased by:

**-$26,578.71 (-1.0%)**

Unlike July, the largest negative category movement in October came from Shoes.

---

## Category Performance in October

### October 2021 vs. October 2022

| Category        |      Change | Change % |
| --------------- | ----------: | -------: |
| Shoes           | -$91,826.01 |   -12.1% |
| Food & Beverage |    -$726.97 |    -7.6% |
| Books           |    -$196.95 |    -2.2% |
| Toys            |    -$179.20 |    -0.4% |
| Clothing        | +$45,312.08 |    +3.8% |
| Technology      | +$14,700.00 |    +2.1% |
| Cosmetics       |  +$5,611.08 |    +8.0% |
| Souvenir        |    +$727.26 |   +12.2% |

Shoes were the largest negative contributor:

**-$91.8K (-12.1%)**

This decline was partially offset by increases in several other categories.

Clothing and Technology together increased by approximately:

**+$60.0K**

Cosmetics added another:

**+$5.6K**

### Key Finding

The October decline was **highly concentrated in the Shoes category**.

Unlike July, Clothing increased in October while Shoes experienced the largest negative movement.

This indicates that the October decline had a different category profile from July.

The next step is therefore to investigate **Shoes by shopping mall and transaction volume**.

---

# Shopping Mall Performance in October

![Revenue by Mall 2021](/customers/tableau/Revenue_by_Mall_2021.png)

![Revenue by Mall 2022](/customers/tableau/Revenue_by_Mall_2022.png)

### October 2021 vs. October 2022

| Shopping Mall     |      Change | Change % |
| ----------------- | ----------: | -------: |
| Metropol AVM      | -$42,987.77 |   -15.6% |
| Emaar Square Mall | -$34,600.46 |   -20.4% |
| Zorlu Center      | -$34,533.41 |   -24.8% |
| Cevahir AVM       | -$23,535.20 |   -15.8% |
| Metrocity         | -$17,133.48 |    -3.9% |
| Viaport Outlet    | -$14,412.16 |    -9.3% |
| Forum Istanbul    |  -$4,104.30 |    -2.6% |
| Istinye Park      | +$23,397.97 |    +9.1% |
| Kanyon            | +$54,010.84 |   +10.1% |
| Mall of Istanbul  | +$67,319.26 |   +13.2% |

October had more widespread mall-level declines than July.

The largest negative changes were:

* **Metropol AVM: -$43.0K**
* **Emaar Square Mall: -$34.6K**
* **Zorlu Center: -$34.5K**
* **Cevahir AVM: -$23.5K**

At the same time, several malls generated substantial increases:

* **Mall of Istanbul: +$67.3K**
* **Kanyon: +$54.0K**
* **Istinye Park: +$23.4K**

### Key Finding

October performance was also highly uneven across locations.

Several malls experienced significant declines while Mall of Istanbul and Kanyon generated strong increases.

The data demonstrates **different mall-level performance patterns**, but does not establish the operational reason behind those differences.

---

# Transaction Behavior in October

| Metric                    | October 2021 | October 2022 |         Change |
| ------------------------- | -----------: | -----------: | -------------: |
| Average transaction value |      $710.53 |      $716.17 | +$5.65 (+0.8%) |
| Transactions              |        3,916 |        3,848 |    -68 (-1.7%) |

Average transaction value increased from **$710.53 to $716.17**.

At the same time, transaction volume declined from **3,916 to 3,848**.

### Key Finding

October shows the same general transaction pattern as July:

* Average transaction value increased.
* Transaction volume decreased.
* Monthly revenue decreased.

Therefore, both peak-month declines occurred while average spending per transaction was slightly higher than the previous year.

The consistent decrease in transaction volume makes **transaction acquisition/volume an important area for further investigation**.

---

# July vs. October: What Changed?

The two monthly declines had different category drivers.

| Metric                    |              July |        October |
| ------------------------- | ----------------: | -------------: |
| Revenue change            |       **-$52.9K** |    **-$26.6K** |
| Main negative category    |          Clothing |          Shoes |
| Largest category decline  | Clothing: -$81.0K | Shoes: -$91.8K |
| Average transaction value |             +0.4% |          +0.8% |
| Transaction volume        |             -2.3% |          -1.7% |

## July

July's decline was primarily associated with **Clothing and Technology**.

Clothing was the largest negative contributor at **-$81.0K**, while Shoes provided a substantial positive offset of **+$56.4K**.

## October

October's decline had a different category profile.

Shoes declined by **$91.8K**, while Clothing and Technology both increased.

## Common Transaction Pattern

Despite their different category drivers, July and October share the same transaction-level pattern:

> **Average transaction value increased while transaction volume decreased.**

This is an important distinction.

The data does not show customers spending less per transaction. Instead, fewer transactions were recorded during both declining peak months.

The next step is to determine **which categories, malls, and customer groups contributed to the reduction in transaction volume**.

---

# Mall-Level Context

## Revenue by Shopping Mall

![Revenue by Mall 2021](/customers/tableau/Revenue_by_Mall_2021.png)

![Revenue by Mall 2022](/customers/tableau/Revenue_by_Mall_2022.png)

The mall-level revenue table shows substantial differences in revenue contribution across locations.

| Shopping Mall     |        Revenue |
| ----------------- | -------------: |
| Mall of Istanbul  | $13,851,737.62 |
| Kanyon            | $13,710,755.24 |
| Metrocity         | $10,249,980.07 |
| Metropol AVM      |  $6,937,992.99 |
| Istinye Park      |  $6,717,077.54 |
| Zorlu Center      |  $3,509,649.02 |
| Cevahir AVM       |  $3,433,671.84 |
| Viaport Outlet    |  $3,414,019.46 |
| Emaar Square Mall |  $3,390,408.31 |
| Forum Istanbul    |  $3,336,073.82 |

The two largest locations are **Mall of Istanbul** and **Kanyon**.

Combined revenue in the table:

**$27,562,492.86**

Total revenue represented by the listed mall values:

**$68,551,365.91**

Therefore, Mall of Istanbul and Kanyon represent approximately:

**40.2% of the revenue represented in this mall-level table.**

This demonstrates substantial revenue concentration in the two largest locations.

Because this table's total differs from the separately reported 2021–2022 annual revenue figures, the 40.2% figure should be interpreted specifically as a **share of the revenue represented in the mall-level table**, rather than as a share of the combined 2021–2022 annual revenue.

---

# Transaction Distribution by Mall

## 2021

![Transactions by Mall 2021](/customers/tableau/Transactions_By_Mall_2021.png)

The 2021 transaction distribution shows that Mall of Istanbul and Kanyon were also the two highest-volume locations.

| Shopping Mall          | Transactions |
| ---------------------- | -----------: |
| Mall of Istanbul       |        9,026 |
| Kanyon                 |        8,946 |
| Metrocity              |        6,856 |
| Metropol AVM           |        4,679 |
| Istinye Park           |        4,419 |
| Cevahir AVM            |        2,365 |
| Zorlu Center           |        2,330 |
| Viaport Outlet         |        2,286 |
| Forum Istanbul         |        2,253 |
| Emaar Square Mall      |        2,222 |
| **Listed malls total** |   **45,382** |

Mall of Istanbul and Kanyon together generated:

**17,972 transactions**

in 2021.

They therefore represented approximately **39.6% of the transactions shown in the listed-mall table**.

This is consistent with their position as the two highest-volume locations.

---

## 2022

![Transactions by Mall 2022](/customers/tableau/Transactions_By_Mall_2022.png)

The 2022 transaction distribution provides the corresponding comparison for the following year.

The leading malls remain important contributors to transaction activity, while lower-volume locations account for substantially fewer transactions.

Transaction counts should be interpreted consistently across the analysis. A transaction count should use the same definition throughout the dashboard — for example, either transaction rows or unique invoices — rather than switching between different fields.

---

# Basket Size by Shopping Mall

![Basket Size Distribution by Mall](/customers/tableau/Basket_Size_Distribution_by_Shopping_Mall.png)

Basket size provides an additional perspective on customer purchasing behavior.

Revenue can change because of:

* Number of transactions
* Amount spent per transaction
* Number of items purchased
* Product mix

Basket size can therefore help identify locations where customers purchase relatively more or fewer items per transaction.

However, basket size alone does not establish why revenue changed.

It should be evaluated together with:

* Transaction volume
* Average transaction value
* Category mix
* Mall-level revenue

This prevents basket size from being interpreted as an independent explanation for revenue performance.

---

# Revenue by Gender

## 2021

![Revenue by Gender, 2021](/customers/tableau/Revenue_by_Gender_2021.png)

The 2021 gender analysis compares revenue contribution and average price between female and male customers.

| Gender | Average Price |
| ------ | ------------: |
| Female |       $688.14 |
| Male   |       $690.92 |

The difference is approximately:

**$2.78**

This is a relatively small difference in average price between the two groups.

Therefore, the available data does not indicate a meaningful difference in average price between male and female customers.

---

## 2022

![Revenue by Gender, 2022](/customers/tableau/Revenue_by_Gender_2022.png)

The 2022 visualization provides the corresponding year-over-year view of revenue by gender.

The gender analysis can be used as a segmentation layer, but it does not by itself explain the July or October revenue declines.

The more significant measurable differences in the peak-month analysis are observed in **transaction volume, category performance, and mall-level performance**.

---

# Key Business Findings

## Annual Revenue Was Stable

Revenue increased from **$31.32M in 2021 to $31.37M in 2022**.

The year-over-year increase was only **0.18%**, indicating a stable revenue base rather than significant growth.

---

## Peak-Month Declines Had Different Category Drivers

The two declining peak months were driven by different category movements.

**July:** Clothing and Technology were the largest negative contributors.

**October:** Shoes were the dominant negative contributor.

This means the two monthly declines should not be treated as one identical problem.

---

## Transaction Volume Declined in Both Months

Both July and October show:

* Higher average transaction value
* Lower transaction volume
* Lower total monthly revenue

July:

**Average transaction value +0.4%**
**Transactions -2.3%**

October:

**Average transaction value +0.8%**
**Transactions -1.7%**

This makes transaction volume an important area for further investigation.

However, the analysis should not claim that transaction volume was the sole cause of the revenue decline without a formal revenue decomposition.

---

## Mall Performance Was Uneven

Mall-level revenue changed differently across locations.

In July, the largest negative changes occurred at **Istinye Park, Emaar Square Mall, and Cevahir AVM**.

In October, the largest negative changes occurred at **Metropol AVM, Emaar Square Mall, Zorlu Center, and Cevahir AVM**.

At the same time, **Mall of Istanbul and Kanyon** generated substantial increases in October.

The data therefore shows significant variation in location-level performance.

It does not, however, establish the reason for those differences.

---

## Revenue Is Concentrated in the Largest Locations

The mall-level revenue table shows that Mall of Istanbul and Kanyon are the two largest revenue-generating locations.

Together they account for approximately **40.2% of the revenue represented in that table**.

This indicates that performance changes at the largest locations can have a meaningful effect on the overall revenue distribution.

---

# Recommendations

## Investigate the July Clothing Decline

Clothing declined by approximately **$81.0K in July 2022**, making it the largest negative category movement in that month.

The next analysis should break Clothing performance down by:

* Shopping mall
* Transaction volume
* Average transaction value
* Product-level performance, if available

This would identify where the Clothing decline was concentrated.

---

## Investigate the October Shoes Decline

Shoes declined by approximately **$91.8K in October 2022**, making it the largest negative category movement identified in the peak-month analysis.

The next step should be to analyze Shoes by:

* Shopping mall
* Transaction volume
* Average transaction value
* Product-level performance, if available

This would help determine whether the decline was concentrated in specific locations or reflected broader footwear performance.

---

## Focus on Transaction Volume

Both July and October experienced lower transaction counts despite slightly higher average transaction values.

This suggests that transaction volume should be monitored as a key performance indicator.

Further analysis should determine whether fewer transactions were concentrated in:

* Particular malls
* Particular categories
* Particular customer segments

---

## Prioritize Category × Mall Analysis

The strongest next analytical step is to combine the two dimensions that show the largest differences:

**Category + Shopping Mall**

For example:

* Clothing × Mall in July
* Technology × Mall in July
* Shoes × Mall in October

This can reveal whether the overall category decline was concentrated in a small number of locations.

---

## Use Basket Size as a Supporting Metric

Basket size can provide additional insight into purchasing behavior.

However, it should be used as a supporting metric rather than treated as a standalone explanation for revenue changes.

The strongest interpretation comes from combining:

**Revenue + Transactions + Average Transaction Value + Basket Size + Category + Mall**

---

# Conclusion

The analysis describes a business with a **stable annual revenue base but meaningful variation across months, categories, and shopping malls**.

The most important findings are:

* **Annual revenue remained essentially flat**, increasing only 0.18% from 2021 to 2022.
* **July revenue declined by $52.9K**, with Clothing and Technology representing the largest negative category movements.
* **October revenue declined by $26.6K**, with Shoes representing the dominant negative category movement.
* **Average transaction value increased in both July and October**, while transaction volume decreased.
* **Mall-level performance varied substantially**, with some locations declining while others grew.
* **Mall of Istanbul and Kanyon are the two largest locations** in the mall-level revenue table and together represent approximately 40.2% of the revenue shown in that table.
* The available data identifies **where performance changed**, but does not establish external causes such as promotions, inventory availability, customer traffic, or competitive activity.

The strongest evidence-based next step is therefore to move from high-level comparisons to **category × mall × transaction analysis**.

This would help determine whether the July Clothing decline and October Shoes decline were concentrated in specific locations or reflected broader changes in customer purchasing behavior.
