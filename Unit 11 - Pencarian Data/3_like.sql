-- menggunakan like untuk mendapatkan data identik
SELECT DISTINCT users.name, log_activity.activity
FROM users INNER JOIN log_activity
ON users.id = log_activity.user_id
WHERE users.name LIKE "%vis%";