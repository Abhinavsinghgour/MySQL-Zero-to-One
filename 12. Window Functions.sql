-- Window Functions

-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

/*
🧑‍🎓🎓Overview :-

Window Functions: Aggregation func, OVER(): like....SUM() OVER(PARTITION BY gender ORDER BY employee_id)
SUM(salary) 
ROW_number()
RANK()
DENSE_RANK() 

*/

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

-- first let's look at group by
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;
     
-- now let's try doing something similar with a window function

SELECT
dem.employee_id, dem.first_name, gender, salary, AVG(salary) OVER( PARTITION BY gender /*ORDER BY employee_id*/ )
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
-- now if we wanted to see what the salaries were for genders we could do that by using sum.

SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender /*ORDER BY employee_id*/)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total

SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;



-- Let's look at row_number rank and dense rank now

SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_number() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Row_num
FROM employee_demographics dem
JOIN employee_salary sal
       ON dem.employee_id = sal.employee_id;


-- let's compare this to rank

SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_number() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Rank_row
FROM employee_demographics dem
JOIN employee_salary sal
       ON dem.employee_id = sal.employee_id;

-- 🔥🌟🌟🌟notice rank repeats on tom ad jerry at 5, but then skips 6 to go to 7 -- this goes based off positional rank

-- let's compare this to dense rank

SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_number() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Rank_row,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC ) AS Dense_row_rank  -- 🔥🌟🌟🌟 this is 🔥numerically ordered instead of positional like rank
FROM employee_demographics dem
JOIN employee_salary sal
       ON dem.employee_id = sal.employee_id;
       
