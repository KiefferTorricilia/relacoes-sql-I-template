-- Active: 1680560728168@@127.0.0.1@3306


CREATE TABLE phones (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM phones;

SELECT * FROM users;

INSERT INTO users (id, name, email, password)
VALUES
    ("1234", "Kieffer", "kieffer.torricilia@gmail.com", "123456"),
    ("2345", "Stephany", "stephany.torricilia@gmail.com", "123456");

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ("1", "(19) 991722887", "1234"),
    ("2", "(19) 9922722887", "1234"),
    ("3", "(34) 991722887", "2345");

SELECT * FROM phones
INNER JOIN users
ON phones.user_id = users.id;

CREATE TABLE licenses(
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    register_number TEXT NOT NULL,
    category TEXT NOT NULL
);

DROP TABLE licenses;

CREATE TABLE drivers(
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

DROP TABLE drivers;

INSERT INTO drivers (id, name, email, password, license_id)
VALUES 
("32124", "Rogerinho", "rogerinhodoingá@email.com", "123456", "412412412412"),
("321324", "Renan", "renandasilva@email.com",  "123456","1484811616151"),
("124341", "Maurilio", "mauriliodosanjos@email.com", "123456", "848116.49484"),
("57612", "Julinho", "julinhodavan@email.com",  "123456","818616161611");

INSERT INTO licenses (id, register_number, category)
VALUES 
("412412412412", "3123123", "B" ),
("1484811616151", "32143123", "B" ),
("848116.49484", "675676", "B"),
("818616161611", "3143253", "B");

SELECT drivers.id AS DriverId, name, email, register_number, category FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

CREATE TABLE university(
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE students(
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    university_id TEXT NOT NULL,
    FOREIGN KEY (university_id) REFERENCES university(id)
);

DROP TABLE students;

DROP TABLE university;

INSERT INTO university(id, name)
VALUES
    ("1", "Descomplica"),
    ("2", "Puc-Campinas"),
    ("3", "USP");



INSERT INTO students(id, name, university_id)
VALUES
    ("1", "Kieffer", "1"),
    ("3", "Stephany", "3"),
    ("2", "Raissa", "2");

SELECT * FROM university
INNER JOIN students
ON university.id = students.university_id

-- Práticas