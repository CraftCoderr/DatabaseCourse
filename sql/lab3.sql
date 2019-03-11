# 1 Все записи таблицы
SELECT * FROM exam;
# 2 Названия вузов, в которых есть отличные оценки по экзаменам
SELECT DISTINCT school_name FROM exam WHERE mark > 90;
# 3 Результаты всех экзаменов ВУЗа СевГУ
SELECT * FROM exam WHERE school_name = 'СевГУ';
# 4 Результаты экзаменов направления 09.03.02 ВУЗа СевГУ
SELECT * FROM exam WHERE school_name = 'СевГУ' AND speciality_code = '09.03.02';
# 5 Результаты экзаменов с отличной оценкой студентов ВУЗов СевГУ и КФУ
SELECT * FROM exam WHERE school_name IN ('СевГУ', 'КФУ') AND mark BETWEEN 90 AND 100;
# 6 Результаты экзаменов с не отличной оценкой студентов ВУЗов кроме МГУ и КФУ
SELECT * FROM exam WHERE school_name NOT IN ('ЧФ МГУ', 'КФУ') AND mark NOT BETWEEN 90 AND 100;
# 7 Средняя оценка по всем экзаменам по специальности 09.03.01
SELECT AVG(mark) FROM exam WHERE speciality_code = '09.03.01';
# 8 Количество экзаменов, сданных на отлично
SELECT COUNT(*) FROM exam WHERE mark >= 90;
# 9 Квадраты значений всех оценок по экзаменам
SELECT mark*mark FROM exam;
# 10 Максимальный квадрат значения оценки по экзамену
SELECT MAX(mark*mark) FROM exam;
# 11 Средняя оценка по каждой специальности
SELECT speciality_code, AVG(mark) FROM exam GROUP BY speciality_code;
# 12 Коды специальности, студенты которых имеют оценки по экзаменам не меньше 80
SELECT speciality_code FROM exam GROUP BY speciality_code HAVING MIN(mark) > 80;
# 13 Средние оценки за экзамены студентов СевГУ по специальностям, отсортированные по возрастанию
SELECT speciality_code, AVG(mark) AS am FROM exam GROUP BY speciality_code ORDER BY am;