# Day 11 – SQL LIKE Operator

## 🔹 What is LIKE Operator?

The LIKE operator is used to search for a **specific pattern** in a column.

It is mainly used with **text (string) data**.

---

## 🔹 Why Use LIKE?

- To search partial values
- To filter data based on patterns
- Used in search features (name, email, etc.)

---

## 🔹 Syntax
```sql
SELECT column1, column2
FROM table_name
WHERE column_name LIKE 'pattern';
```
---

## 🔹 Wildcards Used with LIKE

| Wildcard | Meaning                          |
|----------|----------------------------------|
| %        | Represents zero or more characters |
| _        | Represents exactly one character |

---

## 🔹 Example Table: students

| id | name   | city    |
|----|--------|---------|
| 1  | Amit   | Pune    |
| 2  | Neha   | Mumbai  |
| 3  | Rahul  | Delhi   |
| 4  | Sneha  | Pune    |
| 5  | Kiran  | Nashik  |

---

## 🔹 Example 1: Starts With (A%)
```sql
SELECT * 
FROM students
WHERE name LIKE 'A%';
```
✔ Names starting with 'A'

---

## 🔹 Example 2: Ends With (%a)
```sql
SELECT * 
FROM students
WHERE name LIKE '%a';
```
✔ Names ending with 'a'

---

## 🔹 Example 3: Contains (%h%)
```sql
SELECT * 
FROM students
WHERE name LIKE '%h%';
```
✔ Names containing 'h'

---

## 🔹 Example 4: Single Character (_)
```sql
SELECT * 
FROM students
WHERE name LIKE '_mit';
```
✔ Matches 'Amit' (only one character before 'mit')

---

## 🔹 Example 5: Fixed Length Pattern
```sql
SELECT * 
FROM students
WHERE name LIKE '____';
```
✔ Names with exactly 4 characters

---

## 🔹 Example 6: Multiple Conditions
```sql
SELECT * 
FROM students
WHERE city LIKE 'P%';
```
✔ Cities starting with 'P'

---

## 🔹 Important Points

- LIKE is **case-sensitive** in some databases (MySQL depends on collation)
- Used only with **text data**
- % is most commonly used wildcard
- _ is used when position matters
- Can be combined with AND, OR, NOT

---

## 🔹 LIKE with NOT
```sql
SELECT * 
FROM students
WHERE name NOT LIKE 'A%';
```
✔ Excludes names starting with 'A'

---

## 🔹 Real-World Example

📌 Search Feature:
```sql
SELECT * 
FROM users
WHERE name LIKE '%shiv%';
```
✔ Finds all users with 'shiv' in their name

---

## 🔹 Summary

- LIKE is used for pattern matching
- % → multiple characters
- _ → single character
- Used in search and filtering text data
