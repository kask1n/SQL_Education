DROP SCHEMA IF EXISTS stepik_advanced_2_4;
CREATE SCHEMA stepik_advanced_2_4;
USE stepik_advanced_2_4;


CREATE TABLE type_room
(
    type_room_id   INT PRIMARY KEY AUTO_INCREMENT,
    type_room_name VARCHAR(60),
    price          DECIMAL(9, 2)
);

INSERT INTO type_room(type_room_name, price)
VALUES ('Представительский люкс', 20000),
       ('Люкс', 15000),
       ('Стандартный двухместный номер', 2500),
       ('Стандартный одноместный номер', 2900),
       ('Двухместный номер бизнес класса', 3500),
       ('Одноместный номер бизнес класса', 4100),
       ('Представительский двухместный номер', 4100),
       ('Представительский одноместный номер', 4500),
       ('Люкс-студио', 18000),
       ('Люкс с террасой', 16000),
       ('Полулюкс', 14000),
       ('Апартаменты Делюкс', 12000);


CREATE TABLE status
(
    status_id   INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);

INSERT INTO status(status_name)
VALUES ('Занят'),
       ('Забронирован'),
       ('Бронирование отменено');


CREATE TABLE guest
(
    guest_id   INT PRIMARY KEY AUTO_INCREMENT,
    guest_name VARCHAR(30)
);

INSERT INTO guest(guest_name)
VALUES ('Иванов М.С.'),
       ('Петров Ф.С.'),
       ('Федоров П.Р.'),
       ('Абрамова А.А.'),
       ('Самарин С.С.'),
       ('Туполев И.Д.'),
       ('Баранов П.В.'),
       ('Шевцова А.Р.'),
       ('Белых К.Д.'),
       ('Садиев С.И.'),
       ('Астахов И.И.'),
       ('Борисов В.В.'),
       ('Тощаков П.С.'),
       ('Солиева К.П.'),
       ('Левченко А.Г.'),
       ('Хованец Г.П.'),
       ('Тихомиров Т.М.'),
       ('Дворников М.А.'),
       ('Жидкова Р.Л.'),
       ('Бондаренко С.С.');


CREATE TABLE service
(
    service_id   INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(50)
);

INSERT INTO service (service_name)
VALUES ('Трансфер от/до аэропорта'),
       ('Спа и оздоровительный центр'),
       ('Фитнес-центр'),
       ('Доставка еды и напитков в номер'),
       ('Экскурсии'),
       ('Услуги прачечной'),
       ('Сейф'),
       ('Бизнес-центр'),
       ('Услуги няни');


CREATE TABLE room
(
    room_id      INT PRIMARY KEY AUTO_INCREMENT,
    room_name    VARCHAR(80),
    type_room_id int,
    FOREIGN KEY (type_room_id) REFERENCES type_room (type_room_id) ON DELETE CASCADE
);

INSERT INTO room(room_name, type_room_id)
VALUES ('Л-1301', 1),
       ('Л-1302', 1),
       ('Л-1403', 1),
       ('Л-1304', 2),
       ('С-0201', 3),
       ('С-0203', 3),
       ('С-0205', 3),
       ('С-0207', 3),
       ('С-0209', 3),
       ('С-0211', 3),
       ('С-0213', 3),
       ('С-0215', 3),
       ('С-0217', 3),
       ('С-0219', 4),
       ('С-0221', 4),
       ('С-0223', 4),
       ('С-0225', 4),
       ('С-0227', 4),
       ('С-0202', 5),
       ('С-0204', 5),
       ('С-0206', 5),
       ('С-0208', 5),
       ('С-0210', 5),
       ('С-0212', 5),
       ('С-0214', 5),
       ('С-0216', 6),
       ('С-0218', 6),
       ('С-0220', 6),
       ('С-0222', 6),
       ('С-0224', 6),
       ('С-0226', 6),
       ('С-0228', 6),
       ('П-0811', 7),
       ('П-0813', 7),
       ('П-0815', 7),
       ('П-0817', 7),
       ('П-0819', 7),
       ('П-1002', 8),
       ('П-1004', 8),
       ('П-1005', 8),
       ('П-1006', 8),
       ('Л-0901', 9),
       ('Л-0903', 9),
       ('Л-0701', 10),
       ('Л-0501', 10),
       ('Л-1201', 10);


