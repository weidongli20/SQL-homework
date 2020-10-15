# Looking for Suspicious Transactions

![Credit card fraudster](Images/credit_card_fraudster.jpg)

*[Credit Card Fraudster by Richard Patterson](https://www.flickr.com/photos/136770128@N07/42252105582/) | [Creative Commons Licensed](https://creativecommons.org/licenses/by/2.0/)*

## Background

Fraud is everywhere these days—whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this assignment, will apply the SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

Main tasks:

1. [Data Modeling](#Data-Modeling): Define a database model to store the credit card transactions data and create a new PostgreSQL database using the model.

2. [Data Engineering](#Data-Engineering): Create a database schema on PostgreSQL and populate the database from the CSV files provided.

3. [Data Analysis](#Data-Analysis): Analyze the data to identify possible fraudulent transactions.

---

### Data Modeling

Create an entity relationship diagram (ERD) by inspecting the provided CSV files.

**Note:** For the `credit_card` table, the `card` column should be a VARCHAR(20) datatype rather than an INT.

use a tool like [Quick Database Diagrams](https://app.quickdatabasediagrams.com/#/) to create your model.

### Data Engineering

Using the database model as a blueprint, create a database schema for each of your tables and relationships. Specify data types, primary keys, foreign keys, and any other constraints you defined.

After creating the database schema, import the data from the corresponding CSV files.

### Data Analysis

Now that the data is prepared within the database, it's finally time to identify fraudulent transactions using SQL and Pandas DataFrames. Analyze the data and then create a report within a Jupyter Notebook file to present the findings ...

## Challenge

Another approach to identify fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers.

Read the following articles on outliers detection, and then code a function using Python to identify anomalies for any cardholder.

* [How to Calculate Outliers](https://www.wikihow.com/Calculate-Outliers)

* [Removing Outliers Using Standard Deviation in Python](https://www.kdnuggets.com/2017/02/removing-outliers-standard-deviation-python.html)

* [How to Use Statistics to Identify Outliers in Data](https://machinelearningmastery.com/how-to-use-statistics-to-identify-outliers-in-data/)


