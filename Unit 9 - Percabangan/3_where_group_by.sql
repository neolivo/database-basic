-- Memilih data aktivitas pengguna berdasarkan waktu dan mengelompokkannya dalam rentang waktu tertentu
-- dengan menyaring data yang valid (tidak null) dan aktivitas dalam 30 hari terakhir
SELECT 
    user_id,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) as night_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) as morning_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) as afternoon_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) as evening_activities
FROM log_activity
WHERE user_id > 2 -- kondisional where
AND created_at >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY user_id;

-- update v1.3
SELECT 
    user_id,
    COUNT(CASE WHEN status = 'open' THEN 1 END) as open_tickets,
    COUNT(CASE WHEN status = 'closed' THEN 1 END) as closed_tickets,
    COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_tickets
FROM support_tickets
WHERE created_at >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY user_id
HAVING COUNT(CASE WHEN status = 'open' THEN 1 END) >= 1
ORDER BY open_tickets DESC;
-- menampilkan akumulasi tiket berdasarkan status
-- user harus memiliki minimal 1 tiket yang masih open