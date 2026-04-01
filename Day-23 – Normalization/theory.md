# Day 23 – Normalization

## 1. What is Normalization?

Normalization is the process of **organizing data in a database** to:

- Reduce data redundancy (duplicate data)
- Improve data integrity
- Make database efficient

👉 Goal: Store data in the most structured way

---

## 2. Why Normalization?

Without normalization:
- Data duplication increases
- Update anomalies occur
- Inconsistency in data

With normalization:
- Clean and structured data
- Easy maintenance
- Better performance

---

## 3. Types of Anomalies

### a) Insertion Anomaly
- Cannot insert data without other data

### b) Update Anomaly
- Same data needs to be updated in multiple places

### c) Deletion Anomaly
- Deleting one record removes important data

---

## 4. Normal Forms

### 🔹 1NF (First Normal Form)

Rules:
- No repeating groups
- Atomic values (no multiple values in one column)

❌ Example (Not in 1NF):
| id | name | skills        |
|----|------|--------------|
| 1  | Amit | SQL, Python  |

✅ Convert to 1NF:
| id | name | skill  |
|----|------|--------|
| 1  | Amit | SQL    |
| 1  | Amit | Python |

---

### 🔹 2NF (Second Normal Form)

Rules:
- Must be in 1NF
- No partial dependency (depends on full primary key)

👉 Applies to composite primary keys

❌ Example:
| student_id | course_id | student_name |
|------------|----------|--------------|

(student_name depends only on student_id)

✅ Solution:
- Create separate tables

---

### 🔹 3NF (Third Normal Form)

Rules:
- Must be in 2NF
- No transitive dependency

👉 Non-key column should not depend on another non-key column

❌ Example:
| id | dept_id | dept_name |

(dept_name depends on dept_id, not id)

✅ Solution:
- Split into two tables

---

## 5. Before vs After Normalization

### Before:
Employees Table:
- id, name, dept_name

### After:
Employees Table:
- id, name, dept_id

Department Table:
- dept_id, dept_name

---

## 6. Advantages of Normalization

- Reduces redundancy
- Improves data consistency
- Avoids anomalies
- Better database design

---

## 7. Disadvantages of Normalization

- More tables
- Complex queries (JOIN needed)
- Slight performance cost

---

## 8. Key Points

- Normalization = Data organization technique
- Uses Normal Forms (1NF, 2NF, 3NF)
- Focus on eliminating redundancy
- Important for database design

---

## Real-World Use Cases

- Designing user, order, and product tables
- Avoiding duplicate customer data
- Maintaining scalable databases
- Used in OLTP systems (banking, e-commerce)
