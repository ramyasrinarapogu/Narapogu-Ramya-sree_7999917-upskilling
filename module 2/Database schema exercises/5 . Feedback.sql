USE event_portal;
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
SHOW TABLES;
INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date)
VALUES 
(1, 1, 5, 'Excellent event, very informative!', '2026-06-10'),
(2, 1, 4, 'Good event but timing can improve.', '2026-06-10'),
(2, 2, 5, 'Amazing music experience!', '2026-06-16');
SELECT * FROM Feedback;
SELECT 
    Users.full_name,
    Events.title AS event_name,
    Feedback.rating,
    Feedback.comments,
    Feedback.feedback_date
FROM Feedback
JOIN Users ON Feedback.user_id = Users.user_id
JOIN Events ON Feedback.event_id = Events.event_id;
