-- menggunakan where untuk mendapat data paten
SELECT DISTINCT users.name, log_activity.activity
FROM users INNER JOIN log_activity
ON users.id = log_activity.user_id
WHERE users.id = 3;