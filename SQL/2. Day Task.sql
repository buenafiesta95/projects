/*
1. Which actor has appeared in the most films?
*/

select first_name, last_name, count(a.actor_id) from sakila.actor as a
inner join sakila.film_actor as l on 
a.actor_id = l.actor_id
group by a.actor_id order by count(a.actor_id)DESC Limit 1 ;

/*
2. Most active customer (the customer that has rented the most number of films
*/

select first_name, last_name, count(a.customer_id) from sakila.customer as a
inner join sakila.payment as l on 
a.customer_id = l.customer_id
group by a.customer_id order by count(a.customer_id)DESC Limit 1 ;

/*
3. List number of films per category.
*/

select name, count(a.category_id) from sakila.category as a
inner join sakila.film_category as l on 
a.category_id = l.category_id
group by a.category_id order by count(a.category_id) DESC;

/*
4. Display the first and last names, as well as the address, of each staff member.
*/

select first_name, last_name, address from sakila.staff as a
inner join sakila.address as l on 
a.address_id = l.address_id;

/*
5. Display the total amount rung up by each staff member in August of 2005.
*/


select first_name, last_name, sum(amount) from sakila.staff as a
inner join sakila.payment as l on
a.staff_id = l.staff_id
where payment_date between '2005-08-01' and '2005-08-31'
#where year (payment_date) = 2005 and month(payment_date) = 08
group by a.staff_id;

/*
6. List each film and the number of actors who are listed for that film.
*/

select title, count(l.actor_id) 
from sakila.film as a
inner join sakila.film_actor as l on 
a.film_id = l.film_id
group by l.film_id order by count(l.actor_id) DESC;

/*
7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

*/

select last_name, first_name, sum(amount) from sakila.payment as a
inner join sakila.customer as l on 
a.customer_id = l.customer_id
group by a.customer_id order by (last_name) ASC;
