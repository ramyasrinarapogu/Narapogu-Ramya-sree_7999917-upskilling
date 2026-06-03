USE event_portal;
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
SHOW TABLES;
INSERT INTO Registrations (user_id, event_id, registration_date)
VALUES 
(1, 1, '2026-06-01'),
(2, 1, '2026-06-02'),
(2, 2, '2026-06-03');
SELECT * FROM Registrations;
SELECT 
    Users.full_name,
    Users.email,
    Events.title AS event_name,
    Registrations.registration_date
FROM Registrations
JOIN Users ON Registrations.user_id = Users.user_id
JOIN Events ON Registrations.event_id = Events.event_id;