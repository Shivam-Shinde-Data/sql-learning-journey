# Day 31 – ROW_NUMBER()

## 1. What is ROW_NUMBER()?

ROW_NUMBER() is a window function that assigns a **unique sequential number** to each row.

- Starts from 1
- No duplicates
- Works within partitions

---

## 2. Syntax
```sql
ROW_NUMBER() OVER (
    PARTITION BY column
    ORDER BY column
)
```
---

## 3. Key Points

- Always gives **unique numbers**
- Resets for each partition
- Requires ORDER BY
- Even identical values get different numbers

---

## 4. Example Table

orders:

|id | customer | amount |
|---|----------|--------|
|1  | A        | 100 |
|2  | A        | 200 |
|3  | B        | 150 |
|4  | B        | 150 |

---

## 5. Basic Example

SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM orders;

---

## 6. With PARTITION BY

SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS row_num
FROM orders;

---

## 7. Use Case: Top N Records

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS rn
    FROM orders
) t
WHERE rn = 1;

- Gets top order per customer

---

## 8. ROW_NUMBER vs RANK (Preview)

| Feature      | ROW_NUMBER | RANK |
|--------------|------------|------|
| Unique       | Yes        | No   |
| Same values  | Different  | Same |
| Skips ranks  | No         | Yes  |

---

## 9. Real-World Use Cases

- Remove duplicates
- Top N per group
- Pagination
- Leaderboards

---

## 10. Key Points

- Assigns unique sequence
- Depends on ORDER BY
- Used heavily in interviews
