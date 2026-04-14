# 🎯 Stored Procedures – Interview Questions

## 🔹 Basic Questions

### 1. What is a Stored Procedure?
A stored procedure is a precompiled SQL block stored in the database that can be executed using CALL.

---

### 2. Why are stored procedures used?
- Code reusability
- Better performance
- Security
- Reduced network traffic

---

### 3. Difference between Procedure and Function?

| Procedure | Function |
|----------|----------|
| No return value | Returns value |
| Called using CALL | Called using SELECT |
| Used for actions | Used for calculations |

---

### 4. How do you execute a stored procedure?

```sql
CALL procedure_name();
