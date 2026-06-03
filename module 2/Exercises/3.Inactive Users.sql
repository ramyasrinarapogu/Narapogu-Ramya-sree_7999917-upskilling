CREATE DATABASE communityhub;
USE communityhub;
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL
);
CREATE TABLE Activity (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    event_id INT,
    activity_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
INSERT INTO Members (name, email, city, join_date) VALUES
('Vikram Patel', 'vikram@hub.com', 'Pune', '2025-01-01'),
('Sneha Iyer', 'sneha@hub.com', 'Mumbai', '2025-01-05'),
('Rohit Das', 'rohit@hub.com', 'Pune', '2025-01-10'),
('Anita Rao', 'anita@hub.com', 'Delhi', '2025-01-12');
INSERT INTO Activity (member_id, event_id, activity_date) VALUES
(1, 101, DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
(2, 102, DATE_SUB(CURDATE(), INTERVAL 20 DAY)),
(1, 103, DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
(3, 104, DATE_SUB(CURDATE(), INTERVAL 120 DAY));
SELECT * FROM Members;
SELECT * FROM Activity;
SELECT m.member_id, m.name, m.email, m.city
FROM Members m
LEFT JOIN Activity a 
    ON m.member_id = a.member_id 
    AND a.activity_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
WHERE a.member_id IS NULL;
