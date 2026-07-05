-- ===========================================================
-- 1. INNER JOIN
-- ===========================================================

-- Q1. Display customer details with account details.
SELECT c.customer_id,c.first_name,c.last_name,
       a.account_number,a.balance
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id;


-- Q2. Display customer and branch details.
SELECT c.first_name,b.branch_name
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN branch b
ON a.branch_id=b.branch_id;


-- Q3. Display customer account type.
SELECT c.first_name,
       at.account_type_name,
       a.balance
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN account_type at
ON a.account_type_id=at.account_type_id;


-- ===========================================================
-- 2. LEFT JOIN
-- ===========================================================

-- Q4. Display all customers with their account details.
SELECT c.first_name,
       a.account_number,
       a.balance
FROM customer c
LEFT JOIN account a
ON c.customer_id=a.customer_id;


-- Q5. Display all customers with loan details.
SELECT c.first_name,
       l.loan_amount,
       l.loan_status
FROM customer c
LEFT JOIN loan l
ON c.customer_id=l.customer_id;


-- ===========================================================
-- 3. RIGHT JOIN
-- ===========================================================

-- Q6. Display all accounts even if customer data is missing.
SELECT c.first_name,
       a.account_number
FROM customer c
RIGHT JOIN account a
ON c.customer_id=a.customer_id;


-- Q7. Display all loans with customer details.
SELECT c.first_name,
       l.loan_amount
FROM customer c
RIGHT JOIN loan l
ON c.customer_id=l.customer_id;


-- ===========================================================
-- 4. CROSS JOIN
-- ===========================================================

-- Q8. Display every customer with every account type.
SELECT c.first_name,
       at.account_type_name
FROM customer c
CROSS JOIN account_type at;


-- ===========================================================
-- 5. SELF JOIN
-- ===========================================================

-- Q9. Display customers from the same city.
SELECT
c1.first_name AS Customer1,
c2.first_name AS Customer2,
c1.city_id
FROM customer c1
JOIN customer c2
ON c1.city_id=c2.city_id
AND c1.customer_id<>c2.customer_id;


-- ===========================================================
-- 6. THREE TABLE JOIN
-- ===========================================================

-- Q10. Display customer, account and branch details.
SELECT
c.first_name,
a.account_number,
b.branch_name
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN branch b
ON a.branch_id=b.branch_id;


-- ===========================================================
-- 7. FOUR TABLE JOIN
-- ===========================================================

-- Q11. Display customer, account, branch and account type.
SELECT
c.first_name,
a.account_number,
b.branch_name,
at.account_type_name
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN branch b
ON a.branch_id=b.branch_id
INNER JOIN account_type at
ON a.account_type_id=at.account_type_id;


-- ===========================================================
-- 8. FIVE TABLE JOIN
-- ===========================================================

-- Q12. Display customer, account, branch,
-- account type and city.
SELECT
c.first_name,
a.account_number,
b.branch_name,
at.account_type_name,
ci.city_name
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN branch b
ON a.branch_id=b.branch_id
INNER JOIN account_type at
ON a.account_type_id=at.account_type_id
INNER JOIN city ci
ON c.city_id=ci.city_id;


-- ===========================================================
-- 9. CUSTOMER + LOAN TYPE
-- ===========================================================

-- Q13. Display customer loan details.
SELECT
c.first_name,
lt.loan_name,
l.loan_amount
FROM customer c
INNER JOIN loan l
ON c.customer_id=l.customer_id
INNER JOIN loan_type lt
ON l.loan_type_id=lt.loan_type_id;


-- ===========================================================
-- 10. CUSTOMER + CARD
-- ===========================================================

-- Q14. Display customer card request.
SELECT
c.first_name,
ct.card_name,
cr.request_status
FROM customer c
INNER JOIN card_request cr
ON c.customer_id=cr.customer_id
INNER JOIN card_type ct
ON cr.card_type_id=ct.card_type_id;


-- ===========================================================
-- 11. BENEFICIARY JOIN
-- ===========================================================

-- Q15. Display customer beneficiary details.
SELECT
c.first_name,
b.beneficiary_name,
b.bank_name
FROM customer c
INNER JOIN beneficiary b
ON c.customer_id=b.customer_id;


-- ===========================================================
-- 12. TRANSACTION HISTORY
-- ===========================================================

-- Q16. Display account transactions.
SELECT
a.account_number,
tt.transaction_name,
th.amount,
th.transaction_date
FROM transaction_history th
INNER JOIN account a
ON th.account_id=a.account_id
INNER JOIN transaction_type tt
ON th.transaction_type_id=tt.transaction_type_id;


-- ===========================================================
-- 13. GROUP BY WITH JOIN
-- ===========================================================

-- Q17. Count accounts in each branch.
SELECT
b.branch_name,
COUNT(a.account_id) AS Total_Accounts
FROM branch b
INNER JOIN account a
ON b.branch_id=a.branch_id
GROUP BY b.branch_name;


-- ===========================================================
-- 14. HAVING WITH JOIN
-- ===========================================================

-- Q18. Display branches having more than one account.
SELECT
b.branch_name,
COUNT(a.account_id) AS Total
FROM branch b
INNER JOIN account a
ON b.branch_id=a.branch_id
GROUP BY b.branch_name
HAVING COUNT(a.account_id)>1;


-- ===========================================================
-- 15. AGGREGATE WITH JOIN
-- ===========================================================

-- Q19. Display total balance in each branch.
SELECT
b.branch_name,
SUM(a.balance) AS Total_Balance
FROM branch b
INNER JOIN account a
ON b.branch_id=a.branch_id
GROUP BY b.branch_name;


-- ===========================================================
-- 16. MULTIPLE JOIN WITH ORDER BY
-- ===========================================================

-- Q20. Display customer, account and balance in descending order.
SELECT
c.first_name,
a.account_number,
b.branch_name,
a.balance
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN branch b
ON a.branch_id=b.branch_id
ORDER BY a.balance DESC;


-- ===========================================================
-- INNER JOIN + LEFT JOIN
-- ===========================================================



SELECT
    c.customer_id,
    c.first_name,
    a.account_number,
    a.balance,
    l.loan_amount,
    l.loan_status
FROM customer c
INNER JOIN account a
ON c.customer_id = a.customer_id
LEFT JOIN loan l
ON c.customer_id = l.customer_id;