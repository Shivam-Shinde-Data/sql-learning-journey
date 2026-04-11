# Day 33 – DENSE_RANK() Interview Questions

## 1. What is DENSE_RANK()?
Assigns rank without skipping numbers.

---

## 2. Difference between RANK and DENSE_RANK?
RANK skips numbers, DENSE_RANK does not.

---

## 3. What happens with duplicate values?
Same rank is assigned.

---

## 4. Does DENSE_RANK skip ranks?
No.

---

## 5. Difference between ROW_NUMBER and DENSE_RANK?
ROW_NUMBER gives unique values, DENSE_RANK allows ties.

---

## 6. Use case of DENSE_RANK?
Leaderboard without gaps.

---

## 7. Can it be used with PARTITION BY?
Yes.

---

## 8. Does it require ORDER BY?
Yes.

---

## 9. Real-world use?
Product ranking, analytics dashboards.

---

## 10. Which is better: RANK or DENSE_RANK?
Depends on requirement (gap vs no gap).
