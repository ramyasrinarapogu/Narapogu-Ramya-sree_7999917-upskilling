CREATE DATABASE event_portal;
USE event_portal;
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
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Users (full_name, email, city, registration_date) VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05');
INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id) VALUES
('Tech Meetup', 'AI Event', 'New York', '2026-06-10 10:00:00', '2026-06-10 16:00:00', 'upcoming', 1),
('Music Fest', 'Live show', 'Los Angeles', '2026-06-15 18:00:00', '2026-06-15 22:00:00', 'upcoming', 2);

INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 1, '2026-06-01'),
(2, 2, '2026-06-02');
SELECT 
    u.full_name,
    u.city,
    e.title AS event_name,
    e.start_date,
    e.status
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
  AND u.city = e.city
ORDER BY e.start_date ASC;
SELECT * FROM Registrations;
DELETE FROM Registrations;
INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 1, '2026-06-01'),
(2, 2, '2026-06-02');
SELECT DISTINCT
    u.full_name,
    u.city,
    e.title AS event_name,
    e.start_date,
    e.status
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
  AND u.city = e.city
ORDER BY e.start_date ASC;
