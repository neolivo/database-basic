-- fungsi agregat avg() untuk menghitung rata rata
SELECT -- memilih data untuk nantinya dilakukan operasi
    user_id, COUNT(activity) as total_activities,
    AVG(TIME_TO_SEC(TIMEDIFF(updated_at, created_at))) as avg_durasi_aktivitas
FROM log_activity GROUP BY user_id HAVING COUNT(activity) > 0
ORDER BY avg_durasi_aktivitas DESC;
-- catatan : durasi akan 0 jika created_at = updated_at