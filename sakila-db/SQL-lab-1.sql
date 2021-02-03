select *  
from sakila.language;
-- Just a first example to try
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