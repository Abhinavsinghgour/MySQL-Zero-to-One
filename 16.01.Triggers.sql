DROP TRIGGER IF EXISTS after_insert_employee;

DELIMITER $$
CREATE TRIGGER after_insert_employee
AFTER INSERT ON employee_demographics
FOR EACH ROW
BEGIN
  INSERT INTO employee_salary (employee_id, first_name, last_name)
  VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END$$
DELIMITER ;

INSERT INTO employee_demographics(employee_id, first_name, last_name)
VALUES (14, 'Ansh', 'prathap');

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;


SHOW TABLES FROM parks_and_recreation;