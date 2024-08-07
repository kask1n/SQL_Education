DROP SCHEMA IF EXISTS stepik_advanced_3_1;
CREATE SCHEMA stepik_advanced_3_1;
USE stepik_advanced_3_1;


CREATE TABLE book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   decimal(8, 2),
    amount  INT
);

INSERT INTO book (title, author, price, amount)
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 5),
       ('Идиот', 'Достоевский Ф.М.', 460, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 3),
       ('Игрок', 'Достоевский Ф.М.', 480.50, 10),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15),
       ('Таинственный остров', 'Жюль Верн', 169.99, 0),
       ('Пуаро ведет следствие', 'Агата Кристи', 272.50, 2),
       ('Евгений Онегин', 'Пушкин А.С.', 200.11, 8),
       ('Бородино', 'Лермонтов М.Ю.', 316.55, 10),
       ('Дубровский', 'Пушкин А.С.', 114.99, 7),
       ('Собачье сердце', 'Булгаков М.А.', 380.90, 6),
       ('Вокруг света за 80 дней', 'Жюль Верн', 201.01, 15),
       ('Смерть на Ниле', 'Агата Кристи', 250.12, 18),
       ('Убийства по алфавиту', 'Агата Кристи', 231.70, 9),
       ('Загадочное происшествие', 'Агата Кристи', 260.99, 15),
       ('Капитанская дочка', 'Пушкин А.С.', 199.99, 5),
       ('Этюд в багровых тонах', 'Дойл Артур Конан', 215.00, 3),
       ('Приключения Шерлока Холмса', 'Дойл Артур Конан', 590.50, 11),
       ('Записки о Шерлоке Холмсе', 'Дойл Артур Конан', 470.20, 14),
       ('Затерянный мир', 'Дойл Артур Конан', 400.00, 3),
       ('Стихи', 'Лермонтов М.Ю.', 550.60, 6),
       ('Поэмы', 'Лермонтов М.Ю.', 202.40, 8),
       ('Герой нашего времени', 'Лермонтов М.Ю.', 479.99, 2),
       ('Стихи', 'Пушкин А.С.', 600.50, 5),
       ('Слово милой', 'Пушкин А.С.', 120.30, 12),
       ('Поэмы', 'Пушкин А.С.', 630.50, 7),
       ('Скрюченный домишко', 'Агата Кристи', 150.01, 13);
