

DELIMITER $$

-- Q1. Create a procedure to display all customers.

CREATE PROCEDURE sp_display_customers()
BEGIN
    SELECT * FROM customer;
END $$

DELIMITER ;

CALL sp_display_customers();

-- 2. STORED PROCEDURE WITH INPUT PARAMETER


DELIMITER $$

-- Q2. Display customer details using customer id.

CREATE PROCEDURE sp_customer_by_id
(
    IN p_customer_id INT
)
BEGIN
    SELECT *
    FROM customer
    WHERE customer_id = p_customer_id;
END $$

DELIMITER ;

CALL sp_customer_by_id(1);



-- 3. STORED PROCEDURE WITH TWO INPUT PARAMETERS

DELIMITER $$

-- Q3. Display accounts between minimum and maximum balance.

CREATE PROCEDURE sp_balance_range
(
    IN p_min_balance DECIMAL(12,2),
    IN p_max_balance DECIMAL(12,2)
)
BEGIN
    SELECT *
    FROM account
    WHERE balance BETWEEN p_min_balance AND p_max_balance;
END $$

DELIMITER ;

CALL sp_balance_range(10000,100000);


-- 4. STORED PROCEDURE WITH OUTPUT PARAMETER

DELIMITER $$

-- Q4. Count total customers.

CREATE PROCEDURE sp_total_customers
(
    OUT total INT
)
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM customer;
END $$

DELIMITER ;

CALL sp_total_customers(@total_customers);

SELECT @total_customers;


-- 5. STORED PROCEDURE WITH INPUT AND OUTPUT

DELIMITER $$

-- Q5. Find account balance using account id.

CREATE PROCEDURE sp_account_balance
(
    IN p_account_id INT,
    OUT p_balance DECIMAL(12,2)
)
BEGIN
    SELECT balance
    INTO p_balance
    FROM account
    WHERE account_id = p_account_id;
END $$

DELIMITER ;

CALL sp_account_balance(1,@balance);

SELECT @balance;


-- 6. STORED PROCEDURE USING IF

DELIMITER $$

-- Q6. Check whether an account is active.

CREATE PROCEDURE sp_check_account
(
    IN p_account_id INT
)
BEGIN

DECLARE v_status VARCHAR(20);

SELECT account_status
INTO v_status
FROM account
WHERE account_id=p_account_id;

IF v_status='Active' THEN
    SELECT 'Account is Active' AS Status;
ELSE
    SELECT 'Account is Inactive' AS Status;
END IF;

END $$

DELIMITER ;

CALL sp_check_account(1);


-- 7. STORED PROCEDURE USING AGGREGATE FUNCTION

DELIMITER $$

-- Q7. Display total balance.

CREATE PROCEDURE sp_total_balance()
BEGIN
    SELECT SUM(balance) AS Total_Balance
    FROM account;
END $$

DELIMITER ;

CALL sp_total_balance();

-- 8. STORED PROCEDURE USING JOIN

DELIMITER $$

-- Q8. Display customer and account details.

CREATE PROCEDURE sp_customer_accounts()
BEGIN

SELECT
c.customer_id,
c.first_name,
a.account_number,
a.balance
FROM customer c
INNER JOIN account a
ON c.customer_id=a.customer_id;

END $$

DELIMITER ;

CALL sp_customer_accounts();


-- 9. STORED PROCEDURE USING GROUP BY

DELIMITER $$

-- Q9. Count accounts branch wise.

CREATE PROCEDURE sp_branch_accounts()
BEGIN

SELECT
branch_id,
COUNT(account_id) AS Total_Accounts
FROM account
GROUP BY branch_id;

END $$

DELIMITER ;

CALL sp_branch_accounts();



-- 10. STORED PROCEDURE USING SUBQUERY

DELIMITER $$

-- Q10. Display customer having highest balance.

CREATE PROCEDURE sp_highest_balance_customer()
BEGIN

SELECT *
FROM customer
WHERE customer_id=
(
SELECT customer_id
FROM account
ORDER BY balance DESC
LIMIT 1
);

END $$

DELIMITER ;

CALL sp_highest_balance_customer();
