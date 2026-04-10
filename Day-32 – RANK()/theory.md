# Day 32 – RANK()

## 1. What is RANK()?

RANK() is a window function used to assign a rank to rows based on a column.

- Same values → same rank
- Skips next rank(s) after ties

---

## 2. Syntax
```sql
RANK() OVER (
    PARTITION BY column
    ORDER BY column
)
```
---

## 3. Key Behavior

If values are same:
- They get same rank
- Next rank is skipped

Example:

| amount | rank |
|--------|------|
| 200    | 1    |
| 150    | 2    |
| 150    | 2    |
| 100    | 4    |

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
       RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM orders;
```
Output:

| id | amount | rank_num |
|----|--------|----------|
| 2  | 200    | 1        |
| 3  | 150    | 2        |
| 4  | 150    | 2        |
| 1  | 100    | 4        |

---

## 6. With PARTITION BY
```sql
SELECT id,
       customer,
       amount,
       RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rank_num
FROM orders;
```
Output:

| id | customer | amount | rank_num |
|----|----------|--------|----------|
| 2  | A        | 200    | 1        |
| 1  | A        | 100    | 2        |
| 3  | B        | 150    | 1        |
| 4  | B        | 150    | 1        |

---

## 7. RANK vs ROW_NUMBER

| Feature      | RANK | ROW_NUMBER |
|--------------|------|------------|
| Same values  | Same rank | Different |
| Skips ranks  | Yes  | No         |

---

## 8. Use Case: Top Performers
```sql
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 1;
```
Output:

| id | customer | amount | rnk |
|----|----------|--------|-----|
| 2  | A        | 200    | 1   |
| 3  | B        | 150    | 1   |
| 4  | B        | 150    | 1   |

- Returns all top ties

---

## 9. Real-World Use Cases

- Leaderboards (with ties)
- Competition ranking
- Sales ranking
- Top performers analysis

---

## 10. Key Points

- Same values → same rank
- Skips ranks after tie
- Useful when ties matter
