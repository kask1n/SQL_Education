CREATE TABLE store AS
WITH get_twin_books AS (SELECT title, author, price, amount
                        FROM book
                        WHERE (title, author) IN (SELECT DISTINCT title, author
                                                  FROM supply)

                        UNION ALL
                        SELECT title, author, price, amount
                        FROM supply
                        WHERE (title, author) IN (SELECT DISTINCT title, author
                                                  FROM book)),

     get_sum_amount (sum_amount) AS (SELECT SUM(amount)
                                     FROM book

                                     UNION ALL
                                     SELECT SUM(amount)
                                     FROM supply),

     get_unique_books (tit, auth) AS (SELECT DISTINCT title, author
                                      FROM book

                                      UNION ALL
                                      SELECT DISTINCT title, author
                                      FROM supply)

SELECT title       AS Книга,
       author      AS Автор,
       MAX(price)  AS Цена,
       SUM(amount) AS Количество

FROM get_twin_books
GROUP BY title, author
HAVING SUM(amount) >
       (SELECT SUM(sum_amount) FROM get_sum_amount) / (SELECT COUNT(*) FROM get_unique_books)
ORDER BY 2, 3 DESC;

SELECT *
FROM store;
