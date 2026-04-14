# Day XX – Stored Procedures (Basics)

## 📌 What is a Stored Procedure?

A Stored Procedure is a **saved SQL block** that can be executed whenever needed.

👉 Similar to a function in programming, but mainly used to perform actions.

---

## ✅ Why Use Stored Procedures?

- Reusability (write once, use many times)
- Faster execution (precompiled)
- Reduces duplicate code
- Better security (no direct table access)

---

## ⚙️ Syntax (PostgreSQL)

```sql
CREATE OR REPLACE PROCEDURE procedure_name(parameters)
LANGUAGE plpgsql
AS $$
BEGIN
    -- SQL statements
END;
$$;
