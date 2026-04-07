# Day 29 – COALESCE Function

## 1. What is COALESCE?

COALESCE is a SQL function used to handle NULL values.

It returns the **first non-NULL value** from a list of expressions.

---

## 2. Syntax

COALESCE(value1, value2, value3, ..., valueN)

- Evaluates from left to right
- Returns the first NON-NULL value
- If all values are NULL → returns NULL

---

## 3. Why Use COALESCE?

- Replace NULL with default values
- Avoid NULL in calculations
- Improve query readability
- Useful in reports and aggregations

---

## 4. Basic Example
```sql
SELECT COALESCE(NULL, NULL, 10, 20);

Output:
10
```
---

## 5. Replace NULL Values
```sql
SELECT customer_name,
       COALESCE(phone, 'Not Available') AS phone_number
FROM customers;
```
---

## 6. COALESCE with Multiple Columns
```sql
SELECT COALESCE(email, phone, 'No Contact') AS contact_info
FROM customers;
```
- Priority: email → phone → default

---

## 7. COALESCE in Calculations
```sql
SELECT product_name,
       price,
       COALESCE(discount, 0) AS discount,
       price - COALESCE(discount, 0) AS final_price
FROM products;
```
---

## 8. COALESCE with Aggregate Functions
```sql
SELECT COALESCE(SUM(order_amount), 0) AS total_revenue
FROM orders;
```
- Prevents NULL when no rows exist

---

## 9. COALESCE vs ISNULL (Important)

| Feature      | COALESCE                  | ISNULL              |
|--------------|--------------------------|---------------------|
| Standard     | SQL Standard             | Not standard (SQL Server) |
| Arguments    | Multiple values allowed  | Only 2 values       |
| Portability  | Works in all DBs         | Limited             |

---

## 10. Real-World Use Cases

- Show default values in dashboards
- Handle missing user data
- Clean data during ETL pipelines
- Avoid NULL in financial calculations

---

## 11. Key Points

- Returns first non-NULL value
- Evaluates left → right
- Works with multiple arguments
- Widely used in real-world queries
