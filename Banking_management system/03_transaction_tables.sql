-- ==========================================
-- PROJECT : BANKING MANAGEMENT SYSTEM
-- FILE    : 03_transaction_tables.sql
-- ==========================================

-- ==========================================
-- CUSTOMER
-- ==========================================

CREATE TABLE customer
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    aadhar_number VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    city_id INT,
    state_id INT,
    country_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Active','Inactive') DEFAULT 'Active',

    CONSTRAINT fk_customer_city
        FOREIGN KEY(city_id)
        REFERENCES city(city_id),

    CONSTRAINT fk_customer_state
        FOREIGN KEY(state_id)
        REFERENCES state(state_id),

    CONSTRAINT fk_customer_country
        FOREIGN KEY(country_id)
        REFERENCES country(country_id)
);

-- ==========================================
-- LOGIN
-- ==========================================

CREATE TABLE login
(
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    customer_id INT NOT NULL,
    role_id INT NOT NULL,
    last_login DATETIME,
    status ENUM('Active','Inactive') DEFAULT 'Active',

    CONSTRAINT fk_login_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_login_role
        FOREIGN KEY(role_id)
        REFERENCES user_role(role_id)
);

-- ==========================================
-- ACCOUNT
-- ==========================================

CREATE TABLE account
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type_id INT NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0,
    opening_date DATE,
    account_status ENUM('Active','Closed','Blocked')
        DEFAULT 'Active',

    CONSTRAINT fk_account_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_account_branch
        FOREIGN KEY(branch_id)
        REFERENCES branch(branch_id),

    CONSTRAINT fk_account_type
        FOREIGN KEY(account_type_id)
        REFERENCES account_type(account_type_id)
);

-- ==========================================
-- BENEFICIARY
-- ==========================================

CREATE TABLE beneficiary
(
    beneficiary_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    beneficiary_name VARCHAR(100),
    account_number VARCHAR(20),
    ifsc_code VARCHAR(20),
    bank_name VARCHAR(100),
    added_date DATE,

    CONSTRAINT fk_beneficiary_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id)
);

-- ==========================================
-- DEPOSIT
-- ==========================================

CREATE TABLE deposit
(
    deposit_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    deposit_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    remarks VARCHAR(200),

    CONSTRAINT fk_deposit_account
        FOREIGN KEY(account_id)
        REFERENCES account(account_id)
);

-- ==========================================
-- WITHDRAWAL
-- ==========================================

CREATE TABLE withdrawal
(
    withdrawal_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    withdrawal_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    remarks VARCHAR(200),

    CONSTRAINT fk_withdrawal_account
        FOREIGN KEY(account_id)
        REFERENCES account(account_id)
);

-- ==========================================
-- FUND TRANSFER
-- ==========================================

CREATE TABLE fund_transfer
(
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT NOT NULL,
    to_account INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transfer_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    transfer_status ENUM('Success','Pending','Failed')
        DEFAULT 'Pending',

    CONSTRAINT fk_transfer_from
        FOREIGN KEY(from_account)
        REFERENCES account(account_id),

    CONSTRAINT fk_transfer_to
        FOREIGN KEY(to_account)
        REFERENCES account(account_id)
);

-- ==========================================
-- TRANSACTION HISTORY
-- ==========================================

CREATE TABLE transaction_history
(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type_id INT NOT NULL,
    amount DECIMAL(15,2),
    balance_after DECIMAL(15,2),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    remarks VARCHAR(200),

    CONSTRAINT fk_transaction_account
        FOREIGN KEY(account_id)
        REFERENCES account(account_id),

    CONSTRAINT fk_transaction_type
        FOREIGN KEY(transaction_type_id)
        REFERENCES transaction_type(transaction_type_id)
);

-- ==========================================
-- LOAN
-- ==========================================

CREATE TABLE loan
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type_id INT NOT NULL,
    loan_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    tenure_months INT,
    loan_status ENUM('Pending','Approved','Rejected')
        DEFAULT 'Pending',
    approved_date DATE,

    CONSTRAINT fk_loan_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_loan_type
        FOREIGN KEY(loan_type_id)
        REFERENCES loan_type(loan_type_id)
);

-- ==========================================
-- CARD REQUEST
-- ==========================================

CREATE TABLE card_request
(
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    card_type_id INT NOT NULL,
    request_date DATE,
    request_status ENUM('Pending','Approved','Rejected')
        DEFAULT 'Pending',

    CONSTRAINT fk_card_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_card_type
        FOREIGN KEY(card_type_id)
        REFERENCES card_type(card_type_id)
);

-- ==========================================
-- ACCOUNT STATEMENT
-- ==========================================

CREATE TABLE account_statement
(
    statement_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    statement_month VARCHAR(20),
    opening_balance DECIMAL(15,2),
    closing_balance DECIMAL(15,2),
    generated_date DATE,

    CONSTRAINT fk_statement_account
        FOREIGN KEY(account_id)
        REFERENCES account(account_id)
);