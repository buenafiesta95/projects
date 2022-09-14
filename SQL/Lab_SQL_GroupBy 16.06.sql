use sakila;
#Which last names appear more than once? We would use the same logic as in the previous question 
#but this time we want to include the last names of the actors where the last name was present more than once
#TASK1
select last_name
from actor
group by last_name
having count(last_name) <2;

#Using the rental table, find out how many rentals were processed by each employee.
select count(rental_id), staff_id from rental
group by staff_id;

#Using the film table, find out how many films there are of each rating.
select rating, count(film_id) as num_of_films from film
group by rating;

#What is the mean length of the film for each rating type. 
#Round off the average lengths to two decimal places
select rating, round(avg(length),2) as avg_length from film
group by rating;

#Which kind of movies (rating) have a mean duration of more than two hours?
select rating from film
group by rating
having avg(length) > 120;