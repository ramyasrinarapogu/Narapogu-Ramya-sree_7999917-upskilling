CREATE DATABASE userpulse;
USE userpulse;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100),
    registration_date DATE NOT NULL
);
INSERT INTO Users (full_name, email, city, registration_date) VALUES
('Aarav Mehta', 'aarav@example.com', 'Mumbai', CURDATE() - INTERVAL 1 DAY),
('Neha Sharma', 'neha@example.com', 'Delhi', CURDATE() - INTERVAL 1 DAY),
('Rohit Singh', 'rohit@example.com', 'Pune', CURDATE() - INTERVAL 2 DAY),
('Pooja Verma', 'pooja@example.com', 'Mumbai', CURDATE() - INTERVAL 3 DAY),
('Kiran Rao', 'kiran@example.com', 'Chennai', CURDATE() - INTERVAL 4 DAY),
('Sneha Iyer', 'sneha@example.com', 'Bangalore', CURDATE() - INTERVAL 5 DAY),
('Arjun Nair', 'arjun@example.com', 'Kochi', CURDATE() - INTERVAL 6 DAY),
('Old User', 'old@example.com', 'Delhi', CURDATE() - INTERVAL 20 DAY);
SELECT * FROM Users;
SELECT 
    registration_date,
    COUNT(user_id) AS new_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date
ORDER BY registration_date ASC;
