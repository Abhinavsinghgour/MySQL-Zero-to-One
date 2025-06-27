# How to use SELECT statement?

SELECT * FROM parks_and_recreation.employee_demographics;

SELECT 
first_name,
gender,
age,
#PEMDAS rule left to right
(age+10) +10 *10
FROM parks_and_recreation.employee_demographics;

# DISTINCT keyowrd
SELECT 
DISTINCT first_name
FROM employee_demographics;

SELECT 
DISTINCT gender
FROM employee_demographics;

#here first_name & gender is single compact data hence uniqueness will be checked based on its combination.
SELECT 
DISTINCT first_name, gender 
FROM employee_demographics;
