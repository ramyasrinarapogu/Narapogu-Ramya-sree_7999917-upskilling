CREATE DATABASE eventanalytics;
USE eventanalytics;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
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
('AI Summit', 'Hyderabad', 'completed'),
('Cloud Expo', 'Bangalore', 'completed'),
('Startup Fest', 'Chennai', 'upcoming');
INSERT INTO Registrations (user_id, event_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 3);
INSERT INTO Feedback (user_id, event_id, rating, comments) VALUES
(1, 1, 5, 'Excellent'),
(2, 1, 4, 'Good'),
(3, 1, 5, 'Great'),

(4, 2, 3, 'Average'),
(5, 2, 4, 'Nice'),
(6, 2, 4, 'Good'),
(7, 2, 5, 'Excellent');
SELECT * FROM Events;
SELECT * FROM Registrations;
SELECT * FROM Feedback;
SELECT 
    e.event_id,
    e.title,

    COUNT(DISTINCT r.registration_id) AS total_registrations,
    ROUND(AVG(f.rating), 2) AS avg_rating

FROM Events e
LEFT JOIN Registrations r 
    ON e.event_id = r.event_id
LEFT JOIN Feedback f 
    ON e.event_id = f.event_id

WHERE e.status = 'completed'
GROUP BY e.event_id, e.title;
