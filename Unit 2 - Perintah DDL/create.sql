-- seperti sebelumnya, create untuk membuat tabel
CREATE TABLE IF NOT EXISTS log_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity TEXT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) 
    REFERENCES users(id) ON DELETE CASCADE
) -- tabel untuk mencatat aktivitas user