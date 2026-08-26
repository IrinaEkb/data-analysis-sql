DROP TABLE IF EXISTS state_summary_clean;

CREATE TABLE state_summary_clean AS
SELECT
    UPPER(TRIM(state)) AS state,
    total_payments,
    total_services,
    total_providers,
    avg_markup_ratio
FROM state_summary
WHERE state IS NOT NULL
  AND UPPER(TRIM(state)) IN (
                             'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
                             'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
                             'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
                             'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
                             'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY','DC'
    );

SELECT COUNT(*) FROM state_summary_clean;
-- 50 states + DC = 51 rows, no missing values, no duplicates, no zero values, no leading/trailing spaces, no inconsistent state format, no negative values


WITH src AS (
    SELECT
        COUNT(*) AS rows_,
        SUM(total_payments)  AS pay,
        SUM(total_services)  AS svc,
        SUM(total_providers) AS prov
    FROM state_summary
    WHERE UPPER(TRIM(state)) IN (
                                 'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
                                 'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
                                 'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
                                 'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
                                 'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY','DC'
        )
),
     clean_ AS (
         SELECT
             COUNT(*) AS rows_,
             SUM(total_payments)  AS pay,
             SUM(total_services)  AS svc,
             SUM(total_providers) AS prov
         FROM state_summary_clean
     )
SELECT
    s.rows_ AS src_rows,  c.rows_ AS clean_rows,  s.rows_ - c.rows_ AS diff_rows,
    s.pay   AS src_pay,   c.pay   AS clean_pay,    ROUND(s.pay - c.pay, 2)  AS diff_pay,
    s.svc   AS src_svc,   c.svc   AS clean_svc,    s.svc - c.svc  AS diff_svc,
    s.prov  AS src_prov,  c.prov  AS clean_prov,   s.prov - c.prov AS diff_prov
FROM src s CROSS JOIN clean_ c;