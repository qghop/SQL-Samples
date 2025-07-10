SELECT c.customer_id as "Customer ID",
       c.first_name as "First Name",
       c.last_name as "Last Name",
       c.email as "EMail",
       ROUND(SUM(p.amount),2) as Total
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY Total DESC, c.last_name
LIMIT 5;