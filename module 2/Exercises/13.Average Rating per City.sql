CREATE DATABASE cityinsight;
USE cityinsight;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    city VARCHAR(100),
    status VARCHAR(20)
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT,
    comments TEXT
);
INSERT INTO Events (title, city, status) VALUES
('AI Summit', 'Hyderabad', 'upcoming'),
('Cloud Expo', 'Bangalore', 'upcoming'),
('Dev Meet', 'Hyderabad', 'completed'),
('Startup Fest', 'Chennai', 'completed');
INSERT INTO Feedback (user_id, event_id, rating, comments) VALUES
(1, 1, 5, 'Excellent'),
(2, 1, 4, 'Very good'),
(3, 2, 3, 'Average'),
(4, 2, 4, 'Nice'),
(5, 3, 2, 'Bad experience'),
(6, 3, 3, 'Okay'),
(7, 4, 5, 'Great'),
(8, 4, 4, 'Good');
SELECT * FROM Events;
SELECT * FROM Feedback;
SELECT 
    e.city,
    ROUND(AVG(f.rating), 2) AS avg_rating
FROM Events e
JOIN Feedback f 
    ON e.event_id = f.event_id
GROUP BY e.city
ORDER BY avg_rating DESC;
