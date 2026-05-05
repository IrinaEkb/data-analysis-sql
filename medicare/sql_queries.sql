-- Check dataset size
SELECT COUNT(*) FROM state_summary;

-- Check for missing values
SELECT *
FROM state_summary
WHERE state IS NULL
   OR total_payments IS NULL
   OR total_services IS NULL
   OR total_providers IS NULL;

-- Check for duplicates
SELECT state, COUNT(*)
FROM state_summary
GROUP BY state
HAVING COUNT(*) > 1;

-- Cleaned aggregated dataset (one row per state)
CREATE TABLE state_summary_clean AS
SELECT
    state,
    SUM(total_payments) AS total_payments,
    SUM(total_services) AS total_services,
    SUM(total_providers) AS total_providers,
    AVG(avg_markup_ratio) AS avg_markup_ratio
FROM state_summary
WHERE state IN (
                'CA','FL','TX','NY','NJ','IL','PA','NC','OH','GA','MD','MI','VA','MA','AZ','TN',
                'SC','IN','AL','MO','WA','LA','WI','CO','KY','OK','CT','AR','KS','MS','MN','NV',
                'IA','OR','NE','UT','WV','DE','NM','NH','ID','ME','RI','MT','SD','DC','HI','ND',
                'AK','VT','WY'
    )
GROUP BY state;

-- Top 10 states by total Medicare payments (USD)
SELECT state, total_payments
FROM state_summary_clean
ORDER BY total_payments DESC
    LIMIT 10;

-- Bottom 10 states by total Medicare payments (USD)
SELECT state, total_payments
FROM state_summary_clean
ORDER BY total_payments ASC
    LIMIT 10;

-- Average Medicare payments across all states (USD)
SELECT AVG(total_payments) AS avg_payments_usd
FROM state_summary_clean;

-- States with total payments above national average (USD)
SELECT state, total_payments
FROM state_summary_clean
WHERE total_payments > (SELECT AVG(total_payments) FROM state_summary_clean)
ORDER BY total_payments DESC;

-- States ranked by number of providers
SELECT state, total_providers
FROM state_summary_clean
ORDER BY total_providers DESC;

-- States ranked by total services
SELECT state, total_services
FROM state_summary_clean
ORDER BY total_services DESC;

-- Medicare cost per service (USD per service)
SELECT
    state,
    total_payments / total_services AS cost_per_service
FROM state_summary_clean
ORDER BY cost_per_service DESC;

-- Services per provider (services per provider)
SELECT
    state,
    total_services / total_providers AS services_per_provider
FROM state_summary_clean
ORDER BY services_per_provider DESC;

-- Markup ratio (times higher than Medicare payment)
SELECT state, avg_markup_ratio
FROM state_summary_clean
ORDER BY avg_markup_ratio DESC;

-- Combined efficiency view (payments, services, providers, markup)
SELECT
    state,
    total_payments,
    total_services,
    total_providers,
    avg_markup_ratio,
    total_payments / total_services AS cost_per_service
FROM state_summary_clean
ORDER BY cost_per_service DESC;