select *  
from sakila.language;
-- Just a first example to try

-- Lab | SQL Queries 1
select * 
from sakila.actor
order by actor_id;
select * from sakila.address;
select * from sakila.category;
select * from sakila.city;
select * from sakila.country;
select * from sakila.customer;
select * from sakila.film;
select * from sakila.film_actor;
select * from sakila.film_category;
select * from sakila.film_text;
select * from sakila.inventory;
select * from sakila.language;
select * from sakila.payment;
select * from sakila.rental;
select * from sakila.staff;
select * from sakila.store;

-- Question 3.
select title from sakila.film;

-- Question 4.
select payment_date as 'Payment_date'
 from sakila.payment;
 select distinct name as 'language' from sakila.language;
 
 -- Question 5.
 select * from sakila.store;
 select distinct first_name from sakila.staff;
 
-- Question 6.
select * from sakila.rental;
select convert(rental_date, date) from sakila.rental;
select distinct convert(rental_date, date) as 'date' from sakila.rental;

-- Lab | SQL Queries 2

-- Question 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = 'Scarlett';

-- Question 2. Select all the actors with the last name ‘Johansson’.
select * from sakila.actor
where last_name = 'Johansson';

-- Question 3. How many films (movies) are available for rent?
select count(rental_id) from sakila.film;

-- Question 4. How many films have been rented?
select * from sakila.film;
select * from sakila.rental;

-- Question 5. What is the shortest and longest rental period?
select convert(return_date, date), convert(rental_date, date) from sakila.rental;
SELECT min(TIMEDIFF(return_date, rental_date))
from sakila.rental;
SELECT max(TIMEDIFF(return_date, rental_date))
from sakila.rental;

-- Question 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select title, length from sakila.film
order by length;
select min(length) as min_duration from sakila.film;
select max(length) as max_duration from sakila.film;

-- Question 7. What's the average movie duration?
select floor(avg(length)) as 'average_movie_duration' from sakila.film;

-- Question 8. What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length)) from sakila.film;
select convert(floor(avg(length)), time) 
as 'average_movie_duration' 
from sakila.film;

-- Question 9. How many movies longer than 3 hours?
select *
from sakila.film
where length > 180;

-- Question 10. Get the name and email formatted. 
-- Example: Mary SMITH - mary.smith@sakilacustomer.org.
select * from sakila.customer;
select first_name, last_name, lcase(email) 
from sakila.customer;

-- Question 11. What's the length of the longest film title?
select title, length(title) from sakila.film
order by length(title);
select max(length(title)) from sakila.film;


-- 
select count(distinct(last_name)) from sakila.actor;
--
select count(distinct(language_id)) from sakila.film;
--

-- 3. How many movies were released with "PG-13" rating?
select count(film_id) from sakila.film
where rating = 'PG-13';
--

-- 4. Get 10 the longest movies from 2006.
select title, length, release_year from sakila.film
where release_year = '2006'
order by length desc
limit 10;
--

select * from sakila.film
where release_year = '2006'
order by length desc
limit 10;
--

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(last_update), min(rental_date))
from sakila.rental;
-- 
select *, date_format(rental_date, '%M') as month, date_format(rental_date, '%W') as weekday
from sakila.rental
limit 20;
-- 

-- 
select *, extract(MONTH from rental_date) as month, date_format(rental_date, '%W') as weekday
from sakila.rental
limit 20;
--

-- 7. Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
select *, 
case
when date_format(rental_date, '%W') IN ('Saturday, Sunday') then 'Weekend'
else 'Workday'
End as day_type
from sakila.rental;

-- 8. How many rentals were in the last month of activity?
select count(rental_id) from sakila.rental
where extract(YEAR from rental_date)='2006' and EXTRACT(MONTH from rental_date)='02';
--
select rental_date from sakila.rental
order by rental_date desc
limit 1;


