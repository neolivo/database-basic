-- inner join = perpotongan dua himpunan
SELECT users.name, 
    -- menghitung jumlah aktivitas
    COUNT(log_activity.activity) as total_activities,

    -- mengelompokkan aktivitas dalam satu kolom
    GROUP_CONCAT(log_activity.activity) as activity_list
FROM users -- dari kolom users
INNER JOIN log_activity -- gabung dengan log_activity
ON users.id = log_activity.user_id -- keterkaitan
GROUP BY users.name; -- group berdasar nama user