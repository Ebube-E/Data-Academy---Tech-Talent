SHOW DATABASES;

-- create a new database called employees

CREATE DATABASE cars;

USE cars;

CREATE TABLE cars_details(
car_id INT NOT NULL,
make VARCHAR (20) NOT NULL, 
model VARCHAR (20), 
reg VARCHAR (20) NOT NULL,
price DECIMAL (8,2) NOT NULL, 
PRIMARY KEY (car_id),
UNIQUE (reg)
);

EXPLAIN cars_details;

ALTER TABLE cars_details
MODIFY model VARCHAR (20) NOT NULL;

EXPLAIN cars_details;

ALTER TABLE cars_details
ADD COLUMN colour VARCHAR (20) NOT NULL;

ALTER TABLE cars_details
ADD COLUMN spec VARCHAR (20) NOT NULL;

EXPLAIN cars_details;

ALTER TABLE cars_details
DROP COLUMN spec;

EXPLAIN cars_details;

-- insert table items
INSERT INTO cars_details (car_id, make, model, colour, reg, price)
VALUES ('1', 'BMW', '5 Series', 'red', 'WD70 YBV', '32500'),
('2', 'Ford', 'Focus', 'blue', 'LD64 BZA', '24500'),
('3', 'Volvo', 'XC40', 'black', 'BG19 KJP', '32000');

SELECT * FROM cars_details;

INSERT INTO cars_details (car_id, make, model, colour, reg, price)
VALUES ('4','Renault','Megane','white','FO55 GGL','16000');

SELECT * FROM cars_details;

UPDATE cars_details
SET colour = 'grey'
WHERE car_id = 1;

SELECT * FROM cars_details;

DELETE FROM cars_details 
WHERE car_id ='4';

SELECT * FROM cars_details;

SELECT make, model FROM cars_details;

SELECT * FROM cars_details 
WHERE car_id = 3;

SELECT * FROM cars_details ORDER BY make;

SELECT make, model FROM cars_details
ORDER BY make, model;