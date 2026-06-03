CREATE DATABASE resourcecheck;
USE resourcecheck;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    city VARCHAR(100),
    status VARCHAR(20)
);
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255),
    uploaded_at DATETIME,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Events (title, city, status) VALUES
('AI Summit', 'Hyderabad', 'upcoming'),
('Cloud Expo', 'Bangalore', 'upcoming'),
('Dev Meetup', 'Chennai', 'completed'),
('Startup Fest', 'Mumbai', 'upcoming');
INSERT INTO Resources (event_id, resource_type, resource_url, uploaded_at) VALUES
(1, 'pdf', 'ai_agenda.pdf', '2026-06-01 10:00:00'),
(1, 'image', 'ai_banner.jpg', '2026-06-01 11:00:00'),
(3, 'link', 'dev_docs.com', '2026-06-02 10:00:00');
SELECT * FROM Events;
SELECT * FROM Resources;
SELECT 
    e.event_id,
    e.title,
    e.city,
    e.status
FROM Events e
LEFT JOIN Resources r 
    ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;
