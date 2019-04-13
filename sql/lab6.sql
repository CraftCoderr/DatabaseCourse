# 1
SELECT * FROM subject WHERE name = 'Пупкин Василий Иванович';
# 2
SELECT * FROM school_specialities ORDER BY capacity;
# 3
SELECT address, COUNT(*) FROM school GROUP BY address;
# 4
SELECT * FROM school_specialities GROUP BY speciality_code ORDER BY capacity;