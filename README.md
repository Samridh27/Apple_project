# ![Apple Logo](https://github.com/najirh/Apple-Retail-Sales-SQL-Project---Analyzing-Millions-of-Sales-Rows/blob/main/Apple_Changsha_RetailTeamMembers_09012021_big.jpg.slideshow-xlarge_2x.jpg) Apple Retail Sales SQL Project - Analyzing Millions of Sales Rows

## Project Overview

The primary objective of this project was to leverage SQL for a comprehensive analysis of Apple's business operations. By combining data from different domains—sales, products, and warranty—I aimed to provide actionable insights for business decision-making. The project addresses questions related to sales performance, product trends, store efficiency, and warranty claim patterns.

This project uses SQL to analyze a multi-faceted dataset of Apple's sales, products, stores, and warranty claims. It uncovers key business insights and showcases my proficiency in data manipulation and querying.

## Entity Relationship Diagram (ERD)

![ERD](https://github.com/najirh/Apple-Retail-Sales-SQL-Project---Analyzing-Millions-of-Sales-Rows/blob/main/erd.png)

## Key Questions Answered

Through a series of SQL queries, the project provides answers to the following questions:

- Which stores are top performers in terms of total sales and units sold?
- What are the best-selling products?
- What is the relationship between product price and the number of warranty claims?
- How do warranty claims vary by product category and region?
- How has sales performance evolved over time, and what are the monthly and yearly growth trends?

## Technical Skills Highlighted

- Advanced SQL: Utilized complex joins, subqueries, and aggregation functions to combine and summarize data from multiple tables.
- Data Cleaning & Transformation: Handled data inconsistencies and prepared the dataset for analysis.
- Exploratory Data Analysis (EDA): Explored the data to identify patterns, trends, and anomalies.
- Performance Optimization: Implemented techniques like indexing to significantly reduce query execution time.
- Window Functions: Used for tasks such as ranking products by sales and calculating running totals.

## Database Schema

The project uses five main tables:

1. **stores**: Contains information about Apple retail stores.
   - `store_id`: Unique identifier for each store.
   - `store_name`: Name of the store.
   - `city`: City where the store is located.
   - `country`: Country of the store.

2. **category**: Holds product category information.
   - `category_id`: Unique identifier for each product category.
   - `category_name`: Name of the category.

3. **products**: Details about Apple products.
   - `product_id`: Unique identifier for each product.
   - `product_name`: Name of the product.
   - `category_id`: References the category table.
   - `launch_date`: Date when the product was launched.
   - `price`: Price of the product.

4. **sales**: Stores sales transactions.
   - `sale_id`: Unique identifier for each sale.
   - `sale_date`: Date of the sale.
   - `store_id`: References the store table.
   - `product_id`: References the product table.
   - `quantity`: Number of units sold.

5. **warranty**: Contains information about warranty claims.
   - `claim_id`: Unique identifier for each warranty claim.
   - `claim_date`: Date the claim was made.
   - `sale_id`: References the sales table.
   - `repair_status`: Status of the warranty claim (e.g., Paid Repaired, Warranty Void).
