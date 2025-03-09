-- having digunakan untuk menyaring hasil agregasi setelah group by
SELECT name, COUNT(*) as jumlah_user -- jumlah data
FROM users -- merujuk pada kolom users
GROUP BY name -- kategorikan berdasarkan nama
HAVING COUNT(*) > 1; -- saring total data lebih dari satu
-- hasil akan kosong jika tidak ada duplikasi
-- catatan : untuk mengganti parameter, ganti "name"