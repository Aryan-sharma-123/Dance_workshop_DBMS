drop table payments;
drop table participants;
drop table artists;
drop table dance_styles;
drop table dance_academies;
drop table managers;
drop table locations;





CREATE TABLE locations (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE managers (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20)
);

CREATE TABLE dance_academies (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location_id INT,
  manager_id INT,
  FOREIGN KEY (location_id) REFERENCES locations(id) on delete  cascade,
  FOREIGN KEY (manager_id) REFERENCES managers(id) on delete cascade
);

CREATE TABLE dance_styles (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE artists (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  style_id INT,
  FOREIGN KEY (style_id) REFERENCES dance_styles(id) on delete cascade
);

CREATE TABLE participants (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  style_id INT,
  artist_id INT,
  FOREIGN KEY (style_id) REFERENCES dance_styles(id) on delete  cascade,
  FOREIGN KEY (artist_id) REFERENCES artists(id) on delete cascade
);

CREATE TABLE payments (
  id INT PRIMARY KEY,
  participant_id INT,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date DATE NOT NULL,
  FOREIGN KEY (participant_id) REFERENCES participants(id) on delete cascade
);
