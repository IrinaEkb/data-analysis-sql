## Revenue Seasonality Insights

## Business Objective & Problem Framing

The main objective of this analysis is to understand why revenue in peak months (July and October) decreased in 2022 compared to 2021, despite overall stable annual performance.

Annual revenue remains almost unchanged:
- 2021: 31,316,304.63
- 2022: 31,372,826.18
- Δ = +56,521.55 (+0.18%)

However, within this stable annual result, key seasonal peaks show slight weakening:
- July: 2,802,468.58 (2021) → 2,749,554.99 (2022) → Δ = -52,913.59
- October: 2,782,418.40 (2021) → 2,755,839.69 (2022) → Δ = -26,578.71

Focus of analysis:

what drives decline in peak months
which components (category / transactions / basket) explain the shift
whether decline is structural or seasonal noise

### Seasonal pattern is stable, but not symmetric

Revenue shows a consistent yearly pattern across 2021–2022:
- recurring peak months: July, October
- recurring low months: February, September
- no structural growth trend across years (stable baseline)

---

### February and September represent structural low-demand periods

February and September consistently show weaker revenue performance compared to other months, but for different structural reasons.

February represents the lowest point of the year due to:
- shortest calendar month and reduced trading days
- post-holiday consumption slowdown after the Dec–Jan peak
- reduced promotional intensity at the start of the retail cycle

September reflects a transitional soft-demand period driven by:
- end of summer consumption cycle
- absence of major promotional campaigns
- delayed spending ahead of Q4 demand increase

---

### July and October represent demand peaks

These months consistently outperform others:

July:
- mid-year consumption peak
- seasonal demand increase
- promotional cycles in mid-year retail planning

October:
- pre-Q4 demand buildup
- early holiday shopping behavior
- increased campaign intensity before year-end cycle

---

##  Seasonality Validation (SQL-based extension)

To validate why peak and low months behave differently, additional analysis should be performed at category level.

### Revenue by category per month

```sql
SELECT
    DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
    category,
    SUM(price) AS monthly_revenue
FROM customer_shopping_data_cleaned
GROUP BY
    DATE_FORMAT(invoice_date, '%Y-%m-01'),
    category
ORDER BY
    month_date, monthly_revenue DESC;
```

# Purpose:

identify which categories drive July and October peaks
detect whether February decline is category-wide or category-specific

## Revenue by Category — Peak Months (July & October)

### July 2021 vs 2022

| month_date | category        | monthly_revenue |
|------------|----------------|-----------------|
| 2021-07-01 | Clothing        | 1329054.32      |
| 2021-07-01 | Shoes           | 689595.33       |
| 2021-07-01 | Technology      | 644700.00       |
| 2021-07-01 | Cosmetics       | 70585.76        |
| 2021-07-01 | Toys            | 44262.40        |
| 2021-07-01 | Books           | 8999.10         |
| 2021-07-01 | Food & Beverage | 8749.79         |
| 2021-07-01 | Souvenir        | 6521.88         |
| 2022-07-01 | Clothing        | 1248032.72      |
| 2022-07-01 | Shoes           | 746011.31       |
| 2022-07-01 | Technology      | 621600.00       |
| 2022-07-01 | Cosmetics       | 67617.58        |
| 2022-07-01 | Toys            | 41072.64        |
| 2022-07-01 | Books           | 9953.55         |
| 2022-07-01 | Food & Beverage | 8979.91         |
| 2022-07-01 | Souvenir        | 6287.28         |

### July 2022 vs July 2021

Revenue declines were primarily driven by:

- Clothing: -81,021.60 (-6.1%)
- Technology: -23,100.00 (-3.6%)
- Toys: -3,189.76 (-7.2%)
- Cosmetics: -2,968.18 (-4.2%)

Revenue increases were observed in:

- Shoes: +56,415.98 (+8.2%)
- Books: +954.45 (+10.6%)
- Food & Beverage: +230.12 (+2.6%)

Given that July remained one of the strongest revenue months in both years, the result may indicate weaker category demand, changes in product mix, or reduced availability of high-revenue items within the Clothing segment.

--- 

### October 2021 vs 2022

