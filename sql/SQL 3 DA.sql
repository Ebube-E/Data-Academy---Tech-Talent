-- Subquerys

use uni;
-- Using example from earlier we can find the cost of the most expensive course (12000) and put this in a second query so our SQL looks like this

SELECT max(FullTimeFee) FROM fees;
SELECT CourseID FROM fees WHERE FullTimeFee = 12000;

-- Instead we can combine this into one result by embedding the first query as a subquery

SELECT CourseID FROM fees 
WHERE FullTimeFee = (SELECT max(FullTimeFee) FROM fees);

-- It’s possible to embed sub queries within subqueries when necessary
-- If we wanted the student information for students attending these courses we could embed this as another sub query

SELECT * FROM student 
where CourseID in (SELECT CourseID FROM fees WHERE FullTimeFee = (SELECT max(FullTimeFee) FROM fees));

-- In each case, when only one column is returned from a query, this functions as a list in SQL terms 

-- Null Values
-- NULL values appear in databases where values are unknown

-- A database will typically determine unfilled fields in rows to be NULL values

-- A NULL value is not equal to zero, a blank space or any other value

select * 
from student
where courseID is null;

-- Grouping numerical fucntions
-- We can place conditions on numerical functions to be grouped by an attribute.
-- GROUP BY statement is often used with aggregate functions ( COUNT() , MAX() , MIN() , SUM() , AVG() ) to group the result-set by one or more columns.

select courseID, SUM(FullTimeFee) 
from fees
group by courseID;


-- Joining tables

use sakila;

--  What is a join?
desc customer;
desc address;

-- Cartesian Product -  no relationship  between the tables
select c.first_name, c.last_name, a.address
from customer as c join address as a;

-- Inner Joins - The INNER JOIN keyword selects records that have matching values in both tables.

select c.first_name, c.last_name, a.address
from customer as c inner join address as a
	on c.address_id = a.address_id;

--  Join will automatically create an inner join 
select c.first_name, c.last_name, a.address
from customer as c join address as a
	on c.address_id = a.address_id;

-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2).    
select c.first_name, c.last_name, a.address
from customer as c left join address as a
	on c.address_id = a.address_id;
    
-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1).
select c.first_name, c.last_name, a.address
from customer as c right join address as a
	on c.address_id = a.address_id;
    

-- Joining 3 or More Tables
select c.first_name, c.last_name, ct.city
from customer as c
	inner join address as a
    on c.address_id = a.address_id
    inner join city as ct
    on a.city_id = ct.city_id;

-- Joining 3 or More Tables
-- Note order does not matter 
select c.first_name, c.last_name, ct.city
from customer as c
	inner join address as a
    on c.address_id = a.address_id
    inner join city as ct
    on a.city_id = ct.city_id;

select c.first_name, c.last_name, ct.city
from city as ct
	inner join address as a
    on a.city_id = ct.city_id
    inner join customer as c
    on c.address_id = a.address_id;

select c.first_name, c.last_name, ct.city
from address as a
	inner join city as ct
    on a.city_id = ct.city_id
    inner join customer as c
    on c.address_id = a.address_id;


-- Self-Joins
-- Note: This does not run as no column prequel_film_id. This is for demonstration purposes.
select f.title, f_prnt.title prequel
from film f
	inner join film f_prnt
	on f_prnt.film_id = f.prequel_film_id
where f.prequel_film_id IS NOT NULL;
 


