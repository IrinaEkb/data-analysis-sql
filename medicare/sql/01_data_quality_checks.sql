
-- check how many rows
SELECT COUNT(*) FROM state_summary;

-- check data types
describe state_summary;

--  Missing values check
SELECT *
FROM state_summary
WHERE state IS NULL
   OR total_payments IS NULL
   OR total_services IS NULL
   OR total_providers IS NULL;

--  Duplicate states check
SELECT state, COUNT(*)
FROM state_summary
GROUP BY state
HAVING COUNT(*) > 1;

--  Zero values check
SELECT *
FROM state_summary
WHERE total_services = 0
   OR total_providers = 0;

-- Leading/trailing spaces in state
SELECT *
FROM state_summary
WHERE state != TRIM(state);

-- Inconsistent state format (lowercase/mixed)
SELECT DISTINCT state
FROM state_summary
WHERE state != UPPER(state);

-- negative values (impossible in real data)
SELECT *
FROM state_summary
WHERE total_payments < 0
   OR total_services < 0
   OR total_providers < 0;
