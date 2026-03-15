# Day 07 – ORDER BY Clause (10 Interview Questions)

## 1. What is the ORDER BY clause in SQL?
The **ORDER BY clause** is used to **sort the result of a SQL query** based on one or more columns. It helps present data in a meaningful order such as highest salary, alphabetical names, or latest dates.

Example:

```sql
SELECT * 
FROM employees
ORDER BY salary;
```

---

## 2. What is the default sorting order in ORDER BY?
The default sorting order is **Ascending (ASC)**. This means values are sorted from **smallest to largest**.

Example:

```sql
SELECT name
FROM employees
ORDER BY name;
```

---

## 3. What is the difference between ASC and DESC?
- **ASC (Ascending)** → Smallest to largest  
- **DESC (Descending)** → Largest to smallest  

Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC;
```

---

## 4. Can we sort data using multiple columns?
Yes, SQL allows sorting using **multiple columns**. The database first sorts by the first column, and if values are equal, it sorts by the second column.

Example:

```sql
SELECT name, department, salary
FROM employees
ORDER BY department, salary;
```

---

## 5. Can we apply different sorting orders to different columns?
Yes, you can specify **ASC or DESC for each column separately**.

Example:

```sql
SELECT name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;
```

---

## 6. Can ORDER BY be used with text columns?
Yes, ORDER BY can sort **text or string columns alphabetically**.

Example:

```sql
SELECT name
FROM employees
ORDER BY name;
```

---

## 7. Can ORDER BY be used with date columns?
Yes, ORDER BY can sort **date columns** either from oldest to newest or newest to oldest.

Example:

```sql
SELECT order_id, order_date
FROM orders
ORDER BY order_date DESC;
```

---

## 8. Can we use ORDER BY with column numbers?
Yes, you can use the **column position number** from the SELECT statement.

Example:

```sql
SELECT name, salary
FROM employees
ORDER BY 2 DESC;
```

Here **2 refers to the salary column**.

---

## 9. Can ORDER BY be used with SELECT specific columns?
Yes, ORDER BY works with both **SELECT * and selected columns**.

Example:

```sql
SELECT name, salary
FROM employees
ORDER BY salary;
```

---

## 10. Is ORDER BY mandatory in SQL queries?
No, ORDER BY is **optional**. Without ORDER BY, the database may return rows in **any order**.

Example:

```sql
SELECT *
FROM employees;
```
