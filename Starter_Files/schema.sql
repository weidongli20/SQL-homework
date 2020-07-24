-- Drop Views

DROP VIEW IF EXISTS small_payments;
DROP VIEW IF EXISTS small_payments_top5_merchants;
DROP VIEW IF EXISTS top_100_trans_7_9;

-- Drop table if exists
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS transactions;

-- Create new table
CREATE TABLE card_holder (
  card_holder_id INT NOT NULL,
  card_holder_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (card_holder_id)
);

-- Create new table to import data
CREATE TABLE credit_card (
  card VARCHAR(20) NOT NULL,
  card_holder_id INT NOT NULL,
  PRIMARY KEY (card),
  FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)
);

CREATE TABLE merchant_category (
  merchant_cat_id INT NOT NULL,
  merchant_cat_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (merchant_cat_id)
);

CREATE TABLE merchant (
  merchant_id INT NOT NULL,
  merchant_name VARCHAR(50) NOT NULL,
  merchant_cat_id INT NOT NULL,
  PRIMARY KEY (merchant_id),
  FOREIGN KEY (merchant_cat_id) REFERENCES merchant_category(merchant_cat_id)
);

CREATE TABLE transactions (
  transactions_id INT NOT NULL,
  trans_date timestamp without time zone NOT NULL,
  amount FLOAT,
  card VARCHAR(20) NOT NULL,
  merchant_id INT NOT NULL,
  PRIMARY KEY (transactions_id),
  FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
  FOREIGN KEY (card) REFERENCES credit_card(card)
);
