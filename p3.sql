USE sakila;
SHOW TABLES;

-- 1. Find total numbers of customers.
DESCRIBE customer;
SELECT COUNT(*) AS total_customers FROM customer;

-- 2. Find the total number of films available in the database.
DESCRIBE film;
SELECT COUNT(*) AS total_films FROM film;

-- 3.Find the highest rental rate among all films.
SELECT MAX(rental_rate) AS highest_rate FROM film;

-- 4. Find the lowest replacement cost of any film.
SELECT MIN(replacement_cost) AS lowest_replacement_cost FROM film;

-- 5. Find the average rental duration of the films.
SELECT AVG(rental_duration) AS average_rental_duration FROM film;

-- 6. Find the total amount of money collected from payments.
DESCRIBE payment;
SELECT SUM(amount) AS total_amount_collected FROM payment;

-- 7. Find the maximum payment amount made by any customer.
SELECT MAX(amount) AS max_payment FROM payment;

-- 8. Find the minimum payment amount made by any customer.
SELECT MIN(amount) AS min_payment FROM payment;

-- 9. Find the total number of customers for each store.
DESCRIBE customer;
SELECT store_id,COUNT(customer_id) AS total_customers FROM customer GROUP BY store_id;

-- 10. Find the total number of films for each rating.
DESCRIBE film;
SELECT rating,COUNT(film_id) AS total_film_per_rating FROM film GROUP BY rating;

-- 11. Find the average replacement cost for each rating.
SELECT rating,AVG(replacement_cost) AS avg_replace_cost FROM film GROUP BY rating;

-- 12. Find the total payment amount for each staff member.
SELECT staff_id,SUM(amount) AS 'Total payment for each staff' FROM payment GROUP BY staff_id;

-- 13. Find the total number of rentals for each staff member.
DESCRIBE rental;
SELECT staff_id,COUNT(rental_id) AS 'Total rentals for each staff' FROM rental GROUP BY staff_id;

-- 14. Find the total number of films for each rental duration.
DESCRIBE film;
SELECT rental_duration,COUNT(film_id) AS 'Total films for each rental duration' FROM film GROUP BY rental_duration;

-- 15. Find the average rental rate for each film rating.
SELECT rating,AVG(rental_rate) AS 'Average rental rate for each rating' FROM film GROUP BY rating;

-- 16. Show ratings that have more than 50 films
SELECT rating,COUNT(film_id) AS 'Total films for each rating' FROM film GROUP BY rating HAVING COUNT(film_id) > 50;

-- 17. Show customers who have made more than 20 payments
DESC payment;
SELECT customer_id,COUNT(payment_id) AS 'Total payments for each customer' FROM payment GROUP BY customer_id HAVING COUNT(payment_id) > 20;

-- 18.Show film categories containing more than 60 films
SELECT * FROM film_category;
SELECT category_id,COUNT(film_id) AS 'Total films for each category' FROM film_category GROUP BY category_id HAVING COUNT(film_id) > 60;


-- 19. Show staff members who have processed payments totaling more than 3000
SELECT staff_id,SUM(amount) AS 'Total payment for each staff' FROM payment GROUP BY staff_id HAVING SUM(amount) > 3000;

-- 20. Show customers whose total payment amount exceeds $100.
DESC payment;
SELECT customer_id,SUM(amount) AS 'Total payment for each customer' FROM payment GROUP BY customer_id HAVING SUM(amount) > 100;