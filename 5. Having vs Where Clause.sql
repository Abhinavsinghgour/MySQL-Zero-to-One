-- # Having vs Where Clause--

-- WHERE CLAUSE - it works on Rows
-- HAVING CLAUSE - it works on GROUP BY Columns and Aggreagation function.


#Here WHERE clause dosen't work because avg(age) column is created yet because Of incompletion of GROUP BY function.
# hence it will not work

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age)>=40;
GROUP BY gender;

#So in such scenario we use HAVING CLAUSE instead of WHERE CLAUSE.
#here the use case of HAVING CLAUSE

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>=40;

#Combining Having and Where Clause

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(Salary)>75000;
