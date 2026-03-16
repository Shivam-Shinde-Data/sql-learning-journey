# Day 08 – LIMIT Clause

## 1. Introduction

The **LIMIT clause** is used to **restrict the number of rows returned by a SQL query**.

Sometimes tables contain thousands or millions of rows. In such cases, we may only want to see a **small portion of the result**. The LIMIT clause helps us control how many rows should appear in the output.

Example:

```sql
SELECT *
FROM employees
LIMIT 5;
```

This query returns **only the first 5 rows** from the employees table.

---

## 2. Basic Syntax

The basic syntax of LIMIT is:

```sql
SELECT column1, column2
FROM table_name
LIMIT number;
```

Example:

```sql
SELECT name, salary
FROM employees
LIMIT 3;
```

This returns the **first 3 rows** from the result.

---

## 3. LIMIT with ORDER BY

LIMIT is often used together with **ORDER BY** to get **Top N results**.

Example: Highest paid employees

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

This query returns the **top 3 highest salary employees**.

---

## 4. LIMIT with OFFSET

Sometimes we want to **skip some rows** before selecting rows. For this purpose, we use **OFFSET**.

Syntax:

```sql
SELECT column1
FROM table_name
LIMIT number OFFSET number;
```

Example:

```sql
SELECT *
FROM employees
LIMIT 3 OFFSET 2;
```

Explanation:
- Skip first **2 rows**
- Then return **next 3 rows**

---

## 5. LIMIT for Pagination

LIMIT is widely used in **web applications** for pagination.

Example:

Page 1

```sql
SELECT *
FROM products
LIMIT 10 OFFSET 0;
```

Page 2

```sql
SELECT *
FROM products
LIMIT 10 OFFSET 10;
```

Page 3

```sql
SELECT *
FROM products
LIMIT 10 OFFSET 20;
```

This helps websites load **small chunks of data instead of the full dataset**.

---

## 6. LIMIT with SELECT *

LIMIT works with both **SELECT * and specific columns**.

Example:

```sql
SELECT *
FROM orders
LIMIT 5;
```

Example with specific columns:

```sql
SELECT order_id, order_date
FROM orders
LIMIT 5;
```

---

## 7. LIMIT with Conditions

LIMIT can also be used together with **WHERE conditions**.

Example:

```sql
SELECT name, salary
FROM employees
WHERE department = 'IT'
LIMIT 2;
```

This returns **2 employees from the IT department**.

---

## 8. Database Support

LIMIT is supported in:

- MySQL
- PostgreSQL
- SQLite

In **SQL Server**, a similar function is used called **TOP**.

Example (SQL Server):

```sql
SELECT TOP 5 *
FROM employees;
```

---

## 9. Real World Example

LIMIT is commonly used in:

- **Top 10 products**
- **Latest 5 orders**
- **Top 3 highest salary employees**
- **Pagination in websites**
- **Dashboard reports**

Example:

```sql
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;
```

This shows the **5 most expensive products**.
