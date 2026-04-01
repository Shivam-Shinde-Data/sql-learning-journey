# Day 23 – Interview Questions (Normalization)

## 1. What is normalization?
Normalization is the process of organizing data to reduce redundancy and improve integrity.

---

## 2. Why is normalization important?
It avoids duplication, ensures consistency, and prevents anomalies.

---

## 3. What is 1NF?
- No repeating groups
- Atomic values

---

## 4. What is 2NF?
- Must be in 1NF
- No partial dependency on composite key

---

## 5. What is 3NF?
- Must be in 2NF
- No transitive dependency

---

## 6. What are anomalies?
Problems caused due to poor design:
- Insert anomaly
- Update anomaly
- Delete anomaly

---

## 7. What is transitive dependency?
When a non-key column depends on another non-key column.

---

## 8. What is partial dependency?
When a column depends only on part of a composite key.

---

## 9. What are the disadvantages of normalization?
- More tables
- Complex queries (JOINs)

---

## 10. What is denormalization?
Process of combining tables to improve performance.

---

## 11. When should you normalize?
- During database design phase
- When data redundancy is high

---

## 12. Is normalization always required?
Mostly yes, but in some cases denormalization is used for performance optimization.
