# Data Dictionary

Dataset: customer_shopping_data

| Column | Original Type | Description |
|----------|-------------|-------------|
| invoice_no | text | Unique invoice identifier |
| customer_id | text | Unique customer identifier |
| gender | text | Customer gender |
| age | int | Customer age |
| category | text | Product category purchased |
| quantity | text | Number of items purchased |
| price | text | Transaction value |
| payment_method | text | Payment method used |
| invoice_date | text | Transaction date |
| shopping_mall | text | Shopping mall location |

# Data Preparation

The original dataset contained several analytical fields stored as text.

The following conversions were performed:

- invoice_date → DATE
- quantity → BIGINT
- price → DECIMAL(10,2)

These changes enabled accurate aggregation, revenue calculations, and recency analysis.