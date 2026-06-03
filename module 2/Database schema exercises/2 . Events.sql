CREATE DATABASE event_portal;
USE event_portal;
show databases;
USE event_portal;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming', 'completed', 'cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);
INSERT INTO Users (full_name, email, city, registration_date)
VALUES 
('Rahul Kumar', 'rahul@gmail.com', 'Hyderabad', '2026-06-02'),
('Anjali Sharma', 'anjali@gmail.com', 'Vijayawada', '2026-06-01');
INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id)
VALUES 
('Tech Conference', 'AI and Web Development Event', 'Hyderabad', '2026-06-10 10:00:00', '2026-06-10 18:00:00', 'upcoming', 1),
('Music Fest', 'Live music concert', 'Vijayawada', '2026-06-15 18:00:00', '2026-06-15 23:00:00', 'upcoming', 2);
SELECT * FROM Users;
SELECT * FROM Events;
SELECT 
    Events.event_id,
    Events.title,
    Events.city,
    Events.status,
    Users.full_name AS organizer_name
FROM Events
JOIN Users ON Events.organizer_id = Users.user_id;
