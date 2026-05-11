
# Medicare Spending Analysis Across U.S. States (2014–2023)

## Project Overview

This project analyzes Medicare spending across all U.S. states using CMS aggregated data (2014–2023).

The main focus is a subset of **top spending states**, used to understand what drives differences in Medicare expenditures:
- utilization (service volume)
- pricing (cost per service)
- provider distribution

---

## Tools Used

- SQL
- Microsoft Excel (data exploration and validation)

---

## Data Source

CMS Medicare State Summary dataset  
Coverage: **2014–2023 (10 years)**

Dataset includes:
- total Medicare payments
- total services
- total providers
- average markup ratio

Source: https://www.openmedicare.us

---

## Data Preparation & Validation

Initial dataset included all U.S. states and territories.  
Data was checked and transformed into a state-level aggregated dataset for analysis.

### Checks performed:

- Verified total row count
- Checked missing values in key fields
- Verified no duplicate states
- Standardized analysis to valid state codes only

### Aggregation step:

Data was consolidated to one row per state using:

- total payments (sum)
- total services (sum)
- total providers (sum)
- average markup ratio (average)

This created a cleaned state-level dataset used for analysis.

---

## Analysis Approach

The analysis focused on:

- Top states by Medicare spending
- Bottom states by Medicare spending
- Cost per service (efficiency metric)
- Services per provider
- Provider distribution across states
- Comparison of high vs low spending states

---

## Key Findings

## 1. What drives Medicare spending across large states — utilization or pricing?

Medicare spending among the highest-spending states is primarily driven by **utilization (service volume)**.

### Key observations:

- Florida: 5.13B services, $160.8B payments, cost per service 31.34
- California: 4.76B services, $186.4B payments, cost per service 39.19
- Texas: 3.78B services, $125.9B payments, cost per service 33.31
- New York: 2.96B services, $116.4B payments, cost per service 39.32

### Insight:
States with higher total Medicare payments consistently show significantly higher service volumes.  
Cost per service varies moderately across states, while differences in total spending are strongly aligned with utilization levels.

---

## 2. Do more productive providers reduce healthcare costs?

No consistent relationship was observed between provider productivity and lower healthcare costs.

- Florida: high provider count, high utilization, lower cost per service
- California: highest provider count, high utilization, higher cost per service
- New York: lower utilization, higher cost per service

### Insight:
Provider density does not consistently translate into lower unit costs across states.

---

## 3. Which states appear higher cost vs lower cost?

### Higher cost per service + high spending:
- New York
- California

### Lower cost comparison:
- Illinois

### Insight:
Some high-spending states also show elevated cost per service, indicating differences in delivery cost structures.

---

## 4. How concentrated is Medicare spending across states?

Medicare spending is concentrated in a small number of large states:

- California
- Florida
- Texas
- New York

### Insight:
A small group of states accounts for a large share of total Medicare spending due to both population size and utilization intensity.


# Medicare Spending Analysis Across Large States

## 1. What drives Medicare spending across large states — utilization or pricing?

Medicare spending among the top 10 spending states is primarily driven by **utilization (service volume)**.

### Key observations:

- **Florida**
    - Services: 5.13B
    - Total payments: $160.8B
    - Cost per service: 31.34

- **California**
    - Services: 4.76B
    - Total payments: $186.4B
    - Cost per service: 39.19

- **Texas**
    - Services: 3.78B
    - Total payments: $125.9B
    - Cost per service: 33.31

- **New York**
    - Services: 2.96B
    - Total payments: $116.4B
    - Cost per service: 39.32

### Core insight:
States with higher total payments consistently have **significantly higher service volumes**. Cost per service varies moderately across states, while differences in total spending are strongly aligned with differences in utilization.

---

## 2. Do more productive providers reduce healthcare costs?

Within the top 10 Medicare spending states, there is **no consistent relationship** between provider productivity and lower healthcare costs.

### Key observations:

- **Florida**
    - Providers: 1.33M
    - High service volume
    - Cost per service: 31.34

- **California**
    - Providers: 1.68M
    - High service volume
    - Cost per service: 39.19

- **New York**
    - Providers: 1.48M
    - Lower service volume
    - Cost per service: 39.32

### Insight:
Across high-spending states, higher provider activity does not consistently translate into lower cost per service. Cost levels vary independently of provider density and productivity.

---

## 3. Which states appear operationally inefficient?

Operational differences are observed among high-spending states where elevated cost per service aligns with high total spending.

### High-spending / higher-cost states:

- **New York**
    - Total spending: $116.4B
    - Cost per service: 39.32

- **California**
    - Total spending: $186.4B
    - Cost per service: 39.19

### Comparison:

- **Illinois**
    - Total spending: $70.7B
    - Cost per service: 33.89

### Insight:
New York and California combine high total spending with higher unit costs, reflecting more expensive service delivery structures compared to lower-cost states such as Illinois.

---

## 4. How concentrated is Medicare spending across states?

Medicare spending is concentrated in a small number of large states.

### Top states:

- **California**: $186.4B
- **Florida**: $160.8B
- **Texas**: $125.9B
- **New York**: $116.4B

### Insight:
These states account for a substantial share of total Medicare payments, driven by both population size and high service utilization.

## Data Validation (SQL + Excel)

![Cleaned Data](medicare/images/CleanedData.png)

---

## Pivot Table Analysis

![Pivot Table Results](medicare/images/pivotTable.png)