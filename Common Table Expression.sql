Writing CTEs to find the average amount paid by the top 5 customers 

WITH average_total_amount_paid_cte (customer_id, first_name, last_name, city, country, total_amount_paid)
AS (SELECT B.customer_id,
B.first_name,
B.last_name,
D.city,
E.country,
SUM(A.amount) AS Total_Amount_Paid FROM customer B
INNER JOIN payment A ON B.customer_id = A.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
WHERE D.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)',
'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
GROUP BY B.customer_id,
B.first_name,
1
B.last_name, D.city, E.country
ORDER BY Total_Amount_Paid DESC LIMIT 5)
SELECT AVG(total_amount_paid) FROM average_total_amount_paid_cte
