CREATE DATABASE sessionanalytics;
USE sessionanalytics;
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200),
    start_time DATETIME,
    end_time DATETIME
);
INSERT INTO Sessions (event_id, title, start_time, end_time) VALUES
(1, 'Intro AI', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'ML Basics', '2026-06-10 11:15:00', '2026-06-10 12:45:00'),
(1, 'Deep Learning', '2026-06-10 13:00:00', '2026-06-10 14:30:00'),

(2, 'Cloud Intro', '2026-06-11 09:00:00', '2026-06-11 10:30:00'),
(2, 'AWS Deep Dive', '2026-06-11 10:45:00', '2026-06-11 12:15:00'),

(3, 'Dev Basics', '2026-06-12 10:00:00', '2026-06-12 11:00:00');
SELECT * FROM Sessions;
SELECT 
    event_id,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)), 2) AS avg_session_duration_minutes
FROM Sessions
GROUP BY event_id
ORDER BY event_id;