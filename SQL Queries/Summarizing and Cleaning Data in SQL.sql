A. Checking for and clean dirty data

1. Non-uniform data

SELECT DISTINCT rating FROM film

If there was any non-uniform data so in order to fix this, we’ll need to update the values that represent a specific rating in order to be consistent. I would use the UPDATE query which would look this given that the rating G was inconsistently filled out in the film table:

UPDATE film
SET rating = 'G' WHERE rating IN ('gen',
'G', 'General')

2. Duplicate data

--looking for duplicate values

SELECT title, release_year,
language_id, rental_duration, COUNT(*)
FROM film GROUP BY title,
release_year, language_id, rental_duration
HAVING COUNT(*)>1;

If there were duplicate records in the database, then we can fix it by the following two ways:
a. Creating a virtual table, known as a view, where we select only unique records.
b. Delete the duplicate record from the table or view.
Deleting records is something for which we need to practice extra care as it can change a table therefore the standard way of going forward would be by creating a view.

3. Missing values

SELECT film_id,
title,
rating,
release_year, --description ignored in select because it has a lot of missing values language_id
FROM FILM

Missing values can either be ignored or a better way of replacing missing values would be to use the method of imputing values by using statistical methods. So in such a case, I’d suggest using the following UPDATE command:
UPDATE tablename SET = AVG(col1) WHERE col1 IS NULL

B. Using SQL to calculate descriptive statistics

1. Numeric values:

SELECT MIN(film_id) AS min_film_id, MAX(film_id) AS max_film_id, AVG(film_id) AS avg_film_id,
MIN(language_id) AS min_language_id, MAX(language_id) AS
max_language_id, AVG(language_id) AS
avg_language_id,
MIN(rental_duration) AS min_rent_duration,
MAX(rental_duration) AS max_rent_duration,
AVG(rental_duration) AS avg_rent_duration,
MIN(rental_rate) AS min_rent, MAX(rental_rate) AS max_rent, AVG(rental_rate) AS avg_rent,
MIN(length) AS min_length,
MAX(length) AS max_length,
AVG(length) AS avg_length, MIN(replacement_cost) AS min_repl_cost,
MAX(replacement_cost) AS max_repl_cost,
AVG(replacement_cost) AS avg_repl_cost
FROM film;

2. Mode (for non-numeric values):

SELECT mode()
WITHIN GROUP (ORDER BY release_year) AS mode_release_year,
mode() WITHIN GROUP (ORDER BY language_id)
AS mode_language,
mode() WITHIN GROUP (ORDER BY rating) AS mode_rating,
mode() WITHIN GROUP (ORDER BY special_features)
AS mode_special_features
FROM film
