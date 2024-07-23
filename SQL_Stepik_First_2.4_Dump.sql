DROP SCHEMA IF EXISTS stepik_first_2_4;
CREATE SCHEMA stepik_first_2_4;
USE stepik_first_2_4;

CREATE TABLE author
(
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_author VARCHAR(50)
);
INSERT INTO author (name_author)
VALUES ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.');

CREATE TABLE genre
(
    genre_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_genre VARCHAR(30)
);
INSERT INTO genre (name_genre)
VALUES ('Роман'),
       ('Поэзия'),
       ('Приключения');

CREATE TABLE book
(
    book_id   INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(50),
    author_id INT,
    genre_id  INT,
    price     DECIMAL(8, 2),
    amount    INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE SET NULL
);

INSERT INTO book (title, author_id, genre_id, price, amount)
VALUES ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2);

CREATE TABLE city
(
    city_id       INT PRIMARY KEY AUTO_INCREMENT,
    name_city     VARCHAR(50),
    days_delivery INT
);
INSERT INTO city (name_city, days_delivery)
VALUES ('Москва', 5),
       ('Санкт-Петербург', 3),
       ('Владивосток', 12);

CREATE TABLE client
(
    client_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_client VARCHAR(50),
    city_id     INT,
    email       VARCHAR(30),
    FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE
);

INSERT INTO client (name_client, city_id, email)
VALUES ('Баранов Павел', 3, 'baranov@test'),
       ('Абрамова Катя', 1, 'abramova@test'),
       ('Семенонов Иван', 2, 'semenov@test'),
       ('Яковлева Галина', 1, 'yakovleva@test');

CREATE TABLE buy
(
    buy_id          INT PRIMARY KEY AUTO_INCREMENT,
    buy_description VARCHAR(100),
    client_id       INT,
    FOREIGN KEY (client_id) REFERENCES client (client_id) ON DELETE CASCADE
);
INSERT INTO buy (buy_description, client_id)
VALUES ('Доставка только вечером', 1),
       (Null, 3),
       ('Упаковать каждую книгу по отдельности', 2),
       (Null, 1);

CREATE TABLE buy_book
(
    buy_book_id INT PRIMARY KEY AUTO_INCREMENT,
    buy_id      int,
    book_id     INT,
    amount      INT,
    FOREIGN KEY (buy_id) REFERENCES buy (buy_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE
);

INSERT INTO buy_book (buy_id, book_id, amount)
VALUES (1, 1, 1),
       (1, 7, 2),
       (1, 3, 1),
       (2, 8, 2),
       (3, 3, 2),
       (3, 2, 1),
       (3, 1, 1),
       (4, 5, 1);

CREATE TABLE step
(
    step_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_step VARCHAR(50)
);

INSERT INTO step (name_step)
VALUES ('Оплата'),
       ('Упаковка'),
       ('Транспортировка'),
       ('Доставка');

CREATE TABLE buy_step
(
    buy_step_id   INT PRIMARY KEY AUTO_INCREMENT,
    buy_id        int,
    step_id       INT,
    date_step_beg DATE,
    date_step_end DATE,
    FOREIGN KEY (buy_id) REFERENCES buy (buy_id) ON DELETE CASCADE,
    FOREIGN KEY (step_id) REFERENCES step (step_id) ON DELETE CASCADE
);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end)
VALUES (1, 1, '2020-02-20', '2020-02-20'),
       (1, 2, '2020-02-20', '2020-02-21'),
       (1, 3, '2020-02-22', '2020-03-07'),
       (1, 4, '2020-03-08', '2020-03-08'),
       (2, 1, '2020-02-28', '2020-02-28'),
       (2, 2, '2020-02-29', '2020-03-01'),
       (2, 3, '2020-03-02', Null),
       (2, 4, Null, Null),
       (3, 1, '2020-03-05', '2020-03-05'),
       (3, 2, '2020-03-05', '2020-03-06'),
       (3, 3, '2020-03-06', '2020-03-11'),
       (3, 4, '2020-03-12', Null),
       (4, 1, '2020-03-20', Null),
       (4, 2, Null, Null),
       (4, 3, Null, Null),
       (4, 4, Null, Null);
