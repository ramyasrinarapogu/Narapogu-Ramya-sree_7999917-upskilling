CREATE DATABASE eventpulse;
USE eventpulse;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Users (full_name, email, city) VALUES
('Ravi Teja', 'ravi@example.com', 'Hyderabad'),
('Sneha Reddy', 'sneha@example.com', 'Chennai'),
('Arjun Mehta', 'arjun@example.com', 'Bangalore');
INSERT INTO Events (title, city, start_date) VALUES
('AI Summit', 'Hyderabad', '2026-06-10 10:00:00'),
('Cloud Expo', 'Chennai', '2026-06-12 09:00:00');
INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date) VALUES
(1, 1, 5, 'Excellent event', '2026-06-11'),
(2, 1, 2, 'Not well organized', '2026-06-11'),
(3, 1, 1, 'Very poor experience', '2026-06-11'),
(2, 2, 4, 'Good event', '2026-06-13'),
(3, 2, 2, 'Could be better', '2026-06-13');
SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Feedback;
SELECT 
    u.full_name AS user_name,
    e.title AS event_name,
    f.rating,
    f.comments,
    f.feedback_date
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3
ORDER BY f.rating ASC;