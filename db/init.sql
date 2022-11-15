CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT, DELETE ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  login VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS products (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  price INTEGER,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS orders (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  totalprice INTEGER,
  PRIMARY KEY (ID)
);

INSERT INTO users (login, password)
SELECT * FROM (SELECT 'grisha', '{SHA}QL0AFWMIX8NRZTKeof9cXsvbvu8=') AS tmp
WHERE NOT EXISTS (
    SELECT login FROM users WHERE login='grisha' AND password='123'
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Monopoly', 3999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Monopoly' AND price = 3999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'UNO', 499) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'UNO' AND price = 499
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Jenga', 999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Jenga' AND price = 999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Manchkin', 1299) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Manchkin' AND price = 1299
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Carcassonne', 2799) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Carcassonne' AND price = 2799
) LIMIT 1;

INSERT INTO orders (name,  totalprice)
SELECT * FROM (SELECT 'Gregory', 10000) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM orders WHERE name = 'Gregory' AND  totalprice = 10000
) LIMIT 1;

INSERT INTO orders (name,  totalprice)
SELECT * FROM (SELECT 'Andrew', 7777) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM orders WHERE name = 'Andrew' AND  totalprice = 7777
) LIMIT 1;

CREATE TABLE IF NOT EXISTS files (
     ID INT(11) NOT NULL  AUTO_INCREMENT,
     content LONGBLOB NOT NULL,
     author VARCHAR(32) NOT NULL,
     title VARCHAR(256) NOT NULL,
     `type` VARCHAR(256) NOT NULL,
     PRIMARY KEY (ID)
);