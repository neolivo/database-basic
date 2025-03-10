-- Subquery dalam klausa WHERE
-- Mencari pengguna yang telah login (memiliki log aktivitas)
SELECT name, email 
FROM users 
WHERE id IN (
    SELECT DISTINCT user_id 
    FROM log_activity
);