| month_date | category        | monthly_revenue |
|------------|----------------|-----------------|
| 2021-10-01 | Clothing        | 1189817.20      |
| 2021-10-01 | Shoes           | 759815.22       |
| 2021-10-01 | Technology      | 696150.00       |
| 2021-10-01 | Cosmetics       | 70463.78        |
| 2021-10-01 | Toys            | 41789.44        |
| 2021-10-01 | Food & Beverage | 9534.29         |
| 2021-10-01 | Books           | 8877.90         |
| 2021-10-01 | Souvenir        | 5970.57         |
| 2022-10-01 | Clothing        | 1235129.28      |
| 2022-10-01 | Technology      | 710850.00       |
| 2022-10-01 | Shoes           | 667989.21       |
| 2022-10-01 | Cosmetics       | 76074.86        |
| 2022-10-01 | Toys            | 41610.24        |
| 2022-10-01 | Food & Beverage | 8807.32         |
| 2022-10-01 | Books           | 8680.95         |
| 2022-10-01 | Souvenir        | 6697.83         |

### October 2022 vs October 2021

Revenue declines were concentrated in:

- Shoes: -91,826.01 (-12.1%)
- Food & Beverage: -726.97 (-7.6%)
- Books: -196.95 (-2.2%)

Revenue increases were observed in:

- Clothing: +45,312.08 (+3.8%)
- Technology: +14,700.00 (+2.1%)
- Cosmetics: +5,611.08 (+8.0%)
- Souvenir: +727.26 (+12.2%)

The October revenue mix shifted across the three largest product categories. While Clothing (+3.8%) and Technology (+2.1%) increased year-over-year, Shoes declined by 12.1%, representing the largest negative contribution to monthly revenue.
Further analysis would focus on footwear product mix, inventory availability, and category-level demand patterns to determine why shoe sales underperformed despite overall strength in October.

### 2. Mall-level seasonality comparison

``` sql 
SELECT
shopping_mall,
DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
SUM(price) AS monthly_revenue
FROM customer_shopping_data_cleaned
GROUP BY
shopping_mall,
DATE_FORMAT(invoice_date, '%Y-%m-01')
ORDER BY
shopping_mall, month_date;
```
# Purpose:

check if seasonality is uniform across malls
identify location-specific demand patterns

## July 2021 vs 2022

| Shopping Mall | July 2021 | July 2022 | Change | Change % |
|--------------|-----------:|-----------:|--------:|---------:|
| Cevahir AVM | 145,142.75 | 129,512.10 | -15,630.65 | -10.8% |
| Emaar Square Mall | 177,622.38 | 127,969.47 | -49,652.91 | -28.0% |
| Forum Istanbul | 139,079.89 | 139,619.47 | +539.58 | +0.4% |
| Istinye Park | 323,727.66 | 244,538.48 | -79,189.18 | -24.5% |
| Kanyon | 535,771.26 | 553,782.55 | +18,011.29 | +3.4% |
| Mall of Istanbul | 537,365.99 | 572,754.25 | +35,388.26 | +6.6% |
| Metrocity | 412,367.35 | 408,848.49 | -3,518.86 | -0.9% |
| Metropol AVM | 238,542.44 | 250,956.76 | +12,414.32 | +5.2% |
| Viaport Outlet | 145,857.04 | 172,450.50 | +26,593.46 | +18.2% |
| Zorlu Center | 146,991.82 | 149,122.92 | +2,131.10 | +1.5% |

### July 2022 vs July 2021

Revenue declines were concentrated in:

- Istinye Park: -79,189.18 (-24.5%)
- Emaar Square Mall: -49,652.91 (-28.0%)
- Cevahir AVM: -15,630.65 (-10.8%)

Revenue increases were observed in:

- Mall of Istanbul: +35,388.26 (+6.6%)
- Viaport Outlet: +26,593.46 (+18.2%)
- Kanyon: +18,011.29 (+3.4%)

The July revenue decline was primarily driven by weaker performance in Istinye Park and Emaar Square Mall. While several malls increased revenue year-over-year, the gains were not sufficient to offset the declines in these two locations.

Further analysis would focus on transaction volume, category mix, promotional activity, and tenant performance to identify why summer demand weakened in these malls during July 2022.

