
DROP TABLE IF EXISTS customer_shopping_data_cleaned;

CREATE TABLE customer_shopping_data_cleaned AS
SELECT
    TRIM(invoice_no) AS invoice_no,
    TRIM(customer_id) AS customer_id,
    TRIM(gender) AS gender,
    age,
    TRIM(category) AS category,
    CAST(TRIM(quantity) AS SIGNED) AS quantity,
    CAST(TRIM(price) AS DECIMAL(10,2)) AS price,
    TRIM(payment_method) AS payment_method,
    STR_TO_DATE(TRIM(invoice_date), '%d/%m/%Y') AS invoice_date,
    TRIM(shopping_mall) AS shopping_mall
FROM customer_shopping_data;

