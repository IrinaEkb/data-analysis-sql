## Revenue Seasonality Insights

### 1. Seasonal pattern is stable, but not symmetric

Revenue shows repeated intra-year structure:
- recurring peak months: July, October
- recurring low months: February, September
- no structural growth trend across years (stable baseline)

---

# Revenue trend and forecast visualization:

![Revenue Trend & Forecast](tableau/Revenue_Forecast.png)


### 2. February low performance is structural

February consistently shows the lowest revenue across all years.

This is explained by measurable retail factors:
- shortest calendar month (fewer trading days)
- post-holiday consumption slowdown (after Dec–Jan cycle)
- reduced promotional activity in early-year retail cycle

---

### 3. September weakness is demand-transition effect

September consistently underperforms relative to adjacent months.

Likely drivers:
- end of summer consumption cycle
- absence of major retail campaigns
- shift in spending behavior toward Q4 preparation period

---

### 4. July and October represent demand peaks

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

### 5. Year-over-year pattern (important observation)

2022 peak months are slightly lower than 2021 peaks.

This may indicate:
- demand normalization after stronger previous year
- category-level redistribution of spending
- potential reduction in high-value basket frequency

This requires category-level validation 

---

### 6. Key limitation

Revenue is analyzed at aggregated level.
To validate seasonality drivers, breakdown by:
- product category
- shopping mall
- transaction value distribution


---

##  Seasonality Validation (SQL-based extension)

To validate why peak and low months behave differently, additional analysis should be performed at category level.

### 1. Revenue by category per month

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