--liquibase formatted sql

--changeset naklyshko:lab4_1
ALTER TABLE exam CHANGE COLUMN passport_number passport VARCHAR(255) NOT NULL;
--rollback ALTER TABLE exam CHANGE COLUMN passport passport_number VARCHAR(255) NOT NULL;

--changeset naklyshko:lab4_2
CREATE TABLE school(name VARCHAR(255) PRIMARY KEY, address VARCHAR(255), level TINYINT);
CREATE TABLE speciality(code VARCHAR(255) PRIMARY KEY, training_mode VARCHAR(255), training_period TINYINT);
CREATE TABLE subject(id SMALLINT PRIMARY KEY, name VARCHAR(255));
CREATE TABLE enrollee(passport VARCHAR(255) PRIMARY KEY, name VARCHAR(255));
--rollback DROP TABLE school, speciality, subject, enrollee;

--changeset naklyshko:lab4_3
CREATE TABLE school_specialities(
    school_name VARCHAR(255),
    speciality_code VARCHAR(255),
    capacity SMALLINT UNSIGNED,
    PRIMARY KEY (school_name, speciality_code),
    CONSTRAINT `school-school_specialities` FOREIGN KEY (school_name) REFERENCES school(name) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `speciality-school_specialities` FOREIGN KEY (speciality_code) REFERENCES speciality(code) ON DELETE RESTRICT ON UPDATE CASCADE
);
--rollback DROP TABLE school_specialities

--changeset naklyshko:lab4_4
CREATE TABLE school_enrollees(
    passport VARCHAR(255),
    school_name VARCHAR(255),
    speciality_code VARCHAR(255),
    PRIMARY KEY (passport, school_name, speciality_code),
    CONSTRAINT `enrollee-school_enrollees` FOREIGN KEY (passport) REFERENCES enrollee(passport) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `school_specialities-school_enrollees` FOREIGN KEY (school_name, speciality_code) REFERENCES school_specialities(school_name, speciality_code) ON DELETE RESTRICT ON UPDATE CASCADE
);
--rollback DROP TABLE school_enrollees

--changeset naklyshko:lab4_5
ALTER TABLE exam
  ADD CONSTRAINT `subject-exam` FOREIGN KEY (subject_id) REFERENCES subject(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `school_enrollees-exam` FOREIGN KEY (passport, school_name, speciality_code) REFERENCES school_enrollees(passport, school_name, speciality_code) ON DELETE CASCADE ON UPDATE CASCADE;
--rollback ALTER TABLE exam DROP FOREIGN KEY `school_enrollees-exam`, DROP FOREIGN KEY `subject-exam`

--changeset naklyshko:lab4_6
INSERT INTO school(name, address, level) VALUES
  ('СевГУ', '299053, г. Севастополь, ул. Университетская, 33', 4),
  ('ЧФ МГУ', '299000, г. Севастополь, ул. Героев Севастополя, 7', 4);

--changeset naklyshko:lab4_7
INSERT INTO speciality(code, training_mode, training_period) VALUES
  ('09.03.01', 'ОФО', 4), ('09.03.02', 'ОФО,ЗФО', 4), ('09.03.03', 'ОФО', 4),
  ('01.03.02', 'ОФО', 4), ('38.03.04', 'ОФО', 4);

--changeset naklyshko:lab4_8
INSERT INTO enrollee(passport, name) VALUES
  ('1234567890', 'Пупкин Василий Иванович'), ('1122334455', 'Громов Анатолий Сергеевич');

--changeset naklyshko:lab4_9
INSERT INTO subject(id, name) VALUES
  (1, 'Математика'), (2, 'Русский язык'), (3, 'АиП'), (4, 'Физика'), (5, 'ТБД');

--changeset naklyshko:lab4_10
INSERT INTO school_specialities(school_name, speciality_code, capacity) VALUES
  ('СевГУ', '09.03.01', 55), ('СевГУ', '09.03.02', 55), ('СевГУ', '09.03.03', 25),
  ('ЧФ МГУ', '01.03.02', 25), ('ЧФ МГУ', '38.03.04', 28);

--changeset naklyshko:lab4_11
INSERT INTO school_enrollees(passport, school_name, speciality_code) VALUES
  ('1234567890', 'СевГУ', '09.03.01'), ('1122334455', 'ЧФ МГУ', '01.03.02');

--changeset naklyshko:lab4_12
INSERT INTO exam(speciality_code, school_name, passport, subject_id, mark) VALUES
  ('09.03.01', 'СевГУ', '1234567890', 1, 90), ('01.03.02', 'ЧФ МГУ', '1122334455', 1, 85);
