-- 1. Subquery dalam WHERE clause
-- Mencari user yang memiliki aktivitas log dalam 24 jam terakhir
SELECT * FROM users 
WHERE id IN (
    SELECT DISTINCT user_id 
    FROM log_activity 
    WHERE created_at >= NOW() - INTERVAL 24 HOUR
);

-- 2. Subquery dalam FROM clause
-- Menghitung jumlah aktivitas per user
SELECT u.name, activity_count.total
FROM users u
JOIN (
    SELECT user_id, COUNT(*) as total
    FROM log_activity
    GROUP BY user_id
) activity_count ON u.id = activity_count.user_id;

-- 3. Subquery dengan EXISTS
-- Mencari user yang belum pernah melakukan aktivitas apapun
SELECT * FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM log_activity
    WHERE user_id = u.id
);

-- 4. Subquery dalam SELECT clause
-- Menampilkan user beserta jumlah aktivitas terakhirnya
SELECT 
    name,
    email,
    (SELECT COUNT(*) FROM log_activity WHERE user_id = users.id) as total_activities,
    (SELECT activity FROM log_activity 
     WHERE user_id = users.id 
     ORDER BY created_at DESC LIMIT 1) as last_activity
FROM users;

-- 5. Subquery dengan ANY/SOME
-- Mencari user yang memiliki aktivitas setelah tanggal tertentu
SELECT * FROM users
WHERE id = ANY (
    SELECT user_id FROM log_activity
    WHERE created_at > '2023-01-01'
);

-- 6. Subquery dengan ALL
-- Mencari user yang aktivitasnya lebih baru dari semua aktivitas user tertentu
SELECT * FROM users
WHERE id IN (
    SELECT user_id FROM log_activity
    WHERE created_at > ALL (
        SELECT created_at FROM log_activity
        WHERE user_id = 1
    )
);