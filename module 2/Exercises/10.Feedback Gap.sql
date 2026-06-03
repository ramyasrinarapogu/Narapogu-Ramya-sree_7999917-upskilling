CREATE DATABASE insighthub;
USE insighthub;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    city VARCHAR(100),
    status VARCHAR(20)
);
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT,
    comments TEXT
);
INSERT INTO Events (title, city, status) VALUES
('AI Summit', 'Hyderabad', 'upcoming'),
('Cloud Expo', 'Bangalore', 'upcoming'),
('Dev Meetup', 'Chennai', 'completed');
INSERT INTO Registrations (user_id, event_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);
INSERT INTO Feedback (user_id, event_id, rating, comments) VALUES
(4, 3, 5, 'Great event!');
SELECT * FROM Events;
SELECT * FROM Registrations;
SELECT * FROM Feedback;
SELECT 
    e.event_id,
    e.title,
    COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r 
    ON e.event_id = r.event_id
LEFT JOIN Feedback f 
    ON e.event_id = f.event_id
WHERE f.event_id IS NULL
GROUP BY e.event_id, e.title;