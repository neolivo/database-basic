-- offset digunakan untuk melewati
SELECT name, email
FROM users
WHERE name LIKE '%a%'
ORDER BY name ASC
LIMIT 4 -- membatasi 4 data pertama
OFFSET 3; -- skip lalu tampilkan mulai data ke 3