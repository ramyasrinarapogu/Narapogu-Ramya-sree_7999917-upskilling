CREATE DATABASE feedbackrank;
USE feedbackrank;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT,
    comments TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Users (full_name, city) VALUES
('Aarav Sharma', 'Mumbai'),
('Neha Verma', 'Delhi'),
('Rohit Das', 'Pune'),
('Sneha Iyer', 'Chennai'),
('Kiran Rao', 'Bangalore'),
('Vikram Patel', 'Hyderabad');
INSERT INTO Feedback (user_id, event_id, rating, comments) VALUES
(1, 101, 5, 'Great'),
(1, 102, 4, 'Good'),

(2, 101, 3, 'Average'),

(3, 103, 5, 'Excellent'),
(3, 104, 4, 'Nice'),
(3, 105, 5, 'Super'),

(4, 106, 4, 'Good'),

(5, 107, 5, 'Amazing'),
(5, 108, 4, 'Nice'),
(5, 109, 3, 'Okay'),

(6, 110, 5, 'Perfect'),
(6, 111, 4, 'Good');
SELECT * FROM Users;
SELECT * FROM Feedback;
SELECT 
    u.user_id,
    u.full_name,
    COUNT(f.feedback_id) AS total_feedbacks
FROM Users u
JOIN Feedback f 
    ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_feedbacks DESC
LIMIT 5;