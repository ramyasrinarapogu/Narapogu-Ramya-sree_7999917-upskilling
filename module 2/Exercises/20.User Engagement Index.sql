CREATE DATABASE engagementhub;
USE engagementhub;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    city VARCHAR(100)
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
INSERT INTO Users (full_name, city) VALUES
('Rahul Kumar', 'Hyderabad'),
('Anjali Sharma', 'Vijayawada'),
('Vikram Rao', 'Chennai'),
('Sneha Iyer', 'Bangalore');
INSERT INTO Registrations (user_id, event_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(3, 104);
INSERT INTO Feedback (user_id, event_id, rating, comments) VALUES
(1, 101, 5, 'Great'),
(1, 102, 4, 'Good'),
(2, 101, 3, 'Average'),
(3, 103, 5, 'Excellent');
SELECT * FROM Users;
SELECT * FROM Registrations;
SELECT * FROM Feedback;
SELECT 
    u.user_id,
    u.full_name,

    COUNT(DISTINCT r.event_id) AS events_attended,
    COUNT(DISTINCT f.feedback_id) AS feedback_count

FROM Users u
LEFT JOIN Registrations r 
    ON u.user_id = r.user_id

LEFT JOIN Feedback f 
    ON u.user_id = f.user_id

GROUP BY u.user_id, u.full_name
ORDER BY events_attended DESC;