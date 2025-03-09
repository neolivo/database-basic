-- Mencari timestamp aktivitas paling awal
SELECT MIN(created_at) as earliest_activity
FROM log_activity;

-- Mencari aktivitas paling awal untuk setiap pengguna
SELECT user_id, MIN(created_at) as first_activity
FROM log_activity
GROUP BY user_id;

-- Mencari user_id terendah yang melakukan aktivitas
SELECT MIN(user_id) as earliest_user
FROM log_activity;

-- Mencari tanggal aktivitas paling awal dan pengguna yang terkait
SELECT la.user_id, u.username, MIN(la.created_at) as first_activity
FROM log_activity la
JOIN users u ON la.user_id = u.id
GROUP BY la.user_id, u.username;

-- Mencari pengguna yang melakukan aktivitas pertama mereka sebelum tahun 2023
SELECT user_id
FROM log_activity
GROUP BY user_id
HAVING MIN(created_at) < '2023-01-01';