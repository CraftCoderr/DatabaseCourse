# Добавление данных
INSERT INTO school(name, address, level) VALUES
  ('СКТ', '299007, г. Севастополь, улица Кожанова, 2', 3),
  ('СМК', '299045, г. Севастополь, улица Репина, 3', 3);
INSERT INTO enrollee(passport, name) VALUES
  ('1122777455', 'Громов Анатолий Сергеевич'), ('2415124446', 'Фокин Андрей Васильевич');
INSERT INTO speciality(code, training_mode, training_period) VALUES
  ('44.03.01', 'ОФО', 3), ('44.03.02', 'ОФО', 3);
INSERT INTO school_specialities(school_name, speciality_code, capacity) VALUES
  ('СКТ', '44.03.01', 10), ('СМК', '09.03.01', 15);
INSERT INTO school_enrollees(passport, school_name, speciality_code) VALUES
  ('1122777455', 'СКТ', '44.03.01'), ('2415124446', 'СМК', '09.03.01');
INSERT INTO exam(speciality_code, school_name, passport, subject_id, mark) VALUES
  ('09.03.01', 'СевГУ', '1234567890', 2, 78),
  ('09.03.01', 'СевГУ', '1234567890', 3, 80),
  ('09.03.01', 'СевГУ', '1234567890', 4, 86),
  ('01.03.02', 'ЧФ МГУ', '1122334455', 2, 85),
  ('01.03.02', 'ЧФ МГУ', '1122334455', 3, 85),
  ('01.03.02', 'ЧФ МГУ', '1122334455', 4, 85);
# 1 Фамилии студентов, обучающихся в ВУЗах с аккредитацией 4 уровня
SELECT e.name FROM enrollee AS e JOIN school_enrollees AS se ON e.passport = se.passport WHERE se.school_name IN (SELECT name FROM school WHERE level = 4);
# 2 Названия предметов, средний бал по которым больше 85
SELECT name FROM subject WHERE id IN (SELECT subject_id FROM exam GROUP BY subject_id HAVING AVG(mark) > 85);
# 3 Вывести название ВУЗов, осуществляющих подготовку по специальности "компьютерные сети"
SELECT school_name FROM school_specialities WHERE speciality_code = '09.03.01';
# 4 Вывести ФИО студентов, которые не сдали ни одного экзамена
SELECT passport, name FROM enrollee WHERE NOT EXISTS (SELECT * FROM exam WHERE exam.passport = enrollee.passport);
# 5 Вывести название специальности с минимальным сроком обучения
SELECT code FROM speciality WHERE training_period = (SELECT MIN(training_period) FROM speciality);