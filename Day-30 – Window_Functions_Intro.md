# Day 30 – Window Functions Introduction

## 1. What are Window Functions?

Window Functions perform calculations across a set of rows related to the current row.

- Do NOT collapse rows (unlike GROUP BY)
- Return one result per row
- Used for ranking, running totals, comparisons

---

## 2. Why Use Window Functions?

- Ranking (Top N users, leaderboard)
- Running totals (cumulative sales)
- Compare rows (previous vs current)
- Advanced analytics without losing row-level data

---

## 3. Syntax
```sql
function_name() OVER (
    PARTITION BY column
    ORDER BY column
)
```
---

## 4. Key Components

### OVER()
Defines the window (set of rows)

### PARTITION BY
Splits data into groups (like GROUP BY but keeps rows)

### ORDER BY
Defines order inside each partition

---

## 5. Example Table

orders:

|id | customer | amount |
|---|----------|--------|
|1  | A        | 100 |
|2  | A        | 200 |
|3  | B        | 150 |
|4  | B        | 300 |

---

## 6. Example: Running Total
```sql
SELECT customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer ORDER BY id) AS running_total
FROM orders;
```
---

## 7. Window Function vs GROUP BY

| Feature        | GROUP BY        | Window Function      |
|----------------|----------------|---------------------|
| Rows returned  | Reduced        | Same as original    |
| Aggregation    | Yes            | Yes                 |
| Row-level data | Lost           | Preserved           |

---

## 8. Common Window Functions

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD()
- LAG()
- SUM(), AVG() with OVER()

---

## 9. Real-World Use Cases

- Leaderboards (Top customers)
- Sales trend analysis
- Fraud detection (compare transactions)
- Data engineering pipelines (analytics layer)

---

## 10. Key Points

- Works on a "window" of rows
- Uses OVER() clause
- Keeps original rows intact
- Essential for analytics queries
