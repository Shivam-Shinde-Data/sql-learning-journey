# Day 08 – LIMIT Clause (Interview Questions)

## 1. What is the LIMIT clause in SQL?

The LIMIT clause is used to **restrict the number of rows returned by a query result**.

Example:

```sql
SELECT *
FROM employees
LIMIT 5;
```

---

## 2. Why is LIMIT used in SQL?

LIMIT is used to **retrieve only a specific number of rows**, which helps when working with large datasets.

Example:

```sql
SELECT name, salary
FROM employees
LIMIT 10;
```

---

## 3. Can LIMIT be used with ORDER BY?

Yes. LIMIT is commonly used with ORDER BY to get **Top N results**.

Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

## 4. What is OFFSET in SQL?

OFFSET is used to **skip a certain number of rows before returning the result**.

Example:

```sql
SELECT *
FROM employees
LIMIT 3 OFFSET 2;
```

---

## 5. What is the difference between LIMIT and OFFSET?

- **LIMIT** → Specifies how many rows to return  
- **OFFSET** → Specifies how many rows to skip before returning rows

Example:

```sql
SELECT *
FROM employees
LIMIT 5 OFFSET 10;
```

---

## 6. Can LIMIT be used with WHERE clause?

Yes. LIMIT can be combined with WHERE conditions.

Example:

```sql
SELECT name
FROM employees
WHERE department = 'IT'
LIMIT 2;
```

---

## 7. Does LIMIT work with SELECT *?

Yes. LIMIT works with both **SELECT * and specific columns**.

Example:

```sql
SELECT *
FROM employees
LIMIT 4;
```

---

## 8. Which databases support LIMIT?

LIMIT is supported by:

- MySQL  
- PostgreSQL  
- SQLite  

Example:

```sql
SELECT *
FROM products
LIMIT 10;
```

---

## 9. What is the equivalent of LIMIT in SQL Server?

SQL Server uses the **TOP keyword** instead of LIMIT.

Example:

```sql
SELECT TOP 5 *
FROM employees;
```

---

## 10. Where is LIMIT used in real-world applications?

LIMIT is commonly used in:

- Pagination in websites
- Top 10 products
- Latest orders
- Dashboard reports

Example:

```sql
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;
```
