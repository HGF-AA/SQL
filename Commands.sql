SELECT title ,COUNT(actor_id) AS Num_Actors FROM film
	JOIN film_actor USING (film_id)
    GROUP BY film_id
    ORDER BY Num_Actors DESC;
    
SELECT customer_id, first_name, last_name, ROUND(AVG(amount),2) AS Avg_paid, SUM(amount) FROM customer
	JOIN payment USING(customer_id)
	GROUP BY customer_id
	HAVING SUM(amount) > 180;
        
SELECT first_name, last_name, email, country FROM customer
	JOIN address USING(address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id) 
    WHERE country = 'Canada';
    
SELECT SUM(amount), name AS 'Genre' FROM category
	JOIN film_category USING (category_id)
    JOIN inventory USING (film_id) 
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY name
    ORDER BY SUM(amount) DESC;
    
    
    
    






