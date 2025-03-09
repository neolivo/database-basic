-- memilih data lalu mengelompokkan dengan percabangan
SELECT 
    user_id,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) as night_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) as morning_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) as afternoon_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) as evening_activities
FROM log_activity
GROUP BY user_id;