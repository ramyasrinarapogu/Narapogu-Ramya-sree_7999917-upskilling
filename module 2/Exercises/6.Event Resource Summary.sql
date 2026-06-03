CREATE DATABASE eventvault;
USE eventvault;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    status VARCHAR(20)
);
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
INSERT INTO Events (title, city, start_date, status) VALUES
('AI Summit', 'Hyderabad', '2026-06-10 10:00:00', 'upcoming'),
('Startup Expo', 'Bangalore', '2026-06-15 09:00:00', 'upcoming');
INSERT INTO Resources (event_id, resource_type, resource_url, uploaded_at) VALUES
(1, 'pdf', 'https://event.com/ai_agenda.pdf', '2026-05-01 10:00:00'),
(1, 'image', 'https://event.com/ai_banner.jpg', '2026-05-02 10:00:00'),
(1, 'link', 'https://event.com/ai_docs', '2026-05-03 10:00:00'),

(2, 'pdf', 'https://event.com/startup_guide.pdf', '2026-05-05 10:00:00'),
(2, 'link', 'https://event.com/startup_info', '2026-05-06 10:00:00');
SELECT * FROM Events;
SELECT * FROM Resources;
SELECT 
    e.event_id,
    e.title,

    COUNT(CASE WHEN r.resource_type = 'pdf' THEN 1 END) AS pdf_count,
    COUNT(CASE WHEN r.resource_type = 'image' THEN 1 END) AS image_count,
    COUNT(CASE WHEN r.resource_type = 'link' THEN 1 END) AS link_count,

    COUNT(r.resource_id) AS total_resources

FROM Events e
LEFT JOIN Resources r 
    ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_resources DESC;