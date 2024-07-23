WITH get_employees (position, applicant, Премия, Выходной_день) AS
         (SELECT position,
                 applicant,
                 (experience + 1) * 1000,
                 CASE
                     WHEN WEEKDAY(DATE_ADD(date_birth, INTERVAL 2022 - YEAR(date_birth) YEAR)) = 5
                         THEN DATE_ADD(DATE_ADD(date_birth, INTERVAL 2022 - YEAR(date_birth) YEAR), INTERVAL 2 DAY)
                     WHEN WEEKDAY(DATE_ADD(date_birth, INTERVAL 2022 - YEAR(date_birth) YEAR)) = 6
                         THEN DATE_ADD(DATE_ADD(date_birth, INTERVAL 2022 - YEAR(date_birth) YEAR), INTERVAL 1 DAY)
                     ELSE DATE_ADD(date_birth, INTERVAL 2022 - YEAR(date_birth) YEAR)
                     END
          FROM resume
          WHERE specialisation = 'Продажи'
            AND applicant NOT REGEXP '[рРpP]+'),

     get_totals (bonuses, days_off) AS (SELECT SUM(Премия), COUNT(*)
                                        FROM get_employees)

SELECT position, applicant, Премия, Выходной_день
FROM get_employees

UNION

SELECT 'Итого',
       '',
       bonuses,
       CASE
           WHEN days_off = 1 THEN CONCAT(days_off, ' день')
           WHEN days_off BETWEEN 2 AND 4 THEN CONCAT(days_off, ' дня')
           ELSE CONCAT(days_off, ' дней')
           END
FROM get_employees,
     get_totals;
