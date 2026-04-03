# Day 25 – Interview Questions (DELETE vs TRUNCATE vs DROP)

## 1. What is the difference between DELETE and TRUNCATE?
DELETE removes specific rows and supports WHERE clause.
TRUNCATE removes all rows and does not support WHERE.

---

## 2. Which command is faster: DELETE or TRUNCATE?
TRUNCATE is faster because it does not log individual row deletions.

---

## 3. Can we rollback DELETE?
Yes, DELETE can be rolled back if used within a transaction.

---

## 4. Can we rollback TRUNCATE?
No, TRUNCATE cannot be rolled back in most DBMS.

---

## 5. What does DROP do?
DROP deletes both table structure and data permanently.

---

## 6. Does TRUNCATE reset AUTO_INCREMENT?
Yes, TRUNCATE resets AUTO_INCREMENT values.

---

## 7. Can we use WHERE with TRUNCATE?
No, TRUNCATE does not support WHERE clause.

---

## 8. Difference between DROP and TRUNCATE?
TRUNCATE removes data only.
DROP removes both data and table structure.

---

## 9. When should you use DELETE instead of TRUNCATE?
When you need to delete specific rows using a condition.

---

## 10. Is DELETE a DML or DDL command?
DELETE is a DML command.
TRUNCATE and DROP are DDL commands.
