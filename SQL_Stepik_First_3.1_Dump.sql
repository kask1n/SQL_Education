DROP SCHEMA IF EXISTS stepik_first_3_1;
CREATE SCHEMA stepik_first_3_1;
USE stepik_first_3_1;


CREATE TABLE subject
(
    subject_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_subject VARCHAR(30)
);

INSERT INTO subject (name_subject)
VALUES ('Основы SQL'),
       ('Основы баз данных'),
       ('Физика');


CREATE TABLE student
(
    student_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_student VARCHAR(50)
);

INSERT INTO student (name_student)
VALUES ('Баранов Павел'),
       ('Абрамова Катя'),
       ('Семенов Иван'),
       ('Яковлева Галина');


CREATE TABLE attempt
(
    attempt_id   INT PRIMARY KEY AUTO_INCREMENT,
    student_id   INT,
    subject_id   INT,
    date_attempt DATE,
    result       INT,
    FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id) ON DELETE CASCADE
);

INSERT INTO attempt (student_id, subject_id, date_attempt, result)
VALUES (1, 2, '2020-03-23', 67),
       (3, 1, '2020-03-23', 100),
       (4, 2, '2020-03-26', 0),
       (1, 1, '2020-04-15', 33),
       (3, 1, '2020-04-15', 67),
       (4, 2, '2020-04-21', 100),
       (3, 1, '2020-05-17', 33);


CREATE TABLE question
(
    question_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_question VARCHAR(100),
    subject_id    INT,
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id) ON DELETE CASCADE
);

INSERT INTO question(name_question, subject_id)
VALUES ('Запрос на выборку начинается с ключевого слова:', 1),
       ('Условие, по которому отбираются записи, задается после ключевого слова:', 1),
       ('Для сортировки используется:', 1),
       ('Какой запрос выбирает все записи из таблицы student:', 1),
       ('Для внутреннего соединения таблиц используется оператор:', 1),
       ('База данных - это:', 2),
       ('Отношение - это:', 2),
       ('Концептуальная модель используется для', 2),
       ('Какой тип данных не допустим в реляционной таблице?', 2);


CREATE TABLE answer
(
    answer_id   INT PRIMARY KEY AUTO_INCREMENT,
    name_answer VARCHAR(100),
    question_id INT,
    is_correct  BOOL,
    FOREIGN KEY (question_id) REFERENCES question (question_id) ON DELETE CASCADE
);

INSERT INTO answer (name_answer, question_id, is_correct)
VALUES ('UPDATE', 1, false),
       ('SELECT', 1, true),
       ('INSERT', 1, false),
       ('GROUP BY', 2, false),
       ('FROM', 2, false),
       ('WHERE', 2, true),
       ('SELECT', 2, false),
       ('SORT', 3, false),
       ('ORDER BY', 3, true),
       ('RANG BY', 3, false),
       ('SELECT * FROM student', 4, true),
       ('SELECT student', 4, false),
       ('INNER JOIN', 5, true),
       ('LEFT JOIN', 5, false),
       ('RIGHT JOIN', 5, false),
       ('CROSS JOIN', 5, false),
       ('совокупность данных, организованныхпо определенным правилам', 6, true),
       ('совокупность программ для хранения иобработки больших массивов информации', 6, false),
       ('строка', 7, false),
       ('столбец', 7, false),
       ('таблица', 7, true),
       ('обобщенное представление пользователей о данных', 8, true),
       ('описание представления данных в памяти компьютера', 8, false),
       ('база данных', 8, false),
       ('file', 9, true),
       ('INT', 9, false),
       ('VARCHAR', 9, false),
       ('DATE', 9, false);


CREATE TABLE testing
(
    testing_id  INT PRIMARY KEY AUTO_INCREMENT,
    attempt_id  INT,
    question_id INT,
    answer_id   INT,
    FOREIGN KEY (attempt_id) REFERENCES attempt (attempt_id) ON DELETE CASCADE
);

INSERT INTO testing (attempt_id, question_id, answer_id)
VALUES (1, 9, 25),
       (1, 7, 19),
       (1, 6, 17),
       (2, 3, 9),
       (2, 1, 2),
       (2, 4, 11),
       (3, 6, 18),
       (3, 8, 24),
       (3, 9, 28),
       (4, 1, 2),
       (4, 5, 16),
       (4, 3, 10),
       (5, 2, 6),
       (5, 1, 2),
       (5, 4, 12),
       (6, 6, 17),
       (6, 8, 22),
       (6, 7, 21),
       (7, 1, 3),
       (7, 4, 11),
       (7, 5, 16);
