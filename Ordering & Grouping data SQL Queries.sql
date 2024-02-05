Here are sample SQL queries to order and group data: 

1. Ordering data 

SELECT title, release_year, rental_rate FROM film ORDER BY title ASC, release_year DESC, rental_rate DESC

2. Grouping Data

SELECT rating, AVG(rental_rate) AS average_rental_rate FROM film GROUP BY rating
SELECT rating, MAX(rental_rate) AS maximum_rental_rate, MIN(rental_rate) AS minimum_rental_rate FROM film GROUP BY rating
