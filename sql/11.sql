/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT (actor.first_name || ' ' || actor.last_name) AS "Actor Name"
FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
WHERE film.film_id IN
    (SELECT film_id
     FROM (SELECT film_id, unnest(special_features) AS feature FROM film) AS f
     WHERE feature = 'Behind the Scenes');
