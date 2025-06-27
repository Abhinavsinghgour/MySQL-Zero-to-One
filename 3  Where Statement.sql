#WHERE Clause:
#-------------
#The WHERE clause is used to filter records (rows of data)

#It's going to extract only those records that fulfill a specified condition.

# So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
# So this is only effecting the rows, not the columns


#Let's take a look at how this looks

SELECT * FROM  employee_demographics;

SELECT *
FROM employee_demographics
WHERE age>=50;

SELECT *
FROM employee_demographics
WHERE birth_date >= '1989-01-01';

SELECT *
FROM employee_demographics
WHERE gender = 'female';

-- AND OR NOT LOGICAL OPERATOR-- 

SELECT *
FROM employee_demographics
WHERE birth_date >= '1989-01-01'
AND gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date >= '1989-01-01'
AND gender = 'Female';

#We can use WHERE clause with date value also
SELECT *
FROM employee_demographics
WHERE birth_date >= '1989-01-01'
OR NOT gender = 'Male';

# LIKE STATEMENT

-- two special characters a % and a _

-- % means anything

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 't__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'c_%'
