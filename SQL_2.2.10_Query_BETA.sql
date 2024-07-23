INSERT INTO city (name_city)
VALUES ('Екатеринбург');

WITH get_sum_amount (sum_amount)
         AS (SELECT SUM(amount)
             FROM book),

     get_count_city (count_city)
         AS (SELECT COUNT(*)
             FROM city),

     get_min_amount (min_amount)
         AS (SELECT FLOOR(sum_amount / count_city)
             FROM get_sum_amount
                      CROSS JOIN get_count_city),

     get_residue(residue)
         AS (SELECT sum_amount - count_city * min_amount
             FROM get_sum_amount
                      CROSS JOIN get_count_city
                      CROSS JOIN get_min_amount)

SELECT name_author,
       title,
       amount,
       GROUP_CONCAT(
               CONCAT(name_city, ' - ', min_amount) ORDER BY name_city SEPARATOR ', '
           ) AS city_amount # TODO: Добавить условие распределения книг, вероятно, при помощи оконной функции NTILE().
FROM author
         INNER JOIN book
                    USING (author_id)
         CROSS JOIN city
         CROSS JOIN get_min_amount
GROUP BY name_author, title, amount, book_id
ORDER BY 1, book_id;
