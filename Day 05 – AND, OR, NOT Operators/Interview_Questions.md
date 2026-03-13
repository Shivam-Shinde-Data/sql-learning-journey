# Day 05 – SQL Interview Questions (AND, OR, NOT)

Below are commonly asked SQL interview questions related to **logical operators (AND, OR, NOT)**.

---

## 1. What are logical operators in SQL?

Logical operators are used to combine multiple conditions in a SQL query.

Common logical operators in SQL are:

- AND
- OR
- NOT

They are mainly used with the `WHERE` clause to filter records.

---

## 2. What does the AND operator do in SQL?

The **AND operator** returns records only when **all conditions are true**.

Example:

```sql
SELECT *
FROM students
WHERE course = 'BSc' AND city = 'Pune';
```

This query returns students who study **BSc and live in Pune**.

---

## 3. What does the OR operator do in SQL?

The **OR operator** returns records when **at least one condition is true**.

Example:

```sql
SELECT *
FROM students
WHERE city = 'Pune' OR city = 'Mumbai';
```

This query returns students who live in **Pune or Mumbai**.

---

## 4. What is the NOT operator in SQL?

The **NOT operator** is used to exclude records that match a condition.

Example:

```sql
SELECT *
FROM students
WHERE NOT city = 'Pune';
```

This query returns students who **do not live in Pune**.

---

## 5. Can AND and OR be used together in a SQL query?

Yes, **AND and OR can be used together** in the same query.

Example:

```sql
SELECT *
FROM students
WHERE course = 'BSc' AND (city = 'Pune' OR city = 'Delhi');
```

This query retrieves students who study **BSc and live in Pune or Delhi**.

---

## 6. What is the difference between AND and OR?

| Operator | Meaning |
|--------|--------|
| AND | All conditions must be true |
| OR | At least one condition must be true |

Example:

```sql
SELECT *
FROM students
WHERE age > 20 AND city = 'Pune';
```

---

## 7. In which clause are AND, OR, and NOT usually used?

Logical operators are mostly used in the **WHERE clause**.

Example:

```sql
SELECT *
FROM students
WHERE age > 20 AND course = 'BSc';
```

---

## 8. What happens if conditions are written without logical operators?

SQL will throw an **error** because conditions must be connected using logical operators.

Incorrect:

```sql
SELECT *
FROM students
WHERE age > 20 city = 'Pune';
```

Correct:

```sql
SELECT *
FROM students
WHERE age > 20 AND city = 'Pune';
```

---

## 9. Why are logical operators important in SQL?

Logical operators help in:

- Filtering data
- Combining multiple conditions
- Writing complex queries
- Retrieving accurate data from a database

---

## 10. Give a real-world example of logical operators in SQL.

Example: Retrieve employees who work in the **IT department and earn more than 50000**.

```sql
SELECT *
FROM employees
WHERE department = 'IT' AND salary > 50000;
```

This query returns employees who satisfy **both conditions**.
