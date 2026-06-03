CREATE DATABASE eventflow;
USE eventflow;
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL
);
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time) VALUES
(1, 'AI Intro', 'Dr. Mehta', '2026-06-10 09:00:00', '2026-06-10 10:00:00'),
(1, 'Machine Learning', 'Anil Kumar', '2026-06-10 10:15:00', '2026-06-10 11:15:00'),
(1, 'Deep Learning', 'Sara Khan', '2026-06-10 11:30:00', '2026-06-10 12:30:00'),
(1, 'Cloud Basics', 'Ravi Sharma', '2026-06-10 13:00:00', '2026-06-10 14:00:00'),

(2, 'Marketing 101', 'John Doe', '2026-06-11 10:00:00', '2026-06-11 11:00:00'),
(2, 'Sales Strategy', 'Emma Watson', '2026-06-11 11:00:00', '2026-06-11 12:00:00'),
(2, 'Business Growth', 'Mark Lee', '2026-06-11 14:00:00', '2026-06-11 15:00:00');
SELECT * FROM Sessions;
SELECT 
    event_id,
    COUNT(*) AS peak_sessions
FROM Sessions
WHERE TIME(start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY event_id
ORDER BY peak_sessions DESC;
