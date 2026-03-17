# Day 09 – BETWEEN Operator (Interview Questions)

## 1. What is the BETWEEN operator in SQL?

The BETWEEN operator is used to **filter rows within a specified range of values**. The range includes both the starting and ending values.

Example:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 70000;
```

---

## 2. Is BETWEEN inclusive or exclusive?

BETWEEN is **inclusive**, meaning it includes both boundary values.

Example:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 45000 AND 65000;
```

This includes **45000 and 65000**.

---

## 3. Can BETWEEN be used with date values?

Yes. BETWEEN is commonly used with **date ranges**.

Example:

```sql
SELECT name, joining_date
FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';
```

---

## 4. Can BETWEEN work with text values?

Yes. BETWEEN can filter **text values alphabetically**.

Example:

```sql
SELECT name
FROM employees
WHERE name BETWEEN 'A' AND 'M';
```

---

## 5. What is NOT BETWEEN?

NOT BETWEEN is used to **exclude values within a specific range**.

Example:

```sql
SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 50000 AND 70000;
```

---

## 6. Can BETWEEN be used with other conditions?

Yes. BETWEEN can be combined with **AND or OR conditions**.

Example:

```sql
SELECT name, department, salary
FROM employees
WHERE department = 'IT'
AND salary BETWEEN 60000 AND 80000;
```

---

## 7. What is the equivalent of BETWEEN using comparison operators?

BETWEEN can be replaced using **>= and <=**.

Example:

```sql
SELECT *
FROM employees
WHERE salary >= 50000
AND salary <= 70000;
```

---

## 8. Can BETWEEN be used with numbers?

Yes. BETWEEN works with **numeric ranges**.

Example:

```sql
SELECT name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 60000;
```

---

## 9. Where is BETWEEN used in real-world SQL queries?

BETWEEN is commonly used for:

- Salary ranges
- Product price ranges
- Order date ranges
- Student marks ranges

Example:

```sql
SELECT product_name, price
FROM products
WHERE price BETWEEN 1000 AND 5000;
```

---

## 10. What happens if the start value is greater than the end value?

The query may return **no results** because the range becomes invalid.

Example:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 70000 AND 50000;
```
