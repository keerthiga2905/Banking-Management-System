create database banking_management_system;
USE banking_management_system;
-- ==========================================
-- MASTER TABLE : COUNTRY
-- ==========================================

CREATE TABLE country
(
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- MASTER TABLE : STATE
-- ==========================================

CREATE TABLE state
(
    state_id INT AUTO_INCREMENT PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_state_country
    FOREIGN KEY(country_id)
    REFERENCES country(country_id)
);

-- ==========================================
-- MASTER TABLE : CITY
-- ==========================================

CREATE TABLE city
(
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    state_id INT NOT NULL,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_city_state
    FOREIGN KEY(state_id)
    REFERENCES state(state_id)
);

-- ==========================================
-- MASTER TABLE : BRANCH
-- ==========================================

CREATE TABLE branch
(
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    ifsc_code VARCHAR(20) NOT NULL UNIQUE,
    city_id INT NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(15),
    email VARCHAR(100),
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_branch_city
    FOREIGN KEY(city_id)
    REFERENCES city(city_id)
);

-- ==========================================
-- MASTER TABLE : ACCOUNT TYPE
-- ==========================================

CREATE TABLE account_type
(
    account_type_id INT AUTO_INCREMENT PRIMARY KEY,
    account_type_name VARCHAR(50) NOT NULL UNIQUE,
    minimum_balance DECIMAL(12,2) DEFAULT 0,
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- ==========================================
-- MASTER TABLE : TRANSACTION TYPE
-- ==========================================

CREATE TABLE transaction_type
(
    transaction_type_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_name VARCHAR(50) NOT NULL UNIQUE,
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- ==========================================
-- MASTER TABLE : LOAN TYPE
-- ==========================================

CREATE TABLE loan_type
(
    loan_type_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_name VARCHAR(100) NOT NULL UNIQUE,
    interest_rate DECIMAL(5,2),
    maximum_amount DECIMAL(15,2),
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- ==========================================
-- MASTER TABLE : CARD TYPE
-- ==========================================

CREATE TABLE card_type
(
    card_type_id INT AUTO_INCREMENT PRIMARY KEY,
    card_name VARCHAR(50) NOT NULL UNIQUE,
    annual_fee DECIMAL(10,2),
    daily_limit DECIMAL(12,2),
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- ==========================================
-- MASTER TABLE : USER ROLE
-- ==========================================

CREATE TABLE user_role
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    status ENUM('Active','Inactive') DEFAULT 'Active'
);