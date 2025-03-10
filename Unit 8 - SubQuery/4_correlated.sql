-- Correlated subquery
-- Mencari pengguna yang memiliki lebih dari 2 aktivitas
SELECT name, email
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM log_activity 
    WHERE user_id = u.id
) > 2;