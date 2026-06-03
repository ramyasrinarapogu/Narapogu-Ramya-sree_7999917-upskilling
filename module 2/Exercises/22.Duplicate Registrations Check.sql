CREATE DATABASE registrationcheck;
USE registrationcheck;
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE
);
INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 101, '2026-06-01'),
(1, 101, '2026-06-02'),  -- duplicate ❌
(2, 101, '2026-06-01'),
(3, 102, '2026-06-03'),
(3, 102, '2026-06-04'),  -- duplicate ❌
(3, 102, '2026-06-05'),  -- duplicate ❌
(4, 103, '2026-06-01'),
(5, 104, '2026-06-02');
SELECT * FROM Registrations;
SELECT 
    user_id,
    event_id,
    COUNT(*) AS total_registrations
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;