CREATE TABLE room_booking
(
    room_booking_id INT PRIMARY KEY AUTO_INCREMENT,
    room_id         INT,
    guest_id        INT,
    check_in_date   DATE,
    check_out_date  DATE,
    status_id       INT,
    FOREIGN KEY (room_id) REFERENCES room (room_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES guest (guest_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES status (status_id) ON DELETE CASCADE
);

INSERT INTO room_booking (room_id, guest_id, check_in_date, check_out_date, status_id)
VALUES (14, 13, '2020-09-07', '2020-09-09', 1),
       (17, 2, '2020-09-11', '2020-09-19', 1),
       (27, 12, '2020-09-12', '2020-09-21', 1),
       (31, 11, '2020-09-13', '2020-09-15', 1),
       (4, 13, '2020-09-14', '2020-09-15', 1),
       (30, 18, '2020-09-14', '2020-09-18', 1),
       (32, 1, '2020-09-18', '2020-09-21', 1),
       (36, 8, '2020-09-22', '2020-09-25', 3),
       (11, 5, '2020-09-26', '2020-09-29', 1),
       (13, 16, '2020-09-28', '2020-10-06', 1),
       (43, 8, '2020-09-28', '2020-10-12', 1),
       (4, 9, '2020-10-02', '2020-10-09', 1),
       (36, 1, '2020-10-03', '2020-10-06', 1),
       (41, 16, '2020-10-05', '2020-10-15', 3),
       (18, 10, '2020-10-08', '2020-10-18', 1),
       (26, 3, '2020-10-11', '2020-10-25', 1),
       (32, 13, '2020-10-15', '2020-10-17', 1),
       (14, 16, '2020-10-17', '2020-10-20', 3),
       (32, 17, '2020-10-19', '2020-10-29', 3),
       (41, 17, '2020-10-25', '2020-10-31', 1),
       (5, 10, '2020-10-30', '2020-11-06', 1),
       (39, 11, '2020-10-31', '2020-11-01', 1),
       (29, 11, '2020-11-03', '2020-11-08', 1),
       (31, 10, '2020-11-04', '2020-11-11', 1),
       (34, 8, '2020-11-05', '2020-11-14', 1),
       (6, 17, '2020-11-07', '2020-11-10', 1),
       (14, 12, '2020-11-10', '2020-11-20', 3),
       (26, 7, '2020-11-16', '2020-11-18', 1),
       (3, 9, '2020-11-18', '2020-11-21', 1),
       (12, 11, '2020-11-20', '2020-11-23', 1),
       (40, 10, '2020-11-20', '2020-12-02', 1),
       (1, 1, '2020-11-22', '2020-11-24', 1),
       (26, 4, '2020-11-23', '2020-12-01', 1),
       (1, 14, '2020-11-25', '2020-12-03', 1),
       (11, 9, '2020-11-25', '2020-12-03', 1),
       (28, 11, '2020-11-26', '2020-12-07', 1),
       (27, 16, '2020-11-27', '2020-12-02', 3),
       (3, 17, '2020-11-29', '2020-12-02', 1),
       (23, 12, '2020-11-30', '2020-12-04', 1),
       (7, 4, '2020-12-02', '2020-12-03', 1),
       (3, 5, '2020-12-07', '2020-12-14', 1),
       (39, 4, '2020-12-07', '2020-12-13', 1),
       (4, 8, '2020-12-11', '2020-12-25', 1),
       (13, 11, '2020-12-11', '2020-12-24', 1),
       (24, 16, '2020-12-11', '2020-12-19', 1),
       (21, 19, '2020-12-13', '2020-12-15', 1),
       (20, 6, '2020-12-15', '2020-12-19', 1),
       (36, 1, '2020-12-15', '2020-12-19', 1),
       (42, 5, '2020-12-18', '2020-12-20', 1),
       (2, 5, '2020-12-19', '2020-12-31', 1),
       (17, 6, '2020-12-20', '2020-12-21', 1),
       (34, 14, '2020-12-21', '2020-12-24', 1),
       (18, 3, '2020-12-25', '2020-12-27', 1),
       (13, 10, '2020-12-28', '2021-01-07', 1),
       (39, 8, '2021-01-03', '2021-01-08', 1),
       (14, 19, '2021-01-04', '2021-01-09', 3),
       (33, 12, '2021-01-04', '2021-01-10', 1),
       (13, 4, '2021-01-09', '2021-01-15', 1),
       (21, 11, '2021-01-13', '2021-01-16', 1),
       (43, 16, '2021-01-13', '2021-01-17', 1),
       (19, 13, '2021-01-14', '2021-01-15', 1),
       (4, 18, '2021-01-15', '2021-01-21', 1),
       (8, 1, '2021-01-20', '2021-01-23', 1),
       (37, 3, '2021-01-20', '2021-01-27', 1),
       (35, 3, '2021-01-21', '2021-01-28', 1),
       (21, 9, '2021-01-24', '2021-02-02', 1),
       (35, 12, '2021-01-24', '2021-01-26', 1),
       (12, 3, '2021-01-26', '2021-01-28', 1),
       (2, 9, '2021-01-30', '2021-02-11', 1),
       (7, 12, '2021-02-01', '2021-02-11', 1),
       (34, 2, '2021-02-06', '2021-02-07', 1),
       (35, 16, '2021-02-06', '2021-02-07', 1),
       (11, 7, '2021-02-07', '2021-02-17', 1),
       (18, 9, '2021-02-07', '2021-02-09', 1),
       (9, 2, '2021-02-11', '2021-02-13', 1),
       (19, 12, '2021-02-13', '2021-02-18', 1),
       (4, 7, '2021-02-16', '2021-02-17', 1),
       (26, 10, '2021-02-16', '2021-02-21', 1),
       (19, 9, '2021-02-20', '2021-02-23', 1),
       (23, 13, '2021-02-22', '2021-02-26', 1),
       (28, 6, '2021-02-22', '2021-03-04', 1),
       (41, 6, '2021-02-22', '2021-02-25', 1),
       (4, 4, '2021-02-23', '2021-03-01', 1),
       (37, 18, '2021-02-25', '2021-02-26', 1),
       (41, 10, '2021-03-01', '2021-03-05', 1),
       (11, 6, '2021-03-07', '2021-03-12', 1),
       (6, 12, '2021-03-10', '2021-03-23', 3),
       (37, 12, '2021-03-10', '2021-03-14', 1),
       (12, 7, '2021-03-12', '2021-03-18', 1),
       (21, 19, '2021-03-13', '2021-03-19', 1),
       (3, 17, '2021-03-18', '2021-03-24', 1),
       (14, 6, '2021-03-20', '2021-03-24', 1),
       (31, 18, '2021-03-23', '2021-03-24', 1),
       (31, 15, '2021-03-27', '2021-04-02', 1),
       (15, 10, '2021-04-04', '2021-04-07', 2),
       (17, 11, '2021-04-05', '2021-04-09', 2),
       (20, 11, '2021-04-07', '2021-04-13', 2),
       (25, 18, '2021-04-09', '2021-04-11', 2),
       (28, 13, '2021-04-09', '2021-04-16', 2),
       (1, 17, '2021-04-10', '2021-04-14', 2),
       (27, 1, '2021-04-15', '2021-04-28', 2),
       (3, 9, '2021-04-22', '2021-04-24', 2),
       (6, 18, '2021-04-26', '2021-05-08', 2),
       (22, 15, '2021-04-26', '2021-04-28', 2),
       (18, 3, '2021-04-28', '2021-05-09', 2),
       (22, 5, '2021-05-01', '2021-05-10', 2),
       (42, 10, '2021-05-01', '2021-05-02', 2),
       (14, 11, '2021-05-04', '2021-05-10', 2),
       (29, 14, '2021-05-04', '2021-05-06', 2),
       (21, 13, '2021-05-09', '2021-05-13', 3),
       (35, 17, '2021-05-10', '2021-05-18', 2),
       (17, 17, '2021-05-11', '2021-05-12', 2),
       (33, 10, '2021-05-14', '2021-05-15', 3),
       (16, 2, '2021-05-15', '2021-05-22', 2),
       (14, 8, '2021-05-23', '2021-05-25', 2),
       (20, 2, '2021-05-24', '2021-05-24', 3),
       (35, 1, '2021-05-24', '2021-05-26', 2),
       (19, 9, '2021-05-30', '2021-06-07', 2),
       (15, 15, '2021-05-31', '2021-06-03', 3),
       (25, 14, '2021-05-31', '2021-06-09', 2),
       (39, 19, '2021-06-01', '2021-06-07', 2),
       (16, 1, '2021-06-02', '2021-06-06', 3),
       (35, 18, '2021-06-02', '2021-06-13', 2),
       (30, 13, '2021-06-03', '2021-06-06', 3),
       (9, 6, '2021-06-05', '2021-06-12', 2),
       (42, 7, '2021-06-05', '2021-06-07', 2),
       (27, 19, '2021-06-06', '2021-06-09', 2),
       (29, 11, '2021-06-06', '2021-06-07', 2),
       (41, 4, '2021-06-14', '2021-06-15', 2),
       (10, 1, '2021-06-15', '2021-06-23', 2),
       (35, 11, '2021-06-15', '2021-06-19', 2),
       (38, 5, '2021-06-15', '2021-06-17', 2),
       (31, 5, '2021-06-16', '2021-06-27', 3),
       (9, 6, '2021-06-17', '2021-06-25', 2),
       (20, 3, '2021-06-17', '2021-06-18', 2),
       (39, 11, '2021-06-17', '2021-06-19', 2),
       (39, 8, '2021-06-22', '2021-06-23', 2),
       (29, 3, '2021-06-23', '2021-06-28', 2),
       (2, 7, '2021-06-24', '2021-06-28', 2),
       (10, 15, '2021-06-24', '2021-06-25', 2),
       (38, 4, '2021-06-26', '2021-06-30', 3),
       (8, 18, '2021-06-27', '2021-07-05', 2),
       (24, 12, '2021-06-27', '2021-07-04', 2);


CREATE TABLE service_booking
(
    service_booking_id INT PRIMARY KEY AUTO_INCREMENT,
    service_id         int,
    room_booking_id    INT,
    service_start_date DATE,
    price              DECIMAL(10, 2),
    FOREIGN KEY (service_id) REFERENCES service (service_id) ON DELETE CASCADE,
    FOREIGN KEY (room_booking_id) REFERENCES room_booking (room_booking_id) ON DELETE CASCADE
);

INSERT INTO service_booking(service_id, room_booking_id, service_start_date, price)
VALUES (4, 9, '2020-09-27', 8665),
       (5, 9, '2020-09-28', 4089),
       (1, 9, '2020-09-28', 1050),
       (2, 10, '2020-10-04', 4448),
       (8, 11, '2020-09-29', 1000),
       (4, 12, '2020-10-04', 2343),
       (1, 13, '2020-10-05', 1106),
       (8, 16, '2020-10-17', 1000),
       (1, 21, '2020-10-30', 1000),
       (1, 21, '2020-11-06', 1200),
       (8, 24, '2020-11-08', 1000),
       (5, 24, '2020-11-10', 3980),
       (8, 24, '2020-11-09', 1000),
       (3, 28, '2020-11-18', 1025),
       (5, 28, '2020-11-16', 2595),
       (2, 32, '2020-11-23', 9550),
       (8, 36, '2020-12-04', 1000),
       (4, 38, '2020-11-30', 5300),
       (6, 38, '2020-12-01', 100),
       (8, 39, '2020-11-30', 1000),
       (7, 40, '2020-12-02', 100),
       (2, 44, '2020-12-21', 5076),
       (1, 46, '2020-12-14', 1882),
       (6, 47, '2020-12-16', 383),
       (3, 50, '2020-12-26', 1459),
       (4, 52, '2020-12-24', 4815),
       (5, 54, '2020-12-30', 3800),
       (1, 54, '2021-01-07', 1200),
       (2, 55, '2021-01-08', 3619),
       (7, 55, '2021-01-04', 100),
       (2, 59, '2021-01-15', 2755),
       (1, 59, '2021-01-16', 900),
       (5, 59, '2021-01-14', 1200),
       (5, 59, '2021-01-15', 11500),
       (4, 61, '2021-01-14', 3259),
       (7, 69, '2021-02-04', 100),
       (1, 69, '2021-02-08', 1105),
       (6, 72, '2021-02-07', 773),
       (1, 73, '2021-02-13', 1744),
       (6, 74, '2021-02-08', 1073),
       (2, 76, '2021-02-16', 3509),
       (1, 76, '2021-02-17', 1291),
       (5, 76, '2021-02-14', 4553),
       (8, 76, '2021-02-14', 1000),
       (1, 80, '2021-02-22', 1500),
       (7, 80, '2021-02-22', 100),
       (2, 91, '2021-03-23', 3484),
       (2, 92, '2021-03-21', 5142);
