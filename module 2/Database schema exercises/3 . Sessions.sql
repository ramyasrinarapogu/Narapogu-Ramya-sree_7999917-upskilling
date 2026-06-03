USE event_portal;
show databases;
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
SHOW TABLES;
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time)
VALUES 
(1, 'AI Introduction', 'Dr. Ravi Kumar', '2026-06-10 10:00:00', '2026-06-10 11:00:00'),
(1, 'Web Development Basics', 'Anita Sharma', '2026-06-10 11:30:00', '2026-06-10 12:30:00'),
(2, 'Music Industry Talk', 'John Mathew', '2026-06-15 18:30:00', '2026-06-15 19:30:00');
SELECT * FROM Sessions;
SELECT 
    Users.full_name AS organizer,
    Events.title AS event_title,
    Sessions.title AS session_title,
    Sessions.speaker_name,
    Sessions.start_time
FROM Sessions
JOIN Events ON Sessions.event_id = Events.event_id
JOIN Users ON Events.organizer_id = Users.user_id;
