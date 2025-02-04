SELECT * FROM address
WHERE  district <> 'California'
ORDER BY district ASC;

SELECT title, rating FROM film
WHERE rating = 'G';

SELECT * FROM rental
WHERE return_date < '2005-05-28';

SELECT  title, rating, rental_rate FROM film
WHERE title LIKE 'A%' AND title NOT LIKE '%E' 
AND rating IN ('PG', 'G', 'NC-17')
AND rental_rate NOT BETWEEN 1 AND 4
ORDER BY title DESC; 

SELECT first_name, last_name, address, city, country FROM staff
	JOIN address USING (address_id) 
    JOIN city USING (city_id)
    JOIN country USING (country_id);
    
SELECT staff_id, first_name, last_name, SUM(amount) AS total_amount FROM staff
	JOIN payment USING (staff_id)
		WHERE MONTH(payment_date)=08 AND YEAR(payment_date)= 2005
	GROUP BY staff_id;
    
SELECT title, COUNT(*) AS 'Number of copies'FROM film
	JOIN inventory USING (film_id)
WHERE title="Hunchback Impossible";
    
    SELECT DATEDIFF(return_date, rental_date) AS duration FROM rental
WHERE DATEDIFF(return_date, rental_date) > 6
ORDER BY duration ASC;

SELECT AVG(amount), staff_id FROM payment
GROUP BY staff_id;

SELECT COUNT(*), AVG(replacement_cost), rental_duration FROM film
WHERE rating LIKE '_' AND special_features LIKE '%commentaries%'
GROUP BY rental_duration
HAVING COUNT(*) <=50;