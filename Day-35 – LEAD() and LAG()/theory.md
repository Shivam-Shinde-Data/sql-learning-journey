# Day 35 – LEAD() and LAG()

## 1. What are LEAD() and LAG()?

LEAD() and LAG() are window functions used to access data from **next** or **previous rows**.

- LEAD() → looks forward (next row)
- LAG() → looks backward (previous row)

---

## 2. Syntax
```sql
LEAD(column, offset, default) OVER (
    PARTITION BY column
    ORDER BY column
)

LAG(column, offset, default) OVER (
    PARTITION BY column
    ORDER BY column
)
```
- offset → how many rows ahead/behind (default = 1)
- default → value if no row exists

---

## 3. Example Table

orders:

| id | customer | amount |
|----|----------|--------|
| 1  | A        | 100    |
| 2  | A        | 200    |
| 3  | A        | 300    |
| 4  | B        | 150    |
| 5  | B        | 250    |

---

## 4. LAG() Example (Previous Row)
```sql
SELECT id,
       customer,
       amount,
       LAG(amount) OVER (PARTITION BY customer ORDER BY id) AS prev_amount
FROM orders;
```
Output:

| id | customer | amount | prev_amount |
|----|----------|--------|-------------|
| 1  | A        | 100    | NULL        |
| 2  | A        | 200    | 100         |
| 3  | A        | 300    | 200         |
| 4  | B        | 150    | NULL        |
| 5  | B        | 250    | 150         |

---

## 5. LEAD() Example (Next Row)
```sql
SELECT id,
       customer,
       amount,
       LEAD(amount) OVER (PARTITION BY customer ORDER BY id) AS next_amount
FROM orders;
```
Output:

| id | customer | amount | next_amount |
|----|----------|--------|-------------|
| 1  | A        | 100    | 200         |
| 2  | A        | 200    | 300         |
| 3  | A        | 300    | NULL        |
| 4  | B        | 150    | 250         |
| 5  | B        | 250    | NULL        |

---

## 6. Difference Calculation
```sql
SELECT id,
       customer,
       amount,
       amount - LAG(amount) OVER (PARTITION BY customer ORDER BY id) AS diff
FROM orders;
```
Output:

| id | customer | amount | diff |
|----|----------|--------|------|
| 1  | A        | 100    | NULL |
| 2  | A        | 200    | 100  |
| 3  | A        | 300    | 100  |
| 4  | B        | 150    | NULL |
| 5  | B        | 250    | 100  |

---

## 7. Using Offset
```sql
SELECT id,
       amount,
       LAG(amount, 2) OVER (ORDER BY id) AS lag_2
FROM orders;
```
Output:

| id | amount | lag_2 |
|----|--------|-------|
| 1  | 100    | NULL  |
| 2  | 200    | NULL  |
| 3  | 300    | 100   |
| 4  | 150    | 200   |
| 5  | 250    | 300   |

---

## 8. LEAD vs LAG

| Feature | LEAD | LAG |
|--------|------|-----|
| Direction | Forward | Backward |
| Use case | Next row | Previous row |

---

## 9. Real-World Use Cases

- Sales growth analysis
- Comparing previous transactions
- Detecting trends
- Time-series analysis
- Stock price comparison

---

## 10. Key Points

- Access previous/next rows without joins
- Requires ORDER BY
- Works per partition
- Very important for analytics
