create database if not exists Homework5;
use Homework5;

CREATE TABLE staff (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  post VARCHAR(50),
  salary INT
);


INSERT INTO staff (firstname, lastname, post, salary) VALUES
('John', 'Doe', 'Engineer', 80000),
('Jane', 'Doe', 'Manager', 90000),
('Bob', 'Smith', 'Developer', 85000),
('Alice', 'Johnson', 'Designer', 75000),
('Charlie', 'Brown', 'Tester', 70000);

SELECT * FROM staff;

CREATE TABLE academic_record (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  quartal INT,
  subject VARCHAR(50),
  grade INT
);

SELECT * FROM academic_record;

INSERT INTO academic_record (name, quartal, subject, grade) VALUES
('Петя', 1, 'физика', 5),
('Петя', 1, 'математика', 4),
('Петя', 2, 'физика', 3),
('Петя', 2, 'математика', 4),
('Петя', 3, 'физика', 4),
('Петя', 3, 'математика', 5),
('Вася', 1, 'физика', 2),
('Вася', 1, 'математика', 3),
('Вася', 2, 'физика', 4),
('Вася', 2, 'математика', 4),
('Маша', 3, 'математика', 5),
('Маша', 1, 'физика', 2),
('Маша', 1, 'математика', 3),
('Маша', 2, 'физика', 4),
('Маша', 2, 'математика', 4),
('Петя', 4, 'физика', 2);



-- Получить информацию об оценках Пети по физике по четвертям:

-- 1. текущая успеваемость

select
name, quartal, subject, grade,
ROW_NUMBER() OVER(PARTITION BY subject ORDER BY grade desc) AS 'Row_number',
ROW_NUMBER() OVER(PARTITION BY subject ORDER BY quartal) AS 'Row_number2'
from academic_record
where subject = 'физика' and name = 'Петя';


-- 2. оценка в следующей четверти
-- 3. оценка в предыдущей четверти

SELECT
name, quartal as 'Четверть', grade as 'Оценка',
LAG(grade) OVER() AS 'Предыдущая четверть',
LEAD(grade) OVER() AS 'Следующая четверть'
FROM academic_record
where subject = 'физика' and name = 'Петя';

