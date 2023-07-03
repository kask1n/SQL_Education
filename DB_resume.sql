CREATE TABLE resume
(
    resume_id      INT PRIMARY KEY AUTO_INCREMENT,
    applicant      VARCHAR(60),
    specialisation VARCHAR(80),
    position       VARCHAR(50),
    min_salary     INT,
    experience     INT,
    date_birth     DATE
);
INSERT INTO resume(applicant, specialisation, position, min_salary, experience, date_birth)
VALUES ('Иванов М.С.', 'IT', 'web-программист', 50000, 2, '1998-12-15'),
       ('Петров Ф.С.', 'Строительство', 'инженер-строитель', 45000, 5, '1995-01-07'),
       ('Федоров П.Р.', 'Продажи', 'менеджер по продажам', 35000, 7, '1993-08-26'),
       ('Абрамова А.А.', 'Продажи', 'региональный менеджер', 90000, 4, '1992-09-23'),
       ('Самарин С.С.', 'Транспорт', 'логист-диспетчер', 30000, 0, '2001-07-18'),
       ('Туполев И.Д.', 'Строительство', 'инженер-строитель', 40000, 10, '1985-03-16'),
       ('Баранов П.В.', 'Юристы', 'адвокат', 60000, 5, '1982-02-24'),
       ('Шевцова А.Р.', 'Продажи', 'менеджер по продажам', 30000, 2, '1995-11-12'),
       ('Белых К.Д.', 'IT', 'Python программист', 100000, 5, '1991-12-09'),
       ('Садиев С.И.', 'IT', 'программист PHP и Питон', 90000, 6, '1982-11-07'),
       ('Астахов И.И.', 'Строительство', 'прораб', 100000, 15, '1976-01-30'),
       ('Борисов В.В.', 'Продажи', 'менеджер по продажам', 50000, 12, '1980-03-01'),
       ('Тощаков П.С.', 'Строительство', 'технолог', 50000, 15, '1979-04-25'),
       ('Солиева К.П.', 'Продажи', 'директор по продажам', 130000, 7, '1973-04-30'),
       ('Левченко А.Г.', 'IT', 'PHP разработчик', 110000, 9, '1967-12-27'),
       ('Хованец Г.П.', 'Строительство', 'прораб', 90000, 16, '1970-10-01'),
       ('Тихомиров Т.М.', 'Транспорт', 'экспедитор', 45000, 20, '1975-08-08'),
       ('Дворников М.А.', 'Транспорт', 'логист-диспетчер', 35000, 2, '1998-11-10'),
       ('Жидкова Р.Л.', 'Продажи', 'менеджер по продажам', 30000, 5, '1987-10-20'),
       ('Бондарев С.С.', 'IT', 'web-программист', 130000, 9, '1987-02-16'),
       ('Иванов П.А.', 'Продажи', 'директор по продажам', 140000, 11, '1979-04-24'),
       ('Прохоров А.Д.', 'IT', 'web-программист', 200000, 8, '1985-03-23'),
       ('Соболев А.И.', 'Транспорт', 'водитель', 35000, 15, '1984-03-30'),
       ('Ромашко Ф.Ю.', 'Продажи', 'продавец-консультант', 25000, 0, '2002-05-07'),
       ('Краско С.С.', 'IT', 'программист 1C', 85000, 3, '1997-09-02'),
       ('Паршина Г.И.', 'IT', 'программист C и Питон', 110000, 9, '1981-08-11'),
       ('Светлова С.Т.', 'Транспорт', 'водитель', 40000, 10, '1991-09-17'),
       ('Буянов П.Д.', 'Юристы', 'адвокат', 55000, 15, '1980-06-01'),
       ('Ульянов М.А.', 'Продажи', 'региональный менеджер', 130000, 11, '1979-06-19'),
       ('Тупикин К.Л.', 'IT', 'программист 1.7C', 140000, 12, '1981-07-03'),
       ('Ермоленко Г.С.', 'IT', 'программист C#', 90000, 6, '1993-12-09'),
       ('Сомов Я.Г.', 'IT', 'программист C++', 115000, 8, '1990-11-16'),
       ('Орлова Е.Р.', 'Строительство', 'head', 170000, 15, '1972-01-16'),
       ('Ларин В.П.', 'Строительство', 'инженер-строитель', 70000, 12, '1970-05-15');