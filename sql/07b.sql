/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT(film.title)
FROM film
INNER JOIN inventory USING (film_id)
LEFT JOIN (
    SELECT inventory.film_id
    FROM inventory
    INNER JOIN rental USING (inventory_id)
    INNER JOIN customer USING (customer_id)
    INNER JOIN address USING (address_id)
    INNER JOIN city USING (city_id)
    INNER JOIN country USING (country_id)
    WHERE country = 'United States'
) AS us_rentals ON film.film_id = us_rentals.film_id
WHERE us_rentals.film_id IS NULL
ORDER BY film.title;
