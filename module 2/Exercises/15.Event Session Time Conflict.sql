CREATE DATABASE eventscheduler;
USE eventscheduler;
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200),
    start_time DATETIME,
    end_time DATETIME
);
INSERT INTO Sessions (event_id, title, start_time, end_time) VALUES

-- Event 1 (conflict exists)
(1, 'Intro AI', '2026-06-10 10:00:00', '2026-06-10 11:30:00'),
(1, 'ML Basics', '2026-06-10 11:00:00', '2026-06-10 12:00:00'),
(1, 'Deep Learning', '2026-06-10 12:30:00', '2026-06-10 13:30:00'),

-- Event 2 (conflict exists)
(2, 'Cloud Intro', '2026-06-11 09:00:00', '2026-06-11 10:30:00'),
(2, 'AWS Basics', '2026-06-11 10:00:00', '2026-06-11 11:00:00'),
(2, 'DevOps', '2026-06-11 11:30:00', '2026-06-11 12:30:00');
SELECT * FROM Sessions;
SELECT 
    s1.event_id,
    s1.session_id AS session_1,
    s1.title AS session_1_title,
    s2.session_id AS session_2,
    s2.title AS session_2_title,
    s1.start_time,
    s1.end_time,
    s2.start_time AS overlap_start,
    s2.end_time AS overlap_end
FROM Sessions s1
JOIN Sessions s2 
    ON s1.event_id = s2.event_id
    AND s1.session_id < s2.session_id
    AND s1.start_time < s2.end_time
    AND s1.end_time > s2.start_time
ORDER BY s1.event_id;
