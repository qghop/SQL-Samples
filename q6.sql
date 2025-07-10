SELECT c.last_name as "Last Name",
       c.first_name as "First Name",
       f.title as "Film Title"
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE (c.last_name LIKE 'Andre%' OR c.last_name LIKE 'Ander%')
AND (f.description LIKE '%dentist%' AND f.description LIKE '%monastery%')
AND r.return_date LIKE '2005-08%';