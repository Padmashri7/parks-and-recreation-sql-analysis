# Parks and Recreation: SQL Analysis Project

A hands-on MySQL project exploring relational databases, employee information, salary analysis and department-level data through practical SQL queries.

This project uses a sample Parks and Recreation employee database to practise SQL fundamentals and advanced querying techniques, progressing from data retrieval to joins, analytical functions and database programming.

---

## Database Overview

The project uses three relational tables:

| Table | Purpose |
|---|---|
| `employee_demographics` | Employee age, gender and birth-date information |
| `employee_salary` | Employee occupations, salaries and department IDs |
| `parks_departments` | Department names and identifiers |

The tables are connected through employee IDs and department IDs, allowing employee and organisational information to be queried together.

## SQL Skills Demonstrated

| Area | Concepts and functions |
|---|---|
| Database Management | `CREATE DATABASE`, `CREATE TABLE`, `PRIMARY KEY` |
| Data Manipulation | `INSERT INTO` |
| Data Filtering | `WHERE`, `AND`, `OR`, `IN`, `LIKE` |
| Aggregation | `GROUP BY`, `HAVING`, `AVG()`, `COUNT()`, `MIN()`, `MAX()` |
| Sorting and Limiting | `ORDER BY`, `LIMIT` |
| Joins | `INNER JOIN`, `LEFT JOIN`, Self Join |
| String Functions | `CONCAT()`, `TRIM()`, `SUBSTRING()`, `REPLACE()`, `UPPER()`, `LOWER()` |
| Conditional Logic | `CASE WHEN` |
| Subqueries | Nested queries and `IN` |
| Window Functions | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `OVER()`, `PARTITION BY` |
| Advanced Querying | Common Table Expressions (CTEs), temporary tables |
| Database Programming | Stored procedures, triggers and events |

---

## Query Gallery

The following seven screenshots demonstrate selected SQL queries and their execution results.

### 1. Data Aggregation — GROUP BY and HAVING

Calculated average, maximum and minimum employee ages, along with employee counts, grouped by gender. Used `HAVING` to filter aggregated results.

![Employee Age Analysis](images/01_gender_age_summary.png)

### 2. Relational Analysis — Multi-table JOIN

Combined employee demographics, salary records and department information using `INNER JOIN` to create a consolidated view of employee and organisational data.

![Employee and Department Joins](images/02_employee_department_joins.png)

### 3. Business Logic — CASE Statements

Applied conditional logic to calculate revised employee salaries based on salary thresholds and identify department-specific bonus eligibility.

![Salary Revision and Bonus Calculation](images/03_salary_revision_and_bonus_case.png)

### 4. Analytical Ranking — Window Functions

Used `ROW_NUMBER()`, `RANK()` and `DENSE_RANK()` with `PARTITION BY` to rank employees by salary within gender groups.

![Employee Salary Ranking](images/04_employee_salary_window_ranking.png)

### 5. Query Organisation — Common Table Expressions

Created a CTE to calculate gender-wise salary statistics, including average salary, highest salary, lowest salary and employee count.

![CTE Salary Summary](images/05_gender_salary_summary_cte.png)

### 6. Nested Queries — Subqueries

Used a subquery with the `IN` operator to retrieve employees assigned to a particular department.

![Department-based Employee Selection](images/06_department_employee_subquery.png)

### 7. Database Programming — Stored Procedures

Created and executed a stored procedure to retrieve employees earning at least 50,000, with results ordered by salary in descending order.

![High Salary Stored Procedure](images/07_high_salary_stored_procedure.png)

---

## Key Learning Outcomes

- Practised retrieving, filtering and organising records using SQL.
- Combined employee, salary and department information through joins.
- Applied aggregate functions to summarise employee and salary data.
- Used conditional expressions to calculate revised salaries and department-specific bonuses.
- Applied window functions to rank employees within groups.
- Structured analytical queries using CTEs and subqueries.
- Explored reusable database operations through stored procedures, triggers and events.

## Project Files

| File | Description |
|---|---|
| `parks_and_recreation.sql` | Database creation, sample data and SQL practice queries |
| `images/` | Seven selected SQL query screenshots and execution results |

## Tools Used

- MySQL
- MySQL Workbench
- SQL

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open the SQL script in MySQL Workbench.
3. Review the script before execution.
4. Execute the database setup and sample data statements.
5. Run the analytical queries to explore the database.

> **Important safety note:** The script begins with `DROP DATABASE IF EXISTS`, which can delete an existing database with the same name. It also contains an event that periodically deletes employee demographic records for employees aged 60 or above. Review or disable these statements before running the complete script.

## Project Scope

This is a learning and practice project built around a small sample employee dataset. Its purpose is to demonstrate SQL querying techniques, relational database operations and analytical thinking rather than to represent production-scale business data.

---

*Developed as part of my continued learning in SQL and data analytics.*
