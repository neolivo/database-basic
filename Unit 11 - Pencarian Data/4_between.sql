-- menggunakan between untuk mendapatkan data radius
SELECT DISTINCT users.name, log_activity.activity, log_activity.updated_at
FROM users INNER JOIN log_activity
ON users.id = log_activity.user_id
WHERE log_activity.updated_at BETWEEN "2025-01-01" AND "2025-12-31";
-- mendapatkan data dari 1 januari 2025 sampai dengan 31 desember 2025