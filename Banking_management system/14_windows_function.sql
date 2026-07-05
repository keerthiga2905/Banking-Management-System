-- Q1. Display customer name, account number and assign row number.

SELECT
c.customer_id,
c.first_name,
a.account_number,
a.balance,
ROW_NUMBER() OVER(ORDER BY a.balance DESC) AS row_no
FROM customer c
INNER JOIN account a
ON c.customer_id = a.customer_id;


-- Q2. Display customer name, branch name and rank customers based on balance.

SELECT
c.first_name,
b.branch_name,
a.balance,
RANK() OVER(ORDER BY a.balance DESC) AS balance_rank
FROM customer c
INNER JOIN account a
ON c.customer_id = a.customer_id
INNER JOIN branch b
ON a.branch_id = b.branch_id;

-- Q3. Display customer name with previous account balance.

SELECT
c.first_name,
a.balance,
LAG(a.balance,1) OVER(ORDER BY a.balance) AS previous_balance
FROM customer c
INNER JOIN account a
ON c.customer_id = a.customer_id;



-- Q4. Display customer name, account number and count of accounts in each branch.

SELECT
c.first_name,
a.account_number,
b.branch_name,
COUNT(a.account_id) OVER(PARTITION BY b.branch_name) AS total_accounts
FROM customer c
INNER JOIN account a
ON c.customer_id = a.customer_id
INNER JOIN branch b
ON a.branch_id = b.branch_id;