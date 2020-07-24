-- For the time period 7:00 am to 9:00 am
-- The 100 highest transactions during

CREATE VIEW top_100_trans_7_9 AS
SELECT 
  trans_date,
  amount,
  card
FROM transactions
WHERE (
	EXTRACT(HOUR FROM trans_date) > 7 
    AND EXTRACT(HOUR FROM trans_date) < 9)
ORDER BY amount DESC
LIMIT 100
;

-- Small payments
CREATE VIEW small_payments AS
SELECT
  m.merchant_name,
  COUNT(t.amount) "Small Trans Numbers",
  MIN(t.amount) "Least Payment"
FROM transactions t
JOIN merchant m ON t.merchant_id = m.merchant_id
WHERE t.amount < 2
GROUP BY m.merchant_name
ORDER BY MIN(t.amount)
;
-- top 5
CREATE VIEW small_payments_top5_merchants AS
SELECT
  m.merchant_name,
  COUNT(t.amount) "Small Trans Numbers",
  MIN(t.amount) "Least Payment"
FROM transactions t
JOIN merchant m ON t.merchant_id = m.merchant_id
WHERE t.amount < 2
GROUP BY m.merchant_name
ORDER BY MIN(t.amount)
LIMIT 5
;
