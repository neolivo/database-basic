-- Contoh 1: Mendapatkan nama yang berbeda dari tabel users
SELECT DISTINCT name FROM users;

-- Contoh 2: Mendapatkan daftar pengguna yang berbeda yang melakukan aktivitas
SELECT DISTINCT u.name, u.email
FROM users u
JOIN log_activity la ON u.id = la.user_id;

-- Contoh 3: Mendapatkan daftar aktivitas yang berbeda
SELECT DISTINCT activity
FROM log_activity
ORDER BY activity;

-- Contoh 4: Mendapatkan tanggal yang berbeda saat aktivitas dilakukan
SELECT DISTINCT DATE(created_at) as activity_date
FROM log_activity
ORDER BY activity_date;

-- Contoh 5: Mendapatkan kombinasi unik antara pengguna dan aktivitas
SELECT DISTINCT u.name, la.activity
FROM users u
JOIN log_activity la ON u.id = la.user_id
ORDER BY u.name, la.activity;
