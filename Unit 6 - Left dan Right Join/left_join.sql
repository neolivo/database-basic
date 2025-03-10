-- left join = semua data dari tabel kiri (users) akan ditampilkan
SELECT users.name, 
    -- menghitung jumlah aktivitas
    COUNT(log_activity.activity) as total_activities,
    -- mengelompokkan aktivitas dalam satu kolom
    GROUP_CONCAT(log_activity.activity) as activity_list
FROM users -- dari kolom users
LEFT JOIN log_activity -- gabung dengan log_activity
ON users.id = log_activity.user_id -- keterkaitan
GROUP BY users.name -- group berdasar nama user
HAVING total_activities > 0; -- filter aktivitas > 0
-- catatan : bisa ganti "0" dengan angka minimum


-- update v1.3
SELECT 
    u.id AS user_id,
    u.name,
    st.ticket_title,
    st.status
FROM users u
LEFT JOIN support_tickets st ON u.id = st.user_id;