CREATE DATABASE eventstream;
USE eventstream;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL
);
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200),
    speaker_name VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Events (title, city, status) VALUES
('AI Summit', 'Hyderabad', 'upcoming'),
('Cloud Expo', 'Bangalore', 'upcoming'),
('Marketing Meetup', 'Chennai', 'completed');
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time) VALUES
(1, 'Intro to AI', 'Dr. Mehta', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'ML Basics', 'Arjun', '2026-06-10 11:15:00', '2026-06-10 12:15:00'),
(2, 'Cloud 101', 'Sara', '2026-06-12 10:00:00', '2026-06-12 11:00:00'),
(2, 'AWS Deep Dive', 'Ravi', '2026-06-12 11:15:00', '2026-06-12 12:15:00'),
(2, 'DevOps Intro', 'Neha', '2026-06-12 13:00:00', '2026-06-12 14:00:00'),
(3, 'Marketing Basics', 'John', '2026-05-01 10:00:00', '2026-05-01 11:00:00');
SELECT * FROM Events;
SELECT * FROM Sessions;
SELECT 
    e.event_id,
    e.title,
    e.city,
    COUNT(s.session_id) AS total_sessions
FROM Events e
LEFT JOIN Sessions s 
    ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id, e.title, e.city
ORDER BY total_sessions DESC;