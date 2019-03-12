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