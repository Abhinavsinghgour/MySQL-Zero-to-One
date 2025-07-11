-- Using Temporary Tables
-- Temporary tables are tables that are only visible to the session that created them. 
-- They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.

-- There's 2 ways to create temp tables:
-- 1. This is the less commonly used way - which is to build it exactly like a real table and insert data into it

CREATE TEMPORARY TABLE Temp_table
(first_name varchar(50),
 last_name varchar(50),
 favourite_movie varchar(100)
 );
-- if we execute this it gets created and we can actualyl query it.

select * from temp_table;

-- notice that if we refresh out tables it isn't there. It isn't an actual table. It's just a table in memory.

-- now obviously it's balnk so we would need to insert data into it like this:

INSERT INTO Temp_table VALUES('Abhinav', 'Singh', 'THE BILLION DOLLAR CODE');

-- now when we run it and execute it again we have our data
SELECT *
FROM Temp_table;





-- the second way is much faster and my preferred method
-- 2. Build it by inserting data into it - easier and faster


CREATE TABLE ssal_over_50kal_over_50k
SELECT *
FROM employee_salary
WHERE salary>=50000 ;

-- if we run this query we get our output
SELECT *
#ROW_NUMBER () OVER() -- Additional touch 😁😁😁
FROM sal_over_50k
;

 -----> you can even call this temporary table in onther file within the session but once you close the file temporary file stops working.