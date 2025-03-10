-- memilih data lalu mengelompokkan dengan percabangan
SELECT 
    user_id,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) as night_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) as morning_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) as afternoon_activities,
    SUM(CASE WHEN HOUR(created_at) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) as evening_activities
FROM log_activity
GROUP BY user_id;

-- update v1.3
SELECT users.email,
    COUNT(st.id) as total_tickets,
    SUM(CASE WHEN st.status = 'open' THEN 1 ELSE 0 END) as open_tickets,
    SUM(CASE WHEN st.status = 'closed' THEN 1 ELSE 0 END) as closed_tickets,
    SUM(CASE WHEN st.status = 'pending' THEN 1 ELSE 0 END) as pending_tickets,
    MAX(st.created_at) as latest_ticket
FROM users
LEFT JOIN support_tickets st 
ON users.id = st.user_id
GROUP BY users.id, users.email
ORDER BY total_tickets DESC;
-- menampilkan akumulasi tiket berdasarkan email