-- Subquery dalam klausa WHERE
-- Mencari pengguna yang telah login (memiliki log aktivitas)
SELECT name, email 
FROM users 
WHERE id IN (
    SELECT DISTINCT user_id 
    FROM log_activity
);

-- Subquery dalam klausa SELECT
-- Menghitung jumlah aktivitas untuk setiap pengguna
SELECT 
    name,
    (SELECT COUNT(*) 
     FROM log_activity 
     WHERE user_id = users.id) as activity_count
FROM users;

-- Subquery dalam klausa FROM
-- Mendapatkan pengguna dengan aktivitas terakhir mereka
SELECT u.name, la.activity, la.created_at
FROM users u
JOIN (
    SELECT user_id, MAX(created_at) as last_activity_date
    FROM log_activity
    GROUP BY user_id
) latest ON u.id = latest.user_id
JOIN log_activity la ON la.user_id = u.id 
    AND la.created_at = latest.last_activity_date;

-- Correlated subquery
-- Mencari pengguna yang memiliki lebih dari 2 aktivitas
SELECT name, email
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM log_activity 
    WHERE user_id = u.id
) > 2;