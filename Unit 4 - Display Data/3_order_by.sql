-- order by untuk mengurutkan hasil data
SELECT name, email
FROM users
WHERE name LIKE '%s%'
ORDER BY name ASC;
-- diurutkan berdasarkan namanya
-- diurutkan secara ascending