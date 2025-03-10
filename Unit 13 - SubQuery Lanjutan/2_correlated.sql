-- 1. Mencari pengguna yang memiliki lebih dari 3 log aktivitas
SELECT u.id, u.name, u.email,
    (SELECT COUNT(*) 
     FROM log_activity la 
     WHERE la.user_id = u.id) as activity_count
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM log_activity la 
    WHERE la.user_id = u.id
) > 3;

-- 2. Mencari pengguna yang memiliki tiket dukungan terbuka tetapi tidak memiliki aktivitas dalam 7 hari terakhir
SELECT u.id, u.name, u.email
FROM users u
WHERE EXISTS (
    SELECT 1 
    FROM support_tickets st 
    WHERE st.user_id = u.id
) AND NOT EXISTS (
    SELECT 1 
    FROM log_activity la 
    WHERE la.user_id = u.id 
    AND la.created_at >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY)
);

-- 3. Mencari pengguna yang memiliki tiket terbuka lebih banyak daripada tiket yang ditutup
SELECT u.id, u.name
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM support_tickets st 
    WHERE st.user_id = u.id 
    AND st.status = 'open'
) > (
    SELECT COUNT(*) 
    FROM support_tickets st 
    WHERE st.user_id = u.id 
    AND st.status = 'closed'
);

-- 4. Memperbarui timestamp updated_at pengguna untuk mereka yang memiliki aktivitas tiket terbaru
UPDATE users u
SET updated_at = CURRENT_TIMESTAMP
WHERE EXISTS (
    SELECT 1 
    FROM support_tickets st 
    WHERE st.user_id = u.id 
    AND st.created_at >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 24 HOUR)
);

-- 5. Mencari pengguna yang memiliki log aktivitas lebih banyak dari rata-rata aktivitas per pengguna
SELECT u.id, u.name,
    (SELECT COUNT(*) 
     FROM log_activity la 
     WHERE la.user_id = u.id) as activity_count
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM log_activity la 
    WHERE la.user_id = u.id
) > (
    SELECT AVG(activity_count)
    FROM (
        SELECT COUNT(*) as activity_count
        FROM log_activity
        GROUP BY user_id
    ) as avg_activities
);