-- Pertama buat tabel yang dibutuhkan
CREATE TABLE IF NOT EXISTS users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    email_verified_at TIMESTAMP NULL,
    password VARCHAR(255) NOT NULL,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS log_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity TEXT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) 
    REFERENCES users(id) ON DELETE CASCADE
);

-- Contoh query yang menggabungkan DISTINCT dan LIMIT

-- Mendapatkan 3 pengguna unik yang melakukan aktivitas apapun
SELECT DISTINCT u.name, u.email
FROM users u
JOIN log_activity la ON u.id = la.user_id
LIMIT 3;

-- Mendapatkan 2 aktivitas unik pertama yang dilakukan oleh pengguna
SELECT DISTINCT activity
FROM log_activity
LIMIT 2;

-- Mendapatkan 3 pengguna unik terbaru yang melakukan login
SELECT DISTINCT u.name, u.email, la.created_at
FROM users u
JOIN log_activity la ON u.id = la.user_id
WHERE la.activity = 'Logged in'
ORDER BY la.created_at DESC
LIMIT 3;

-- Mendapatkan ID pengguna unik dengan aktivitas terakhir mereka, dibatasi 2 hasil
SELECT DISTINCT user_id, 
    FIRST_VALUE(activity) OVER (PARTITION BY user_id ORDER BY created_at DESC) as latest_activity
FROM log_activity
LIMIT 2;
