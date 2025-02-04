SELECT MAX(amount) FROM payment;

SELECT * FROM payment
WHERE amount = (SELECT MAX(amount) FROM payment);

SELECT * FROM actor
WHERE first_name = 'Penelope';

SELECT * FROM film
	JOIN film_actor USING (film_id)
    WHERE actor_id IN (SELECT actor_id FROM actor
WHERE first_name = 'Penelope');

SELECT MAX(AVG_AMOUNT) FROM (
SELECT MONTH(payment_date) AS M, AVG(amount) AS AVG_AMOUNT FROM payment
	GROUP BY M) q;

SELECT AVG(amount), customer_id FROM payment
	GROUP BY customer_id;
    
SELECT customer_id, AVG(amount) AS AVG_AMOUNT FROM payment
    GROUP BY customer_id
    HAVING AVG_AMOUNT > (SELECT AVG(amount) FROM payment);
   
  SELECT manager_staff_id, address FROM store JOIN address USING (address_id)
  WHERE store_id = (SELECT store_id FROM(
SELECT store_id, COUNT(*) AS INVENTORY_STOCK FROM inventory
	GROUP BY store_id
    ORDER BY INVENTORY_STOCK DESC
    LIMIT 1) a);
    
SELECT first_name, last_name FROM payment 
JOIN customer USING (customer_id)
WHERE amount >= ALL(SELECT amount FROM payment);

SELECT * FROM film
WHERE film_id = ANY 
	(SELECT film_id FROM film_actor
    WHERE actor_id = 1);
    
    SELECT * FROM film
    JOIN film_actor USING(film_id)
    JOIN actor USING (actor_id)
    WHERE title='Alone Trip';
    
SELECT * FROM actor WHERE actor_id IN(
	SELECT actor_id FROM film_actor 
	WHERE film_id IN(
		SELECT film_id FROM film
		WHERE title='Alone Trip'));
        
SELECT customer_id, AVG(amount) AS AVG_AMO FROM payment
GROUP BY customer_id
HAVING AVG_AMO > (SELECT AVG(amount) FROM payment)
AND COUNT(*) <
(SELECT AVG(NUM_PAYMENTS) FROM (
SELECT customer_id, COUNT(*) AS NUM_PAYMENTS
FROM payment
GROUP BY customer_id)s);
        
  

