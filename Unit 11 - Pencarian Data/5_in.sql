-- menggunakan in untuk mendapatkan data dari kumpulan
SELECT DISTINCT users.name, log_activity.activity
FROM users INNER JOIN log_activity
ON users.id = log_activity.user_id
WHERE log_activity.id IN (1, 3, 5, 7);