-- Subquery dalam klausa FROM
-- Mendapatkan pengguna dengan aktivitas terakhir mereka
SELECT u.name, la.activity, la.created_at
FROM users u
JOIN (
    SELECT user_id, MAX(created_at) as last_activity_date
    FROM log_activity
    GROUP BY user_id
) latest ON u.id = latest.user_id
JOIN log_activity la ON la.user_id = u.id 
    AND la.created_at = latest.last_activity_date;