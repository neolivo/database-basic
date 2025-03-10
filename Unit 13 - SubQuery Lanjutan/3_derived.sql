-- 1. Mencari pengguna dengan total aktivitas dan tiket dukungan mereka
SELECT 
    user_stats.name,
    user_stats.total_activities,
    user_stats.total_tickets
FROM (
    SELECT 
        u.id,
        u.name,
        COUNT(DISTINCT la.id) as total_activities,
        COUNT(DISTINCT st.id) as total_tickets
    FROM users u
    LEFT JOIN log_activity la ON u.id = la.user_id
    LEFT JOIN support_tickets st ON u.id = st.user_id
    GROUP BY u.id, u.name
) AS user_stats
WHERE user_stats.total_activities > 0;

-- 2. Mencari pengguna dengan tiket yang masih tertunda dan aktivitas terakhir mereka
SELECT 
    ticket_info.name,
    ticket_info.ticket_title,
    ticket_info.last_activity
FROM (
    SELECT 
        u.name,
        st.ticket_title,
        (SELECT activity 
         FROM log_activity 
         WHERE user_id = u.id 
         ORDER BY created_at DESC 
         LIMIT 1) as last_activity
    FROM users u
    JOIN support_tickets st ON u.id = st.user_id
    WHERE st.status = 'pending'
) AS ticket_info;

-- 3. Mendapatkan pengguna dengan status verifikasi dan jumlah aktivitas
SELECT *
FROM (
    SELECT 
        u.name,
        CASE 
            WHEN u.email_verified_at IS NOT NULL THEN 'Verified'
            ELSE 'Not Verified'
        END as verification_status,
        COUNT(la.id) as activity_count
    FROM users u
    LEFT JOIN log_activity la ON u.id = la.user_id
    GROUP BY u.id, u.name, u.email_verified_at
) AS user_verification
WHERE user_verification.activity_count > 0;

-- 4. Mencari pengguna paling aktif dengan tiket yang masih terbuka
SELECT *
FROM (
    SELECT 
        u.name,
        COUNT(la.id) as activity_count,
        COUNT(st.id) as open_tickets
    FROM users u
    LEFT JOIN log_activity la ON u.id = la.user_id
    LEFT JOIN support_tickets st ON u.id = st.user_id AND st.status = 'open'
    GROUP BY u.id, u.name
    HAVING activity_count > 0
    ORDER BY activity_count DESC
) AS active_users
WHERE active_users.open_tickets > 0;