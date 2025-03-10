-- 1. Temukan semua pengguna yang telah membuat lebih dari 2 tiket dukungan
SELECT name, email
FROM users
WHERE id IN (
    SELECT user_id 
    FROM support_tickets 
    GROUP BY user_id 
    HAVING COUNT(*) > 2
);

-- 2. Temukan pengguna yang memiliki catatan aktivitas dan tiket dukungan
SELECT DISTINCT u.name, u.email
FROM users u
WHERE u.id IN (
    SELECT user_id FROM log_activity
) AND u.id IN (
    SELECT user_id FROM support_tickets
);

-- 3. Temukan pengguna yang belum pernah membuat tiket dukungan
SELECT name, email
FROM users
WHERE id NOT IN (
    SELECT DISTINCT user_id 
    FROM support_tickets
);

-- 4. Temukan pengguna yang memiliki aktivitas lebih banyak dari rata-rata aktivitas per pengguna
SELECT u.name, COUNT(la.id) as activity_count
FROM users u
JOIN log_activity la ON u.id = la.user_id
GROUP BY u.id, u.name
HAVING COUNT(la.id) > (
    SELECT AVG(activity_count)
    FROM (
        SELECT COUNT(*) as activity_count
        FROM log_activity
        GROUP BY user_id
    ) as avg_activities
);

-- 5. Temukan pengguna yang memiliki tiket dengan semua jenis status yang tersedia
SELECT u.name, u.email
FROM users u
WHERE NOT EXISTS (
    SELECT DISTINCT status
    FROM support_tickets
    WHERE status IS NOT NULL
    AND status NOT IN (
        SELECT DISTINCT status
        FROM support_tickets st
        WHERE st.user_id = u.id
    )
);

-- 6. Temukan aktivitas terbaru untuk setiap pengguna yang memiliki tiket dengan status 'pending'
SELECT u.name, la.activity, la.created_at
FROM users u
JOIN log_activity la ON u.id = la.user_id
WHERE la.created_at = (
    SELECT MAX(created_at)
    FROM log_activity
    WHERE user_id = u.id
) AND u.id IN (
    SELECT user_id
    FROM support_tickets
    WHERE status = 'pending'
);