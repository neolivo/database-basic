-- 1. REGEXP untuk mencari nama yang diawali huruf 'A'
SELECT name FROM users 
WHERE name REGEXP '^A';

-- 2. REGEXP untuk validasi format email
SELECT email FROM users 
WHERE email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';

-- 3. REGEXP untuk mencari nama yang memiliki spasi
SELECT name FROM users 
WHERE name REGEXP '\s';

-- 4. REGEXP untuk mencari nama yang hanya berisi huruf
SELECT name FROM users 
WHERE name REGEXP '^[A-Za-z\s]+$';

-- 5. REGEXP untuk mencari email dengan domain tertentu
SELECT email FROM users 
WHERE email REGEXP '@gmail\.com$';

-- 6. REGEXP dalam subquery
SELECT * FROM users 
WHERE id IN (
    SELECT id FROM users 
    WHERE email REGEXP '^[a-z]+\.[a-z]+@'
);

-- 7. REGEXP dengan multiple patterns
SELECT name, email FROM users 
WHERE name REGEXP 'davis|putra'
AND email REGEXP '@(gmail|yahoo)\.com$';