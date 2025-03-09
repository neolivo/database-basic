-- Menghitung total jumlah entri log
SELECT COUNT(*) AS total_logs 
FROM log_activity;

-- Menghitung log per pengguna
SELECT user_id, COUNT(*) AS activity_count 
FROM log_activity 
GROUP BY user_id;

-- Menghitung log per hari
SELECT DATE(created_at) AS activity_date, COUNT(*) AS daily_count 
FROM log_activity 
GROUP BY DATE(created_at);

-- Menghitung log dalam 7 hari terakhir
SELECT COUNT(*) AS recent_logs 
FROM log_activity 
WHERE created_at >= NOW() - INTERVAL 7 DAY;

-- Menghitung log per pengguna per hari
SELECT user_id, DATE(created_at) AS activity_date, COUNT(*) AS user_daily_count 
FROM log_activity 
GROUP BY user_id, DATE(created_at) 
ORDER BY user_id, activity_date;

-- Mendapatkan statistik aktivitas pengguna per bulan
SELECT 
    user_id,
    YEAR(created_at) as year,
    MONTH(created_at) as month,
    COUNT(id) as monthly_activities
FROM log_activity
GROUP BY user_id, YEAR(created_at), MONTH(created_at)
ORDER BY user_id, year, month;

-- Mendapatkan distribusi aktivitas per jam
SELECT 
    HOUR(created_at) as hour_of_day,
    COUNT(id) as activity_count
FROM log_activity
GROUP BY HOUR(created_at)
ORDER BY hour_of_day;
