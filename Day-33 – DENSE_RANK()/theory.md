# Day 33 – DENSE_RANK()

## 1. What is DENSE_RANK()?

DENSE_RANK() is a window function used to assign ranks to rows.

- Same values → same rank
- Does NOT skip ranks after ties

---

## 2. Syntax
```sql
DENSE_RANK() OVER (
    PARTITION BY column
    ORDER BY column
)
```
---

## 3. Key Behavior

If values are same:
- They get same rank
- Next rank is NOT skipped

Example:

| amount | dense_rank |
|--------|------------|
| 200    | 1          |
| 150    | 2          |
| 150    | 2          |
| 100    | 3          |

---

## 4. Example Table

orders:

| id | customer | amount |
|----|----------|--------|
| 1  | A        | 100    |
| 2  | A        | 200    |
| 3  | B        | 150    |
| 4  | B        | 150    |

---

## 5. Basic Example
```sql
SELECT id,
       amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank
FROM orders;
```
Output:

| id | amount | dense_rank |
|----|--------|------------|
| 2  | 200    | 1          |
| 3  | 150    | 2          |
| 4  | 150    | 2          |
| 1  | 100    | 3          |

---

## 6. With PARTITION BY
```sql
SELECT id,
       customer,
       amount,
       DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS dense_rank
FROM orders;
```
Output:

| id | customer | amount | dense_rank |
|----|----------|--------|------------|
| 2  | A        | 200    | 1          |
| 1  | A        | 100    | 2          |
| 3  | B        | 150    | 1          |
| 4  | B        | 150    | 1          |

---

## 7. Window Function Differences (Important 🔥)

### ROW_NUMBER vs RANK vs DENSE_RANK

| Feature            | ROW_NUMBER | RANK | DENSE_RANK |
|--------------------|------------|------|------------|
| Unique values      | Yes        | No   | No         |
| Same values rank   | Different  | Same | Same       |
| Rank skipping      | No         | Yes  | No         |
| Sequence continuity| Continuous | Gaps | Continuous |

---

### Example Comparison

| amount | ROW_NUMBER | RANK | DENSE_RANK |
|--------|------------|------|------------|
| 200    | 1          | 1    | 1          |
| 150    | 2          | 2    | 2          |
| 150    | 3          | 2    | 2          |
| 100    | 4          | 4    | 3          |

---

## 8. When to Use What?

- ROW_NUMBER → when you need unique ordering (pagination, dedup)
- RANK → when ties matter and skipping is okay (competition)
- DENSE_RANK → when ties matter but no gaps needed (reporting)

---

## 9. Real-World Use Cases

- Leaderboards without gaps
- Product ranking
- Category-wise ranking
- Analytics dashboards

---

## 10. Key Points

- Same values → same rank
- No rank skipping
- Very important in analytics queries
