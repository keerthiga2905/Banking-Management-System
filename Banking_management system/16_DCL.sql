
-- Description : DCL Commands (GRANT & REVOKE)

-- Q1. Create a new user.

CREATE USER 'bankuser'@'localhost'
IDENTIFIED BY 'Bank@123';


-- Q2. Grant SELECT privilege on customer table.

GRANT SELECT
ON banking_management_system.customer
TO 'bankuser'@'localhost';


-- Q3. Grant INSERT privilege on account table.

GRANT INSERT
ON banking_management_system.account
TO 'bankuser'@'localhost';


-- Q4. Grant UPDATE privilege on account table.

GRANT UPDATE
ON banking_management_system.account
TO 'bankuser'@'localhost';


-- Q5. Grant DELETE privilege on transaction_history table.

GRANT DELETE
ON banking_management_system.transaction_history
TO 'bankuser'@'localhost';


-- Q6. Grant multiple privileges on loan table.

GRANT SELECT, INSERT, UPDATE
ON banking_management_system.loan
TO 'bankuser'@'localhost';


-- Q7. Grant all privileges on the database.

GRANT ALL PRIVILEGES
ON banking_management_system.*
TO 'bankuser'@'localhost';


-- Q8. Apply the privilege changes.

FLUSH PRIVILEGES;


-- Q9. Show grants for the user.

SHOW GRANTS FOR 'bankuser'@'localhost';


-- Q10. Revoke INSERT privilege from account table.

REVOKE INSERT
ON banking_management_system.account
FROM 'bankuser'@'localhost';


-- Q11. Revoke UPDATE privilege from account table.

REVOKE UPDATE
ON banking_management_system.account
FROM 'bankuser'@'localhost';


-- Q12. Revoke DELETE privilege from transaction_history table.

REVOKE DELETE
ON banking_management_system.transaction_history
FROM 'bankuser'@'localhost';


-- Q13. Revoke all privileges from the user.

REVOKE ALL PRIVILEGES
ON banking_management_system.*
FROM 'bankuser'@'localhost';


-- Q14. Show grants after revoke.

SHOW GRANTS FOR 'bankuser'@'localhost';


-- Q15. Drop the user.

DROP USER 'bankuser'@'localhost';