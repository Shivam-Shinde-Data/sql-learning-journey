# Day 34 – PARTITION BY

## 1. What is PARTITION BY?

PARTITION BY is used in window functions to divide data into groups (partitions).

- Works like GROUP BY but does NOT collapse rows
- Each partition is processed separately
- Window functions restart for each partition

---

## 2. Syntax
```sql
function_name() OVER (
    PARTITION BY column
    ORDER BY column
)
```
---

## 3. Key Idea

- GROUP BY → reduces rows
- PARTITION BY → keeps rows, just groups internally

---

## 4. Example Table

orders:

| id | customer | amount |
|----|----------|--------|
| 1  | A        | 100    |
| 2  | A        | 200    |
| 3  | B        | 150    |
| 4  | B        | 300    |

---

## 5. Without PARTITION BY
```sql
SELECT id,
       customer,
       amount,
       SUM(amount) OVER () AS total_amount
FROM orders;
```
Output:

| id | customer | amount | total_amount |
|----|----------|--------|--------------|
| 1  | A        | 100    | 750          |
| 2  | A        | 200    | 750          |
| 3  | B        | 150    | 750          |
| 4  | B        | 300    | 750          |

---

## 6. With PARTITION BY
```sql
SELECT id,
       customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer) AS total_per_customer
FROM orders;
```
Output:

| id | customer | amount | total_per_customer |
|----|----------|--------|--------------------|
| 1  | A        | 100    | 300                |
| 2  | A        | 200    | 300                |
| 3  | B        | 150    | 450                |
| 4  | B        | 300    | 450                |

---

## 7. PARTITION BY + ORDER BY
```sql
SELECT id,
       customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer ORDER BY id) AS running_total
FROM orders;
```
Output:

| id | customer | amount | running_total |
|----|----------|--------|---------------|
| 1  | A        | 100    | 100           |
| 2  | A        | 200    | 300           |
| 3  | B        | 150    | 150           |
| 4  | B        | 300    | 450           |

---

## 8. Multiple PARTITION BY Columns
```sql
SELECT id,
       customer,
       amount,
       COUNT(*) OVER (PARTITION BY customer, amount) AS count_same
FROM orders;
```
Output:

| id | customer | amount | count_same |
|----|----------|--------|------------|
| 1  | A        | 100    | 1          |
| 2  | A        | 200    | 1          |
| 3  | B        | 150    | 1          |
| 4  | B        | 300    | 1          |

---

## 9. PARTITION BY vs GROUP BY

| Feature        | GROUP BY        | PARTITION BY      |
|----------------|----------------|-------------------|
| Rows returned  | Reduced        | Same              |
| Aggregation    | Yes            | Yes               |
| Row-level data | Lost           | Preserved         |

---

## 10. Real-World Use Cases

- Customer-wise analysis
- Category-wise ranking
- Running totals per group
- Data analytics pipelines

---

## 11. Key Points

- Divides data into groups
- Works only with window functions
- Does NOT reduce rows
- Very important for analytics
