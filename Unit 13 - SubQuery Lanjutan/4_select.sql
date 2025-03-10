-- 1. Mencari user yang memiliki aktivitas log terbanyak
SELECT 
    u.name,
    (SELECT COUNT(*) FROM log_activity WHERE user_id = u.id) as total_aktivitas
FROM users u
WHERE (SELECT COUNT(*) FROM log_activity WHERE user_id = u.id) > 0
ORDER BY total_aktivitas DESC;

-- 2. Menampilkan user yang belum pernah membuat tiket support
SELECT name, email 
FROM users 
WHERE id NOT IN (
    SELECT DISTINCT user_id 
    FROM support_tickets
);

-- 3. Mencari user yang memiliki tiket support dengan status 'pending'
SELECT name, email
FROM users
WHERE id IN (
    SELECT user_id 
    FROM support_tickets 
    WHERE status = 'pending'
);

-- 4. Menampilkan jumlah tiket dan aktivitas untuk setiap user
SELECT 
    u.name,
    (
        SELECT COUNT(*) 
        FROM support_tickets 
        WHERE user_id = u.id
    ) as jumlah_tiket,
    (
        SELECT COUNT(*) 
        FROM log_activity 
        WHERE user_id = u.id
    ) as jumlah_aktivitas
FROM users u;

-- 5. Mencari user yang memiliki tiket support lebih banyak dari rata-rata
SELECT name, email
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM support_tickets 
    WHERE user_id = u.id
) > (
    SELECT AVG(ticket_count)
    FROM (
        SELECT COUNT(*) as ticket_count 
        FROM support_tickets 
        GROUP BY user_id
    ) as avg_tickets
);

-- 6. Menampilkan user yang memiliki aktivitas log dalam 24 jam terakhir
SELECT name, email
FROM users
WHERE id IN (
    SELECT DISTINCT user_id
    FROM log_activity
    WHERE created_at >= NOW() - INTERVAL 1 DAY
);