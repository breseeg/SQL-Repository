Performing subqueries in SQL to find the average amount paid by the top 5 customers.

SELECT AVG(total_amount_paid) AS average FROM (SELECT B.customer_id, B.first_name,
B.last_name,
D.city,
E.country,
SUM(A.amount) AS Total_Amount_Paid
FROM customer B
INNER JOIN payment A ON B.customer_id = A.customer_id INNER JOIN address C ON B.address_id = C.address_id
1
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
WHERE D.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)',
'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
GROUP BY B.customer_id, B.first_name, B.last_name, D.city, E.country
ORDER BY Total_Amount_Paid DESC LIMIT 5) AS total_amount_paid
