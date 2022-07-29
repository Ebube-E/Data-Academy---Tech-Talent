-- use database
use sakila;

-- select all 
select * 
from language;

-- select specific columne names 

select language_id, name, last_update
from language;

select name
from language;


-- Addtional clauses

select language_id,  
	'COMMON' language_usage,    -- instert language_usage column and fill with COMMON values
	language_id * 3.1415927,    -- multiply language_id by 3.1415927
	upper(name)                 -- print name column in capital letters
from language;

-- creating an alias 
select language_id,
	'COMMON' language_usage,
	language_id * 3.1415927 lang_pi_value,   
	upper(name) language_name                
from language;

-- alternative way to create an alias 

select language_id,
	'COMMON' as language_usage,
	language_id * 3.1415927 as lang_pi_value,
	upper(name) as language_name
from language;

-- removing duplicates - distinct 
select actor_id
from film_actor
order by actor_id;

select distinct actor_id
from film_actor
order by actor_id;


-- from clause
-- Derived subquery-generated tables (select in a select)
select concat(cust.last_name, ', ', cust.first_name) as full_name, email
from
	(select first_name, last_name, email
    from customer
    where first_name = 'JESSIE'
    ) cust;

-- In reality this example can be done without the use of a subquery

select concat(last_name, ', ', first_name) full_name
from customer 
where first_name = 'JESSIE';

 
-- temporary tables
   
create temporary table actors_j (
    actor_id smallint(5),
    first_name varchar(45),
    last_name varchar(45)
);


-- inserting existing values into temp table 
insert into actors_j
select actor_id, first_name, last_name
from actor
where last_name like 'J%';

select *
from actors_j;

-- views from one or more real tables
create view cust_vw AS
select customer_id, first_name, last_name, active
from customer;

select first_name, last_name
from cust_vw
where active = 0;

-- where clause
select title
from film
where rating = 'G' and rental_duration >= 7;

select title
from film
where rating = 'G' or rental_duration >= 7;

select title, rating, rental_duration
from film
where (rating = 'G' and rental_duration >= 7)
	or (rating = 'PG-13' and rental_duration < 4);
    
-- Min and Max functions

select MIN(release_year)
from film;

select MAX(release_year)
from film;

-- Count, Avg, Sum functions

select count(release_year)
from film;

select avg(release_year)
from film;

select sum(release_year)
from film;

select count(*)
from film
where release_year = 2006;

-- Asc and desc order
select distinct rating
from film
order by rating ASC;

select distinct rating
from film
order by rating desc;
