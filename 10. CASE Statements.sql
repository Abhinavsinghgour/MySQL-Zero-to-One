-- Case Statements

-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel

SELECT * 
FROM employee_demographics;

SELECT first_name,age,
CASE
    WHEN Age <= 30 THEN 'Young'
END AS  age_bracket
FROM employee_demographics;

SELECT first_name,last_name,age,
CASE
    WHEN Age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN "old"
    WHEN age>50 THEN "On Death's Door"
END AS  age_bracket
FROM employee_demographics;

-- Poor Jerry

-- Now we don't just have to do simple labels like we did, we can also perform calculations

-- Let's look at giving bonuses to employees

SELECT * 
FROM employee_salary;

-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make less than 45k then they get a 5% raise - very generous
-- if they make more than 45k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

SELECT first_name,last_name,salary,
CASE
    WHEN salary <= 45 THEN  salary + (salary * 0.05)   # 5% raise
    WHEN salary > 45 THEN  salary * 1.05 # 7% raise
END AS  Bonus,
CASE
    WHEN dept_id = 6 THEN salary * .10  # 10% Bonus
END AS Bonus
FROM employee_salary;


SELECT *
FROM parks_departments;