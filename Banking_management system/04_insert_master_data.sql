-- ==========================================
-- COUNTRY (20 Records)
-- ==========================================

INSERT INTO country (country_name) VALUES
('India'),
('United States'),
('United Kingdom'),
('Canada'),
('Australia'),
('Germany'),
('France'),
('Japan'),
('China'),
('Singapore'),
('Malaysia'),
('United Arab Emirates'),
('Saudi Arabia'),
('South Africa'),
('Brazil'),
('Italy'),
('Spain'),
('New Zealand'),
('Sri Lanka'),
('Nepal');



-- ==========================================
-- STATE (20 Records)
-- ==========================================

-- ==========================================
-- CITY (20 Records)
-- ==========================================

INSERT INTO city (city_name, state_id) VALUES
('Chennai',1),
('Coimbatore',1),
('Madurai',1),
('Salem',1),
('Tiruchirappalli',1),
('Bengaluru',2),
('Mysuru',2),
('Hubballi',2),
('Mangaluru',2),
('Kochi',3),
('Thiruvananthapuram',3),
('Kozhikode',3),
('Hyderabad',5),
('Warangal',5),
('Mumbai',6),
('Pune',6),
('Ahmedabad',7),
('Jaipur',8),
('Kolkata',9),
('Lucknow',10);


-- ==========================================
-- BRANCH (20 Records)
-- ==========================================

INSERT INTO branch
(branch_name, ifsc_code, city_id, address, phone, email)
VALUES
('Chennai Main Branch','BMS000001',1,'Anna Salai, Chennai','9876500001','chennai@bms.com'),
('Coimbatore Branch','BMS000002',2,'Gandhipuram, Coimbatore','9876500002','coimbatore@bms.com'),
('Madurai Branch','BMS000003',3,'KK Nagar, Madurai','9876500003','madurai@bms.com'),
('Salem Branch','BMS000004',4,'Five Roads, Salem','9876500004','salem@bms.com'),
('Trichy Branch','BMS000005',5,'Cantonment, Trichy','9876500005','trichy@bms.com'),
('Bengaluru Main Branch','BMS000006',6,'MG Road, Bengaluru','9876500006','bengaluru@bms.com'),
('Mysuru Branch','BMS000007',7,'Sayyaji Rao Road, Mysuru','9876500007','mysuru@bms.com'),
('Hubli Branch','BMS000008',8,'Vidyanagar, Hubli','9876500008','hubli@bms.com'),
('Mangaluru Branch','BMS000009',9,'Hampankatta, Mangaluru','9876500009','mangaluru@bms.com'),
('Kochi Branch','BMS000010',10,'Marine Drive, Kochi','9876500010','kochi@bms.com'),
('Thiruvananthapuram Branch','BMS000011',11,'MG Road, Thiruvananthapuram','9876500011','tvm@bms.com'),
('Kozhikode Branch','BMS000012',12,'Mavoor Road, Kozhikode','9876500012','kozhikode@bms.com'),
('Hyderabad Branch','BMS000013',13,'Banjara Hills, Hyderabad','9876500013','hyderabad@bms.com'),
('Warangal Branch','BMS000014',14,'Hanamkonda, Warangal','9876500014','warangal@bms.com'),
('Mumbai Main Branch','BMS000015',15,'Andheri East, Mumbai','9876500015','mumbai@bms.com'),
('Pune Branch','BMS000016',16,'Shivaji Nagar, Pune','9876500016','pune@bms.com'),
('Ahmedabad Branch','BMS000017',17,'Navrangpura, Ahmedabad','9876500017','ahmedabad@bms.com'),
('Jaipur Branch','BMS000018',18,'MI Road, Jaipur','9876500018','jaipur@bms.com'),
('Kolkata Branch','BMS000019',19,'Salt Lake, Kolkata','9876500019','kolkata@bms.com'),
('Lucknow Branch','BMS000020',20,'Hazratganj, Lucknow','9876500020','lucknow@bms.com');


-- ==========================================
-- ACCOUNT TYPE (20 Records)
-- ==========================================

