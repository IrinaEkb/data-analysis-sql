# Carrier Performance Analysis

## Data Source

The dataset used in this project is a publicly available **synthetic logistics dataset** from Kaggle, generated for data analysis and learning purposes.
The carrier names (such as UPS, FedEx, DHL, USPS, Amazon Logistics, LaserShip, and OnTrac) are included as part of the synthetic dataset and **do not represent the actual operational performance of these companies**.
All findings, comparisons, and recommendations presented in this project are based solely on the synthetic data provided in the dataset and are intended to demonstrate data analysis, visualization, and business reporting techniques.

## Carrier Delivery Performance

![Carrier Reliability Ranking](../screenshots/05_Pivot_Carrier_Reliability_Ranking_2023.png)

### Key Findings

- **UPS demonstrated the strongest overall delivery performance**, with **86.33% of shipments delivered on time without delivery issues** and **0% lost shipments**. This indicates the most consistent service performance among the carriers analyzed.
- **Amazon Logistics showed the weakest delivery performance**, with **79.20% of shipments delivered on time without delivery issues** and the highest lost shipment rate (**4.38%**). The carrier may require additional review regarding shipment handling and delivery execution.
- **DHL’s main performance challenge was delivery delays**, with the highest delayed shipment rate (**13.88%**) among all carriers. However, its lost shipment rate remained low (**0.36%**), suggesting that the primary issue was delivery timing rather than shipment loss.
- **USPS showed mixed results.** It had the lowest delayed shipment rate (**7.19%**) but the highest in-transit rate (**5.48%**) and one of the highest lost shipment rates (**4.11%**), indicating potential issues with shipment completion and tracking visibility.

---

## Carrier Cost Efficiency Analysis

![Carrier Cost Efficiency Analysis](../screenshots/05_Pivot_Cost_Efficiency_Analysis.png)

### Key Findings

- Total transportation spending reached **$401.9K** in 2023. **FedEx represented the largest cost share (**16%**) with **$64.1K** in total shipping costs, making it the largest contributor to transportation expenses.
- **UPS had the highest average shipping cost (**$229.71**) and highest cost per mile (**$0.18**), while USPS and Amazon Logistics achieved the lowest cost per mile (**$0.14**). This indicates meaningful differences in carrier pricing efficiency.

---

## Carrier Service Speed and Cost Comparison

![Carrier Service Speed vs Cost](../screenshots/05_Pivot_Service_Speed_vs_Cost.png)

### Key Findings

- Delivery speed differences across carriers were relatively small, ranging from **4.04 to 4.32 average delivery days**, indicating that higher carrier costs do not necessarily result in significantly faster transportation.
- **USPS provided the strongest cost-speed combination**, achieving one of the fastest delivery times (**4.05 days**) with the lowest average cost (**$182.66**).
- **UPS had the highest average cost (**$229.71**) but only achieved an average delivery time of **4.20 days**, suggesting that its higher price is likely related to reliability advantages rather than speed.
- **Amazon Logistics had the slowest average delivery time (**4.32 days**) while maintaining a lower average cost (**$193.91**), showing a trade-off between cost savings and delivery performance.

---

## Carrier Operational Impact

![Carrier Volume and Operational Impact](../screenshots/05_Pivot_Carrier_Volume_and_Operational_Impact.png)

### Key Findings

- The company processed **2,000 shipments** in 2023, with total transportation spending of **$401.9K** across seven carriers.
- **LaserShip handled the largest shipment volume (**303 shipments**), followed by OnTrac (**299**) and FedEx (**295**). Performance improvements with these carriers could impact a significant portion of total operations.
- **FedEx created the highest financial exposure**, accounting for **$64.1K in transportation costs**, even though it did not handle the highest shipment volume.

---

# Overall Insights

- **UPS achieved the highest on-time delivery rate (**86.33%**) with **0% lost shipments**, making it the strongest choice when delivery reliability is the highest priority.
- **USPS delivered one of the best cost-performance balances**, combining the lowest average shipping cost (**$182.66**), one of the fastest delivery times (**4.05 days**), and the lowest delay rate (**7.19%**). For cost-sensitive shipments, it appears to provide the best overall value.
- **FedEx accounted for the largest transportation spend (**$64.1K**, **16%** of total shipping cost), while LaserShip (**303 shipments**) and OnTrac (**299 shipments**) handled the highest shipment volumes. Improving pricing or operational performance for these carriers would likely have the greatest impact on overall logistics costs.
- **Average delivery time varied by only **0.28 days** across all carriers (**4.04–4.32 days**), while average shipping cost differed by nearly **$47** per shipment (**$182.66–$229.71**). This indicates that paying more does not necessarily result in faster deliveries, so carrier selection should prioritize the best balance between cost and service quality.

## Recommendations

- Review carrier contracts for **FedEx**, where transportation spending is the highest.
- Increase the use of **UPS** for shipments where delivery reliability is more important than transportation cost.
- Consider expanding the use of **USPS** for shipments where cost efficiency is the primary objective.
- Perform route-level analysis for **LaserShip** and **OnTrac** to identify opportunities for reducing costs across the largest shipment volumes.