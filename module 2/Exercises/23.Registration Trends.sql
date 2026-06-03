CREATE DATABASE trendpulse;
USE trendpulse;
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL
);
INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 101, '2025-01-15'),
(2, 101, '2025-02-10'),
(3, 102, '2025-02-20'),
(4, 103, '2025-03-05'),
(5, 104, '2025-03-18'),
(1, 105, '2025-04-01'),
(2, 106, '2025-05-12'),
(3, 107, '2025-05-25'),
(4, 108, '2025-06-02'),
(5, 109, '2025-07-10'),
(1, 110, '2025-08-15'),
(2, 111, '2025-09-09'),
(3, 112, '2025-10-20'),
(4, 113, '2025-11-11'),
(5, 114, '2025-12-05');
SELECT * FROM Registrations;
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month,
    COUNT(registration_id) AS total_registrations
FROM Registrations
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(registration_date, '%Y-%m')
ORDER BY month ASC;