-- ini adalah display data dengan kombinasi kondisi where

SELECT name, email
FROM users
WHERE name LIKE '%ka%';
-- nama yang "..ka.." [misal : arka, bakara]
