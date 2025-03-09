-- union digunakan untuk menggabungkan fungsi select
-- perlu diingat bahwa jumlah kolom dan tipe data harus sama

SELECT 
    email,
    email_verified_at
FROM users
UNION
SELECT 
    activity,
    updated_at
FROM log_activity;

-- menampilkan email dan tanggal verifikasi dari tabel users
-- digabung dengan aktivitas dan tanggal update dari log_activity