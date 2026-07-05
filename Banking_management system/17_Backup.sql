
-- Q1. Backup approved loans with customer details.

CREATE TABLE approved_loan_backup AS

SELECT
c.customer_id,
c.first_name,
l.loan_amount,
l.loan_status
FROM customer c
INNER JOIN loan l
ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Approved';



-- Q1. Backup Customer table.

CREATE TABLE customer_backup AS
SELECT *
FROM customer;


-- Q2. Backup Account table.

CREATE TABLE account_backup AS
SELECT *
FROM account;


-- Q3. Backup Loan table.

CREATE TABLE loan_backup AS
SELECT *
FROM loan;


-- Q4. Backup Transaction History table.

CREATE TABLE transaction_history_backup AS
SELECT *
FROM transaction_history;


-- Q5. Backup Branch table.

CREATE TABLE branch_backup AS
SELECT *
FROM branch;


-- RESTORE TABLES

-- Q6. Restore Customer data.

INSERT INTO customer
SELECT *
FROM customer_backup;


-- Q7. Restore Account data.

INSERT INTO account
SELECT *
FROM account_backup;


-- Q8. Restore Loan data.

INSERT INTO loan
SELECT *
FROM loan_backup;


-- Q9. Restore Transaction History data.

INSERT INTO transaction_history
SELECT *
FROM transaction_history_backup;


-- Q10. Restore Branch data.

INSERT INTO branch
SELECT *
FROM branch_backup;


-- VERIFY BACKUP TABLES

-- Q11. Display Customer Backup.

SELECT *
FROM customer_backup;


-- Q12. Display Account Backup.

SELECT *
FROM account_backup;


-- Q13. Display Loan Backup.

SELECT *
FROM loan_backup;


-- Q14. Display Transaction History Backup.

SELECT *
FROM transaction_history_backup;


-- Q15. Display Branch Backup.

SELECT *
FROM branch_backup