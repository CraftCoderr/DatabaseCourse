# Запросы с нарушение целостности
INSERT INTO school(name, address, level) VALUES ('СевГУ', '12355, ул. Гоголя, 7', 4);
INSERT INTO speciality(code, training_mode, training_period) VALUES ('09.03.01', 'ЗФО', 4);
INSERT INTO enrollee(passport, name) VALUES ('1234567890', 'Васин Петр Сергеевич');
INSERT INTO subject(id, name) VALUES (1, 'ВМ');
INSERT INTO school_specialities(school_name, speciality_code, capacity) VALUES ('СевГУ', '09.03.01', 45);
INSERT INTO school_enrollees(passport, school_name, speciality_code) VALUES ('1234567890', 'СевГУ', '09.03.01');
INSERT INTO exam(speciality_code, school_name, passport, subject_id, mark) VALUES ('09.03.01', 'СевГУ', '1234567890', 1, 84);
INSERT INTO school_specialities(school_name, speciality_code, capacity) VALUES ('СевГУ', '09.03.07', 40);
INSERT INTO school_enrollees(passport, school_name, speciality_code) VALUES ('1111111111', 'СевГУ', '09.03.01');
INSERT INTO exam(speciality_code, school_name, passport, subject_id, mark) VALUES ('09.03.01', 'СевГУ', '1122334455', 1, 84);
