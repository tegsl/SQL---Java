WITH maxtime AS
  (SELECT FS0.origin_city, MAX(FS0.actual_time) AS max_time
   FROM flights AS FS0 
   GROUP BY FS0.origin_city)
SELECT DISTINCT FS.origin_city AS origin_city, FS.dest_city AS dest_city, FS.actual_time AS time
FROM flights as FS, maxtime AS MT
WHERE FS.actual_time = MT.max_time AND 
      FS.origin_city = MT.origin_city
ORDER BY FS.origin_city, FS.dest_city ASC
;