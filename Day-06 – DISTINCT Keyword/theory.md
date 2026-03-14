# Day 06 – DISTINCT Keyword

## 1. Introduction

The **DISTINCT keyword** is used to return **unique values** from a column.

When a table contains duplicate values, the DISTINCT keyword helps remove those duplicates and display only **unique records**.

DISTINCT is commonly used in **data analysis and reporting queries**.

---

## 2. Basic Syntax

```sql
SELECT DISTINCT column_name
FROM table_name;
```

This query returns **unique values from the specified column**.

---

## 3. Example Table

Assume we have a table called **students**.

| id | name  | age | course | city   |
|----|------|-----|--------|--------|
| 1 | Rahul | 21 | BSc | Pune |
| 2 | Priya | 20 | BCA | Mumbai |
| 3 | Amit | 22 | BSc | Delhi |
| 4 | Sneha | 21 | BBA | Pune |
| 5 | Rohan | 23 | BCA | Mumbai |
| 6 | Neha | 20 | BSc | Pune |

---

## 4. Example Without DISTINCT

```sql
SELECT city
FROM students;
```

### Output

| city |
|------|
| Pune |
| Mumbai |
| Delhi |
| Pune |
| Mumbai |
| Pune |

In this result, the **city column contains duplicate values**.

---

## 5. Example Using DISTINCT

```sql
SELECT DISTINCT city
FROM students;
```

### Output

| city |
|------|
| Pune |
| Mumbai |
| Delhi |

Here the duplicate cities are removed and only **unique values are displayed**.

---

## 6. DISTINCT with Multiple Columns

DISTINCT can also be applied to multiple columns.

```sql
SELECT DISTINCT course, city
FROM students;
```

This query returns **unique combinations of course and city**.

Example result:

| course | city |
|-------|------|
| BSc | Pune |
| BCA | Mumbai |
| BSc | Delhi |
| BBA | Pune |

---

## 7. Key Points

- DISTINCT removes duplicate values from query results.
- It returns only **unique records**.
- It can be used with **one or multiple columns**.
- It is frequently used in **data analysis queries**.

---

## 8. Real-world Example

Suppose a company wants to know **which cities their customers are from**.

```sql
SELECT DISTINCT city
FROM customers;
```

This query returns a list of **unique customer locations**, which can help businesses analyze their market presence.
