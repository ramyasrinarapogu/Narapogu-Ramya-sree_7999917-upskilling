CREATE DATABASE sessionmax;
USE sessionmax;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    city VARCHAR(100),
    status VARCHAR(20)
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
('Dev Conference', 'Chennai', 'completed');
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time) VALUES
(1, 'Intro AI', 'Dr. Mehta', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'ML Basics', 'Arjun', '2026-06-10 11:15:00', '2026-06-10 12:15:00'),
(1, 'Deep Learning', 'Sara', '2026-06-10 12:30:00', '2026-06-10 13:30:00'),

(2, 'Cloud Basics', 'Ravi', '2026-06-11 10:00:00', '2026-06-11 11:00:00'),
(2, 'AWS Deep Dive', 'Neha', '2026-06-11 11:15:00', '2026-06-11 12:15:00'),

(3, 'Dev Intro', 'John', '2026-06-12 10:00:00', '2026-06-12 11:00:00');
SELECT * FROM Events;
SELECT * FROM Sessions;
SELECT 
    event_id,
    COUNT(session_id) AS total_sessions
FROM Sessions
GROUP BY event_id;
SELECT MAX(session_count) AS max_sessions
FROM (
    SELECT COUNT(session_id) AS session_count
    FROM Sessions
    GROUP BY event_id
) AS temp;
SELECT 
    e.event_id,
    e.title,
    COUNT(s.session_id) AS total_sessions
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(s.session_id) = (
    SELECT MAX(session_count)
    FROM (
        SELECT COUNT(session_id) AS session_count
        FROM Sessions
        GROUP BY event_id
    ) AS temp
);
