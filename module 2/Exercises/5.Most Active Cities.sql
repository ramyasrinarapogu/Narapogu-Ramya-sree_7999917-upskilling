CREATE DATABASE citypulse;
USE citypulse;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);
INSERT INTO Users (full_name, email, city, registration_date) VALUES
('Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2025-01-01'),
('Riya Patel', 'riya@gmail.com', 'Mumbai', '2025-01-02'),
('Kabir Singh', 'kabir@gmail.com', 'Delhi', '2025-01-03'),
('Neha Verma', 'neha@gmail.com', 'Delhi', '2025-01-04'),
('Ishaan Roy', 'ishaan@gmail.com', 'Bangalore', '2025-01-05'),
('Meera Iyer', 'meera@gmail.com', 'Bangalore', '2025-01-06'),
('Aditya Nair', 'aditya@gmail.com', 'Chennai', '2025-01-07'),
('Sara Khan', 'sara@gmail.com', 'Chennai', '2025-01-08'),
('John Mathew', 'john@gmail.com', 'Kolkata', '2025-01-09'),
('Anjali Das', 'anjali@gmail.com', 'Kolkata', '2025-01-10'),
('Rohit Mehta', 'rohit@gmail.com', 'Hyderabad', '2025-01-11');
SELECT * FROM Users;
SELECT 
    city,
    COUNT(DISTINCT user_id) AS total_users
FROM Users
GROUP BY city
ORDER BY total_users DESC
LIMIT 5;
