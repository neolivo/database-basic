-- Implementasi CTE (Common Table Expression) untuk analisis aktivitas pengguna dan tiket support

-- CTE untuk menghitung jumlah aktivitas per pengguna
WITH UserActivityCount AS (
    SELECT 
        u.id,
        u.name,
        COUNT(la.id) as total_aktivitas,
        MAX(la.created_at) as aktivitas_terakhir
    FROM users u
    LEFT JOIN log_activity la ON u.id = la.user_id
    GROUP BY u.id, u.name
),

-- CTE untuk menghitung statistik tiket support per pengguna
UserTicketStats AS (
    SELECT 
        u.id,
        COUNT(st.id) as total_tiket,
        SUM(CASE WHEN st.status = 'open' THEN 1 ELSE 0 END) as tiket_terbuka,
        SUM(CASE WHEN st.status = 'closed' THEN 1 ELSE 0 END) as tiket_tertutup
    FROM users u
    LEFT JOIN support_tickets st ON u.id = st.user_id
    GROUP BY u.id
)

-- Query utama yang menggabungkan kedua CTE
SELECT 
    u.name as nama_pengguna,
    u.email,
    COALESCE(uac.total_aktivitas, 0) as jumlah_aktivitas,
    uac.aktivitas_terakhir,
    COALESCE(uts.total_tiket, 0) as total_tiket_support,
    COALESCE(uts.tiket_terbuka, 0) as tiket_belum_selesai,
    COALESCE(uts.tiket_tertutup, 0) as tiket_selesai,
    -- Menghitung persentase penyelesaian tiket
    CASE 
        WHEN COALESCE(uts.total_tiket, 0) = 0 THEN 0
        ELSE ROUND((uts.tiket_tertutup / uts.total_tiket) * 100, 2)
    END as persentase_penyelesaian
FROM users u
LEFT JOIN UserActivityCount uac ON u.id = uac.id
LEFT JOIN UserTicketStats uts ON u.id = uts.id
-- Hanya menampilkan pengguna yang memiliki aktivitas atau tiket
WHERE uac.total_aktivitas > 0 OR uts.total_tiket > 0
ORDER BY jumlah_aktivitas DESC, total_tiket_support DESC;