- 1. SELECT ALL ROWS AND COLUMNS
-- ===========================================================

-- Q1. Display all customer details.
SELECT * FROM customer;

-- Q2. Display all account details.
SELECT * FROM account;

-- Q3. Display all branch details.
SELECT * FROM branch;

-- Q4. Display all loan details.
SELECT * FROM loan;


-- ===========================================================
-- 2. COLUMN LEVEL SELECTION
-- ===========================================================

-- Q5. Display customer first name, last name and email.
SELECT first_name,last_name,email
FROM customer;

-- Q6. Display account number and balance.
SELECT account_number,balance
FROM account;

-- Q7. Display customer first name and phone number.
SELECT first_name,phone
FROM customer;

-- Q8. Display branch name and IFSC code.
SELECT branch_name,ifsc_code
FROM branch;


-- ===========================================================
-- 3. ROW LEVEL SELECTION (WHERE CLAUSE)
-- ===========================================================

-- Q9. Display female customers.
SELECT *
FROM customer
WHERE gender='Female';

-- Q10. Display male customers.
SELECT *
FROM customer
WHERE gender='Male';

-- Q11. Display active accounts.
SELECT *
FROM account
WHERE account_status='Active';

-- Q12. Display approved loans.
SELECT *
FROM loan
WHERE loan_status='Approved';


-- ===========================================================
-- 4. COMPARISON OPERATORS
-- ===========================================================

-- Q13. Display accounts having balance greater than 50000.
SELECT *
FROM account
WHERE balance>50000;

-- Q14. Display accounts having balance less than 50000.
SELECT *
FROM account
WHERE balance<50000;

-- Q15. Display accounts having balance greater than or equal to 50000.
SELECT *
FROM account
WHERE balance>=50000;

-- Q16. Display accounts having balance less than or equal to 50000.
SELECT *
FROM account
WHERE balance<=50000;

-- Q17. Display customers from city id 1.
SELECT *
FROM customer
WHERE city_id=1;

-- Q18. Display accounts whose balance is not equal to 50000.
SELECT *
FROM account
WHERE balance<>50000;


-- ===========================================================
-- 5. LOGICAL OPERATORS
-- ===========================================================

-- Q19. Display active accounts having balance greater than 50000.
SELECT *
FROM account
WHERE account_status='Active'
AND balance>50000;

-- Q20. Display customers from city id 1 or city id 2.
SELECT *
FROM customer
WHERE city_id=1
OR city_id=2;

-- Q21. Display all loans except rejected loans.
SELECT *
FROM loan
WHERE NOT loan_status='Rejected';


-- ===========================================================
-- 6. BETWEEN OPERATOR
-- ===========================================================

-- Q22. Display accounts having balance between 50000 and 100000.
SELECT *
FROM account
WHERE balance BETWEEN 50000 AND 100000;


-- ===========================================================
-- 7. IN OPERATOR
-- ===========================================================

-- Q23. Display customers from city id 1,2 and 3.
SELECT *
FROM customer
WHERE city_id IN(1,2,3);


-- ===========================================================
-- 8. NOT IN OPERATOR
-- ===========================================================

-- Q24. Display customers not from city id 1,2 and 3.
SELECT *
FROM customer
WHERE city_id NOT IN(1,2,3);


-- ===========================================================
-- 9. LIKE OPERATOR
-- ===========================================================

-- Q25. Display customers whose name starts with 'A'.
SELECT *
FROM customer
WHERE first_name LIKE 'A%';

-- Q26. Display customers whose name ends with 'a'.
SELECT *
FROM customer
WHERE first_name LIKE '%a';

-- Q27. Display customers whose name contains 'ra'.
SELECT *
FROM customer
WHERE first_name LIKE '%ra%';

-- Q28. Display customers whose email ends with gmail.com.
SELECT *
FROM customer
WHERE email LIKE '%gmail.com';


-- ===========================================================
-- 10. DISTINCT
-- ===========================================================

-- Q29. Display distinct genders.
SELECT DISTINCT gender
FROM customer;

-- Q30. Display distinct account types.
SELECT DISTINCT account_type_id
FROM account;


-- ===========================================================
-- 11. ORDER BY
-- ===========================================================

-- Q31. Display customers in ascending order of first name.
SELECT *
FROM customer
ORDER BY first_name ASC;

-- Q32. Display accounts in descending order of balance.
SELECT *
FROM account
ORDER BY balance DESC;


-- ===========================================================
-- 12. LIMIT
-- ===========================================================

-- Q33. Display first five customers.
SELECT *
FROM customer
LIMIT 5;

-- Q34. Display next five customers.
SELECT *
FROM customer
LIMIT 5 OFFSET 5;


-- ===========================================================
-- 13. AGGREGATE FUNCTIONS
-- ===========================================================

-- Q35. Count total customers.
SELECT COUNT(*) AS Total_Customers
FROM customer;

-- Q36. Calculate total account balance.
SELECT SUM(balance) AS Total_Balance
FROM account;

-- Q37. Calculate average account balance.
SELECT AVG(balance) AS Average_Balance
FROM account;

-- Q38. Find highest account balance.
SELECT MAX(balance) AS Highest_Balance
FROM account;

-- Q39. Find lowest account balance.
SELECT MIN(balance) AS Lowest_Balance
FROM account;


-- ===========================================================
-- 14. GROUP BY
-- ===========================================================

-- Q40. Count customers based on gender.
SELECT gender,COUNT(*) AS Total_Customers
FROM customer
GROUP BY gender;

-- Q41. Count accounts based on account type.
SELECT account_type_id,COUNT(*) AS Total_Accounts
FROM account
GROUP BY account_type_id;


-- ===========================================================
-- 15. HAVING
-- ===========================================================

-- Q42. Display genders having more than five customers.
SELECT gender,COUNT(*) AS Total
FROM customer
GROUP BY gender
HAVING COUNT(*)>5;

-- Q43. Display account types having more than one account.
SELECT account_type_id,COUNT(*) AS Total
FROM account
GROUP BY account_type_id
HAVING COUNT(*)>1;


-- ===========================================================
-- 16. ALIAS
-- ===========================================================

-- Q44. Display customer name using alias.
SELECT first_name AS First_Name,
last_name AS Last_Name
FROM customer;

-- Q45. Display account balance using alias.
SELECT balance AS Current_Balance
FROM account;


-- ===========================================================
-- 17. ARITHMETIC OPERATORS
-- ===========================================================

-- Q46. Display balance after adding Rs.1000.
SELECT account_number,
balance,
balance+1000 AS New_Balance
FROM account;

-- Q47. Display balance after deducting Rs.500.
SELECT account_number,
balance,
balance-500 AS Remaining_Balance
FROM account;


-- ===========================================================
-- 18. DATE FUNCTIONS
-- ===========================================================

-- Q48. Display current date.
SELECT CURDATE();

-- Q49. Display current date and time.
SELECT NOW();

-- Q50. Display birth year of all customers.
SELECT YEAR(dob)
FROM customer;


-- ===========================================================
-- 19. NULL FUNCTIONS
-- ===========================================================

-- Q51. Display loans where approved date is NULL.
SELECT *
FROM loan
WHERE approved_date IS NULL;

-- Q52. Display loans where approved date is NOT NULL.
SELECT *
FROM loan
WHERE approved_date IS NOT NULL;