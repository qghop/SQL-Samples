SELECT category.name as "Category Name", count(rental.rental_id) AS "Number of Rentals"
FROM category
JOIN film_category
    ON category.category_id = film_category.category_id
JOIN film
    ON film_category.film_id = film.film_id
JOIN inventory
    ON film.film_id = inventory.film_id
JOIN rental
    ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name
ORDER BY "Number of Rentals" DESC;
