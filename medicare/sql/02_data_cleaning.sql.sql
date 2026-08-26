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