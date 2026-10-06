# Advanced SQL Query Explanation

## Overview

This repository documents my advanced SQL query explanation and business-analysis practice.

The objective was not only to write SQL queries, but to understand what each query is doing, why a particular SQL technique is used, how the result should be interpreted, and what business decision the analysis can support.

The practice was designed around an analyst mindset: moving from SQL syntax and query logic to meaningful business interpretation.

## Objectives

The main objectives of this project were to:

* Develop strong SQL query-reading and explanation skills
* Understand SQL execution logic from beginning to end
* Explain joins and filtering decisions clearly
* Interpret aggregation and conditional aggregation
* Understand the difference between WHERE and HAVING
* Analyze subqueries and CTE-based queries
* Interpret window-function-based business metrics
* Identify logical problems in SQL queries
* Translate SQL output into business insights
* Practice answering SQL interview questions in an analyst-oriented manner

## Key Topics Covered

### Query Logic

* SELECT
* FROM
* JOIN
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* DISTINCT

### Joins

* INNER JOIN
* LEFT JOIN
* Join conditions
* Preserving unmatched records
* Filtering inside JOIN versus WHERE
* Identifying unintended LEFT JOIN behavior

### Aggregation

* COUNT()
* COUNT(DISTINCT ...)
* SUM()
* AVG()
* GROUP-level calculations
* Conditional aggregation
* NULL handling

### Conditional Logic

* CASE expressions
* Conditional counting
* Conditional revenue calculations
* Completed versus cancelled order analysis
* Business classification logic

### Subqueries and CTEs

* IN-based subqueries
* Customer-level aggregation
* CTE-based analytical workflows
* Separating intermediate calculations from final metrics

### Advanced Analytical Concepts

* Revenue share
* Average Order Value
* Cancellation rate
* Purchase rate
* Customer penetration
* Category contribution
* Customer and product segmentation
* Revenue versus order performance
* Business performance comparison

## Business Metrics Practiced

The queries were designed around realistic business questions involving:

* Total orders
* Completed orders
* Cancelled orders
* Completed revenue
* Average Order Value
* Cancellation rate
* Purchase rate
* Revenue contribution
* Revenue share
* Customer counts
* Purchasing customer counts
* Product performance
* Category performance
* City-level performance

## Analyst Thinking

A major focus of this project was learning not to treat a SQL result as the final answer.

For example, the category with the highest revenue is not automatically the category that deserves the largest marketing investment.

Additional metrics may reveal:

* High cancellation rates
* Low purchase rates
* Low customer penetration
* Low AOV
* Heavy dependence on a small customer base
* Unfavorable product mix
* Weak contribution relative to the total business

Similarly, an increase in completed revenue does not automatically prove that marketing performance improved.

Revenue should be decomposed into factors such as:

* New versus returning customers
* Number of orders
* Purchasing customers
* Average Order Value
* Product mix
* Cancellation rate
* Customer geography
* Channel performance

This approach helps move from descriptive SQL reporting toward analytical problem solving.

## Query Explanation Framework

For each query, I practiced answering questions such as:

1. What business question is the query answering?
2. Which tables are involved?
3. How are the tables connected?
4. Why was a particular JOIN selected?
5. Where is filtering happening?
6. What happens during GROUP BY?
7. How are metrics calculated?
8. Why is CASE required?
9. Why is HAVING used instead of WHERE?
10. How does the query handle NULL or zero values?
11. What does the final output actually represent?
12. What business decision could the result support?

## Important SQL Concepts Learned

### LEFT JOIN vs INNER JOIN

LEFT JOIN is useful when the analysis must preserve entities from the primary table even when matching records do not exist.

For example, when analyzing customers, a LEFT JOIN can preserve customers who have no orders.

### WHERE vs HAVING

WHERE filters rows before aggregation.

HAVING filters groups after aggregation.

This distinction is particularly important when filtering metrics such as:

* Total revenue
* Order count
* Customer count
* Completed revenue

### Conditional Aggregation

CASE expressions combined with aggregation allow multiple business metrics to be calculated from the same dataset.

Examples include:

* Completed orders
* Cancelled orders
* Completed revenue
* Cancellation rate

### NULLIF()

NULLIF() was practiced as a division-by-zero safeguard when calculating metrics such as:

* AOV
* Cancellation rate
* Purchase rate
* Revenue contribution

### COUNT(DISTINCT)

COUNT(DISTINCT ...) was used when the business question required unique entities rather than raw row counts.

This is particularly important for:

* Unique customers
* Unique orders
* Unique products

## Business Case Analysis

The final exercises focused heavily on interview-style business situations.

Examples included:

* Revenue versus order performance
* City performance evaluation
* Category marketing allocation
* Cancellation risk
* Customer purchasing behavior
* Revenue share analysis
* Conversion and purchase rates
* Diagnosing revenue growth

The goal was to avoid single-metric conclusions and instead evaluate business performance using a combination of metrics.

## Learning Outcome

Through this project, I strengthened my ability to:

* Read complex SQL queries
* Explain query execution logically
* Identify the purpose of each SQL clause
* Detect common SQL logic problems
* Connect SQL techniques with business metrics
* Translate query results into business language
* Challenge misleading single-metric conclusions
* Approach SQL interview questions from an analyst's perspective

The broader learning was that SQL is not only about retrieving data.

**Good analytical SQL connects data, metrics, context, and business decisions.**

## Tools & Technologies

* MySQL
* MySQL Workbench
* SQL
* Relational Database Concepts
* Business Analytics
* Data Analysis

## Repository Structure

```text
Advanced-SQL-Query-Explanation/
│
├── README.md
│
├── query-explanations/
│   ├── intermediate-query-explanation.sql
│   └── advanced-query-explanation.sql
│
└── business-analysis/
    └── business-case-questions.sql
```

## Profile

I am **Shorya Dev Bisht**, a Data Analyst, Data Scientist, and Web Analyst focused on turning data into measurable business insights.

### Connect With Me

* LinkedIn: https://www.linkedin.com/in/shorya-bisht-a20144349/
* GitHub: https://github.com/datascientistshorya
* Medium: https://medium.com/@its.shoryabisht

## Final Takeaway

This project represents a transition from simply writing SQL queries to thinking like an analyst.

The emphasis is on understanding not just **what the query returns**, but also:

**Why was it written this way?
What does the result mean?
What could be wrong with the interpretation?
And what business decision can it support?**
