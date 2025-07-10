SELECT
    date(rental_date) as "Date Rented",
    count(*) as "Num Rentals"
FROM rental
WHERE date(rental_date) = date(return_date)
GROUP BY "Date Rented"
    ORDER BY "Date Rented";