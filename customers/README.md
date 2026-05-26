# Customer Shopping Data Analysis

## Project Overview

This project analyzes retail shopping transactions across multiple shopping malls in Turkey using SQL and Tableau.

The project includes:
- data quality validation
- data cleaning
- exploratory data analysis (EDA)
- revenue analysis
- transaction analysis
- shopping mall performance analysis
- product category analysis
- time-series analysis

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

| Column Name | Description |
|---|---|
| invoice_no | unique transaction identifier |
| customer_id | unique customer identifier |
| gender | customer gender |
| age | customer age |
| category | purchased product category |
| quantity | number of purchased items |
| price | transaction amount |
| payment_method | payment type used |
| invoice_date | transaction date |
| shopping_mall | shopping mall location |


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

# Tableau Visualizations

---

## Revenue Trends

### Monthly Revenue Trend — 2021
![Monthly Revenue Trend — 2021](tableau/Monthly Revenue Trend — 2021.png)

### Monthly Revenue Trend — 2022
![Monthly Revenue Trend — 2022](tableau/Monthly Revenue Trend — 2022.png)

---

## Product Performance

### Revenue by Product Category — 2021
![Revenue by Product Category — 2021](tableau/Revenue by Category Across All Malls — 2021.png)

### Revenue by Product Category — 2022
![Revenue by Product Category — 2022](tableau/Revenue by Category Across All Malls — 2022.png)

---

## Location Analysis

### Revenue by Shopping Mall — 2021
![Revenue by Shopping Mall — 2021](tableau/Revenue by Mall, 2021.png)

### Revenue by Shopping Mall — 2022
![Revenue by Shopping Mall — 2022](tableau/Revenue by Mall, 2022.png)

---

## Overall Performance

### Yearly Revenue Trend
![Yearly Revenue Trend](tableau/Yearly Revenue Trend.png)
