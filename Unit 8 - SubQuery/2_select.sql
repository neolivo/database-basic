-- Subquery dalam klausa SELECT
-- Menghitung jumlah aktivitas untuk setiap pengguna
SELECT 
    name,
    (SELECT COUNT(*) 
     FROM log_activity 
     WHERE user_id = users.id) as activity_count
FROM users;