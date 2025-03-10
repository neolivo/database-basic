-- reminder : jalankan dulu create.sql di unit 2
-- dump data dengan insert or ignore
-- ingat di MariDB jadi INSERT IGNORE

-- reminder data dump awal
INSERT IGNORE INTO users (id, name, email, password)
VALUES (
    1,
    'DAVIS ARRIZQI PUTRA MANDIRI',
    'davis@nusanio.com',
    SHA2('prefrontalcortexonmyheadistheimportantlegacy4096*', 256)
);

-- data dump tambahan
INSERT IGNORE INTO users (id, name, email, password)
VALUES
    (2, "Budi Santoso", "budisantoso@gmail.com", SHA2("password_budi", 256)),
    (3, "Arka Dwi Utami", "arkadwi@gmail.com", SHA2("password_arkadwi", 256)),
    (4, "Dewi Kusuma", "dewikusuma@gmail.com", SHA2("password_dewi", 256)),
    (5, "Raden Wijaya", "radenwijaya@gmail.com", SHA2("password_raden", 256)),
    (6, "Siti Rahma", "sitirahma@gmail.com", SHA2("password_siti", 256)),
    (7, "Eko Prasetyo", "ekopras@gmail.com", SHA2("password_eko", 256)),
    (8, "Maya Indah", "mayaindah@gmail.com", SHA2("password_maya", 256)),
    (9, "Irfan Hakim", "irfanhakim@gmail.com", SHA2("password_irfan", 256)),
    (10, "Nina Sari", "ninasari@gmail.com", SHA2("password_nina", 256)),
    (11, "Hadi Susanto", "hadisus@gmail.com", SHA2("password_hadi", 256)),
    (12, "Lisa Permata", "lisapermata@gmail.com", SHA2("password_lisa", 256)),
    (13, "Agus Wirawan", "aguswirawan@gmail.com", SHA2("password_agus", 256)),
    (14, "Dina Maulida", "dinamaulida@gmail.com", SHA2("password_dina", 256)),
    (15, "Rizky Pratama", "rizkypratama@gmail.com", SHA2("password_rizky", 256));
-- update v1.3 : dari id ke 6  sampai seterusnya

INSERT IGNORE INTO log_activity (user_id, activity)
VALUES -- data data yang diinput
    (1, 'Melakukan Login'),
    (2, 'Membuka Dashboard'),
    (3, 'Mengubah Profil'),
    (4, 'Menambah Data'),
    (1, 'Menghapus Data'),
    (2, 'Mengunduh Laporan'),
    (3, 'Melakukan Logout'),
    (4, 'Memperbarui Status'),
    (1, 'Mengakses Menu'),
    (2, 'Melakukan Pencarian');
-- melakukan 10 repetisi data

-- update v1.3 [ dump data untuk support_tickets ]
INSERT INTO support_tickets (user_id, ticket_title, description, status, created_at) VALUES
(1, 'Login Error', 'Cannot log in to account', 'open', '2025-03-02 09:00:00'),
(1, 'App Crash', 'App crashes on startup', 'pending', '2025-03-02 10:00:00'),
(3, 'Payment Failed', 'Card declined during checkout', 'closed', '2025-03-02 11:00:00'),
(5, 'Slow Loading', 'Website takes too long to load', 'open', '2025-03-02 12:00:00'),
(7, 'Feature Request', 'Add dark mode option', 'pending', '2025-03-02 13:00:00'),
(9, 'Bug Report', 'Button not working', 'open', '2025-03-02 14:00:00'),
(10, 'Account Locked', 'Account inaccessible', 'closed', '2025-03-02 15:00:00'),
(12, 'Data Sync Issue', 'Data not syncing across devices', 'open', '2025-03-02 16:00:00'),
(14, 'Password Reset', 'Forgot password link not working', 'pending', '2025-03-02 17:00:00'),
(15, 'Server Error', '500 error on homepage', 'open', '2025-03-02 18:00:00');