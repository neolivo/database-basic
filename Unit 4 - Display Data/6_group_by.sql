-- group by digunakan untuk mengelompokkan data

SELECT name, COUNT(*) as jumlah_user -- jumlah data
FROM users -- merujuk pada kolom users
WHERE name LIKE '%a%' -- kondisi berdasarkan nama
GROUP BY name; -- kelompokkan berdasarkan nama