---

## October 2021 vs 2022

| Shopping Mall | October 2021 | October 2022 | Change | Change % |
|--------------|-------------:|-------------:|--------:|---------:|
| Cevahir AVM | 148,656.68 | 125,121.48 | -23,535.20 | -15.8% |
| Emaar Square Mall | 169,559.28 | 134,958.82 | -34,600.46 | -20.4% |
| Forum Istanbul | 157,719.26 | 153,614.96 | -4,104.30 | -2.6% |
| Istinye Park | 257,665.75 | 281,063.72 | +23,397.97 | +9.1% |
| Kanyon | 534,454.63 | 588,465.47 | +54,010.84 | +10.1% |
| Mall of Istanbul | 508,603.93 | 575,923.19 | +67,319.26 | +13.2% |
| Metrocity | 435,252.15 | 418,118.67 | -17,133.48 | -3.9% |
| Metropol AVM | 275,781.33 | 232,793.56 | -42,987.77 | -15.6% |
| Viaport Outlet | 155,493.33 | 141,081.17 | -14,412.16 | -9.3% |
| Zorlu Center | 139,232.06 | 104,698.65 | -34,533.41 | -24.8% |

### October 2022 vs October 2021

Revenue declines were concentrated in:

- Metropol AVM: -42,987.77 (-15.6%)
- Emaar Square Mall: -34,600.46 (-20.4%)
- Zorlu Center: -34,533.41 (-24.8%)
- Cevahir AVM: -23,535.20 (-15.8%)

Revenue increases were observed in:

- Mall of Istanbul: +67,319.26 (+13.2%)
- Kanyon: +54,010.84 (+10.1%)
- Istinye Park: +23,397.97 (+9.1%)

The October peak remained strong overall, but revenue growth became concentrated in Mall of Istanbul and Kanyon. Several malls experienced double-digit declines, suggesting that customer demand may have shifted across mall locations rather than growing uniformly across the retail network.

Further analysis would focus on mall-level category performance, tenant mix, and transaction volume to determine why October growth was concentrated in a small number of malls.

### 3. Basket structure by month

``` sql
   SELECT
   DATE_FORMAT(invoice_date, '%Y-%m-01') AS month_date,
   AVG(price) AS avg_transaction_value,
   COUNT(*) AS total_transactions
   FROM customer_shopping_data_cleaned
   GROUP BY
   DATE_FORMAT(invoice_date, '%Y-%m-01')
   ORDER BY
   month_date;
```

# Purpose:

determine whether revenue changes are driven by:
number of transactions
or basket size changes

---


### July 2021 vs 2022

| month_date | avg_transaction_value | total_transactions |
|------------|----------------------|-------------------|
| 2021-07-01 | 703.43 | 3984 |
| 2022-07-01 | 706.28 | 3893 |

Average transaction value increased from 703.43 to 706.28 (+2.85, +0.4%).

Transaction volume declined from 3,984 to 3,893 (-91 transactions, -2.3%).

The results suggest that customer spending remained stable during July. The decline in monthly revenue was primarily associated with lower transaction volume rather than lower spending per purchase.

Further analysis would focus on identifying which customer segments, shopping malls, or product categories contributed most to the decline in completed transactions.

### October 2021 vs 2022

| month_date | avg_transaction_value | total_transactions |
|------------|----------------------|-------------------|
| 2021-10-01 | 710.53 | 3916 |
| 2022-10-01 | 716.17 | 3848 |

Average transaction value increased from 710.53 to 716.17 (+5.65, +0.8%).

Transaction volume declined from 3,916 to 3,848 (-68 transactions, -1.7%).

The October pattern was similar to July. Customers spent slightly more per transaction, but fewer purchases were completed overall.

Combined with the category analysis, this suggests that transaction volume was a more important driver of revenue performance than changes in basket value during peak revenue months.


# Revenue Seasonality & Peak Month Performance Analysis

##  Summary

While annual revenue remained stable year-over-year (YoY), a deeper look at the data reveals that key seasonal peaks underperformed. This analysis isolates the root causes behind the revenue drops in **July** and **October** and outlines strategic business recommendations.

---

##  The "Why" Behind the Peaks

