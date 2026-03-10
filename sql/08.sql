/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT film.title
FROM film
WHERE film.rating = 'G'
AND film.film_id IN
    (SELECT film_id
     FROM (SELECT film_id, unnest(special_features) AS feature FROM film) AS f
     WHERE feature = 'Trailers')
ORDER BY film.title;
