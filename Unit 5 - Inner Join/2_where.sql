-- inner join = perpotongan dua himpunan
SELECT users.name, log_activity.activity
FROM users
INNER JOIN log_activity
ON users.id = log_activity.user_id
WHERE log_activity.activity LIKE "%menghapus%";
-- menyaring hasil berdasarkan kondisi
