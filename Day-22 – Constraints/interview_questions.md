# Day 22 – Interview Questions (Constraints)

## 1. What are constraints in SQL?
Constraints are rules applied to columns to ensure valid and accurate data.

---

## 2. What is NOT NULL constraint?
It ensures that a column cannot store NULL values.

---

## 3. What is UNIQUE constraint?
It ensures all values in a column are different.

---

## 4. What is PRIMARY KEY?
A column (or set of columns) that uniquely identifies each record and cannot be NULL.

---

## 5. Difference between PRIMARY KEY and UNIQUE?
PRIMARY KEY:
- Only one per table
- Cannot be NULL

UNIQUE:
- Multiple allowed
- Can have one NULL (depends on DB)

---

## 6. What is a FOREIGN KEY?
It links one table to another and ensures referential integrity.

---

## 7. What is CHECK constraint?
It restricts values based on a condition.

Example:
salary > 0

---

## 8. What is DEFAULT constraint?
It assigns a default value when no value is provided.

---

## 9. Can we apply constraints after table creation?
Yes, using ALTER TABLE.

---

## 10. What is referential integrity?
It ensures that relationships between tables remain consistent.

---

## 11. What happens if constraint is violated?
The database will reject the operation (error).

---

## 12. Why are constraints important?
They ensure data correctness, consistency, and reliability in databases.
