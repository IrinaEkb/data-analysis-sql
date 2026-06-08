CREATE TABLE state_summary_clean AS
SELECT
    UPPER(TRIM(state)) AS state,

    CAST(NULLIF(TRIM(total_payments), '') AS FLOAT) AS total_payments,
    CAST(NULLIF(TRIM(total_services), '') AS FLOAT) AS total_services,
    CAST(NULLIF(TRIM(total_providers), '') AS FLOAT) AS total_providers,

    CASE
        WHEN avg_markup_ratio IS NULL THEN NULL
        ELSE CAST(avg_markup_ratio AS FLOAT)
        END AS avg_markup_ratio

FROM state_summary
WHERE state IS NOT NULL
  AND UPPER(TRIM(state)) IN (
                             'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
                             'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
                             'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
                             'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
                             'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY',
                             'DC'
    );
