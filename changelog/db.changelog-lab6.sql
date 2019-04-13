--liquibase formatted sql

--changeset naklyshko:lab6_1
CREATE VIEW add_enrolle AS SELECT passport, name FROM enrollee WHERE passport > 999999999 WITH CHECK OPTION;

--changeset naklyshko:lab6_2
INSERT INTO add_enrolle(passport, name) VALUES ('1998873562', 'Пупкин Василий Иванович');

--changeset naklyshko:lab6_4
DROP VIEW add_enrolle;

--changeset naklyshko:lab6_5
--comment Имя и специальность абитуриента
CREATE OR REPLACE VIEW enrolle_speciality AS SELECT e.name AS name, se.speciality_code AS speciality_code FROM enrollee AS e JOIN school_enrollees AS se ON e.passport = se.passport;

--changeset naklyshko:lab6_6
CREATE UNIQUE INDEX `test_index` ON subject(name);

--changeset naklyshko:lab6_7
CREATE INDEX `sort_index` ON school_specialities(capacity);

--changeset naklyshko:lab6_8
CREATE INDEX `group_index` ON school(address);

--changeset naklyshko:lab6_10
ALTER TABLE subject DROP INDEX `test_index`;

--changeset naklyshko:lab6_11
ALTER TABLE school_specialities DROP INDEX `sort_index`;

--changeset naklyshko:lab6_12
ALTER TABLE school DROP INDEX `group_index`;

--#changeset naklyshko:lab6_3
--#INSERT INTO add_enrolle(passport, name) VALUES ('199887356', 'Сугров Петр Сергеевич');

--#changeset naklyshko:lab6_9
--#CREATE INDEX `complex_index` ON school_specialities(speciality_code, capacity);

--#changeset naklyshko:lab6_13
--#ALTER TABLE school_specialities DROP INDEX `complex_index`;