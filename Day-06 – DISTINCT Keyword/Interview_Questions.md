# Day 06 – SQL Interview Questions (DISTINCT)

Below are commonly asked SQL interview questions related to the **DISTINCT keyword**.

---

## 1. What is the DISTINCT keyword in SQL?

The `DISTINCT` keyword is used to return **unique values** from a column by removing duplicate records from the result set.

Example:

```sql
SELECT DISTINCT city
FROM students;
```

This query returns only **unique city values** from the students table.

---

## 2. Why is DISTINCT used in SQL?

`DISTINCT` is used to:

- Remove duplicate values
- Retrieve unique records
- Analyze unique data in a dataset

It is commonly used in **data analysis queries**.

---

## 3. Can DISTINCT be used with multiple columns?

Yes, `DISTINCT` can be used with multiple columns.

Example:

```sql
SELECT DISTINCT course, city
FROM students;
```

This query returns **unique combinations of course and city**.

---

## 4. What happens if DISTINCT is not used?

Without `DISTINCT`, SQL returns **all records including duplicates**.

Example:

```sql
SELECT city
FROM students;
```

Output may contain duplicate values such as:

| city |
|------|
| Pune |
| Mumbai |
| Pune |
| Delhi |

---

## 5. Can DISTINCT be used with SELECT * ?

Yes, `DISTINCT` can be used with `SELECT *`.

Example:

```sql
SELECT DISTINCT *
FROM students;
```

In this case, SQL removes duplicate **entire rows** from the result.

---

## 6. What is the difference between DISTINCT and GROUP BY?

| DISTINCT | GROUP BY |
|----------|----------|
| Removes duplicate rows | Groups rows with the same values |
| Simple to use | Often used with aggregate functions |

Example:

```sql
SELECT DISTINCT city
FROM students;
```

---

## 7. Is DISTINCT applied before or after WHERE?

`WHERE` is applied first and then `DISTINCT` is applied to the filtered result.

Example:

```sql
SELECT DISTINCT city
FROM students
WHERE age > 20;
```

This returns unique cities **only for students older than 20**.

---

## 8. Does DISTINCT affect query performance?

Yes, `DISTINCT` can slightly affect performance because the database must check for duplicate values before returning the result.

However, for small datasets the impact is minimal.

---

## 9. Can DISTINCT be used with aggregate functions?

Yes, `DISTINCT` can be used inside aggregate functions.

Example:

```sql
SELECT COUNT(DISTINCT city)
FROM students;
```

This counts the number of **unique cities** in the table.

---

## 10. Give a real-world example of DISTINCT.

Suppose a company wants to know **all unique departments in their organization**.

```sql
SELECT DISTINCT department
FROM employees;
```

This query returns a list of **unique departments** in the company.
