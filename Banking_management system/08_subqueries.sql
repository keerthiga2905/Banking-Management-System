-- Display the customer details who has the highest account
-- balance in the 'Chennai Main Branch'.

SELECT *
FROM customer
WHERE customer_id =
(
    SELECT customer_id
    FROM account
    WHERE balance =
    (
        SELECT MAX(balance)
        FROM account
        WHERE branch_id =
        (
            SELECT branch_id
            FROM branch
            WHERE branch_name='Chennai Main Branch'
        )
    )
    LIMIT 1
);


-- Retrieve the customer details who have both an active
-- account and an approved loan.

SELECT *
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM account
    WHERE account_status = 'Active'
)
AND customer_id IN
(
    SELECT customer_id
    FROM loan
    WHERE loan_status = 'Approved'
);


-- 1. SINGLE ROW SUBQUERY


-- Q1. Display customers whose account balance is equal to the highest balance.

SELECT *
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM account
    WHERE balance = (
        SELECT MAX(balance)
        FROM account
    )
);



-- 2. MULTIPLE ROW SUBQUERY


-- Q2. Display customers who have approved loans.

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM loan
    WHERE loan_status='Approved'
);


-- 3. MULTIPLE COLUMN SUBQUERY


-- Q3. Display accounts having the same customer_id and branch_id
-- as account number 1.

SELECT *
FROM account
WHERE (customer_id,branch_id)=(
    SELECT customer_id,branch_id
    FROM account
    WHERE account_id=1
);


-- 4. CORRELATED SUBQUERY


-- Q4. Display customers whose account balance is greater than
-- the average balance of all accounts.

SELECT *
FROM account a
WHERE balance>(
    SELECT AVG(balance)
    FROM account
);



-- 5. SUBQUERY IN WHERE CLAUSE


-- Q5. Display accounts belonging to customers from Chennai.

SELECT *
FROM account
WHERE customer_id IN(
    SELECT customer_id
    FROM customer
    WHERE city_id=1
);

-- 6. SUBQUERY IN FROM CLAUSE (DERIVED TABLE)


-- Q6. Display customers whose balance is greater than the average balance.

SELECT *
FROM (
    SELECT account_id, customer_id, balance
    FROM account
) AS acc
WHERE balance >
(
    SELECT AVG(balance)
    FROM account
);


-- ===========================================================
-- 7. SUBQUERY IN SELECT CLAUSE
-- ===========================================================

-- Q7. Display customer details along with total number of accounts.

SELECT
customer_id,
first_name,
(
    SELECT COUNT(*)
    FROM account a
    WHERE a.customer_id=c.customer_id
) AS Total_Accounts
FROM customer c;


-- ===========================================================
-- 8. EXISTS SUBQUERY
-- ===========================================================

-- Q8. Display customers who have at least one account.

SELECT *
FROM customer c
WHERE EXISTS
(
    SELECT *
    FROM account a
    WHERE a.customer_id=c.customer_id
);


-- ===========================================================
-- 9. NOT EXISTS SUBQUERY
-- ===========================================================

-- Q9. Display customers who do not have any loan.

SELECT *
FROM customer c
WHERE NOT EXISTS
(
    SELECT *
    FROM loan l
    WHERE l.customer_id=c.customer_id
);


-- ===========================================================
-- 10. IN SUBQUERY
-- ===========================================================

-- Q10. Display customers who have deposited money.

SELECT *
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM deposit
);
-- ===========================================================
-- 11. NOT IN SUBQUERY
-- ===========================================================

-- Q11. Display customers who have not applied for any loan.

SELECT *
FROM customer
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM loan
);


-- 12. ANY OPERATOR


-- Q12. Display accounts having balance greater than ANY loan amount.

SELECT *
FROM account
WHERE balance > ANY
(
    SELECT loan_amount
    FROM loan
);


-- 13. ALL OPERATOR


-- Q13. Display accounts having balance greater than ALL loan amounts.

SELECT *
FROM account
WHERE balance > ALL
(
    SELECT loan_amount
    FROM loan
);



-- 14. SCALAR SUBQUERY


-- Q14. Display each account along with the average account balance.

SELECT
account_id,
account_number,
balance,
(
    SELECT AVG(balance)
    FROM account
) AS Average_Balance
FROM account;



-- 15. NESTED SUBQUERY


-- Q15. Display the customer who has the highest account balance.

SELECT *
FROM customer
WHERE customer_id =
(
    SELECT customer_id
    FROM account
    WHERE balance =
    (
        SELECT MAX(balance)
        FROM account
    )
);