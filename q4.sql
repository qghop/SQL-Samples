SELECT a.first_name as "First Name", a.last_name as "Last Name"
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Classics', 'Sci-Fi', 'Drama') AND fa.film_id IN (
    SELECT fa.film_id
    FROM film_actor fa
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE first_name = 'EMILY' AND last_name = 'DEE'
)
GROUP BY a.last_name, a.first_name
ORDER BY a.last_name, a.first_name;
