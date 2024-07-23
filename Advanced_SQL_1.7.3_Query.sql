WITH get_author_max (author_max) AS (SELECT author
                                     FROM book
                                     GROUP BY author
                                     HAVING SUM(amount) >= ALL (SELECT SUM(amount)
                                                                FROM book
                                                                GROUP BY author)),

     get_author_min (author_min) AS (SELECT author
                                     FROM book
                                     GROUP BY author
                                     HAVING SUM(amount) <= ALL (SELECT SUM(amount)
                                                                FROM book
                                                                GROUP BY author))

UPDATE book, get_author_max, get_author_min
SET price = CASE
                WHEN author IN (author_max) THEN ROUND(price * 0.85, 2)
                WHEN author IN (author_min) THEN ROUND(price * 1.1, 2)
                ELSE price
    END;

SELECT *
FROM book;