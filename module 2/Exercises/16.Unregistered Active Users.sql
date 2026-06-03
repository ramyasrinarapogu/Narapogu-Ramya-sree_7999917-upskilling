CREATE DATABASE useractivity;
USE useractivity;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100),
    created_at DATE NOT NULL
);
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Users (full_name, email, city, created_at) VALUES
('Aarav Sharma', 'aarav@gmail.com', 'Mumbai', CURDATE() - INTERVAL 5 DAY),
('Neha Verma', 'neha@gmail.com', 'Delhi', CURDATE() - INTERVAL 10 DAY),
('Rohit Das', 'rohit@gmail.com', 'Pune', CURDATE() - INTERVAL 15 DAY),
('Sneha Iyer', 'sneha@gmail.com', 'Chennai', CURDATE() - INTERVAL 40 DAY),
('Kiran Rao', 'kiran@gmail.com', 'Bangalore', CURDATE() - INTERVAL 2 DAY);
INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(2, 101, CURDATE() - INTERVAL 5 DAY),
(4, 102, CURDATE() - INTERVAL 30 DAY);
SELECT * FROM Users;
SELECT * FROM Registrations;
SELECT 
    u.user_id,
    u.full_name,
    u.email,
    u.city,
    u.created_at
FROM Users u
LEFT JOIN Registrations r 
    ON u.user_id = r.user_id
WHERE 
    u.created_at >= CURDATE() - INTERVAL 30 DAY
    AND r.user_id IS NULL;
    