*   **July Decline:** Driven by a major drop in **Clothing (-6.1%)** and **Technology (-3.6%)**. The losses were heavily concentrated in two specific locations: **Istinye Park (-24.5%)** and **Emaar Square Mall (-28.0%)**.
*   **October Decline:** Driven entirely by a massive contraction in **Shoes (-12.1%)**, alongside location-specific hits at **Emaar Square Mall (-20.4%)** and **Cevahir AVM (-15.8%)**.

---

##   Breakdown by Peak Month

### 1. July Peak Analysis (The Clothing & High-End Mall Pullback)
The overall drop of **-$52,913.59** in July was a tug-of-war between a massive drop in standard apparel and a surge in footwear performance.

*   **Category Dynamics:** Clothing single-handedly wiped out **$81k** in revenue. Shoes attempted to save the month with a strong **+$56k (+8.2%)** increase, but it was not enough to offset the combined losses of Clothing and Technology (**-$23k**).
*   **Location Bottlenecks:** The problem is highly concentrated in premium malls. **Istinye Park** and **Emaar Square Mall** combined for a massive loss of **~$129k**.
*   **The Contrast:** While those two premium malls crashed, **Viaport Outlet** surged by **+18.2%**, and **Mall of Istanbul** grew by **+6.6%**. This strongly suggests that consumer demand shifted away from full-price premium malls toward outlet/value locations during July.

### 2. October Peak Analysis (The Footwear Collapse)
The overall drop of **-$26,578.71** in October presents the exact inverse category dynamic of July.

*   **Category Dynamics:** Clothing actually grew by **+$45k (+3.8%)** and Technology grew by **+$14.7k**. However, **Shoes collapsed by -$91,826.01 (-12.1%)**, completely erasing those gains.
*   **Location Bottlenecks:** **Emaar Square Mall** shows a structural issue, dropping **-20.4%** (continuing its bad performance from July). **Cevahir AVM** also dropped significantly by **-15.8%**.
*   **The Contrast:** Unlike July, where major malls carried the slack, October's losses were widespread enough across the bottom-performing locations to drag down the healthy gains seen in Clothing and Technology.

---

##  Strategic Action Plan ("What to do?")

### 1. Implement Channel-Specific Pricing for July
*   **Dynamic Markdowns:** Lower the baseline entry price for Clothing in premium malls (*Istinye Park, Emaar Square*) during July. Do not let premium inventory sit idle while outlets capture the foot traffic.
*   **Cross-Format Bundling:** Run promotions that incentivize footwear buyers in premium malls to cross-purchase apparel (e.g., *"Buy Shoes at Istinye, get 20% off Clothing"*).

### 2. Overhaul Footwear Allocation for October
*   **Pre-Bake October Shoe Inventory:** Move shoe inventory away from underperforming segments and aggressively stock *Emaar Square* and *Cevahir AVM* before October 1st.
*   **Audit the Footwear Mix:** Review why shoes collapsed while apparel grew. Ensure that winter/autumn footwear transitions hit the shelves early enough to capture the pre-Q4 demand spike.

### 3. Fix the "Emaar Square" Black Hole
*   **Deep Diagnostic:** Emaar Square Mall failed catastrophically in both peak periods (-28% in July, -20.4% in October). This indicates a structural location problem rather than seasonal noise.
*   **Action:** Review rental costs, tenant mix, or localized foot traffic declines. Consider reducing marketing spend allocated to this specific location and shifting those dollars toward highly profitable centers like *Mall of Istanbul* or *Viaport Outlet*.

---

##  Revenue Trend Projections & Adjustments

*   **If No Action is Taken:**  peak months will continue to erode, flattening your peaks and turning your revenue distribution into an inefficient, high-risk baseline.
*   **If Fixes Are Implemented:**
    *   **July Recovery:** Reclaiming the **$52k gap** by capturing value-seeking apparel shoppers before they migrate to outlets.
    *   **October Acceleration:** Unlocking an additional **$60k–$90k** in latent revenue by ensuring shoe inventory matches the organic demand shown by Clothing and Technology.

# Revenue trend and forecast visualization:

![Revenue Trend & Forecast](../../tableau/Revenue_Forecast.png)

