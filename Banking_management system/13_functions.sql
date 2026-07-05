DELIMITER $$

CREATE FUNCTION fn_simple_interest
(
    principal DECIMAL(12,2),
    rate DECIMAL(5,2),
    years INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    RETURN (principal * rate * years)/100;

END $$

DELIMITER ;

-- Test

SELECT fn_simple_interest(100000,7.5,5) AS Simple_Interest;


DELIMITER $$

CREATE FUNCTION fn_maturity_amount
(
    principal DECIMAL(12,2),
    rate DECIMAL(5,2),
    years INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    RETURN principal + ((principal * rate * years)/100);

END $$

DELIMITER ;

-- Test

SELECT fn_maturity_amount(100000,7.5,5);

DELIMITER $$

CREATE FUNCTION fn_loan_eligibility
(
    salary DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    IF salary>=50000 THEN
        RETURN 'Eligible';
    ELSE
        RETURN 'Not Eligible';
    END IF;

END $$

DELIMITER ;

-- Test

SELECT fn_loan_eligibility(60000);


DELIMITER $$

CREATE FUNCTION fn_min_balance
(
    bal DECIMAL(12,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN

    IF bal>=1000 THEN
        RETURN 'Minimum Balance Maintained';
    ELSE
        RETURN 'Below Minimum Balance';
    END IF;

END $$

DELIMITER ;

-- Test

SELECT fn_min_balance(500);
