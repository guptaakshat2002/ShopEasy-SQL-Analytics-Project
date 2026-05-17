# ShopEasy SQL Analytics Project

## Business Context

This project simulates a real-world e-commerce analytics environment for ShopEasy, a mid-sized Indian e-commerce company.

The goal of this project is to analyze customer behavior, product performance, revenue trends, and customer retention using SQL.

---

## Tools Used

- PostgreSQL
- SQL
- pgAdmin

---

## Database Schema

The project contains four tables:

1. customers
2. products
3. orders
4. order_items

Main concepts covered:
- JOINS
- CTEs
- Window Functions
- CASE Statements
- Aggregations
- Revenue Analytics
- Customer Segmentation

---

## Business Questions Answered

### Analyst Fundamentals
- Top-performing cities by delivered revenue
- Customers with zero orders
- Category-level sales analysis

### Intermediate Analytics
- Best-selling products by category
- Customer segmentation by revenue
- Churn signal detection

### Advanced Analytics
- Month-over-month revenue growth
- Customer repeat purchase analysis

---

## Key Findings

- Mumbai contributed the highest delivered revenue among all cities.
- Electronics generated the largest share of platform revenue.
- Multiple customers placed repeat orders within 30 days, indicating strong retention potential.

---

## Folder Structure

```text
shopeasy-sql-analytics/
├── schema.sql
├── data_load.sql
├── analysis.sql
└── README.md
