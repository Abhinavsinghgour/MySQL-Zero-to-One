/* string functions are used to manipulate and work with text strings. 
common string functions with real-world uses:

- CONCAT(): Combines multiple strings into one (e.g., full names).
- LENGTH(): Returns the length of a string (e.g., checking password length).
- LOWER()/UPPER(): Converts a string to lowercase or uppercase (e.g., email validation).
- SUBSTRING(): Extracts part of a string (e.g., area codes).
- TRIM(): Removes extra spaces (e.g., cleaning user input).
- REPLACE(): Replaces occurrences of a substring (e.g., updating city names).*/

/*
*Summary:*
- `length(str)`: (int) Length of `str`.
- `upper(str)`: (str) `str` converted to uppercase.
- `lower(str)`: (str) `str` converted to lowercase.
- `trim(str)`: (str) `str` trimmed from both ends.
- `rtrim(str)`: (str) `str` trimmed from the right.
- `ltrim(str)`: (str) `str` trimmed from the left.
- `left(str, n)`: (str) The first `n` characters of `str`.
- `right(str, n)`: (str) The last `n` characters of `str.
- `substring(str, n, m)` (also `substr()`): (str) An `m`-long substring starting at the `n`-th character of `str`.
- `replace(str, sub1, sub2)`: (str) `str` with all instances of `sub1` replaced with `sub2`.
- `locate(sub, str)`: (int) Position of `sub` in `str` (1-based index).
- `concat(str1, str2, ...)`: (str) Concatenation of `str1` and `str2`.
*/

#Length will give us the length of each value
SELECT LENGTH('Abhinav');

#Now we can see the length of each name
SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

#Upper will change all the string characters to upper case
SELECT UPPER('Abhinav');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

#lower will change all the string characters to lower case
SELECT LOWER('SKY');

SELECT first_name, LOWER(first_name) 
FROM employee_demographics;

#Now if you have values that have white space on the front or end, we can get rid of that white space using TRIM
SELECT TRIM('   sky'   );

#Now if we have white space in the middle it doesn't work
SELECT LTRIM('     I           love          SQL');

#There's also L trim for trimming just the left side
SELECT LTRIM('     I love SQL');


#There's also R trim for trimming just the Right side
SELECT RTRIM('         I love SQL         ');

#Now we have Left. Left is going to allow us to take a certain amount of strings from the left hand side.
SELECT LEFT('Alexander', 4);

SELECT first_name, LEFT(first_name,4) 
FROM employee_demographics;

#Right is basically the opposite - taking it starting from the right side
SELECT RIGHT('Alexander', 6);

SELECT first_name, RIGHT(first_name,4) 
FROM employee_demographics;


#Now let's look at substring, this one I personally love and use a lot.
#Substring allows you to specify a starting point and how many characters you want so you can take characters from anywhere in the string.
SELECT first_name, SUBSTRING(first_name, 2,3)
FROM employee_demographics;

#We could use this on phones to get the area code at the beginning.
SELECT birth_date, SUBSTRING(birth_date,1,4) as Birth_year
FROM employee_demographics;



#We can also use replace
SELECT first_name,REPLACE(first_name,'A','Z')
FROM employee_demographics;



#Next we have locate - we have 2 arguments we can use here: we can specify what we are searching for and where to search
#It will return the position of that character in the string.
SELECT LOCATE('a', 'bhanav');

#Let's try it on our first name
SELECT first_name, LOCATE('a',first_name) 
FROM employee_demographics;

#You can also locate longer stringsS
SELECT first_name, LOCATE('esl',first_name) 
FROM employee_demographics;



#Now let's look at concatenate - it will combine the strings together
SELECT CONCAT('Alex', 'Freberg');

#Here we can combine the first and the last name columns together
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;