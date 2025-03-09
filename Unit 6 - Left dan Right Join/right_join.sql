-- right join = semua data dari tabel kanan (log_activity) akan ditampilkan
SELECT users.name, 
    -- menghitung jumlah aktivitas
    COUNT(log_activity.activity) as total_activities,
    -- mengelompokkan aktivitas dalam satu kolom
    GROUP_CONCAT(log_activity.activity) as activity_list
FROM users -- dari kolom users
RIGHT JOIN log_activity -- gabung dengan log_activity
ON users.id = log_activity.user_id -- keterkaitan
GROUP BY users.name -- group berdasar nama user
HAVING total_activities > 0; -- filter aktivitas > 0
-- catatan : bisa ganti "0" dengan angka minimum
