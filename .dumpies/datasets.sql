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
    (5, "Raden Wijaya", "radenwijaya@gmail.com", SHA2("password_raden", 256));
-- melakukan 4 repetisi data, memastikan data tersedia

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