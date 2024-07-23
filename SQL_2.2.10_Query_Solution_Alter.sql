/* Создание временной таблицы numbers, в которую записывается ряд
   последовательных чисел (от 1 до максимального количества экземпляров книг) */
CREATE TEMPORARY TABLE num_0_9_a
(
    num_1 INT
);

INSERT INTO num_0_9_a (num_1)
VALUES (0),
       (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9);

CREATE TEMPORARY TABLE num_0_9_b AS
SELECT num_1 AS num_2
FROM num_0_9_a;

CREATE TEMPORARY TABLE numbers
(
    num INT
) AS
SELECT CONCAT(num_1, num_2) AS num
FROM num_0_9_a
         CROSS JOIN num_0_9_b
WHERE concat(num_1, num_2) BETWEEN 1 AND (SELECT MAX(amount) FROM book)
ORDER BY 1;


/* Создание временной таблицы full_book. Соединение таблицы book с таблицей numbers позволяет её растянуть
   таким образом, что каждая строка с книгой повторяется ровно столько раз, сколько её имеется в наличии (поле amount).
   Поле row_num, в свою очередь, позволяет присвоить каждой книге свой уникальный порядковый номер */
CREATE TEMPORARY TABLE full_book
(
    row_num INT PRIMARY KEY AUTO_INCREMENT
) AS
SELECT book_id, name_author, title, amount
FROM book
         INNER JOIN author USING (author_id)
         INNER JOIN numbers ON book.amount >= numbers.num -- УСЛОВИЕ ЧЕРЕЗ >=
ORDER BY book_id, num;


WITH get_data -- Определяем суммарное количество экземпляров всех книг и количество городов
         AS (SELECT (SELECT SUM(amount) FROM book) AS book_total_amount,
                    (SELECT COUNT(*) FROM city)    AS city_cnt),
     get_city_book_cnt -- Определяем количество книг для отправки в города
         AS (SELECT city_id,
                    name_city,
                    IF(
                                city_id <=
                                MOD(book_total_amount, city_cnt), -- MOD - ФУНКЦИЯ НАХОЖДЕНИЯ ОСТАТКА ОТ ДЕЛЕНИЯ
                                FLOOR(book_total_amount / city_cnt) + 1,
                                FLOOR(book_total_amount / city_cnt)
                        ) AS book_cnt
             FROM city
                      CROSS JOIN get_data),
     get_city_book_sum -- Определяем границы диапазонов порядковых номеров книг, отправляемых в города
         AS (SELECT city_id,
                    name_city,
                    book_cnt,
                    (SELECT SUM(book_cnt)
                     FROM get_city_book_cnt t1
                     WHERE t1.city_id <= t2.city_id) AS book_sum -- УСЛОВИЕ ЧЕРЕЗ <=
             FROM get_city_book_cnt t2),
     get_city_book_range -- Определяем для книг их город/города назначения...
         AS (SELECT city_id,
                    name_city,
                    book_sum - book_cnt + 1 AS beg,
                    book_sum                AS end
             FROM get_city_book_sum),
     get_book_to_city
         AS (SELECT book_id,
                    name_author,
                    title,
                    amount,
                    city_id,
                    name_city,
                    COUNT(*) AS cnt
             FROM full_book
                      INNER JOIN get_city_book_range -- ...путём соотнесения порядковых номеров книг таблицы full_book...
                                 ON row_num BETWEEN beg AND end -- ...с диапазонами порядковых номеров книг из get_city_book_range.
             GROUP BY city_id, name_city, book_id, name_author, title, amount)

SELECT name_author,
       title,
       amount,
       GROUP_CONCAT(
               CONCAT(name_city, ' - ', cnt) ORDER BY city_id SEPARATOR ', '
           ) AS city_amount
FROM get_book_to_city
GROUP BY book_id, name_author, title, amount
ORDER BY book_id;