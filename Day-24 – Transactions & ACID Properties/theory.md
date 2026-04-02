# Day 24 – Transactions & ACID Properties

## 1. What is a Transaction?

A Transaction is a **group of SQL operations executed as a single unit**.

👉 Either ALL operations succeed or NONE are applied.

---

## 2. Why Transactions?

Used to maintain:
- Data consistency
- Data integrity
- Reliable database operations

---

## 3. Transaction Commands

### a) BEGIN / START TRANSACTION
Starts a transaction

START TRANSACTION;

---

### b) COMMIT
Saves all changes permanently

COMMIT;

---

### c) ROLLBACK
Undo changes if something goes wrong

ROLLBACK;

---

### d) SAVEPOINT
Creates a point to rollback to

SAVEPOINT sp1;

---

## 4. Example
```sql
START TRANSACTION;

UPDATE Accounts
SET balance = balance - 1000
WHERE id = 1;

UPDATE Accounts
SET balance = balance + 1000
WHERE id = 2;

COMMIT;
```
👉 Ensures safe money transfer

---

## 5. What are ACID Properties?

ACID = Rules that ensure reliable transactions

---

### 🔹 A – Atomicity

- All operations execute completely or not at all

Example:
If one query fails → entire transaction fails

---

### 🔹 C – Consistency

- Database remains in a valid state

Example:
Balance should never be negative

---

### 🔹 I – Isolation

- Transactions do not interfere with each other

Example:
Two users updating same record won't conflict

---

### 🔹 D – Durability

- Once committed, data is permanent

Even if system crashes

---

## 6. Transaction States

- Active → Transaction running
- Partially Committed → Last step executed
- Committed → Successfully completed
- Failed → Error occurred
- Aborted → Rolled back

---

## 7. Advantages of Transactions

- Ensures data accuracy
- Prevents data corruption
- Handles system failures
- Supports concurrent users

---

## 8. Key Points

- Transaction = Set of SQL operations
- COMMIT → Save changes
- ROLLBACK → Undo changes
- ACID ensures reliability

---

## Real-World Use Cases

- Banking transactions
- Online payments
- Order processing systems
- Inventory management
