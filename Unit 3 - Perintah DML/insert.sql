-- insert digunakan untuk input data
INSERT INTO users (
    name, email, password
) -- ingat urutan kolomnya

VALUES (
    'DAVIS ARRIZQI PUTRA MANDIRI',
    'davis@nusanio.com',
    SHA2('prefrontalcortexonmyheadistheimportantlegacy4096*', 256)
); -- urut sesuai kolom yang diinputkan
-- fungsi SHA2 untuk enkripsi password

