SHOW DATABASES;

-- create a new database called employees

CREATE DATABASE employees;

USE employees;

CREATE TABLE employees_details(
employee_id INT NULL,
first_name VARCHAR (15) NOT NULL,
last_name VARCHAR (15) NOT NULL,
job_title VARCHAR (15) NOT NULL,
email VARCHAR (30) NOT NULL,
office_code INT(3) NOT NULL,
extension INT(4) NOT NULL,
PRIMARY KEY (employee_id),
UNIQUE (extension)
);


EXPLAIN employees_details;

-- Insert  table items
INSERT INTO employees_details (employee_id, first_name, last_name, job_title, email, office_code, extension)
VALUES ('1002', 'Eric', 'Amaechi', 'President', 'eamaechi@purpleevent.com', '1', '5800'),
('', 'Jeff', 'Bow', 'VP Sales', 'jbow@purpleevent.com', '2', '4611'),
('', 'Pamela', 'Castilo', 'Sales Manager', 'pcastilo@purpleevent.com', '3', '9273'),
('', 'Lesile', 'Tseng', 'VP Marketing', 'ltseng@purpleevent.com', '4', '5408'),
('', 'George', 'Murphy', 'VP Sales', 'gmurphy@purpleevent.com', '5', '5300'),
('', 'Mary', 'Paterson', 'Sales Rep', 'mpaterson@purpleevent.com', '6', '2173'),
('', 'Julie', 'Bolt', 'Sales Rep', 'jbolt@purpleevent.com', '7', '2028'),
('', 'Jason', 'Nkem', 'Sales Rep', 'jnkem@purpleevent.com', '8', '6493'),
('', 'Joel', 'Sunny', 'Sales Rep', 'jsunny@purpleevent.com', '9', '4334'),
('', 'Steve', 'Bondur', 'Sales Rep', 'sbondur@purpleevent.com', '10', '2311');

SELECT * FROM employees_details;

UPDATE employees_details 
SET 
    job_title = 'Sales Manager'
WHERE
    employee_id = 1007;
    
    
SELECT * FROM employees_details;

DELETE FROM employees_details 
WHERE
    employee_id = '1011';


ALTER TABLE employees_details
DROP COLUMN employee_id;


SELECT * FROM employees_details;

SELECT * FROM accounts;

EXPLAIN accounts;

ALTER TABLE accounts
DROP COLUMN accountscol;

EXPLAIN accounts;

