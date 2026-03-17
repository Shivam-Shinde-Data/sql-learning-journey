# Day 09 – BETWEEN Operator

## 1. Introduction

The **BETWEEN operator** is used to **filter records within a specific range of values**.

It is commonly used with:
- Numbers
- Dates
- Text (alphabetical range)

The BETWEEN operator is **inclusive**, meaning the start and end values are included in the result.

Example:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;
```

This query returns employees whose salary is **between 40000 and 70000 including both values**.

---

## 2. Basic Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

Example:

```sql
SELECT name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 80000;
```

---

## 3. BETWEEN with Numbers

BETWEEN is often used to filter **numeric values**.

Example:

```sql
SELECT name, salary
FROM employees
WHERE salary BETWEEN 45000 AND 65000;
```

This returns employees whose salary is **within that range**.

---

## 4. BETWEEN with Dates

BETWEEN is very useful when filtering **date ranges**.

Example:

```sql
SELECT name, joining_date
FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';
```

This returns employees who joined **between the specified dates**.

---

## 5. BETWEEN with Text

BETWEEN can also work with **text values**.

Example:

```sql
SELECT name
FROM employees
WHERE name BETWEEN 'A' AND 'M';
```

This returns names **starting alphabetically between A and M**.

---

## 6. NOT BETWEEN

To exclude a range of values, we use **NOT BETWEEN**.

Example:

```sql
SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 40000 AND 70000;
```

This returns employees whose salary is **outside that range**.

---

## 7. BETWEEN with Multiple Conditions

BETWEEN can be combined with other conditions using **AND or OR**.

Example:

```sql
SELECT name, department, salary
FROM employees
WHERE department = 'IT'
AND salary BETWEEN 50000 AND 80000;
```

This returns IT employees whose salary falls within that range.

---

## 8. BETWEEN vs >= AND <=

BETWEEN is equivalent to using **>= and <=**.

Example using BETWEEN:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 70000;
```

Equivalent query:

```sql
SELECT *
FROM employees
WHERE salary >= 50000
AND salary <= 70000;
```

Both queries return the same result.

---

## 9. Real World Example

BETWEEN is widely used in:

- Filtering **salary ranges**
- Selecting **orders between dates**
- Finding **students with marks in a specific range**
- Retrieving **products within a price range**

Example:

```sql
SELECT product_name, price
FROM products
WHERE price BETWEEN 1000 AND 5000;
```

This returns products whose price is **between 1000 and 5000**.
