

-- Q1. Display row number for each customer.

SELECT
customer_id,
first_name,
ROW_NUMBER() OVER(ORDER BY customer_id) AS row_numbers
FROM customer;


-- Q2. Rank customers based on account balance.

SELECT
customer_id,
balance,
RANK() OVER(ORDER BY balance DESC) AS rank_no
FROM account;


-- Q3. Display dense rank based on account balance.

SELECT
customer_id,
balance,
DENSE_RANK() OVER(ORDER BY balance DESC) AS dense_rank
FROM account;


-- Q4. Display previous balance using LAG().

SELECT
account_id,
balance,
LAG(balance) OVER(ORDER BY account_id) AS previous_balance
FROM account;


-- Q5. Display next balance using LEAD().

SELECT
account_id,
balance,
LEAD(balance) OVER(ORDER BY account_id) AS next_balance
FROM account;


-- Q6. Display first balance in each branch.

SELECT
branch_id,
balance,
FIRST_VALUE(balance)
OVER(PARTITION BY branch_id ORDER BY balance DESC) AS highest_balance
FROM account;


-- Q7. Display last balance in each branch.

SELECT
branch_id,
balance,
LAST_VALUE(balance)
OVER(
PARTITION BY branch_id
ORDER BY balance
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_balance
FROM account;


-- Q8. Display second highest balance in each branch.

SELECT
branch_id,
balance,
NTH_VALUE(balance,2)
OVER(
PARTITION BY branch_id
ORDER BY balance DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS second_highest
FROM account;


-- Q9. Display running total of balances.

SELECT
account_id,
balance,
SUM(balance) OVER(ORDER BY account_id) AS running_total
FROM account;


-- Q10. Display average balance branch-wise.

SELECT
branch_id,
balance,
AVG(balance) OVER(PARTITION BY branch_id) AS average_balance
FROM account;


-- Q11. Display total balance branch-wise.

SELECT
branch_id,
balance,
SUM(balance) OVER(PARTITION BY branch_id) AS total_balance
FROM account;


-- Q12. Display number of accounts in each branch.

SELECT
branch_id,
COUNT(*) OVER(PARTITION BY branch_id) AS total_accounts
FROM account;