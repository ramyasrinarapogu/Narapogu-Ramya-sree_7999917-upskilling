CREATE DATABASE organizerhub;
USE organizerhub;
CREATE TABLE Organizers (
    organizer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    organizer_id INT,
    city VARCHAR(100),
    status ENUM('upcoming','completed','cancelled'),
    FOREIGN KEY (organizer_id) REFERENCES Organizers(organizer_id)
);
INSERT INTO Organizers (name, email, city) VALUES
('Raj Malhotra', 'raj@event.com', 'Delhi'),
('Priya Nair', 'priya@event.com', 'Bangalore'),
('Karan Mehta', 'karan@event.com', 'Hyderabad');
INSERT INTO Events (title, organizer_id, city, status) VALUES
('Tech Summit', 1, 'Delhi', 'upcoming'),
('AI Conference', 1, 'Delhi', 'completed'),
('Startup Expo', 1, 'Delhi', 'cancelled'),

('Cloud Meetup', 2, 'Bangalore', 'upcoming'),
('Dev Summit', 2, 'Bangalore', 'completed'),

('Cyber Security Talk', 3, 'Hyderabad', 'upcoming');
SELECT * FROM Organizers;
SELECT * FROM Events;
SELECT 
    o.organizer_id,
    o.name,

    COUNT(e.event_id) AS total_events,

    SUM(CASE WHEN e.status = 'upcoming' THEN 1 ELSE 0 END) AS upcoming_events,
    SUM(CASE WHEN e.status = 'completed' THEN 1 ELSE 0 END) AS completed_events,
    SUM(CASE WHEN e.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_events

FROM Organizers o
LEFT JOIN Events e 
    ON o.organizer_id = e.organizer_id

GROUP BY o.organizer_id, o.name
ORDER BY total_events DESC;
