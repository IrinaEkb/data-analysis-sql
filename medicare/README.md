
# Medicare Spending Analysis Across U.S. States (2014–2023)

# Project Overview

This project analyzes Medicare spending across U.S. states using CMS aggregated data (10-year total, not time-series).
The goal is to understand Medicare resources are distributed across states and which systems show higher pressure, inefficiency, or cost burden.

## This project is designed to answer business-relevant questions:

Which states consume the highest share of Medicare spending?
Is spending driven more by service volume or pricing levels?
How does provider capacity affect system efficiency?
Where is the healthcare system under the highest operational pressure?
Which states show early indicators of future resource strain?

---

# Tools Used

- MySQL
- Microsoft Excel 

---

## Project Structure

```text
medicare/
├── data
│   ├── state_summary_clean.csv
│   └── state_summary.csv
│
├── excel
│   ├── cleanedData.png
│   ├── pivotTable1.png
│   ├── pivotTable2.png
│   └── state_summary_clean.png
│
├── sql
│   ├── 01_data_quality_checks.sql
│   └── 02_data_cleaning.sql.sql
│
└── README.md
```

---

# Data Source

CMS Medicare State Summary dataset  
Coverage: **2014–2023 (10 years)**

---

# Data Preparation & Validation

The original dataset included all U.S. states and territories.

Data cleaning and validation steps included:

- verified total row count
- checked missing values in key fields
- removed duplicate state entries
- standardized valid state codes only

