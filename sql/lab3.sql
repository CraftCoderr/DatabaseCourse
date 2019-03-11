# Все записи таблицы
SELECT * FROM exam;
# Названия вузов, в которых есть отличные оценки по экзаменам
SELECT DISTINCT school_name FROM exam WHERE mark > 90;
# Результаты всех экзаменов ВУЗа СевГУ
SELECT * FROM exam WHERE school_name = 'СевГУ';
# Результаты экзаменов направления 09.03.02 ВУЗа СевГУ
SELECT * FROM exam WHERE school_name = 'СевГУ' AND speciality_code = '09.03.02';
# Результаты экзаменов с отличной оценкой студентов ВУЗов СевГУ и КФУ
SELECT * FROM exam WHERE school_name IN ('СевГУ', 'КФУ') AND mark BETWEEN 90 AND 100;
# Результаты экзаменов с не отличной оценкой студентов ВУЗов кроме МГУ и КФУ
SELECT * FROM exam WHERE school_name NOT IN ('МГУ', 'КФУ') AND mark NOT BETWEEN 90 AND 100;
# Средняя оценка по всем экзаменам по специальности 09.03.01
SELECT AVG(mark) FROM exam WHERE speciality_code = '09.03.01';
# Количество экзаменов, сданных на отлично
SELECT COUNT(*) FROM exam WHERE mark >= 90;
# Квадраты значений всех оценок по экзаменам
SELECT mark*mark FROM exam;
# Максимальный квадрат значения оценки по экзамену
SELECT MAX(mark*mark) FROM exam;
# Средняя оценка по каждой специальности
SELECT AVG(mark) FROM exam GROUP BY speciality_code;
# Коды специальности, студенты которых имеют оценки по экзаменам не меньше 80
SELECT speciality_code FROM exam GROUP BY speciality_code HAVING MIN(mark) > 80;
# Средние оценки за экзамены студентов СевГУ по специальностям, отсортированные по возрастанию
SELECT speciality_code, AVG(mark) AS am FROM exam GROUP BY speciality_code ORDER BY am;