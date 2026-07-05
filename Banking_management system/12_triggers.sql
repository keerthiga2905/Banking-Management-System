-- Automatically calculate interest before updating
-- a Fixed Deposit.

DELIMITER $$

CREATE TRIGGER trg_before_fd_update
BEFORE UPDATE
ON fixed_deposit
FOR EACH ROW
BEGIN

SET NEW.maturity_amount =
NEW.deposit_amount +
(NEW.deposit_amount * NEW.interest_rate * NEW.tenure_years)/100;

END $$
-- Test Trigger

UPDATE fixed_deposit
SET deposit_amount = 200000,
    interest_rate = 7.5,
    tenure_years = 5
WHERE fd_id = 1;

-- Verify

SELECT *
FROM fixed_deposit
WHERE fd_id = 1;
-- Prevent withdrawal if account balance becomes negative.

DELIMITER $$

CREATE TRIGGER trg_before_withdraw
BEFORE INSERT
ON withdrawal
FOR EACH ROW
BEGIN

DECLARE current_balance DECIMAL(12,2);

SELECT balance
INTO current_balance
FROM account
WHERE account_id = NEW.account_id;

IF current_balance < NEW.amount THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT='Insufficient Balance';
END IF;

END $$

INSERT INTO withdrawal
(withdrawal_id,account_id,amount,withdrawal_date)

VALUES
(1,1,5000,NOW());
DELIMITER ;

-- Automatically update source and destination account
-- balances after fund transfer.

DELIMITER $$

CREATE TRIGGER trg_after_fund_transfer
AFTER INSERT
ON fund_transfer
FOR EACH ROW
BEGIN

UPDATE account
SET balance = balance - NEW.transfer_amount
WHERE account_id = NEW.from_account_id;

UPDATE account
SET balance = balance + NEW.transfer_amount
WHERE account_id = NEW.to_account_id;

END $$

DELIMITER ;


SELECT account_id,balance
FROM account
WHERE account_id IN (1,2);

-- Q4. Prevent loan approval if the loan amount exceeds Rs.10,00,000.

DELIMITER $$

CREATE TRIGGER trg_check_loan_amount
BEFORE INSERT
ON loan
FOR EACH ROW
BEGIN

    IF NEW.loan_amount > 1000000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Loan amount exceeds approval limit.';
    END IF;

END $$

DELIMITER ;