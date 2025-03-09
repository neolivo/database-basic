-- limit digunakan untuk membatasi
SELECT name, email
FROM users
WHERE name LIKE '%a%'
ORDER BY name ASC
LIMIT 4;
-- membatasi 4 data pertama