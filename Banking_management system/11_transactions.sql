

START TRANSACTION;

UPDATE account
SET balance = balance + 5000
WHERE account_id = 1;

COMMIT;

SELECT * FROM account
WHERE account_id = 1;


-- Q2. Withdraw Rs.10000 from Account ID 2 and rollback the transaction.

START TRANSACTION;

UPDATE account
SET balance = balance - 10000
WHERE account_id = 2;

ROLLBACK;

SELECT * FROM account
WHERE account_id = 2;


-- Q3. Create a savepoint after depositing money.

START TRANSACTION;

UPDATE account
SET balance = balance + 1000
WHERE account_id = 3;

SAVEPOINT sp_deposit;

UPDATE account
SET balance = balance - 500
WHERE account_id = 4;

COMMIT;


-- Q4. Rollback only the second update using SAVEPOINT.

START TRANSACTION;

UPDATE account
SET balance = balance + 2000
WHERE account_id = 5;

SAVEPOINT sp1;

UPDATE account
SET balance = balance - 1000
WHERE account_id = 6;

ROLLBACK TO sp1;

COMMIT;


-- Q5. Create multiple savepoints.

START TRANSACTION;

UPDATE account
SET balance = balance + 1000
WHERE account_id = 7;

SAVEPOINT sp_first;

UPDATE account
SET balance = balance + 2000
WHERE account_id = 8;

SAVEPOINT sp_second;

UPDATE account
SET balance = balance - 500
WHERE account_id = 9;

ROLLBACK TO sp_second;

COMMIT;


-- Q6. Transfer Rs.5000 from Account 1 to Account 2.

START TRANSACTION;

UPDATE account
SET balance = balance - 5000
WHERE account_id = 1;

UPDATE account
SET balance = balance + 5000
WHERE account_id = 2;

COMMIT;


-- Q7. Transfer money and rollback the transaction.

START TRANSACTION;

UPDATE account
SET balance = balance - 3000
WHERE account_id = 3;

UPDATE account
SET balance = balance + 3000
WHERE account_id = 4;

ROLLBACK;


-- Q8. Close an account.

START TRANSACTION;

UPDATE account
SET account_status = 'Closed'
WHERE account_id = 10;

COMMIT;


-- Q9. Approve a loan.

START TRANSACTION;

UPDATE loan
SET loan_status = 'Approved'
WHERE loan_id = 2;

COMMIT;


-- Q10. Deposit amount and insert transaction history.

START TRANSACTION;

UPDATE account
SET balance = balance + 10000
WHERE account_id = 1;

INSERT INTO transaction_history
(account_id, transaction_type_id, amount, transaction_date)
VALUES
(1, 1, 10000, NOW());

COMMIT;


-- Q11. Rollback deposit transaction.

START TRANSACTION;

UPDATE account
SET balance = balance + 7000
WHERE account_id = 2;

INSERT INTO transaction_history
(account_id, transaction_type_id, amount, transaction_date)
VALUES
(2, 1, 7000, NOW());

ROLLBACK;


-- Q12. Display all account details.

SELECT *
FROM account;


-- Q13. Display all loan details.

SELECT *
FROM loan;


-- Q14. Display all transaction history.

SELECT *
FROM transaction_history;