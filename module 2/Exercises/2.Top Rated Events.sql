CREATE DATABASE eventsphere;
USE eventsphere;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
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
INSERT INTO Users (full_name, email, city, registration_date) VALUES
('Arjun Reddy', 'arjun@example.com', 'Chennai', '2025-01-10'),
('Meera Nair', 'meera@example.com', 'Bangalore', '2025-01-12'),
('Kiran Rao', 'kiran@example.com', 'Chennai', '2025-01-15');
INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id) VALUES
('Cloud Tech Summit', 'Cloud computing event', 'Chennai', '2026-07-10 10:00:00', '2026-07-10 16:00:00', 'upcoming', 1),
('Startup Expo', 'Business networking event', 'Bangalore', '2026-07-15 09:00:00', '2026-07-15 18:00:00', 'upcoming', 2);
INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date) VALUES
-- Event 1 (10 feedbacks)
(1, 1, 5, 'Excellent event', '2026-07-11'),
(2, 1, 4, 'Very good', '2026-07-11'),
(3, 1, 5, 'Loved it', '2026-07-11'),
(1, 1, 4, 'Nice sessions', '2026-07-11'),
(2, 1, 5, 'Great speakers', '2026-07-11'),
(3, 1, 4, 'Informative', '2026-07-11'),
(1, 1, 5, 'Superb', '2026-07-11'),
(2, 1, 4, 'Well organized', '2026-07-11'),
(3, 1, 5, 'Amazing', '2026-07-11'),
(1, 1, 4, 'Good experience', '2026-07-11'),

-- Event 2 (10 feedbacks)
(2, 2, 3, 'Average', '2026-07-16'),
(3, 2, 4, 'Good event', '2026-07-16'),
(1, 2, 5, 'Very helpful', '2026-07-16'),
(2, 2, 4, 'Nice networking', '2026-07-16'),
(3, 2, 3, 'Okay', '2026-07-16'),
(1, 2, 4, 'Useful', '2026-07-16'),
(2, 2, 5, 'Great insights', '2026-07-16'),
(3, 2, 4, 'Well done', '2026-07-16'),
(1, 2, 5, 'Enjoyed it', '2026-07-16'),
(2, 2, 4, 'Good overall', '2026-07-16');
SELECT 
    e.event_id,
    e.title,
    e.city,
    AVG(f.rating) AS avg_rating,
    COUNT(f.feedback_id) AS total_feedbacks
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title, e.city
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;