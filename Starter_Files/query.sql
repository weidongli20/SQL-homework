SELECT * FROM transactions;
SELECT * FROM card_holder;
SELECT * FROM credit_card;

SELECT *
FROM transactions t
JOIN credit_card c ON t.card = c.card
JOIN card_holder a ON a.card_holder_id = c.card_holder_id
;

SELECT trans_date, card, COUNT(*)
FROM transactions
GROUP BY card, trans_date
ORDER BY trans_date
LIMIT 5
;

SELECT *
FROM card_holder
;

SELECT 
  c.card_holder_name, 
  COUNT(t.trans_date) "Total Transactions",
  MIN(t.amount) "Minimum Amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
GROUP BY c.card_holder_name
ORDER BY c.card_holder_name
;


SELECT 
  c.card_holder_name, 
  t.amount "Minimum Amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
GROUP BY c.card_holder_name, t.amount
ORDER BY c.card_holder_name, t.amount DESC
;


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

--ALTER TABLE transactions RENAME merchat_id TO merchant_id
--;

SELECT
  m.merchant_name,
  COUNT(t.amount) "Small Trans Numbers"
FROM transactions t
JOIN merchant m ON t.merchant_id = m.merchant_id
WHERE t.amount < 2
GROUP BY m.merchant_name
ORDER BY COUNT(t.amount) DESC
LIMIT 5
;


SELECT 
  c.card_holder_id, 
  COUNT(t.trans_date) "Total Transactions",
  MIN(t.amount) "Minimum Amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
WHERE (c.card_holder_id = 2 OR c.card_holder_id = 18)
GROUP BY c.card_holder_id
;

CREATE VIEW anomalous_payments AS
SELECT 
  c.card_holder_id,
  c.card_holder_name,
  COUNT(t.trans_date) "Total Transactions",
  MIN(t.amount) "Minimum Amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
WHERE (t.amount*100-ROUND(t.amount*100))>0
GROUP BY c.card_holder_id, c.card_holder_name
ORDER BY c.card_holder_id
;

DROP VIEW IF EXISTS small_payments;

CREATE VIEW small_payments AS
SELECT 
  c.card_holder_id,
  c.card_holder_name,
  COUNT(t.trans_date) "trans_count",
  MIN(t.amount) "min_amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
WHERE t.amount < 2
GROUP BY c.card_holder_id, c.card_holder_name
ORDER BY c.card_holder_id
;

SELECT trans_count, min_amount
FROM small_payments
;

SELECT 
  s.card_holder_id,
  s.card_holder_name,
  trans_count,
  min_amount
FROM small_payments s
JOIN anomalous_payments a
ON s.card_holder_id = a.card_holder_id
ORDER BY trans_count DESC
;

-- visualization

SELECT *
FROM card_holder
WHERE card_holder_id = 2 OR card_holder_id = 18
;

SELECT 
  c.card_holder_id, 
  c.card_holder_name,
  COUNT(t.trans_date) "Total Transactions",
  MIN(t.amount) "Minimum Amount"
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
WHERE (c.card_holder_id = 2 OR c.card_holder_id = 18)
GROUP BY c.card_holder_id, c.card_holder_name
;

SELECT 
  *
FROM card_holder c
JOIN credit_card r ON c.card_holder_id = r.card_holder_id
JOIN transactions t ON t.card = r.card
WHERE (c.card_holder_id = 2 OR c.card_holder_id = 18)
ORDER BY c.card_holder_id
;


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

SELECT 
  trans_date,
  amount,
  card
FROM transactions
WHERE (
	trans_date >= '2018-01-01'
AND trans_date < '2018-07-01'
);

SELECT *
FROM transactions
WHERE transactions_id = 3494
;