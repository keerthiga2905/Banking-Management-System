-- Banking Management System – Normalization
1NF (First Normal Form)

Rule:

No repeating groups
Each column contains a single (atomic) value
Each row is unique

Your tables satisfy 1NF.



Country
country_id	country_name	status	created_at
1	India	Active	2026-07-05

Every column stores only one value.

Branch
branch_id	branch_name	ifsc_code	city_id	address	phone	email
1	Chennai Main	SBI0001	1	Anna Salai	9876543210	branch1@gmail.com

No multiple phone numbers or multiple cities in one column.

 1NF Satisfied

2NF (Second Normal Form)

Rule

Must satisfy 1NF
Every non-key attribute depends on the whole Primary Key.



Wrong Design
Branch

-------------------------------------------------------------
branch_id
branch_name
city_name
state_name
country_name
-------------------------------------------------------------

Here,

city_name
state_name
country_name

are repeated for every branch.

Correct Design (Your Project)
Country
---------
country_id
country_name

State
---------
state_id
state_name
country_id

City
---------
city_id
city_name
state_id

Branch
---------
branch_id
branch_name
city_id

Each table stores only its own data.

Branch
      ↓
City
      ↓
State
      ↓
Country

2NF Satisfied

3NF (Third Normal Form)

Rule

Remove transitive dependency.

Wrong
Branch

branch_id
branch_name
city_name
state_name
country_name

Because

Branch
   ↓
City
   ↓
State
   ↓
Country

Branch does not directly determine Country.

Correct
Country
↓

State

↓

City

↓

Branch

Exactly how your database is designed.

3NF Satisfied

BCNF (Boyce-Codd Normal Form)

Every determinant must be a Candidate Key.



Country

country_id (PK)
country_name (UNIQUE)
country_id

determines

country_name

Similarly,

state_id
→ state_name

city_id
→ city_name

branch_id
→ branch_name

account_type_id
→ account_type_name

loan_type_id
→ loan_name

card_type_id
→ card_name

role_id
→ role_name

All determinants are keys.

 BCNF Satisfied--