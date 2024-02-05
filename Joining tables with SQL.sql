Here are a few SQL queries for joining tables 

1. Finding the top 10 countries for Rockbuster in terms of customer numbers.

SELECT D.country, COUNT(A.customer_id)
AS Total_number_of_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY count (A.customer_id) DESC LIMIT 10

2. Finding the top 10 cities within the top 10 countries identified in the above step. 

SELECT C.city, D.country,
COUNT(A.customer_id) AS Total_number_of_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id INNER JOIN country D ON C.country_id = D.country_id
WHERE D.country IN ('India', 'China', 'United States','Japan',
'Mexico','Brazil','Russian Federation','Philippines','Turkey','Indonesia' ) GROUP BY C.city, D.country
ORDER BY count (A.customer_id) DESC LIMIT 10

3. Finding the top 5 customers in the top 10 cities who have paid the highest total amounts to Rockbuster.

SELECT B.customer_id, B.first_name, B.last_name,
D.city,
E.country,
SUM(A.amount) AS Total_Amount_Paid
FROM customer B
INNER JOIN payment A ON B.customer_id = A.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
WHERE D.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)', 'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
GROUP BY B.customer_id, B.first_name, B.last_name, D.city, E.country
ORDER BY Total_Amount_Paid DESC
LIMIT 5
