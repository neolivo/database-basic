-- Mencari timestamp aktivitas terbaru
SELECT MAX(created_at) AS latest_activity
FROM log_activity;

-- Mencari aktivitas terakhir per pengguna
SELECT user_id, MAX(created_at) AS last_active
FROM log_activity
GROUP BY user_id;

-- Mencari jumlah aktivitas harian maksimum per pengguna
SELECT user_id, DATE(created_at) AS activity_date, COUNT(*) AS activity_count
FROM log_activity
GROUP BY user_id, DATE(created_at)
HAVING COUNT(*) = (
    SELECT MAX(daily_count)
    FROM (
        SELECT COUNT(*) AS daily_count
        FROM log_activity
        GROUP BY user_id, DATE(created_at)
    ) AS counts
);

-- Mencari pengguna dengan aktivitas terbanyak
SELECT user_id, COUNT(*) as total_activities
FROM log_activity
GROUP BY user_id
HAVING COUNT(*) = (
    SELECT MAX(activity_count)
    FROM (
        SELECT COUNT(*) as activity_count
        FROM log_activity
        GROUP BY user_id
    ) AS counts
);

-- Mencari hari dengan aktivitas terbanyak
SELECT DATE(created_at) AS busiest_day, COUNT(*) AS activity_count
FROM log_activity
GROUP BY DATE(created_at)
ORDER BY activity_count DESC
LIMIT 1;