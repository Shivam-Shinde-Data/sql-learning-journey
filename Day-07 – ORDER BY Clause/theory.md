# Day 07 – ORDER BY Clause

## 1. Introduction

The **ORDER BY clause** is used to **sort the result of a SQL query** based on one or more columns.

By default, SQL does **not guarantee any order of rows** in the result.  
If you want the results in a specific order (ascending or descending), you must use **ORDER BY**.

Example:
```sql
SELECT * FROM employees
ORDER BY salary;
```
This query sorts the employees by **salary in ascending order**.

---

## 2. Basic Syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column_name;
```
Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary;
```
This will display employees sorted by salary.

---

## 3. Ascending Order (ASC)

Ascending order means **smallest to largest**.

Examples:
- Numbers → 1, 2, 3, 4
- Text → A, B, C
- Dates → Oldest to Newest

ASC is the **default sorting order**.

Syntax:

```sql
SELECT column_name
FROM table_name
ORDER BY column_name ASC;
```
Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary ASC;

```
---

## 4. Descending Order (DESC)

Descending order means **largest to smallest**.

Examples:
- Numbers → 100, 50, 20
- Text → Z, Y, X
- Dates → Newest to Oldest

Syntax:

```sql
SELECT column_name
FROM table_name
ORDER BY column_name DESC;
```
Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC;
```
This shows the **highest salary first**.

---

## 5. Sorting by Multiple Columns

SQL allows sorting by **multiple columns**.

Syntax:

```sql
SELECT column1, column2
FROM table_name
ORDER BY column1, column2;
```
Example:

```sql
SELECT name, department, salary
FROM employees
ORDER BY department, salary;
```
Explanation:

1. First sorted by department
2. Then salary inside each department

---

## 6. Mixed Sorting Order

You can apply **different sorting directions** for different columns.

Example:

```sql
SELECT name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;
```
Explanation:

- Department → A to Z
- Salary → highest first within department

---

## 7. ORDER BY with Column Number

You can also sort using the **column position** in SELECT.

Example:

```sql
SELECT name, salary
FROM employees
ORDER BY 2 DESC;
```
Here:
- Column 2 = salary

But this method is **not recommended in real projects** because it reduces readability.

---

## 8. ORDER BY with Text Columns

Sorting also works for **VARCHAR or TEXT columns**.

Example:

```sql
SELECT name
FROM employees
ORDER BY name;
```
Output will be alphabetical:

```sql
Amit  
Rahul  
Zoya  
```
---

## 9. ORDER BY with Dates

Example:

```sql
SELECT order_id, order_date
FROM orders
ORDER BY order_date DESC;
```
This returns **latest orders first**.

---

## 10. Real World Example

Imagine an **E-commerce platform**.

To show the **most expensive products first**:

```sql
SELECT product_name, price
FROM products
ORDER BY price DESC;
```
Example Use Cases:

- Show **top paid employees**
- Display **latest orders**
- Sort **products by price**
- Arrange **students by marks**

ORDER BY is widely used in:
- Dashboards
- Reports
- Analytics queries
