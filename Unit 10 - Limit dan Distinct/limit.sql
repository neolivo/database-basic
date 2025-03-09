-- Contoh 1: Mendapatkan 3 pengguna pertama
SELECT * FROM users 
LIMIT 3;

-- Contoh 2: Mendapatkan 5 aktivitas terbaru
SELECT la.activity, u.name, la.created_at
FROM log_activity la
JOIN users u ON la.user_id = u.id
ORDER BY la.created_at DESC
LIMIT 5;

-- Contoh 3: Mendapatkan pengguna dengan offset (paginasi)
SELECT id, name, email 
FROM users 
LIMIT 2 OFFSET 2;

-- Contoh 4: Mendapatkan 3 pengguna teratas dengan aktivitas terbanyak
SELECT u.name, COUNT(la.id) as activity_count
FROM users u
LEFT JOIN log_activity la ON u.id = la.user_id
GROUP BY u.id, u.name
ORDER BY activity_count DESC
LIMIT 3;