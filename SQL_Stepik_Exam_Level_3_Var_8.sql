/* Задание 1 */
CREATE TABLE room
(
    room_id      SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    room_name    CHAR(16) NOT NULL,
    type_room_id SMALLINT,
    FOREIGN KEY (type_room_id) REFERENCES type_room (type_room_id) ON DELETE SET NULL
);


/* Задание 2 */
INSERT INTO room (room_name, type_room_id)
SELECT 'С-0228',
       (SELECT type_room_id
        FROM type_room
        WHERE type_room_name = 'Одноместный номер бизнес класса');

INSERT INTO room (room_name, type_room_id)
SELECT 'П-0811',
       (SELECT type_room_id
        FROM type_room
        WHERE type_room_name = 'Представительский двухместный номер');


/* Задание 3 */
SELECT room_name      AS `Номер`,
       type_room_name AS `Тип_номера`,
       price          AS `Цена`
FROM type_room
         INNER JOIN room
                    USING (type_room_id)
WHERE RIGHT(room_name, 1) % 2 = 1
ORDER BY price, room_name;


/* Задание 4 */
SELECT guest_name,
       room_name,
       check_in_date,
       DATEDIFF(check_out_date, check_in_date) + 1 AS `Количество_дней`
FROM guest
         INNER JOIN room_booking
                    USING (guest_id)
         INNER JOIN room
                    USING (room_id)
         INNER JOIN status
                    USING (status_id)
WHERE status_name = 'Занят'
  AND check_in_date BETWEEN '2020-12-01' AND '2021-01-31'
ORDER BY guest_name, room_name, check_in_date DESC;


/* Задание 5 */
SELECT guest_name             AS `Гость`,
       status_name            AS `Статус`,
       COUNT(room_booking_id) AS `Количество`
FROM guest
         INNER JOIN room_booking
                    USING (guest_id)
         INNER JOIN status
                    USING (status_id)
GROUP BY guest_id, guest_name, status_id, status_name
ORDER BY guest_name, status_name DESC;


/* Задание 6 */
SELECT room_name              AS `Номер`,
       YEAR(check_in_date)    AS `Год`,
       COUNT(room_booking_id) AS `Количество`
FROM room
         LEFT JOIN room_booking
                   USING (room_id)
         LEFT JOIN status
                   USING (status_id)
WHERE status_name = 'Занят'
GROUP BY room_name, YEAR(check_in_date)
ORDER BY room_name, `Год` DESC;


/* Задание 7 */
SELECT service_name           AS `Услуга`,
       COUNT(room_booking_id) AS `Количество`,
       CASE
           WHEN COUNT(room_booking_id) > 7 THEN 'Высокий'
           WHEN COUNT(room_booking_id) BETWEEN 5 AND 7 THEN 'Средний'
           WHEN COUNT(room_booking_id) < 5 THEN 'Низкий'
           END                AS `Спрос`
FROM service
         INNER JOIN service_booking
                    USING (service_id)
GROUP BY service_id, service_name
UNION

SELECT service_name,
       0,
       'Не определен'
FROM service
         LEFT JOIN service_booking
                   USING (service_id)
WHERE service_booking_id IS NULL
ORDER BY `Количество` DESC, `Услуга`;


/* Задание 8 */
WITH get_booking_count
         AS (SELECT room_name,
                    COUNT(room_booking_id) AS booking_count
             FROM room
                      INNER JOIN room_booking
                                 USING (room_id)
                      INNER JOIN status
                                 USING (status_id)
             WHERE status_name = 'Занят'
             GROUP BY room_id, room_name)

SELECT room_name     AS `Номер`,
       booking_count AS `Количество`
FROM get_booking_count
WHERE booking_count = (SELECT MAX(booking_count)
                       FROM get_booking_count)
ORDER BY room_name;


/* Задание 9 */
UPDATE room_booking
    INNER JOIN room
    USING (room_id)
    INNER JOIN guest
    USING (guest_id)
SET status_id = (SELECT status_id
                 FROM status
                 WHERE status_name = 'Бронирование отменено')
WHERE guest_name = 'Жидкова Р.Л.'
  AND room_name = 'П-1004'
  AND check_in_date = '2021-06-01';


/* Задание 10 */
DELETE
FROM service_booking
    USING service
              INNER JOIN service_booking
                         USING (service_id)
              INNER JOIN room_booking
                         USING (room_booking_id)
              INNER JOIN guest
                         USING (guest_id)
              INNER JOIN room
                         USING (room_id)
WHERE guest_name = 'Жидкова Р.Л.'
  AND room_name = 'П-1004'
  AND check_in_date = '2021-06-01';
