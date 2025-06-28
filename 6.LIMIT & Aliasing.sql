-- LIMIT & Aliasing --

-- LIMIT--  

# LIMIT 3 (LIMIT X) : limits the display of desired row upto X value

SELECT * 
FROM employee_demographics
where birth_date>'1985-01-01'
LIMIT 3;

# LIMIT & ORDER BY : LIMIT is considerible more powerful when used with combination with CLAUSE LIKE ORDER BY

SELECT * 
FROM employee_demographics
where birth_date>'1985-01-01'
ORDER BY birth_date DESC
LIMIT 4;

# LIMIT 2,1 (LIMIT X,Y) : Refers that after first 2 row print the row upto limit 1.
SELECT * 
FROM employee_demographics
where birth_date>'1985-01-01'
ORDER BY birth_date DESC
LIMIT 2,1;

-- Aliasing--  
# Aliasing : Used to rename the column by using or not using " AS " keyword

#here we are use AS keyword
SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender;

# Renaming column name without using AS keyword
SELECT gender, AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender;
