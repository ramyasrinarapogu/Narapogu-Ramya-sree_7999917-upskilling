CREATE DATABASE eventintegrity;
USE eventintegrity;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    city VARCHAR(100),
    status VARCHAR(20)
);
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200),
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Events (title, city, status) VALUES
('AI Summit', 'Hyderabad', 'upcoming'),
('Cloud Expo', 'Bangalore', 'upcoming'),
('Dev Conference', 'Chennai', 'completed'),
('Startup Fest', 'Mumbai', 'upcoming');
INSERT INTO Sessions (event_id, title, start_time, end_time) VALUES
(1, 'Intro AI', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'ML Basics', '2026-06-10 11:15:00', '2026-06-10 12:15:00'),

(2, 'Cloud Basics', '2026-06-11 10:00:00', '2026-06-11 11:00:00'),

(3, 'Dev Intro', '2026-06-12 10:00:00', '2026-06-12 11:00:00');
SELECT * FROM Events;
SELECT * FROM Sessions;
SELECT 
    e.event_id,
    e.title,
    e.city,
    e.status
FROM Events e
LEFT JOIN Sessions s 
    ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
