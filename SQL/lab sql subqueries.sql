use sakila;
#How many copies of the film Hunchback Impossible exist 
#in the inventory system?
#TASK 1
select count(film_id) as num_of_copies from inventory
where film_id = (select film_id from film 
where title = "Hunchback Impossible");

#List all films whose length is longer than the average of all the films.
#TASK 2
select title, length from film
where length > (select avg(length) as Avg_length from film);

#Use subqueries to display all actors who appear in the film Alone Trip.
#TASK 3
select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
where film_id = (select film_id from film
where title = "Alone Trip"));

#Sales have been lagging among young families, 
#and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.
#TASK 4
select title from film
where film_id in (select film_id from film_category
					join category using(category_id)
					where name = "Family")

(select film_id from film_category where category_id = 
(select category_id from category where name = "Family"));

#alternative solution
select film_id from film_category
join category using(category_id)
where name = "Family"


#Get name and email from customers from Canada using subqueries. 
#Do the same with joins. Note that to create a join, 
#you will have to identify the correct tables with their 
#primary keys and foreign keys, that will help you get the relevant information
#TASK 5
select first_name, last_name, email from customer
where address_id in	(select address_id 
					from address 
					where city_id in 
								(select city_id 
								from city 
								where country_id in (select country_id 
													from country 
													where country = "Canada")));

#with JOIN
select cu.first_name, cu.last_name, cu.email 
from country as co
join city as c using(country_id)
join address as a using (city_id)
join customer as cu using (address_id)
where country = "Canada";

#Which are films starred by the most prolific actor? 
#Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and 
#then use that actor_id to find the different films that he/she starred.
#TASK 6
select title
from film
where film_id in (select film_id
				  from film_actor
			      where actor_id in (
									select actor_id from (
														select actor_id, count(film_id) as number_films
														from film_actor
														group by actor_id
														order by number_films desc
                                                        limit 1) as sub1));
#alternative solution													
use sakila;
WITH
most_profilic_actor AS (select actor_id from film_actor
		 group by actor_id order by count(film_id)desc limit 1)
SELECT Title
from film inner join film_actor using (film_id)
where actor_id = (select actor_id from most_profilic_actor);                                                    
                                                    
#Films rented by most profitable customer. You can use the customer +
#table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
#TASK 7
select title from film
where film_id in   (select film_id
					from inventory
					where inventory_id in (select inventory_id 
											from rental
                                            where rental_id in (select rental_id 
																from payment