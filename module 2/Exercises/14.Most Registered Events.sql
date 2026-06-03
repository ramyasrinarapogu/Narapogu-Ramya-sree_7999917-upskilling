CREATE DATABASE IF NOT EXISTS event_portal;

-- Select Database
USE event_portal;

-- Drop tables if they already exist
DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Events;

-- Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Events Table
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

-- Create Registrations Table
CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Insert Users
INSERT INTO Users (full_name, email) VALUES
('John', 'john@gmail.com'),
('Alice', 'alice@gmail.com'),
('Bob', 'bob@gmail.com'),
('David', 'david@gmail.com'),
('Emma', 'emma@gmail.com');

-- Insert Events
INSERT INTO Events (title, city) VALUES
('Music Festival', 'Mumbai'),
('Tech Summit', 'Bangalore'),
('Startup Expo', 'Hyderabad'),
('Food Carnival', 'Delhi'),
('Sports Meet', 'Chennai');

-- Insert Registrations
INSERT INTO Registrations (user_id, event_id) VALUES
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(1,1),
(2,1),
(3,1),
(4,1),
(1,3),
(2,3),
(3,3),
(1,4),
(2,4),
(1,5);

-- Top 3 Most Registered Events
SELECT
    e.event_id,
    e.title,
    COUNT(r.user_id) AS total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_registrations DESC
LIMIT 3;