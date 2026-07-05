 -- Create a view to display customer,
-- account, account type and branch.

CREATE VIEW vw_complete_banking_details AS
SELECT
c.customer_id,
c.first_name,
c.last_name,
a.account_number,
at.account_type_name,
b.branch_name,
a.balance
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id
INNER JOIN account_type at
ON a.account_type_id=at.account_type_id
INNER JOIN branch b
ON a.branch_id=b.branch_id;

SELECT * FROM vw_complete_banking_details;


-- Create a view for active accounts
-- using WITH CHECK OPTION.

CREATE VIEW vw_active_customer_accounts AS
SELECT
account_id,
customer_id,
account_number,
balance,
account_status
FROM account
WHERE account_status='Active'
WITH CHECK OPTION;

SELECT * FROM vw_active_customer_accounts;


 -- Drop the customer details view.

DROP VIEW IF EXISTS vw_active_customer_accounts;



 -- Create a view to display account balance with 18% interest.

CREATE VIEW vw_balance_interest AS
SELECT
account_number,
balance,
(balance*18/100) AS interest_amount
FROM account;

SELECT * FROM vw_balance_interest;


--  Create a view to display total balance available in each branch.

CREATE VIEW vw_branch_balance AS
SELECT
b.branch_name,
SUM(a.balance) AS total_balance
FROM branch b
INNER JOIN account a
ON b.branch_id=a.branch_id
GROUP BY b.branch_name;

SELECT * FROM vw_branch_balance;

