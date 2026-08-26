-- check how many rows
SELECT COUNT(*) FROM state_summary;
-- 63

-- check data types
describe state_summary;
/*
state,text,YES,"",,""
total_payments,double,YES,"",,""
total_providers,int,YES,"",,""
total_services,double,YES,"",,""
avg_markup_ratio,double,YES,"",,""
*/

--  Missing values check
SELECT *
FROM state_summary
WHERE state IS NULL
   OR total_payments IS NULL
   OR total_services IS NULL
   OR total_providers IS NULL;
-- no missing values

--  Duplicate states check
SELECT state, COUNT(*)
FROM state_summary
GROUP BY state
HAVING COUNT(*) > 1;
-- no duplicate states

--  Zero values check
SELECT *
FROM state_summary
WHERE total_services = 0
   OR total_providers = 0;
-- no zero values

-- Leading/trailing spaces in state
SELECT *
FROM state_summary
WHERE state != TRIM(state);
-- not found

-- Inconsistent state format (lowercase/mixed)
SELECT DISTINCT state
FROM state_summary
WHERE state != UPPER(state);
-- not found

-- negative values (impossible in real data)
SELECT *
FROM state_summary
WHERE total_payments < 0
   OR total_services < 0
   OR total_providers < 0;
-- not found