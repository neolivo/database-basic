-- 1. Mencari user yang memiliki aktivitas log terbanyak
SELECT name, email, (
    SELECT COUNT(*) 
    FROM log_activity 
    WHERE log_activity.user_id = users.id
) as total_aktivitas
FROM users
WHERE id IN (
    SELECT user_id 
    FROM log_activity 
    GROUP BY user_id
    HAVING COUNT(*) > (
        SELECT AVG(aktivitas_count) 
        FROM (
            SELECT COUNT(*) as aktivitas_count 
            FROM log_activity 
            GROUP BY user_id
        ) as avg_aktivitas
    )
);

-- 2. Menampilkan user yang memiliki tiket support yang masih open
-- dan juga memiliki aktivitas log dalam 7 hari terakhir
SELECT name, email
FROM users
WHERE id IN (
    SELECT user_id
    FROM support_tickets
    WHERE status = 'open'
    AND user_id IN (
        SELECT user_id
        FROM log_activity
        WHERE created_at >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY)
    )
);

-- 3. Mencari user yang belum pernah membuat tiket support
-- tetapi memiliki aktivitas log
SELECT name, email
FROM users
WHERE id NOT IN (
    SELECT user_id
    FROM support_tickets
)
AND id IN (
    SELECT user_id
    FROM log_activity
);

-- 4. Menampilkan user dengan jumlah tiket closed terbanyak
-- yang juga memiliki email terverifikasi
SELECT u.name, u.email, (
    SELECT COUNT(*) 
    FROM support_tickets st 
    WHERE st.user_id = u.id 
    AND st.status = 'closed'
) as total_closed_tickets
FROM users u
WHERE u.email_verified_at IS NOT NULL
AND u.id IN (
    SELECT user_id
    FROM support_tickets
    WHERE status = 'closed'
    GROUP BY user_id
    HAVING COUNT(*) > (
        SELECT AVG(ticket_count)
        FROM (
            SELECT COUNT(*) as ticket_count
            FROM support_tickets
            WHERE status = 'closed'
            GROUP BY user_id
        ) as avg_tickets
    )
)
ORDER BY total_closed_tickets DESC;

-- 5. Mencari user yang memiliki aktivitas terakhir
-- setelah tiket support terakhir mereka
SELECT u.name, u.email,
    (SELECT MAX(created_at) FROM log_activity WHERE user_id = u.id) as last_activity,
    (SELECT MAX(created_at) FROM support_tickets WHERE user_id = u.id) as last_ticket
FROM users u
WHERE u.id IN (
    SELECT user_id
    FROM log_activity la
    WHERE created_at > (
        SELECT COALESCE(MAX(created_at), '1900-01-01')
        FROM support_tickets st
        WHERE st.user_id = la.user_id
    )
);