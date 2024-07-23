INSERT INTO book (title, author, price, amount)
WITH get_new_books AS (SELECT title, author, price, amount
                       FROM supply
                       WHERE author IN (SELECT DISTINCT author
                                        FROM book)
                         AND (title, author) NOT IN (SELECT DISTINCT title, author
                                                     FROM book))
SELECT *
FROM get_new_books
ORDER BY 1 DESC;

SELECT *
FROM book;
