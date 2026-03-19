# Day 11 – Interview Questions (LIKE Operator)

## 1. What is the LIKE operator?
The LIKE operator is used to search for a specific pattern in a column.

---

## 2. Which data type is LIKE used with?
LIKE is mainly used with string (text) data.

---

## 3. What does % wildcard represent?
% represents zero or more characters.

---

## 4. What does _ wildcard represent?
_ represents exactly one character.

---

## 5. Write a query to find names starting with 'A'.
```sql
SELECT * FROM students
WHERE name LIKE 'A%';
```
---

## 6. Write a query to find names ending with 'a'.
```sql
SELECT * FROM students
WHERE name LIKE '%a';
```
---

## 7. Write a query to find names containing 'h'.
```sql
SELECT * FROM students
WHERE name LIKE '%h%';
```
---

## 8. What is the difference between % and _?
% matches multiple characters, while _ matches only one character.

---

## 9. Can LIKE be used with NOT?
Yes, using NOT LIKE to exclude patterns.

Example:
```sql
SELECT * FROM students WHERE name NOT LIKE 'A%';
```
---

## 10. Where is LIKE used in real-world?
LIKE is used in search features like finding users by name, email, or keywords.

---

## 🔹 Pro Tip

Use:
- % for flexible search
- _ when position matters
- Combine LIKE with AND/OR for advanced filtering
