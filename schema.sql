-- Drop table if exists
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS transactions;

-- Create new table
CREATE TABLE card_holder (
  card_holder_id INT NOT NULL,
  card_holder_name VARCHAR(50) NOT NULL
);

-- Create new table to import data
CREATE TABLE credit_card (
  card VARCHAR(20) NOT NULL,
  card_holder_id INT NOT NULL
);

CREATE TABLE merchant_category (
  merchant_cat_id INT NOT NULL,
  merchant_cat_name VARCHAR(50) NOT NULL
);

CREATE TABLE merchant (
  merchant_id INT NOT NULL,
  merchant_name VARCHAR(50) NOT NULL,
  merchant_cat_id INT NOT NULL
);

CREATE TABLE transactions (
  transactions_id INT NOT NULL,
  trans_date timestamp without time zone NOT NULL,
  amount FLOAT,
  card VARCHAR(20) NOT NULL,
  merchat_id INT NOT NULL
);