INSERT INTO account_type (account_type_name, minimum_balance) VALUES
('Savings Account',1000.00),
('Current Account',5000.00),
('Salary Account',0.00),
('Student Account',0.00),
('Senior Citizen Account',500.00),
('Joint Account',2000.00),
('Business Account',10000.00),
('Fixed Deposit Account',10000.00),
('Recurring Deposit Account',500.00),
('NRI Savings Account',5000.00),
('NRI Current Account',10000.00),
('Women Savings Account',500.00),
('Kids Savings Account',0.00),
('Corporate Account',25000.00),
('Premium Savings Account',10000.00),
('Zero Balance Account',0.00),
('Pension Account',0.00),
('Trust Account',5000.00),
('Government Account',10000.00),
('Digital Savings Account',1000.00);


-- ==========================================
-- TRANSACTION TYPE (20 Records)
-- ==========================================

INSERT INTO transaction_type (transaction_name) VALUES
('Cash Deposit'),
('Cash Withdrawal'),
('ATM Withdrawal'),
('ATM Deposit'),
('Fund Transfer'),
('NEFT Transfer'),
('RTGS Transfer'),
('IMPS Transfer'),
('UPI Transfer'),
('Cheque Deposit'),
('Cheque Withdrawal'),
('Interest Credit'),
('Loan EMI Payment'),
('Credit Card Payment'),
('Debit Card Purchase'),
('Online Shopping'),
('Mobile Banking'),
('Internet Banking'),
('Standing Instruction'),
('Balance Adjustment');

-- ==========================================
-- LOAN TYPE (20 Records)
-- ==========================================

INSERT INTO loan_type
(loan_name, interest_rate, maximum_amount)
VALUES
('Home Loan',8.50,10000000.00),
('Personal Loan',11.50,1000000.00),
('Car Loan',9.25,2000000.00),
('Education Loan',7.50,3000000.00),
('Gold Loan',8.00,500000.00),
('Business Loan',10.75,5000000.00),
('Agriculture Loan',6.50,1500000.00),
('Mortgage Loan',8.75,8000000.00),
('Vehicle Loan',9.00,2500000.00),
('MSME Loan',10.25,4000000.00),
('Travel Loan',12.00,500000.00),
('Consumer Durable Loan',13.50,300000.00),
('Two Wheeler Loan',9.50,300000.00),
('Commercial Vehicle Loan',10.50,7000000.00),
('Working Capital Loan',11.00,6000000.00),
('Overdraft Loan',12.50,2000000.00),
('Loan Against Property',8.90,9000000.00),
('Medical Loan',10.00,1000000.00),
('Startup Loan',9.75,5000000.00),
('Festival Loan',11.75,200000.00);


-- ==========================================
-- CARD TYPE (20 Records)
-- ==========================================

INSERT INTO card_type
(card_name, annual_fee, daily_limit)
VALUES
('Visa Debit Card',250.00,50000.00),
('Master Debit Card',300.00,50000.00),
('RuPay Debit Card',150.00,40000.00),
('Visa Platinum Debit Card',500.00,100000.00),
('Master Platinum Debit Card',550.00,100000.00),
('Visa Credit Card',1000.00,150000.00),
('Master Credit Card',1200.00,200000.00),
('RuPay Credit Card',800.00,100000.00),
('Platinum Credit Card',2500.00,300000.00),
('Titanium Credit Card',3000.00,400000.00),
('Gold Credit Card',1800.00,250000.00),
('Business Credit Card',5000.00,500000.00),
('Corporate Credit Card',7000.00,1000000.00),
('Student Debit Card',0.00,25000.00),
('Senior Citizen Debit Card',100.00,30000.00),
('International Debit Card',1000.00,200000.00),
('International Credit Card',4000.00,750000.00),
('Signature Credit Card',6000.00,1000000.00),
('Virtual Debit Card',0.00,20000.00),
('Virtual Credit Card',500.00,50000.00);


-- ==========================================
-- USER ROLE (20 Records)
-- ==========================================

INSERT INTO user_role (role_name) VALUES
('Admin'),
('Super Admin'),
('Branch Manager'),
('Assistant Manager'),
('Cashier'),
('Customer Service Executive'),
('Loan Officer'),
('Relationship Manager'),
('Accountant'),
('Auditor'),
('HR Executive'),
('IT Administrator'),
('System Administrator'),
('Operations Manager'),
('Regional Manager'),
('Branch Employee'),
('Customer'),
('Premium Customer'),
('Corporate Customer'),
('Guest User');
