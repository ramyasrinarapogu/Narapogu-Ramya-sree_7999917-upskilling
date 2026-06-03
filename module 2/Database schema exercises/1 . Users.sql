CREATE DATABASE ansi_sql_exercises;
USE ansi_sql_exercises;
show databases;
USE ansi_sql_exercises;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);
SHOW TABLES;
INSERT INTO Users (full_name, email, city, registration_date)
VALUES 
('Rahul Kumar', 'rahul@gmail.com', 'Hyderabad', '2026-06-02'),
('Anjali Sharma', 'anjali@gmail.com', 'Vijayawada', '2026-06-01'),
('Sita Devi', 'sita@gmail.com', 'Guntur', '2026-06-01');
SELECT * FROM Users;
