# Subqueries

#So subqueries are queries within queries. Let's see how this looks.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

#Now let's say we wanted to look at employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery
#We can do that like this:

-- NOTE : Parks and Recreation have dept_id =1-- 

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);
                
-- Here subquery gives a value or list of value where which will be matched by main query, 
-- in this scenario WHERE clause matches it with employee_id and gives desired output.

SELECT *
FROM parks_departments;

                
#So we are using that subquery in the where statement and if we just highlight the subwuery and run it it's basically a list we are selecting from in the outer query

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
				FROM employee_salary
                WHERE dept_id = 1);


# now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only 





#We can also use subqueries in the select and the from statements - let's see how we can do this

-- Let's say we want to look at the salaries and compare them to the average salary

SELECT first_name, salary, AVG(salary)
FROM employee_salary;
-- if we run this it's not going to work, we are using columns with an aggregate function so we need to use group by
-- if we do that though we don't exactly get what we want
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- it's giving us the average PER GROUP which we don't want
-- here's a good use for a subquery

-- 🔥🌟🌟🌟 Subquery in SELECT will act as column 🌟🌟🌟🔥-- 

-- it's giving us the average PER GROUP which we don't want
-- here's a good use for a subquery

SELECT first_name,salary,
(  SELECT AVG(salary) 
   FROM employee_salary
)   AS Avg_salary # column name
FROM employee_salary;





-- We can also use it in the FROM Statement
-- when we use it here it's almost like we are creating a 🌟🌟🌟 small table we are querying off
      
      -- 🔥🌟🌟🌟 Subquerying in FORM work as derived table of main table like employee_demographics 🌟🌟🌟🔥 -- 
      
SELECT  AVG(MAX(age))
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) 

;
-- now this doesn't work because we get an error saying we have to name it

SELECT gender, AVG(`MAX(age)`)
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) AS gender_table
GROUP BY gender
;
-- still not giving/performing proper AVG(`MAX(salary)`) operation.-- 

SELECT  AVG(Max_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Age_Table
;
-- ✅✅ NOW it's work perfectly fine. 

-- Here another example/operation performed on employee_salary table.
SELECT AVG(`MAX(salary)`) 
FROM ( SELECT salary, Avg(salary), MAX(salary), MIN(salary),COUNT(salary)
FROM employee_salary
GROUP BY salary) AS sal_table
;
