CREATE DATABASE speakerinsight;
USE speakerinsight;
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200),
    speaker_name VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME
);
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time) VALUES
(1, 'Intro to AI', 'Dr. Mehta', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'Machine Learning', 'Dr. Mehta', '2026-06-10 11:15:00', '2026-06-10 12:15:00'),
(1, 'Deep Learning', 'Sara Khan', '2026-06-10 12:30:00', '2026-06-10 13:30:00'),

(2, 'Cloud Basics', 'Ravi Sharma', '2026-06-11 10:00:00', '2026-06-11 11:00:00'),
(2, 'AWS Deep Dive', 'Ravi Sharma', '2026-06-11 11:15:00', '2026-06-11 12:15:00'),
(2, 'DevOps Intro', 'Neha Verma', '2026-06-11 12:30:00', '2026-06-11 13:30:00'),

(3, 'Cyber Security', 'Arjun Patel', '2026-06-12 10:00:00', '2026-06-12 11:00:00');
SELECT * FROM Sessions;
SELECT 
    speaker_name,
    COUNT(session_id) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(session_id) > 1
ORDER BY total_sessions DESC;
