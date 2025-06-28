-- Group By
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them


-- when you use group by  you have to have the same columns you're grouping on in the group by statement

SELECT * FROM employee_demographics;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT * FROM employee_salary;

#here we have only one office manager row in table
SELECT occupation
FROM employee_salary
GROUP BY occupation;

#here we Two office manager row in table because there salary is different.

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(Age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY --


SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT *
FROM employee_demographics
ORDER BY gender, age;

# ORDER SEQUENCE: This order is not much efficient/useful as it is not in proper sequence.
SELECT *
FROM employee_demographics
ORDER BY  age,gender;
 
 # Ascending/Descending : By-default ORDER BY works in ascending order.
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;
